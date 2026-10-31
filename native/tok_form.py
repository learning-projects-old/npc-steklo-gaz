"""Человекочитаемая форма печи, электродов и электрической схемы."""

from copy import deepcopy
import math
import re
import tkinter as tk
from tkinter import ttk

from legacy_io import format_pair_records, serialize_case
from tok_core import CalculationError, geometry_problems, isolated_group_equations, parse_dat


def number(text, label):
    """Читает число формы с точкой или запятой, сообщая имя ошибочного поля."""
    try:
        value = float(str(text).strip().replace(",", "."))
    except ValueError as error:
        raise CalculationError(f"{label}: введите число.") from error
    if not math.isfinite(value):
        raise CalculationError(f"{label}: требуется конечное число.")
    return value


class EditableTable(ttk.Frame):
    """Таблица с редактированием чисел по двойному щелчку для CaseForm."""

    def __init__(self, parent, columns, height=6, widths=None):
        """Создаёт таблицу с заголовками и прокруткой; первый столбец — номер."""
        super().__init__(parent)
        self.columns = columns
        self.editor = None
        self.tree = ttk.Treeview(self, columns=list(range(len(columns))), show="headings", height=height, selectmode="browse")
        for i, title in enumerate(columns):
            self.tree.heading(str(i), text=title)
            self.tree.column(str(i), width=(widths[i] if widths else 125), minwidth=65, anchor="center", stretch=True)
        self.tree.grid(row=0, column=0, sticky="nsew")
        vertical = ttk.Scrollbar(self, orient="vertical", command=self.tree.yview)
        horizontal = ttk.Scrollbar(self, orient="horizontal", command=self.tree.xview)
        vertical.grid(row=0, column=1, sticky="ns")
        horizontal.grid(row=1, column=0, sticky="ew")
        self.tree.configure(yscrollcommand=vertical.set, xscrollcommand=horizontal.set)
        self.columnconfigure(0, weight=1)
        self.rowconfigure(0, weight=1)
        self.tree.bind("<Double-1>", self.edit_cell)

    def edit_cell(self, event):
        """Открывает редактор выбранной числовой ячейки; номер строки неизменяем."""
        self.commit_edit()
        item = self.tree.identify_row(event.y)
        column = self.tree.identify_column(event.x)
        if not item or not column or column == "#1":
            return
        index = int(column[1:]) - 1
        bounds = self.tree.bbox(item, column)
        if not bounds:
            return
        x, y, width, height = bounds
        entry = ttk.Entry(self.tree, justify="center")
        entry.insert(0, self.tree.item(item, "values")[index])
        entry.place(x=x, y=y, width=width, height=height)
        entry.focus_set()
        entry.selection_range(0, "end")
        self.editor = (entry, item, index)
        entry.bind("<Return>", self.commit_edit)
        entry.bind("<FocusOut>", self.commit_edit)
        entry.bind("<Escape>", self.cancel_edit)

    def commit_edit(self, event=None):
        """Сохраняет текст ячейки до чтения формы; числовая проверка выполняется read."""
        if self.editor is None:
            return
        entry, item, index = self.editor
        self.editor = None
        values = list(self.tree.item(item, "values"))
        values[index] = entry.get()
        self.tree.item(item, values=values)
        entry.destroy()

    def cancel_edit(self, event=None):
        """Отменяет незавершённое редактирование одной ячейки по Escape."""
        if self.editor is not None:
            entry = self.editor[0]
            self.editor = None
            entry.destroy()

    def set_rows(self, rows, number_format=".12g"):
        """Заполняет таблицу: ввод сохраняет точность, результаты задают формат .2f."""
        self.cancel_edit()
        children = self.tree.get_children()
        if children:
            self.tree.delete(*children)
        for i, row in enumerate(rows, 1):
            self.tree.insert("", "end", values=[i] + [format(value, number_format) for value in row])

    def rows(self):
        """Возвращает проверенные числовые строки без служебного номера."""
        self.commit_edit()
        return [[number(value, f"{self.columns[j]}, строка {i}") for j, value in enumerate(self.tree.item(item, "values")) if j]
                for i, item in enumerate(self.tree.get_children(), 1)]

    def append_row(self, values):
        """Добавляет строку через кнопку формы с последовательным номером."""
        self.commit_edit()
        self.tree.insert("", "end", values=[len(self.tree.get_children()) + 1] + values)

    def remove_selected(self):
        """Удаляет выбранную строку схемы/коэффициентов только из формы в памяти."""
        self.commit_edit()
        selected = self.tree.selection()
        if selected:
            self.tree.delete(*selected)
            for i, item in enumerate(self.tree.get_children(), 1):
                self.tree.item(item, values=[i] + list(self.tree.item(item, "values"))[1:])


class CaseForm(ttk.Frame):
    """Связывает понятные поля и таблицы с Case; DAT и поля синхронизируются на главном экране."""

    def __init__(self, parent):
        """Создаёт разделы геометрии, питания и специальных коэффициентов."""
        super().__init__(parent)
        self._syncing = False
        self._last_raw = ""
        self._last_form = None
        self.on_change = None
        self.case = None
        self.fields = {}
        split = ttk.Panedwindow(self, orient="horizontal")
        split.pack(fill="both", expand=True)
        self.source_frame = ttk.Frame(split, padding=(0, 0, 12, 0))
        details_frame = ttk.Frame(split)
        split.add(self.source_frame, weight=2)
        split.add(details_frame, weight=5)
        ttk.Label(self.source_frame, text="Исходный DAT", style="Section.TLabel").pack(anchor="w", pady=(0, 6))
        ttk.Label(self.source_frame, text="DAT и форма обновляются автоматически.", style="Muted.TLabel").pack(anchor="w", pady=(0, 8))
        self.book = ttk.Notebook(details_frame)
        self.book.pack(fill="both", expand=True)
        self.geometry, self.supply, self.expert = (ttk.Frame(self.book, padding=16) for _ in range(3))
        self.book.add(self.geometry, text="Печь и электроды")
        self.book.add(self.supply, text="Питание и мощность")
        self.book.add(self.expert, text="Для специалиста")
        self.description = tk.StringVar()
        ttk.Label(self.geometry, textvariable=self.description, style="Section.TLabel").grid(row=0, column=0, columnspan=6, sticky="w", pady=(0, 16))
        for i, (key, title) in enumerate((("length", "Поперечный размер печи"), ("height", "Продольный размер печи"),
                                          ("resistivity", "Удельное сопротивление стекла"), ("width", "Глубина плоской ванны"))):
            column = (i % 2) * 3
            row = 1 + i // 2
            ttk.Label(self.geometry, text=title).grid(row=row, column=column, sticky="w", padx=(0, 8), pady=5)
            self.fields[key] = tk.StringVar()
            ttk.Entry(self.geometry, textvariable=self.fields[key], width=15).grid(row=row, column=column + 1, sticky="ew", padx=(0, 24), pady=5)
        ttk.Label(self.geometry, text="Размеры и удельное сопротивление — в единицах исходной методики.", style="Muted.TLabel").grid(row=3, column=0, columnspan=6, sticky="w", pady=(4, 14))
        bar = ttk.Frame(self.geometry)
        bar.grid(row=4, column=0, columnspan=6, sticky="ew", pady=(0, 8))
        ttk.Label(bar, text="Электроды", style="Section.TLabel").pack(side="left")
        ttk.Label(bar, text="Двойной щелчок по ячейке — изменить значение", style="Muted.TLabel").pack(side="right")
        self.electrode_holder = ttk.Frame(self.geometry)
        self.electrode_holder.grid(row=5, column=0, columnspan=6, sticky="nsew")
        self.electrodes = None
        self.geometry.rowconfigure(5, weight=1)
        self.geometry.columnconfigure(1, weight=1)
        self.geometry.columnconfigure(4, weight=1)
        self.notice = tk.StringVar(value="Координаты показывают положение электрода; для плоского электрода указаны оба конца.")
        ttk.Label(self.geometry, textvariable=self.notice, wraplength=1000, style="Muted.TLabel").grid(row=6, column=0, columnspan=6, sticky="w", pady=10)
        actions = ttk.Frame(self.geometry)
        actions.grid(row=7, column=0, columnspan=6, sticky="w")
        ttk.Button(actions, text="Добавить электрод", command=self.add_electrode).pack(side="left", padx=(0, 8))
        ttk.Button(actions, text="Убрать последний", command=self.remove_electrode).pack(side="left")
        ttk.Label(self.supply, text="Силовые группы", style="Section.TLabel").pack(anchor="w", pady=(0, 8))
        self.groups = EditableTable(self.supply, ["Группа", "Начальное напряжение, В", "Требуемая мощность, Вт"], height=5, widths=[70, 250, 260])
        self.groups.pack(fill="x")
        group_actions = ttk.Frame(self.supply)
        group_actions.pack(fill="x", pady=6)
        ttk.Button(group_actions, text="Добавить группу", command=lambda: self.groups.append_row([100, 100000])).pack(side="left", padx=(0, 8))
        ttk.Button(group_actions, text="Убрать выбранную", command=self.groups.remove_selected).pack(side="left")
        ttk.Label(self.supply, text="Пары электродов с заданным напряжением", style="Section.TLabel").pack(anchor="w", pady=(12, 8))
        self.pair_holder = ttk.Frame(self.supply)
        self.pair_holder.pack(fill="both", expand=True)
        self.pairs = None
        pair_actions = ttk.Frame(self.supply)
        pair_actions.pack(fill="x", pady=6)
        ttk.Button(pair_actions, text="Добавить пару", command=self.add_pair).pack(side="left", padx=(0, 8))
        ttk.Button(pair_actions, text="Убрать выбранную", command=self.remove_pair).pack(side="left", padx=(0, 12))
        ttk.Button(pair_actions, text="Схема связей…", command=self.open_connections).pack(side="left", padx=(0, 8))
        ttk.Button(pair_actions, text="Пары одной строкой (DAT)", command=lambda: self.format_raw_pairs(True)).pack(side="left")
        settings = ttk.Frame(self.supply)
        settings.pack(fill="x", pady=(12, 0))
        for key, label, value in (("tolerance", "Допуск по мощности, Вт", 200), ("relaxation", "Шаг подбора напряжения", 0.02)):
            ttk.Label(settings, text=label).pack(side="left", padx=(0, 8))
            self.fields[key] = tk.StringVar(value=str(value))
            ttk.Entry(settings, textvariable=self.fields[key], width=12).pack(side="left", padx=(0, 24))
        self.supply_hint = tk.StringVar()
        ttk.Label(self.supply, textvariable=self.supply_hint, style="Muted.TLabel", wraplength=1000).pack(anchor="w", pady=8)
        self.special_book = ttk.Notebook(self.expert)
        self.special_book.pack(fill="both", expand=True)
        voltage_tab, power_tab, condition_tab = (ttk.Frame(self.special_book, padding=8) for _ in range(3))
        for frame, text in ((voltage_tab, "Связи напряжений"), (power_tab, "Расчёт мощностей"), (condition_tab, "Условия соединения")):
            self.special_book.add(frame, text=text)
        self.voltage_terms = EditableTable(voltage_tab, ["№", "Пара", "Компонента 1/2", "Силовая группа", "Множитель"], height=10)
        self.voltage_terms.pack(fill="both", expand=True)
        self.power_terms = EditableTable(power_tab, ["№", "Группа мощности", "Группа напряжения", "Электрод", "Компонента 1/2", "Множитель"], height=10)
        self.power_terms.pack(fill="both", expand=True)
        for tab, table, default in ((voltage_tab, self.voltage_terms, [1, 1, 1, 1]), (power_tab, self.power_terms, [1, 1, 1, 1, 1])):
            buttons = ttk.Frame(tab)
            buttons.pack(fill="x", pady=8)
            ttk.Button(buttons, text="Добавить связь", command=lambda t=table, d=default: t.append_row(d)).pack(side="left", padx=(0, 8))
            ttk.Button(buttons, text="Убрать выбранную", command=table.remove_selected).pack(side="left")
            ttk.Label(tab, text="Компонента 1 — действительная часть; 2 — мнимая. Изменяйте связи только при изменении электрической схемы.", style="Muted.TLabel", wraplength=950).pack(anchor="w")
        ttk.Label(condition_tab, text="Здесь задаются ограничения суммарного тока. Пример: коэффициенты 1, 1, 0 означают сумму токов электродов 1 и 2.", wraplength=950).pack(anchor="w", pady=(0, 12))
        self.conditions_holder = ttk.Frame(condition_tab)
        self.conditions_holder.pack(fill="both", expand=True)
        self.conditions = None
        ttk.Button(condition_tab, text="Изолированные источники: сумма токов каждой группы равна нулю", command=self.set_isolated_groups).pack(anchor="w", pady=8)
        ttk.Label(condition_tab, text="Применять только к действительно изолированным источникам питания. Автоматически эта схема не выбирается.", style="Muted.TLabel", wraplength=950).pack(anchor="w")
        from tkinter.scrolledtext import ScrolledText
        raw_tab = self.source_frame
        self.raw = ScrolledText(raw_tab, font=("Consolas", 10), undo=True, wrap="none", width=39)
        self.raw.pack(fill="both", expand=True)
        raw_horizontal = ttk.Scrollbar(raw_tab, orient="horizontal", command=self.raw.xview)
        raw_horizontal.pack(fill="x")
        self.raw.configure(xscrollcommand=raw_horizontal.set)
        self.raw_tab = raw_tab
        raw_actions = ttk.Frame(raw_tab)
        raw_actions.pack(fill="x", pady=8)
        ttk.Button(raw_actions, text="Пары одной строкой", command=lambda: self.format_raw_pairs(True)).pack(fill="x", pady=3)
        ttk.Button(raw_actions, text="Каждая пара отдельно", command=lambda: self.format_raw_pairs(False)).pack(fill="x", pady=3)
        ttk.Button(raw_actions, text="Схема связей…", command=self.open_connections).pack(fill="x", pady=3)
        ttk.Button(raw_actions, text="Применить DAT к форме", command=self.apply_raw).pack(fill="x", pady=3)
        self.sync_status = tk.StringVar(value="Изменения синхронизируются автоматически.")
        ttk.Label(raw_tab, textvariable=self.sync_status, wraplength=320, style="Muted.TLabel").pack(anchor="w")
        self.after(300, self.sync_tick)

    def load(self, case, options=None, raw_text=None):
        """Заполняет Case и параметры; экспертный DAT сохраняет исходное оформление."""
        options = options or {}
        for equation in options.get("extra_equations", []):
            if len(equation["coefficients"]) != case.electrode_count or len(equation["voltage"]) != 2:
                raise CalculationError("Сохранённое условие должно содержать N коэффициентов токов и 2 компоненты правой части.")
        self.max_iterations = options.get("max_iterations", 10000)
        self.case = deepcopy(case)
        for key in self.fields:
            self.fields[key].set(format(getattr(case, key), ".12g"))
        self.description.set(f"{'Плоские' if case.flat else 'Круглые'} электроды: {case.electrode_count}")
        if self.electrodes is not None:
            self.electrodes.destroy()
        columns = (["Электрод", "Первый конец: X", "Первый конец: Y", "Второй конец: X", "Второй конец: Y"] if case.flat else
                   ["Электрод", "Координата X", "Координата Y", "Радиус", "Длина электрода"])
        self.electrodes = EditableTable(self.electrode_holder, columns, height=10)
        self.electrodes.pack(fill="both", expand=True)
        rows = ([case.coordinates[2 * i] + case.coordinates[2 * i + 1] for i in range(case.electrode_count)] if case.flat else
                [point + [case.radius, case.electrode_length] for point in case.coordinates])
        if not case.flat:
            for key, column in (("radii", 2), ("electrode_lengths", 3)):
                if options.get(key) is not None:
                    if len(options[key]) != case.electrode_count:
                        raise CalculationError("Количество индивидуальных размеров не совпадает с количеством электродов.")
                    for row, value in zip(rows, options[key]):
                        row[column] = value
        self.electrodes.set_rows(rows)
        self.groups.set_rows([[v, p] for v, p in zip(case.initial_voltages or [], case.target_powers or [])])
        if self.pairs is not None:
            self.pairs.destroy()
        self.pairs = EditableTable(self.pair_holder, ["Пара", "Первый электрод", "Второй электрод"] +
                                   (["Напряжение / Re, В", "Фаза / Im"] if case.fixed_voltages is not None else []), height=6)
        self.pairs.pack(fill="both", expand=True)
        self.pairs.set_rows([list(pair) + (case.fixed_voltages[i] if case.fixed_voltages is not None else []) for i, pair in enumerate(case.pairs)])
        self.voltage_terms.set_rows(case.voltage_terms or [])
        self.power_terms.set_rows(case.power_terms or [])
        if self.conditions is not None:
            self.conditions.destroy()
        self.conditions = EditableTable(self.conditions_holder, ["Условие"] + [f"Ток {i + 1}" for i in range(case.electrode_count)] + ["Правая часть Re", "Правая часть Im"], height=5, widths=[80] + [85] * case.electrode_count + [130, 130])
        self.conditions.pack(fill="both", expand=True)
        missing = case.electrode_count - 1 - len(case.pairs)
        saved_conditions = options.get("extra_equations", [])
        self.conditions.set_rows([row["coefficients"] + row["voltage"] for row in saved_conditions] if saved_conditions else
                                 [[0.0] * (case.electrode_count + 2) for _ in range(missing)])
        self.supply_hint.set("Заданные напряжения читаются по выбранному режиму расчёта. Группы мощностей в этом файле отсутствуют." if case.fixed_voltages is not None else
                             f"Сохранены исходные связи напряжений и мощностей. Дополнительных условий соединения требуется: {missing}.")
        self.raw.delete("1.0", "end")
        self.raw.insert("1.0", raw_text if raw_text is not None else serialize_case(case))
        self.book.select(self.geometry)
        self._last_raw = self.raw.get("1.0", "end-1c")
        self._last_form = self.form_snapshot()

    def form_snapshot(self):
        """Снимает текстовый снимок формы без завершения активного редактора ячейки."""
        tables = (self.electrodes, self.groups, self.pairs, self.voltage_terms,
                  self.power_terms, self.conditions)
        return (tuple(v.get() for v in self.fields.values()),
                tuple(tuple(tuple(t.tree.item(item, "values")) for item in t.tree.get_children())
                      for t in tables if t is not None))

    def synchronize(self):
        """Согласует DAT и форму перед расчётом и по таймеру, сохраняя пробелы.

        Незавершённый DAT не перезаписывается формой: ошибка останавливает расчёт.
        Параметры вне DAT сохраняются, пока число электродов не изменено.
        """
        if self.case is None or self._syncing:
            return
        self._syncing = True
        changed = False
        try:
            text = self.raw.get("1.0", "end-1c")
            if text != self._last_raw:
                case = parse_dat(text, self.case.name)
                options = {"max_iterations": self.max_iterations}
                if case.electrode_count == self.case.electrode_count:
                    rows = self.electrodes.rows()
                    if not case.flat and not self.case.flat:
                        if case.radius == 0:
                            options["radii"] = [r[2] for r in rows]
                        if case.electrode_length == 0:
                            options["electrode_lengths"] = [r[3] for r in rows]
                    conditions = self.conditions.rows()
                    options["extra_equations"] = [
                        {"coefficients": r[:-2], "voltage": r[-2:]} for r in conditions]
                selected = self.book.select()
                cursor, scroll = self.raw.index("insert"), self.raw.yview()
                self.load(case, options, raw_text=text)
                self.book.select(selected)
                self.raw.mark_set("insert", cursor)
                self.raw.yview_moveto(scroll[0])
                changed = True
            elif self.form_snapshot() != self._last_form:
                case, options = self.read()
                canonical = serialize_case(case)
                old = list(re.finditer(r"\S+", text))
                new = canonical.split()
                if len(old) == len(new):
                    # Оставляем исходные переносы и запись неизменённых чисел.
                    for token, value in reversed(list(zip(old, new))):
                        if float(token.group().replace("D", "E")) != float(value):
                            text = text[:token.start()] + value + text[token.end():]
                else:
                    text = canonical
                self.raw.delete("1.0", "end")
                self.raw.insert("1.0", text)
                self.case = deepcopy(case)
                self._last_raw = text
                self._last_form = self.form_snapshot()
                changed = True
            self.sync_status.set("DAT и форма синхронизированы.")
            problems = geometry_problems(self.case)
            self.notice.set(("Нужно изменить координаты после изменения размеров печи.\n" + "\n".join(problems)) if problems else
                            f"Допустимые координаты: X от {-self.case.length / 2:.2f} до {self.case.length / 2:.2f}; Y от 0.00 до {self.case.height:.2f}.")
            if changed and self.on_change:
                self.on_change()
        finally:
            self._syncing = False

    def sync_tick(self):
        """Проверяет изменения каждые 300 мс; неполный ввод показывает рядом с DAT."""
        try:
            self.synchronize()
        except (CalculationError, ValueError) as error:
            self.sync_status.set(f"Ожидается корректный ввод: {error}")
        finally:
            self.after(300, self.sync_tick)

    def read(self):
        """Синхронизирует DAT, затем проверяет Case и размеры перед расчётом/экспортом."""
        self.synchronize()
        if self.case is None:
            raise CalculationError("Сначала откройте исходный файл или контрольный пример.")
        case = deepcopy(self.case)
        for key, variable in self.fields.items():
            title = {"length": "Поперечный размер", "height": "Продольный размер", "resistivity": "Удельное сопротивление",
                     "width": "Глубина ванны", "tolerance": "Допуск по мощности", "relaxation": "Шаг подбора"}[key]
            setattr(case, key, number(variable.get(), title))
        electrode_rows = self.electrodes.rows()
        case.electrode_count = len(electrode_rows)
        options = {"max_iterations": self.max_iterations}
        if case.flat:
            case.coordinates = [point for row in electrode_rows for point in (row[:2], row[2:])]
        else:
            case.coordinates = [row[:2] for row in electrode_rows]
            options["radii"] = [row[2] for row in electrode_rows]
            options["electrode_lengths"] = [row[3] for row in electrode_rows]
            case.radius = options["radii"][0] if len(set(options["radii"])) == 1 else 0.0
            case.electrode_length = options["electrode_lengths"][0] if len(set(options["electrode_lengths"])) == 1 else 0.0
        pair_rows = self.pairs.rows()
        case.pairs = [row[:2] for row in pair_rows]
        if case.fixed_voltages is not None:
            case.fixed_voltages = [row[2:] for row in pair_rows]
        else:
            groups = self.groups.rows()
            case.initial_voltages, case.target_powers = [row[0] for row in groups], [row[1] for row in groups]
            case.voltage_terms = self.voltage_terms.rows()
            case.power_terms = self.power_terms.rows()
            covered = {int(row[0]) for row in case.voltage_terms}
            for i, item in enumerate(self.pairs.tree.get_children(), 1):
                if "new" in self.pairs.tree.item(item, "tags") and i not in covered:
                    raise CalculationError(f"Для новой пары № {i} задайте связь напряжения во вкладке «Для специалиста» → «Связи напряжений».")
        case = parse_dat(serialize_case(case), case.name)
        conditions = self.conditions.rows()
        missing = case.electrode_count - 1 - len(case.pairs)
        if missing:
            if len(conditions) != missing or any(len(row) != case.electrode_count + 2 for row in conditions):
                raise CalculationError("После изменения количества электродов обновите условия соединения во вкладке «Для специалиста».")
            if any(all(v == 0 for v in row[:-2]) for row in conditions):
                raise CalculationError(f"Нужно задать {missing} условий соединения во вкладке «Для специалиста». Для изолированных источников предусмотрена отдельная кнопка.")
            options["extra_equations"] = [{"coefficients": row[:-2], "voltage": row[-2:]} for row in conditions]
        return case, options

    def add_electrode(self):
        """Добавляет электрод с исходными размерами; связи схема проверяет при расчёте."""
        if self.case is None:
            return
        self.electrodes.append_row([0, 0, 0, 0] if self.case.flat else [0, 1, self.case.radius, self.case.electrode_length])
        self.notice.set("Электрод добавлен. Проверьте пары, связи мощностей и условия соединения для нового количества электродов.")

    def remove_electrode(self):
        """Убирает последний электрод формы, не перенумеровывая существующие связи."""
        self.electrodes.commit_edit()
        items = self.electrodes.tree.get_children()
        if len(items) > 2:
            self.electrodes.tree.delete(items[-1])
            self.notice.set("Электрод убран. Проверьте, что схема не ссылается на удалённый номер.")

    def add_pair(self):
        """Добавляет редактируемую пару с напряжением только для фиксированного режима."""
        if self.case is not None:
            self.pairs.append_row([1, 2] + ([100, 0] if self.case.fixed_voltages is not None else []))
            self.pairs.tree.item(self.pairs.tree.get_children()[-1], tags=("new",))

    def apply_connection_rows(self, rows, origins):
        """Обновляет пары и перенумеровывает ссылки B при удалении существующих строк."""
        new_origins = {i for i, item in enumerate(self.pairs.tree.get_children(), 1) if "new" in self.pairs.tree.item(item, "tags")}
        if self.case.fixed_voltages is None:
            mapping = {old: new for new, old in enumerate(origins, 1) if old is not None}
            terms = self.voltage_terms.rows()
            self.voltage_terms.set_rows([[mapping[int(row[0])]] + row[1:] for row in terms if int(row[0]) in mapping])
        self.pairs.set_rows(rows)
        for item, origin in zip(self.pairs.tree.get_children(), origins):
            if origin is None or origin in new_origins:
                self.pairs.tree.item(item, tags=("new",))
        self.supply_hint.set("Пары обновлены. Для новых пар задайте связи напряжений и проверьте условия соединения.")

    def remove_pair(self):
        """Удаляет выбранную пару вместе с её коэффициентами, сохраняя ссылки оставшихся."""
        children = list(self.pairs.tree.get_children())
        selected = set(self.pairs.tree.selection())
        rows = self.pairs.rows()
        origins = [i for i, item in enumerate(children, 1) if item not in selected]
        self.apply_connection_rows([row for item, row in zip(children, rows) if item not in selected], origins)

    def open_connections(self):
        """Открывает схему пар по текущей геометрии без требования завершённого расчёта."""
        from connections import show_connections
        from tkinter import messagebox
        try:
            if self.case is None:
                raise CalculationError("Сначала откройте расчёт.")
            rows = self.electrodes.rows()
            coordinates = [point for row in rows for point in (row[:2], row[2:])] if self.case.flat else [row[:2] for row in rows]
            show_connections(self, coordinates, self.case.flat, self.pairs.rows(), self.apply_connection_rows)
        except CalculationError as error:
            messagebox.showerror("Схема связей", str(error), parent=self)

    def format_raw_pairs(self, one_line):
        """Переключает только оформление блока пар в экспертном DAT, не числа."""
        from tkinter import messagebox
        try:
            text = format_pair_records(self.raw.get("1.0", "end-1c"), one_line)
            self.raw.delete("1.0", "end")
            self.raw.insert("1.0", text)
            self.raw.focus_set()
        except CalculationError as error:
            messagebox.showerror("Оформление пар", str(error), parent=self)

    def set_isolated_groups(self):
        """Явно заполняет таблицу условий балансами изолированных источников."""
        from tkinter import messagebox
        try:
            case = deepcopy(self.case)
            case.electrode_count = len(self.electrodes.rows())
            case.pairs = self.pairs.rows()
            pairs = [row[:2] for row in case.pairs]
            for pair in pairs:
                if any(v != int(v) or not 1 <= v <= case.electrode_count for v in pair):
                    raise CalculationError("В парах укажите существующие целые номера электродов.")
            case.pairs = [[int(v) for v in pair] for pair in pairs]
            equations = isolated_group_equations(case)
            self.conditions.destroy()
            self.conditions = EditableTable(self.conditions_holder, ["Условие"] + [f"Ток {i + 1}" for i in range(case.electrode_count)] + ["Правая часть Re", "Правая часть Im"], height=5)
            self.conditions.pack(fill="both", expand=True)
            self.conditions.set_rows([row["coefficients"] + row["voltage"] for row in equations])
        except (CalculationError, ValueError) as error:
            messagebox.showerror("Условия соединения", str(error), parent=self)

    def apply_raw(self):
        """Немедленно синхронизирует DAT, сохраняя индивидуальные параметры формы."""
        from tkinter import messagebox
        try:
            self.synchronize()
        except CalculationError as error:
            messagebox.showerror("Исходный DAT", str(error), parent=self)
