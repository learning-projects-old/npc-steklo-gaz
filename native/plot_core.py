"""Перенос пространственного поля мощности PLOT6.EXE на Python."""

from dataclasses import replace
import math
from concurrent.futures import ProcessPoolExecutor


_field_pools = {}

from tok_core import CalculationError, calculate


def transform(u, v, length, height, allow_boundary=False):
    """Возвращает конформные x,y и модуль производной из PLOT6:1490/1D6D.

    Для сетки допускает округлённый нуль под вторым корнем, как исходный
    код 17DD–17EE. Особая нижняя центральная точка обрабатывается вызывающим
    calculate_field интерполяцией соседей, а не этой функцией.
    """
    a = math.pi / length
    boundary = math.cosh(a * height)
    p = math.sin(a * u) * math.cosh(a * v) / boundary
    q = math.cos(a * u) * math.sinh(a * v) / boundary
    s = p * p + q * q
    if s == 0:
        raise CalculationError("Особая точка преобразования поля мощности.")
    second = s + math.cos(2 * a * u) / boundary ** 2
    if allow_boundary:
        second = max(0.0, second)
    derivative = a / s * math.sqrt((s - 1) ** 2 + 4 * q * q) * math.sqrt(second)
    return p + p / s, q - q / s, derivative


def calculate_field(case, radii=None, electrode_lengths=None, extra_equations=None,
                    max_iterations=10000, voltage_format="amplitude_phase", workers=1):
    """Выполняет PLOT6: токи и средняя плотность мощности в сетке 51×137.

    В исходном PLOT6 фиксированные напряжения — действующее значение и фаза
    в градусах. Шесть равномерных временных отсчётов полупериода дают точно
    сумму квадратов двух RMS-компонент: здесь использована эта эквивалентность.
    Сохранены коэффициент 0.83, правило внутри электрода и интерполяция нижнего
    центрального узла. В GUI/CLI результат используется для карты и экспорта.
    workers задаёт число процессов для независимых строк сетки.
    Подбор мощностей PTOK также допускается с уже заданными комплексными токами;
    плоские электроды не поддерживаются именно пространственной моделью PLOT6.
    """
    if case.flat:
        raise CalculationError("Пространственная модель PLOT6 предназначена для круглых электродов.")
    if voltage_format not in ("amplitude_phase", "cartesian"):
        raise CalculationError("Формат напряжения: amplitude_phase или cartesian.")
    effective = case
    original_voltages = case.fixed_voltages
    if original_voltages is not None and voltage_format == "amplitude_phase":
        effective = replace(case, fixed_voltages=[[amplitude * math.cos(math.radians(phase)),
                                                 amplitude * math.sin(math.radians(phase))]
                                                for amplitude, phase in original_voltages])
    result = calculate(effective, radii=radii, electrode_lengths=electrode_lengths,
                       extra_equations=extra_equations, max_iterations=max_iterations)
    n = case.electrode_count
    radii = list(radii) if radii is not None else [case.radius] * n
    lengths = list(electrode_lengths) if electrode_lengths is not None else [case.electrode_length] * n
    electrode_points = [transform(u, v, case.length, case.height) for u, v in case.coordinates]
    u_axis = [-case.length / 2 + i * case.length / 50 for i in range(51)]
    v_axis = [j * case.height / 136 for j in range(137)]
    values = [[0.0] * 137 for _ in range(51)]
    arguments = [(i, u, v_axis, case, radii, lengths, electrode_points,
                  {"currents": result["currents"]}) for i, u in enumerate(u_axis)]
    if workers < 1:
        raise CalculationError("Количество процессов должно быть положительным.")
    # В Windows ProcessPoolExecutor допускает не более 61 процесса.
    count = min(workers, len(arguments), 61)
    if count == 1:
        values = list(map(field_row, arguments))
    else:
        # Сохраняем процессы для следующих расчётов: запуск Windows-процессов
        # дороже самой небольшой сетки. Executor закрывается при выходе Python.
        if count not in _field_pools:
            _field_pools[count] = ProcessPoolExecutor(max_workers=count)
        values = list(_field_pools[count].map(field_row, arguments, chunksize=max(1, len(arguments) // count)))
    values[25][0] = (values[24][0] + values[26][0]) / 2
    result["field"] = {"u_axis": u_axis, "v_axis": v_axis, "values": values,
                       "shape": [51, 137], "model": "PLOT6", "legacy_factor": 0.83,
                       "voltage_format": voltage_format, "input_fixed_voltages": original_voltages,
                       "minimum": min(map(min, values)), "maximum": max(map(max, values))}
    return result


def field_row(arguments):
    """Считает независимую строку PLOT6 в основном или дочернем процессе.

    calculate_field передаёт только числовые данные; порядок операций внутри
    узла одинаков для последовательного и многопроцессорного исполнения.
    """
    i, u, v_axis, case, radii, lengths, electrode_points, result = arguments
    row = [0.0] * len(v_axis)
    for j, v in enumerate(v_axis):
        if i == 25 and j == 0:
            continue
        x, y, derivative = transform(u, v, case.length, case.height, allow_boundary=True)
        gradient_x = [0.0, 0.0]
        gradient_y = [0.0, 0.0]
        inside = None
        for electrode, (xe, ye, de) in enumerate(electrode_points):
            dx, minus, plus = x - xe, y - ye, y + ye
            distance_squared = dx * dx + minus * minus
            if distance_squared <= (radii[electrode] * de) ** 2:
                inside = electrode
                break
            reflected_squared = dx * dx + plus * plus
            if distance_squared == 0 or reflected_squared == 0:
                raise CalculationError("Узел сетки совпадает с особой точкой электрода.")
            factor = 1 / (2 * math.pi * lengths[electrode])
            for component in range(2):
                current = result["currents"][electrode][component]
                gradient_x[component] += current * dx * factor * (1 / distance_squared + 1 / reflected_squared)
                gradient_y[component] += current * factor * (minus / distance_squared + plus / reflected_squared)
        if inside is not None:
            density = sum(current ** 2 for current in result["currents"][inside]) / (math.pi * lengths[inside] * 2 * radii[inside]) ** 2
        else:
            density = derivative ** 2 * sum(value ** 2 for value in gradient_x + gradient_y)
        row[j] = 0.83 * case.resistivity * density
    return row
