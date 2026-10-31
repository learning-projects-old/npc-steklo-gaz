"""Просмотр и редактирование пар электродов на схеме с сохранением ссылок строк."""

import math
import tkinter as tk
from tkinter import messagebox, ttk

from tok_core import CalculationError
from tok_form import EditableTable


def show_connections(parent, coordinates, flat, rows, on_apply):
    """Показывает пары напряжений линиями; возвращает строки и их исходные номера.

    Вызывается CaseForm. Метки origin позволяют обновить ссылки коэффициентов
    при удалении пары; новая пара не получает вымышленного источника питания.
    Координаты плоских электродов заменяются серединами только для рисунка.
    """
    points = ([((coordinates[2 * i][0] + coordinates[2 * i + 1][0]) / 2,
                (coordinates[2 * i][1] + coordinates[2 * i + 1][1]) / 2) for i in range(len(coordinates) // 2)]
              if flat else coordinates)
    n = len(points)
    window = tk.Toplevel(parent)
    window.title("Схема пар электродов")
    window.geometry("1050x680")
    window.minsize(900, 550)
    window.transient(parent.winfo_toplevel())
    ttk.Label(window, text="Линия обозначает пару электродов с заданной разностью напряжений.", padding=16).pack(anchor="w")
    body = ttk.Panedwindow(window, orient="horizontal")
    body.pack(fill="both", expand=True, padx=16)
    canvas = tk.Canvas(body, background="#ffffff", highlightthickness=0)
    side = ttk.Frame(body, padding=(12, 0))
    body.add(canvas, weight=3)
    body.add(side, weight=2)
    columns = ["Пара", "Первый электрод", "Второй электрод"] + (["Напряжение / Re", "Фаза / Im"] if rows and len(rows[0]) == 4 else [])
    table = EditableTable(side, columns, height=10, widths=[55] + [100] * (len(columns) - 1))
    table.pack(fill="both", expand=True)
    table.set_rows(rows)
    for i, item in enumerate(table.tree.get_children(), 1):
        table.tree.item(item, tags=(str(i),))
    first, second = tk.StringVar(value="1"), tk.StringVar(value=str(min(2, n)))
    pickers = ttk.Frame(side)
    pickers.pack(fill="x", pady=8)
    ttk.Label(pickers, text="Электроды:").pack(side="left", padx=(0, 8))
    choices = [str(i) for i in range(1, n + 1)]
    ttk.Combobox(pickers, values=choices, textvariable=first, state="readonly", width=5).pack(side="left")
    ttk.Label(pickers, text="—").pack(side="left", padx=8)
    ttk.Combobox(pickers, values=choices, textvariable=second, state="readonly", width=5).pack(side="left")
    ttk.Label(side, text="Двойной щелчок по ячейке изменяет пару. После изменения схемы проверьте связи напряжений и условия соединения.", wraplength=360, style="Muted.TLabel").pack(anchor="w", pady=8)

    def valid_rows():
        """Проверяет номера и независимое количество пар перед рисунком/применением."""
        values = table.rows()
        if not 1 <= len(values) <= n - 1:
            raise CalculationError(f"Для {n} электродов задайте от 1 до {n - 1} пар напряжений.")
        for row in values:
            if any(v != int(v) or not 1 <= v <= n for v in row[:2]) or row[0] == row[1]:
                raise CalculationError("Пара должна содержать два разных существующих номера электродов.")
        return values

    def draw(event=None):
        """Размещает электроды с сохранением пропорций и подписывает текущие пары."""
        canvas.delete("all")
        try:
            values = valid_rows()
        except CalculationError as error:
            canvas.create_text(25, 25, anchor="nw", width=450, text=str(error), fill="#a14c15")
            return
        width, height = max(canvas.winfo_width(), 400), max(canvas.winfo_height(), 350)
        xs, ys = [p[0] for p in points], [p[1] for p in points]
        xmin, xmax, ymin, ymax = min(xs), max(xs), min(ys), max(ys)
        scale = min((width - 100) / max(xmax - xmin, 1), (height - 100) / max(ymax - ymin, 1))
        mapped = [(width / 2 + (x - (xmin + xmax) / 2) * scale,
                   height / 2 - (y - (ymin + ymax) / 2) * scale) for x, y in points]
        for i, row in enumerate(values, 1):
            x1, y1 = mapped[int(row[0]) - 1]
            x2, y2 = mapped[int(row[1]) - 1]
            canvas.create_line(x1, y1, x2, y2, fill="#b57014", width=2)
            canvas.create_text((x1 + x2) / 2, (y1 + y2) / 2 - 12, text=f"{int(row[0])}–{int(row[1])}", fill="#845214")
        for i, (x, y) in enumerate(mapped, 1):
            canvas.create_oval(x - 12, y - 12, x + 12, y + 12, fill="#007d8a", outline="#ffffff", width=2)
            canvas.create_text(x, y, text=str(i), fill="#ffffff", font=("Segoe UI Semibold", 10))

    def add():
        """Добавляет выбранные номера, сохраняя исходные номера существующих строк."""
        if first.get() == second.get():
            messagebox.showerror("Пара электродов", "Выберите два разных электрода.", parent=window)
            return
        if len(table.tree.get_children()) >= n - 1:
            messagebox.showerror("Пара электродов", f"Для {n} электродов допустимо не больше {n - 1} независимых пар.", parent=window)
            return
        table.append_row([int(first.get()), int(second.get())] + ([100, 0] if len(columns) == 5 else []))
        item = table.tree.get_children()[-1]
        table.tree.item(item, tags=("new",))
        draw()

    def remove():
        """Удаляет выбранную пару в копии диалога; главный расчёт меняется по применению."""
        table.remove_selected()
        draw()

    def apply():
        """Возвращает проверенные пары и соответствие старых/новых номеров в CaseForm."""
        try:
            values = valid_rows()
            origins = [None if table.tree.item(item, "tags") == ("new",) else int(table.tree.item(item, "tags")[0]) for item in table.tree.get_children()]
            on_apply(values, origins)
            window.destroy()
        except CalculationError as error:
            messagebox.showerror("Схема связей", str(error), parent=window)

    actions = ttk.Frame(side)
    actions.pack(fill="x", pady=8)
    ttk.Button(actions, text="Добавить пару", command=add).pack(side="left", padx=(0, 8))
    ttk.Button(actions, text="Убрать выбранную", command=remove).pack(side="left")
    footer = ttk.Frame(window, padding=16)
    footer.pack(fill="x")
    ttk.Button(footer, text="Обновить рисунок", command=draw).pack(side="left")
    ttk.Button(footer, text="Применить связи", command=apply, style="Primary.TButton").pack(side="right")
    ttk.Button(footer, text="Отмена", command=window.destroy).pack(side="right", padx=8)
    canvas.bind("<Configure>", draw)
    draw()
