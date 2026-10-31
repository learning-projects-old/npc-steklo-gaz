"""Текстовые и двоичные форматы исходного комплекта ТОК."""

from pathlib import Path
import math
import struct

from tok_core import CalculationError


def format_pair_records(text, one_line=True):
    """Меняет только переносы строк блока пар DAT, сохраняя все числовые записи.

    Используется кнопками экспертного вида. Учитывает 2 поля для пар PTOK и
    4 поля для записей фиксированных напряжений; остальные байты текста
    вне блока остаются прежними. Значения и порядок пар не изменяются.
    """
    import re
    from tok_core import parse_dat

    case = parse_dat(text)
    tokens = list(re.finditer(r"\S+", text.split("\x1a", 1)[0]))
    header_count = 7 if case.flat else 6
    start = header_count + 2 * len(case.coordinates) + 1
    width = 4 if case.fixed_voltages is not None else 2
    count = width * len(case.pairs)
    values = [token.group() for token in tokens[start:start + count]]
    replacement = " ".join(values) if one_line else "\n".join(" ".join(values[i:i + width]) for i in range(0, count, width))
    return text[:tokens[start].start()] + replacement + text[tokens[start + count - 1].end():]


def serialize_case(case):
    """Возвращает DAT из Case для проверки человекочитаемой формы и экспорта.

    Порядок полей соответствует parse_dat; индивидуальные размеры и ручные
    уравнения хранятся отдельно в параметрах расчёта, как и в исходном DOS.
    """
    header = ([case.length, case.height, case.width, case.resistivity, case.electrode_count,
               2 * case.electrode_count, case.placement] if case.flat else
              [case.length, case.height, case.resistivity, case.electrode_count, case.radius, case.electrode_length])
    records = [header] + case.coordinates + [[len(case.pairs)]]
    if case.fixed_voltages is not None:
        records.extend(pair + voltage for pair, voltage in zip(case.pairs, case.fixed_voltages))
    else:
        records.extend(case.pairs)
        records.append([case.relaxation, case.tolerance, len(case.initial_voltages)])
        records.extend([[voltage, power] for voltage, power in zip(case.initial_voltages, case.target_powers)])
        records.append([len(case.voltage_terms), len(case.power_terms)])
        records.extend(case.voltage_terms)
        records.extend(case.power_terms)
    return "\n".join(" ".join(format(v, ".15g") for v in row) for row in records) + "\n"


def write_tokgr(result, path):
    """Сохраняет TOKGR.DAT: два INTEGER*4 и столбцы REAL*4 напряжений/токов.

    Формат подтверждён существующими файлами и TOKGR.LST; его читают старые
    TOKGRP/TOKGRD и современный read_tokgr. Переполнение float32 — ошибка.
    """
    n = len(result["currents"])
    m = len(result["pair_voltages"])
    values = [row[component] for rows in (result["pair_voltages"], result["currents"])
              for component in range(2) for row in rows]
    try:
        raw = struct.pack("<ii", n, m) + struct.pack(f"<{len(values)}f", *values)
    except (OverflowError, struct.error) as error:
        raise CalculationError("Результат не помещается в исходный формат REAL*4.") from error
    Path(path).write_bytes(raw)


def read_tokgr(path):
    """Открывает сохранённый графический расчёт без DOS-ГРАФОР.

    Проверяет размер и конечность чисел; возвращает данные для векторной
    диаграммы современного GUI. Геометрии электродов этот формат не содержит.
    """
    path = Path(path)
    raw = path.read_bytes()
    if len(raw) < 8:
        raise CalculationError("TOKGR.DAT короче заголовка.")
    n, m = struct.unpack_from("<ii", raw)
    if not 2 <= n <= 1000 or not 1 <= m <= 1000 or len(raw) != 8 + 8 * (n + m):
        raise CalculationError("Размер или заголовок TOKGR.DAT не соответствует формату ТОК.")
    values = struct.unpack_from(f"<{2 * (n + m)}f", raw, 8)
    if not all(math.isfinite(v) for v in values):
        raise CalculationError("Графический файл содержит нечисловые значения.")
    voltages = [[values[i], values[m + i]] for i in range(m)]
    currents = [[values[2 * m + i], values[2 * m + n + i]] for i in range(n)]
    return {"name": path.name, "pair_voltages": voltages, "currents": currents,
            "current_magnitudes": [math.hypot(*row) for row in currents], "graphics_only": True,
            "group_voltages": [], "powers": [], "power_errors": [], "iterations": 0,
            "case": {"flat": False, "electrode_count": n, "coordinates": []}}


def write_field(result, directory):
    """Сохраняет PLOT6-совместимые IST.DAT, POLE.DAT и удобный field.csv.

    IST — little-endian float32, сначала 51 поперечный узел каждого из 137
    продольных сечений. POLE сохраняет старые блоки по 20 столбцов. CSV содержит
    явные координаты и полную двойную точность для современного анализа.
    """
    import csv

    field = result.get("field")
    if field is None:
        raise CalculationError("В результате нет пространственного поля мощности.")
    directory = Path(directory)
    directory.mkdir(parents=True, exist_ok=True)
    values = field["values"]
    flattened = [values[i][j] for j in range(137) for i in range(51)]
    (directory / "IST.DAT").write_bytes(struct.pack("<6987f", *flattened))
    lines = ["", "                                        ПОЛЕ ПЛОТНОСТИ МОЩНОСТИ", ""]
    for start in range(0, 137, 20):
        stop = min(start + 20, 137)
        lines.append("    " + "".join(f"{j + 1:8d}" for j in range(start, stop)))
        for i in range(51):
            lines.append(f"{51 - i:3d} " + "".join(f"{values[i][j]:8.1f}" for j in range(start, stop)))
        lines.append("")
    (directory / "POLE.DAT").write_text("\n".join(lines), encoding="cp866")
    text_values = [values[i][j] for i in range(51) for j in range(137)]
    (directory / "Y51X137.DAT").write_text("\n".join(" ".join(f"{value:.5E}" for value in text_values[start:start + 8])
                                                     for start in range(0, len(text_values), 8)) + "\n", encoding="ascii")
    with (directory / "field.csv").open("w", encoding="utf-8-sig", newline="") as stream:
        writer = csv.writer(stream)
        writer.writerow(["Поперечная координата", "Продольная координата", "Плотность мощности"])
        for j, v in enumerate(field["v_axis"]):
            for i, u in enumerate(field["u_axis"]):
                writer.writerow([u, v, values[i][j]])


def read_field(path, length, height):
    """Читает существующее бинарное IST.DAT для просмотра карты без DOS.

    Размеры печи отсутствуют в самом файле, поэтому GUI получает их из
    соседнего PLOT6.DAT или спрашивает пользователя. Токи из поля не выводятся.
    """
    path = Path(path)
    if not all(math.isfinite(v) and v > 0 for v in (length, height)):
        raise CalculationError("Укажите положительные размеры печи для архивного поля.")
    raw = path.read_bytes()
    if len(raw) != 6987 * 4:
        raise CalculationError("IST.DAT должен содержать 6987 значений REAL*4 (27948 байт).")
    flattened = struct.unpack("<6987f", raw)
    if not all(math.isfinite(v) and v >= 0 for v in flattened):
        raise CalculationError("Архивное поле содержит отрицательные или нечисловые значения.")
    values = [[flattened[j * 51 + i] for j in range(137)] for i in range(51)]
    return {"name": path.name, "graphics_only": True, "currents": [], "pair_voltages": [],
            "current_magnitudes": [], "group_voltages": [], "powers": [], "power_errors": [], "iterations": 0,
            "case": {"flat": False, "electrode_count": 0, "coordinates": [], "length": length, "height": height},
            "field": {"u_axis": [-length / 2 + i * length / 50 for i in range(51)],
                      "v_axis": [j * height / 136 for j in range(137)], "values": values, "shape": [51, 137],
                      "minimum": min(flattened), "maximum": max(flattened), "model": "PLOT6 archive"}}
