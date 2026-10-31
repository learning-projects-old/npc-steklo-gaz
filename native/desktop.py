"""Оконное приложение ТОК: понятные формы, токи, поле мощности и графика."""

from concurrent.futures import ThreadPoolExecutor
from dataclasses import replace
from datetime import datetime
import json
import math
from pathlib import Path
import tkinter as tk
from tkinter import filedialog, messagebox, ttk
from tkinter.scrolledtext import ScrolledText

from legacy_io import read_field, read_tokgr, serialize_case, write_field, write_tokgr
from plot_core import calculate_field
from resistivity import glass_resistivity
from tok_app import format_result, parameters_from_text, resources_path
from tok_core import CalculationError, calculate, load_case
from tok_form import CaseForm, EditableTable, number


def configure_style(window):
    """Задаёт спокойную палитру инженерного приложения и читаемые размеры Tk."""
    style = ttk.Style(window)
    style.theme_use("clam")
    window.configure(background="#edf3f6")
    style.configure(".", font=("Segoe UI", 10), background="#edf3f6", foreground="#153c4b")
    style.configure("TButton", padding=(12, 8))
    style.configure("Primary.TButton", background="#007d8a", foreground="#ffffff", padding=(20, 9))
    style.map("Primary.TButton", background=[("active", "#006874"), ("disabled", "#90a6ad")])
    style.configure("Title.TLabel", font=("Segoe UI Semibold", 20))
    style.configure("Section.TLabel", font=("Segoe UI Semibold", 12))
    style.configure("Muted.TLabel", foreground="#526d79")
    style.configure("Treeview", background="#ffffff", fieldbackground="#ffffff", foreground="#183747", rowheight=31, borderwidth=0)
    style.configure("Treeview.Heading", font=("Segoe UI Semibold", 10), padding=8, background="#e0ebef")
    style.map("Treeview", background=[("selected", "#007d8a")], foreground=[("selected", "#ffffff")])
    style.configure("TNotebook.Tab", padding=(16, 9))
    style.configure("TEntry", padding=5, fieldbackground="#ffffff")


def color_for_value(fraction):
    """Интерполирует научную карту мощности от синего к красному без зависимостей."""
    stops = [(18, 61, 106), (15, 135, 146), (244, 211, 94), (225, 107, 53), (166, 29, 36)]
    position = max(0.0, min(1.0, fraction)) * (len(stops) - 1)
    index = min(int(position), len(stops) - 2)
    weight = position - index
    rgb = [round(a + (b - a) * weight) for a, b in zip(stops[index], stops[index + 1])]
    return "#%02x%02x%02x" % tuple(rgb)


def run_gui(initial_file=None, auto_calculate=False, workers=1):
    """Запускает автономный GUI; расчёты PTOK/PLOT6 выполняются рабочим потоком.

    Форма хранит копию DAT и проверяет её до calculate; исходные файлы не
    перезаписываются. ThreadPoolExecutor не обращается к Tk. Экспорт результатов,
    старой графики и поля вызывается только по кнопкам пользователя. workers
    задаёт число дочерних процессов PLOT6; последовательный PTOK не меняется.
    """
    window = tk.Tk()
    window.iconbitmap(str(resources_path().parent / "assets/tok26.ico"))
    window.title("ТОК 26" + (" FAST" if workers > 1 else "") + " — Расчёт электрического режима стекловаренной печи")
    window.geometry(f"{min(1480, window.winfo_screenwidth() - 80)}x{min(950, window.winfo_screenheight() - 100)}")
    window.minsize(1180, 760)
    configure_style(window)
    state = {"file": None, "result": None, "future": None}
    executor = ThreadPoolExecutor(max_workers=1)
    header = ttk.Frame(window, padding=(22, 16))
    header.pack(fill="x")
    ttk.Label(header, text="ТОК 26" + (f" FAST · процессов PLOT6: {min(workers, 51)}" if workers > 1 else ""), style="Title.TLabel").pack(anchor="w")
    ttk.Label(header, text="Расчёт электрического режима стекловаренной печи", style="Section.TLabel").pack(anchor="w", pady=(3, 0))
    subtitle = tk.StringVar(value="Откройте расчёт или выберите контрольный пример")
    ttk.Label(header, textvariable=subtitle, style="Muted.TLabel").pack(anchor="w", pady=(5, 0))
    controls = ttk.Frame(window, padding=(22, 0, 22, 12))
    controls.pack(fill="x")
    top_book = ttk.Notebook(window)
    top_book.pack(fill="both", expand=True, padx=22)
    input_tab, results_tab, diagram_tab, field_tab, glass_tab, details_tab = (ttk.Frame(top_book, padding=12) for _ in range(6))
    for tab, title in ((input_tab, "Исходные данные"), (results_tab, "Результат"), (diagram_tab, "Геометрия и токи"),
                       (field_tab, "Поле мощности"), (glass_tab, "Сопротивление стекла"), (details_tab, "Подробный отчёт")):
        top_book.add(tab, text=title)
    mode_bar = ttk.Frame(input_tab)
    mode_bar.pack(fill="x", pady=(0, 12))
    ttk.Label(mode_bar, text="Что рассчитать:").pack(side="left", padx=(0, 8))
    mode = tk.StringVar(value="Токи и напряжения")
    ttk.Combobox(mode_bar, textvariable=mode, values=["Токи и напряжения", "Поле мощности PLOT6"], state="readonly", width=26).pack(side="left")
    ttk.Label(mode_bar, text="Заданные напряжения:").pack(side="left", padx=(24, 8))
    voltage_format = tk.StringVar(value="Действительная и мнимая части")
    ttk.Combobox(mode_bar, textvariable=voltage_format, values=["Действительная и мнимая части", "Действующее значение и фаза"], state="readonly", width=33).pack(side="left")
    form = CaseForm(input_tab)
    form.pack(fill="both", expand=True)
    summary = tk.StringVar(value="После расчёта здесь появятся напряжения и токи.")
    ttk.Label(results_tab, textvariable=summary, style="Section.TLabel", wraplength=1100).pack(anchor="w", pady=(0, 12))
    group_table = EditableTable(results_tab, ["Группа", "Напряжение, В", "Мощность, Вт", "Отклонение, Вт"], height=4)
    group_table.pack(fill="x", pady=(0, 16))
    current_table = EditableTable(results_tab, ["Электрод", "Действительная часть, А", "Мнимая часть, А", "Действующее значение, А"], height=10, widths=[90, 250, 250, 280])
    current_table.pack(fill="both", expand=True)
    for table in (group_table, current_table):
        table.tree.unbind("<Double-1>")
    ttk.Label(results_tab, text="Действующее значение тока учитывает обе составляющие. Знаки составляющих задают направление и фазу.", style="Muted.TLabel").pack(anchor="w", pady=12)
    diagram_controls = ttk.Frame(diagram_tab)
    diagram_controls.pack(fill="x", pady=(0, 8))
    ttk.Label(diagram_controls, text="Векторы:").pack(side="left", padx=(0, 8))
    diagram_quantity = tk.StringVar(value="Токи")
    quantity_box = ttk.Combobox(diagram_controls, textvariable=diagram_quantity, values=["Токи", "Напряжения"], state="readonly", width=15)
    quantity_box.pack(side="left", padx=(0, 18))
    ttk.Label(diagram_controls, text="Поворот диаграммы, °:").pack(side="left", padx=(0, 8))
    rotation = tk.StringVar(value="0")
    ttk.Entry(diagram_controls, textvariable=rotation, width=8).pack(side="left", padx=(0, 8))
    ttk.Button(diagram_controls, text="Применить поворот", command=lambda: draw_diagram()).pack(side="left", padx=(0, 8))
    ttk.Button(diagram_controls, text="+30°", command=lambda: set_rotation(30)).pack(side="left", padx=(0, 8))
    ttk.Button(diagram_controls, text="Без поворота", command=lambda: set_rotation(0)).pack(side="left")
    diagram = tk.Canvas(diagram_tab, background="#ffffff", highlightthickness=0)
    diagram.pack(fill="both", expand=True)
    field_summary = tk.StringVar(value="Выберите режим «Поле мощности PLOT6» и нажмите «Рассчитать».")
    ttk.Label(field_tab, textvariable=field_summary, wraplength=1100).pack(anchor="w", pady=(0, 8))
    ttk.Button(field_tab, text="Рассчитать поле для текущей печи", command=lambda: start_field(), style="Primary.TButton").pack(anchor="w", pady=(0, 8))
    logarithmic = tk.BooleanVar(value=False)
    ttk.Checkbutton(field_tab, text="Логарифмическая цветовая шкала", variable=logarithmic, command=lambda: draw_field()).pack(anchor="w")
    field_canvas = tk.Canvas(field_tab, background="#ffffff", highlightthickness=0)
    field_canvas.pack(fill="both", expand=True, pady=8)
    report = ScrolledText(details_tab, font=("Consolas", 10), wrap="none", state="disabled")
    report.pack(fill="both", expand=True)
    status = tk.StringVar(value="Данные редактируются в форме; исходный архив сохраняется.")
    ttk.Label(window, textvariable=status, wraplength=1200, padding=(22, 12)).pack(fill="x")

    def draw_diagram(event=None):
        """Рисует ванну, пары электродов и векторы с явным поворотом только отображения."""
        diagram.delete("all")
        result = state["result"]
        if result is None:
            return
        width, height = max(diagram.winfo_width(), 800), max(diagram.winfo_height(), 450)
        case = result["case"]
        points = case.get("coordinates", [])
        if points:
            xs, ys = [p[0] for p in points], [p[1] for p in points]
            x0, x1 = min(min(xs), -case["length"] / 2), max(max(xs), case["length"] / 2)
            y0, y1 = min(0, min(ys)), max(case["height"], max(ys))
            scale = min((width * 0.48 - 100) / max(x1 - x0, 1), (height - 120) / max(y1 - y0, 1))
            center_x, center_y = width * 0.24, height * 0.52
            mapped = [(center_x + (x - (x0 + x1) / 2) * scale,
                       center_y - (y - (y0 + y1) / 2) * scale) for x, y in points]
            diagram.create_text(25, 25, anchor="w", text="Расположение электродов", font=("Segoe UI Semibold", 13), fill="#153c4b")
            diagram.create_rectangle(center_x - (x1 - x0) * scale / 2, center_y - (y1 - y0) * scale / 2,
                                     center_x + (x1 - x0) * scale / 2, center_y + (y1 - y0) * scale / 2,
                                     outline="#a9bbc4", width=2)
            centers = [((mapped[2 * i][0] + mapped[2 * i + 1][0]) / 2, (mapped[2 * i][1] + mapped[2 * i + 1][1]) / 2)
                       for i in range(case["electrode_count"])] if case["flat"] else mapped
            for first, second in case.get("pairs", []):
                xa, ya = centers[first - 1]
                xb, yb = centers[second - 1]
                diagram.create_line(xa, ya, xb, yb, fill="#b57014", width=2, dash=(5, 3))
                diagram.create_text((xa + xb) / 2, (ya + yb) / 2 - 11, text=f"{first}–{second}", fill="#845214")
            for i in range(case["electrode_count"]):
                if case["flat"]:
                    x, y = mapped[2 * i]
                    x2, y2 = mapped[2 * i + 1]
                    diagram.create_line(x, y, x2, y2, fill="#007d8a", width=6)
                else:
                    x, y = mapped[i]
                    diagram.create_oval(x - 6, y - 6, x + 6, y + 6, fill="#007d8a", outline="")
                diagram.create_text(x + 15, y - 12, text=str(i + 1), font=("Segoe UI", 11))
        else:
            diagram.create_text(30, 60, anchor="w", text="Архивный файл не содержит координат электродов.", width=width * 0.42, font=("Segoe UI", 11))
        cx, cy = width * 0.75, height * 0.53
        radius = min(width * 0.2, height * 0.34)
        try:
            angle = number(rotation.get(), "Угол поворота")
        except CalculationError:
            angle = 0
        vectors = result["currents"] if diagram_quantity.get() == "Токи" else result["pair_voltages"]
        title = "Направление и величина токов" if diagram_quantity.get() == "Токи" else "Напряжения между электродами"
        diagram.create_text(width * 0.52, 25, anchor="w", text=title, font=("Segoe UI Semibold", 13), fill="#153c4b")
        diagram.create_text(width * 0.52, 50, anchor="w", text=f"Поворот {angle:+g}° — только отображение, расчётные значения сохранены", fill="#526d79")
        diagram.create_line(cx - radius, cy, cx + radius, cy, fill="#a9bbc4")
        diagram.create_line(cx, cy - radius, cx, cy + radius, fill="#a9bbc4")
        diagram.create_text(cx + radius - 10, cy + 18, text="Re")
        diagram.create_text(cx + 22, cy - radius + 10, text="Im")
        maximum = max((math.hypot(*vector) for vector in vectors), default=1) or 1
        cosine, sine = math.cos(math.radians(angle)), math.sin(math.radians(angle))
        for i, (real, imaginary) in enumerate(vectors, 1):
            real, imaginary = real * cosine - imaginary * sine, real * sine + imaginary * cosine
            x, y = cx + real / maximum * radius, cy - imaginary / maximum * radius
            diagram.create_line(cx, cy, x, y, arrow="last", width=2, fill="#007d8a")
            diagram.create_text(x + 11, y - 11, text=str(i), font=("Segoe UI Semibold", 10))

    def set_rotation(angle):
        """Меняет визуальный фазовый отсчёт без повторного расчёта токов."""
        rotation.set(str(angle))
        draw_diagram()

    def start_field():
        """Запускает поле из его вкладки, исключая поиск скрытого переключателя режима."""
        mode.set("Поле мощности PLOT6")
        start_calculation()

    def draw_field(event=None):
        """Показывает сетку PLOT6 с явной линейной/логарифмической шкалой цвета."""
        field_canvas.delete("all")
        result = state["result"]
        if result is None or "field" not in result:
            return
        field = result["field"]
        width, height = max(field_canvas.winfo_width(), 800), max(field_canvas.winfo_height(), 400)
        low, high = field["minimum"], field["maximum"]
        transform = math.log1p if logarithmic.get() else float
        denominator = transform(high) - transform(low) or 1
        photo = tk.PhotoImage(width=137, height=51)
        colors = []
        for i in range(50, -1, -1):
            colors.append("{" + " ".join(color_for_value((transform(value) - transform(low)) / denominator) for value in field["values"][i]) + "}")
        photo.put(" ".join(colors))
        zoom = max(1, min(int((width - 150) / 137), int((height - 130) / 51)))
        photo = photo.zoom(zoom, zoom)
        field_canvas.field_photo = photo
        left, top = 80, 35
        field_canvas.create_image(left, top, anchor="nw", image=photo)
        field_canvas.create_rectangle(left, top, left + 137 * zoom, top + 51 * zoom, outline="#153c4b")
        for tick in range(6):
            x = left + tick / 5 * 137 * zoom
            field_canvas.create_text(x, top + 51 * zoom + 18, text=f"{field['v_axis'][-1] * tick / 5:.3g}")
        field_canvas.create_text(left + 68.5 * zoom, top + 51 * zoom + 45, text="Продольная координата")
        field_canvas.create_text(left - 15, top, anchor="e", text=f"{field['u_axis'][-1]:.3g}")
        field_canvas.create_text(left - 15, top + 25.5 * zoom, anchor="e", text="0")
        field_canvas.create_text(left - 15, top + 51 * zoom, anchor="e", text=f"{field['u_axis'][0]:.3g}")
        field_canvas.create_text(left - 55, top + 25.5 * zoom, text="Поперечная\nкоордината", angle=90)
        legend_x = left + 137 * zoom + 30
        for k in range(100):
            y = top + k / 100 * 51 * zoom
            field_canvas.create_rectangle(legend_x, y, legend_x + 14, y + 51 * zoom / 100 + 1, fill=color_for_value(1 - k / 100), outline="")
        field_canvas.create_text(legend_x - 2, top - 15, anchor="w", text=f"{high:.4g}")
        field_canvas.create_text(legend_x - 2, top + 51 * zoom + 18, anchor="w", text=f"{low:.4g}")

    def show_result(result):
        """Обновляет таблицы, отчёт и диаграммы только после успешного расчёта."""
        state["result"] = result
        group_table.set_rows([[v, result["powers"][i], result["power_errors"][i]] for i, v in enumerate(result["group_voltages"])])
        current_table.set_rows([list(current) + [magnitude] for current, magnitude in zip(result["currents"], result["current_magnitudes"])])
        summary.set(f"{result['name']}: {len(result['currents'])} электродов. Максимальный ток {max(result['current_magnitudes'], default=0):,.2f} А." if result["currents"] else
                    f"{result['name']}: архивное поле мощности, 6987 узлов.")
        report.configure(state="normal")
        report.delete("1.0", "end")
        report.insert("1.0", format_result(result))
        report.configure(state="disabled")
        if "field" in result:
            f = result["field"]
            field_summary.set(f"Плотность мощности PLOT6. Сетка 51 × 137; минимум {f['minimum']:.6g}, максимум {f['maximum']:.6g}. Единицы — как в исходной методике.")
        else:
            field_summary.set("Поле мощности не рассчитывалось. Выберите режим PLOT6 в исходных данных.")
        export_button.configure(state="normal")
        archive_button.configure(state="normal")
        draw_diagram()
        draw_field()
        top_book.select(field_tab if "field" in result else results_tab)

    def open_file(path=None):
        """Открывает расчётный DAT или старый графический TOKGR без изменения архива."""
        if state["future"] is not None and not state["future"].done():
            status.set("Дождитесь завершения текущего расчёта.")
            return
        path = path or filedialog.askopenfilename(title="Открыть расчёт или диаграмму", initialdir=resources_path(), filetypes=[("Данные ТОК", "*.DAT *.dat"), ("Все файлы", "*")])
        if not path:
            return
        try:
            path = Path(path)
            raw = path.read_bytes()
            if path.name.upper() == "IST.DAT":
                companion = path.with_name("PLOT6.DAT")
                if companion.exists():
                    dimensions = load_case(companion)
                    length, height = dimensions.length, dimensions.height
                else:
                    from tkinter import simpledialog
                    length = simpledialog.askfloat("Размер печи", "Поперечный размер печи в единицах исходного расчёта:", parent=window, minvalue=0.000001)
                    if length is None:
                        return
                    height = simpledialog.askfloat("Размер печи", "Продольный размер печи:", parent=window, minvalue=0.000001)
                    if height is None:
                        return
                show_result(read_field(path, length, height))
                subtitle.set(f"Архивное поле: {path.name}")
                return
            if b"\x00" in raw:
                result = read_tokgr(path)
                show_result(result)
                subtitle.set(f"Архивная диаграмма: {path.name}")
                return
            case = load_case(path)
            sidecar = path.with_suffix(".options.json")
            options = parameters_from_text(sidecar.read_text(encoding="utf-8")) if sidecar.exists() else {}
            form.load(case, options, raw_text=raw.decode("cp866"))
            state["file"] = path
            state["result"] = None
            group_table.set_rows([])
            current_table.set_rows([])
            diagram.delete("all")
            field_canvas.delete("all")
            summary.set("После расчёта здесь появятся напряжения и токи.")
            field_summary.set("Выберите режим PLOT6 или нажмите «Рассчитать поле для текущей печи».")
            report.configure(state="normal")
            report.delete("1.0", "end")
            report.configure(state="disabled")
            export_button.configure(state="disabled")
            archive_button.configure(state="disabled")
            is_plot = path.name.upper().startswith("PLOT")
            mode.set("Поле мощности PLOT6" if is_plot else "Токи и напряжения")
            voltage_format.set("Действующее значение и фаза" if is_plot else "Действительная и мнимая части")
            subtitle.set(f"{path.name} — {'плоские' if case.flat else 'круглые'} электроды, {case.electrode_count} шт.")
            status.set("Проверьте размеры печи и таблицы. Изменение чисел выполняется двойным щелчком.")
            top_book.select(input_tab)
        except (OSError, CalculationError) as error:
            messagebox.showerror("Не удалось открыть данные", str(error), parent=window)

    def poll():
        """Принимает результат потока через after; ошибки возвращаются в интерфейс."""
        future = state["future"]
        if not future.done():
            window.after(60, poll)
            return
        calculate_button.configure(state="normal")
        open_button.configure(state="normal")
        try:
            show_result(future.result())
            status.set("Расчёт завершён. Результаты можно сохранить в JSON или в старых форматах ТОК.")
        except (CalculationError, ValueError, OSError) as error:
            status.set(f"Расчёт не выполнен: {error}")
            messagebox.showerror("Проверьте данные расчёта", str(error), parent=window)

    def start_calculation():
        """Читает поля формы, выбирает PTOK/PLOT6 и запускает численное ядро."""
        if state["future"] is not None and not state["future"].done():
            status.set("Дождитесь завершения текущего расчёта.")
            return
        try:
            case, options = form.read()
            polar = voltage_format.get() == "Действующее значение и фаза"
            if mode.get() == "Поле мощности PLOT6":
                function = calculate_field
                options["workers"] = workers
                options["voltage_format"] = "amplitude_phase" if polar else "cartesian"
            else:
                function = calculate
                if polar and case.fixed_voltages is not None:
                    case = replace(case, fixed_voltages=[[v * math.cos(math.radians(p)), v * math.sin(math.radians(p))] for v, p in case.fixed_voltages])
            state["result"] = None
            export_button.configure(state="disabled")
            archive_button.configure(state="disabled")
            calculate_button.configure(state="disabled")
            open_button.configure(state="disabled")
            status.set("Выполняется расчёт поля мощности…" if function is calculate_field else "Выполняется подбор напряжений и расчёт токов…")
            state["future"] = executor.submit(function, case, **options)
            window.after(60, poll)
        except (CalculationError, ValueError) as error:
            messagebox.showerror("Проверьте исходные данные", str(error), parent=window)

    def export_json():
        """Сохраняет результаты с входными данными и матрицами, защищая исходный DAT."""
        if state["result"] is None:
            return
        path = filedialog.asksaveasfilename(title="Сохранить результаты", defaultextension=".json", filetypes=[("Результаты ТОК", "*.json")])
        if not path:
            return
        try:
            if state["file"] and Path(path).resolve() == state["file"].resolve():
                raise CalculationError("Результат нельзя сохранить поверх исходного файла.")
            Path(path).write_text(json.dumps(state["result"], ensure_ascii=False, indent=2, allow_nan=False), encoding="utf-8")
            status.set(f"Результаты сохранены: {path}")
        except (OSError, ValueError) as error:
            messagebox.showerror("Ошибка сохранения", str(error), parent=window)

    def export_archive():
        """Экспортирует совместимые TOKGR/IST/POLE и CSV в новый отдельный каталог."""
        if state["result"] is None:
            return
        parent = filedialog.askdirectory(title="Куда сохранить файлы расчёта")
        if not parent:
            return
        try:
            directory = Path(parent) / f"ТОК-{datetime.now():%Y%m%d-%H%M%S-%f}"
            directory.mkdir()
            if state["result"]["currents"]:
                write_tokgr(state["result"], directory / "TOKGR.DAT")
            if "field" in state["result"]:
                write_field(state["result"], directory)
            (directory / "Расчёт.txt").write_text(format_result(state["result"]), encoding="utf-8")
            status.set(f"Файлы сохранены: {directory}")
        except (OSError, ValueError) as error:
            messagebox.showerror("Ошибка экспорта", str(error), parent=window)

    def export_input():
        """Сохраняет изменённую понятную форму как DAT и JSON индивидуальных условий."""
        try:
            case, options = form.read()
            path = filedialog.asksaveasfilename(title="Сохранить новый расчёт", defaultextension=".dat", filetypes=[("Исходные данные ТОК", "*.dat")])
            if not path:
                return
            target = Path(path)
            if state["file"] and target.resolve() == state["file"].resolve():
                raise CalculationError("Выберите новое имя, чтобы сохранить исходный архив.")
            target.write_text(serialize_case(case), encoding="cp866")
            target.with_suffix(".options.json").write_text(json.dumps(options, ensure_ascii=False, indent=2), encoding="utf-8")
            status.set(f"Исходные данные и параметры сохранены: {target}")
        except (OSError, ValueError) as error:
            messagebox.showerror("Ошибка сохранения данных", str(error), parent=window)

    glass_controls = ttk.Frame(glass_tab)
    glass_controls.pack(fill="x", pady=8)
    composition = {}
    for key, label, initial in (("sodium", "Na₂O, %", "14"), ("potassium", "K₂O, %", "7"), ("temperature", "Температура, °C", "1300")):
        ttk.Label(glass_controls, text=label).pack(side="left", padx=(0, 8))
        composition[key] = tk.StringVar(value=initial)
        ttk.Entry(glass_controls, textvariable=composition[key], width=12).pack(side="left", padx=(0, 24))
    glass_result = tk.StringVar(value="Расчёт по формуле исходных таблиц UDSOPR.")
    ttk.Label(glass_tab, textvariable=glass_result, style="Section.TLabel").pack(anchor="w", pady=16)
    glass_table = EditableTable(glass_tab, ["№", "Температура, °C", "Удельное сопротивление"], height=15)
    glass_table.pack(fill="both", expand=True)
    glass_table.tree.unbind("<Double-1>")
    ttk.Label(glass_tab, text="Единицы результата сохранены из исходной таблицы. Перед переносом в расчёт печи согласуйте их с единицами геометрии.", wraplength=1100, style="Muted.TLabel").pack(anchor="w", pady=12)

    def calculate_glass():
        """Считает сопротивление при заданной температуре и таблицу 1000–1700 °C."""
        try:
            sodium = number(composition["sodium"].get(), "Na₂O")
            potassium = number(composition["potassium"].get(), "K₂O")
            temperature = number(composition["temperature"].get(), "Температура")
            value = glass_resistivity(sodium, potassium, temperature)
            glass_result.set(f"При {temperature:g} °C: удельное сопротивление {value:.8g}")
            glass_table.set_rows([[t, glass_resistivity(sodium, potassium, t)] for t in range(1000, 1701, 50)])
        except CalculationError as error:
            messagebox.showerror("Состав стекла", str(error), parent=window)

    ttk.Button(glass_controls, text="Рассчитать сопротивление", command=calculate_glass).pack(side="left")

    def close():
        """Закрывает собственное окно и завершает исполнитель после текущего расчёта."""
        executor.shutdown(wait=False, cancel_futures=True)
        window.destroy()

    open_button = ttk.Button(controls, text="Открыть данные…", command=open_file)
    open_button.pack(side="left", padx=(0, 8))
    def show_example(name):
        """Открывает встроенный пример и сразу показывает рассчитанный результат."""
        if state["future"] is not None and not state["future"].done():
            status.set("Дождитесь завершения текущего расчёта.")
            return
        open_file(resources_path() / name)
        if state["file"] and state["file"].name == name:
            start_calculation()

    ttk.Button(controls, text="Пример токов", command=lambda: show_example("CIRCLE.DAT")).pack(side="left", padx=(0, 8))
    ttk.Button(controls, text="Пример поля", command=lambda: show_example("PLOT6.DAT")).pack(side="left", padx=(0, 8))
    calculate_button = ttk.Button(controls, text="Рассчитать", style="Primary.TButton", command=start_calculation)
    calculate_button.pack(side="left", padx=(4, 12))
    export_button = ttk.Button(controls, text="Сохранить результат…", command=export_json, state="disabled")
    export_button.pack(side="right")
    archive_button = ttk.Button(controls, text="Экспорт файлов…", command=export_archive, state="disabled")
    archive_button.pack(side="right", padx=8)
    ttk.Button(input_tab, text="Сохранить изменённые исходные данные…", command=export_input).pack(anchor="w", pady=(8, 0))
    diagram.bind("<Configure>", draw_diagram)
    quantity_box.bind("<<ComboboxSelected>>", draw_diagram)
    field_canvas.bind("<Configure>", draw_field)
    window.protocol("WM_DELETE_WINDOW", close)
    if initial_file:
        open_file(initial_file)
    elif (resources_path() / "CIRCLE.DAT").exists():
        open_file(resources_path() / "CIRCLE.DAT")
    if auto_calculate:
        window.after(100, start_calculation)
    window.mainloop()
