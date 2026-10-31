"""Перенос PTOK: исходные DAT → сопротивления → токи и мощности.

Происхождение формул и границы совместимости описаны в REVERSE_ENGINEERING.md.
Используется только стандартная библиотека Python.
"""

from dataclasses import asdict, dataclass
import math
from pathlib import Path


class CalculationError(ValueError):
    """Ошибка входных данных, геометрии или сходимости расчёта PTOK."""


@dataclass
class Case:
    """Данные одного DAT; индексы электродов и групп остаются единичными."""

    name: str
    flat: bool
    length: float
    height: float
    resistivity: float
    coordinates: list
    electrode_count: int
    radius: float = 0.0
    electrode_length: float = 0.0
    width: float = 0.0
    placement: int = 0
    pairs: list = None
    relaxation: float = 0.02
    tolerance: float = 200.0
    initial_voltages: list = None
    target_powers: list = None
    voltage_terms: list = None
    power_terms: list = None
    fixed_voltages: list = None


def parse_dat(text, name="Расчёт"):
    """Читает текст DAT для GUI и CLI; не смешивает форматы PTOK и PLOT6.

    Поддерживает круглые/плоские электроды, заданные мощности и заданные
    комплексные напряжения. Диагностика сохраняет номера строк DAT и объясняет
    смещение разделов при лишних номерах пар, не ограничивая допустимые переносы.
    """
    text = text.split("\x1a", 1)[0]
    source_lines = [(i, line.strip()) for i, line in enumerate(text.splitlines(), 1) if line.strip()]
    lines = [line for _, line in source_lines]
    if not lines:
        raise CalculationError("Файл пуст.")
    parsed_lines = []
    for line_number, line in source_lines:
        row = []
        for column, token in enumerate(line.split(), 1):
            try:
                value = float(token.replace("D", "E").replace("d", "e"))
            except ValueError as error:
                raise CalculationError(f"DAT, строка {line_number}, значение № {column}: «{token}» не является числом. Введите число с десятичной точкой, например 0.24.") from error
            if not math.isfinite(value):
                raise CalculationError(f"DAT, строка {line_number}, значение № {column}: «{token}» недопустимо. Замените NaN или бесконечность конечным числом.")
            row.append(value)
        parsed_lines.append(row)
    header = parsed_lines[0]
    values = [value for row in parsed_lines[1:] for value in row]
    locations = [(line_number, column) for line_number, line in source_lines[1:]
                 for column, _ in enumerate(line.split(), 1)]
    if len(header) not in (6, 7):
        raise CalculationError("В первой строке требуется 6 чисел для круглых или 7 для плоских электродов.")
    position = 0

    def take(count, label="расчётные данные"):
        """Извлекает блок DAT; при обрыве называет раздел и число недостающих значений."""
        nonlocal position
        if count < 0 or position + count > len(values):
            raise CalculationError(f"DAT закончился: раздел «{label}» требует {count} чисел, осталось {len(values) - position}. Дополните этот раздел; последнее число файла находится в строке {source_lines[-1][0]}.")
        result = values[position:position + count]
        position += count
        return result

    def integer(value, minimum, maximum, label):
        """Проверяет счётчики/индексы DAT, исключая округление неверных чисел."""
        if value != int(value) or not minimum <= value <= maximum:
            raise CalculationError(f"{label}: требуется целое от {minimum} до {maximum}, получено {value}.")
        return int(value)

    flat = len(header) == 7
    n = integer(header[4] if flat else header[3], 2, 50, "Количество электродов")
    coordinate_count = integer(header[5], 4, 100, "Количество концов") if flat else n
    if flat and coordinate_count != 2 * n:
        raise CalculationError("У плоских электродов должно быть ровно 2N концов.")
    case = Case(name, flat, header[0], header[1], header[3] if flat else header[2], [], n)
    if min(case.length, case.height, case.resistivity) <= 0:
        raise CalculationError("Размеры печи и удельное сопротивление должны быть положительными.")
    if flat:
        case.width = header[2]
        case.placement = integer(header[6], 0, 1, "Размещение")
        if case.width <= 0:
            raise CalculationError("Ширина ванны должна быть положительной.")
    else:
        case.radius, case.electrode_length = header[4:6]
        if case.radius < 0 or case.electrode_length < 0:
            raise CalculationError("Радиус и длина электрода не могут быть отрицательными.")
    case.coordinates = [take(2, f"координаты № {i + 1}: X и Y") for i in range(coordinate_count)]
    pair_count = integer(take(1, "количество пар")[0], 1, n - 1, "Количество пар")
    pair_start = position
    remaining = len(values) - position
    if remaining == 4 * pair_count:
        records = [take(4) for _ in range(pair_count)]
        case.pairs = [r[:2] for r in records]
        case.fixed_voltages = [r[2:] for r in records]
    else:
        case.pairs = [take(2, f"пара № {i + 1}: два номера электродов") for i in range(pair_count)]
        settings_start = position
        case.relaxation, case.tolerance, np_value = take(3, "шаг подбора, допуск мощности и количество силовых групп")
        if np_value != int(np_value) or not 1 <= np_value <= 15 or not 0 < case.relaxation <= 1:
            pair_line = locations[pair_start][0]
            same_line_values = [v for v, location in zip(values[pair_start:], locations[pair_start:]) if location[0] == pair_line]
            if (len(same_line_values) > 2 * pair_count and len(same_line_values) % 2 == 0
                    and all(v == int(v) and v > 0 for v in same_line_values)):
                extra = same_line_values[2 * pair_count:]
                missing_electrodes = sorted({int(v) for v in same_line_values if v > n})
                detail = (f"\nЭлектродов в файле: {n}. Номера {', '.join(map(str, missing_electrodes))} не существуют."
                          if missing_electrodes else "")
                raise CalculationError(
                    f"DAT, строка {pair_line}: указано {pair_count} пар, но в строке записано {len(same_line_values) // 2}. "
                    f"Лишние номера: {' '.join(format(v, 'g') for v in extra)}.{detail}\n"
                    "Удалите лишнюю пару либо сначала добавьте нужные электроды и согласуйте количество пар и электрическую схему. "
                    "Из-за лишних чисел программа не может правильно прочитать следующий раздел питания.")
            line, column = locations[settings_start]
            raise CalculationError(
                f"DAT, строка {line}, значение № {column}: после {pair_count} пар ожидаются шаг подбора (больше 0 и не больше 1), "
                f"допуск мощности и целое количество силовых групп (1–15). Получено: {case.relaxation:g} {case.tolerance:g} {np_value:g}.\n"
                "Проверьте, что каждая пара содержит ровно два номера и число пар совпадает с указанным перед ними. "
                "Пример следующего раздела: 0.02 200. 1.")
        np = integer(np_value, 1, 15, "Количество силовых групп")
        if not 0 < case.relaxation <= 1 or case.tolerance <= 0:
            raise CalculationError("Релаксация должна быть в (0, 1], допуск по мощности — положительным.")
        groups = [take(2, f"силовая группа № {i + 1}: напряжение и мощность") for i in range(np)]
        case.initial_voltages = [g[0] for g in groups]
        case.target_powers = [g[1] for g in groups]
        if any(v == 0 for v in case.initial_voltages) or any(p <= 0 for p in case.target_powers):
            raise CalculationError("Начальные напряжения должны быть ненулевыми, мощности — положительными.")
        nb, na = take(2)
        nb = integer(nb, 1, 1000, "Количество коэффициентов напряжений")
        na = integer(na, 1, 1000, "Количество коэффициентов мощностей")
        case.voltage_terms = [take(4, f"связь напряжения № {i + 1}") for i in range(nb)]
        case.power_terms = [take(5, f"связь мощности № {i + 1}") for i in range(na)]
        for row, component, group, _ in case.voltage_terms:
            integer(row, 1, pair_count, "Строка напряжения")
            integer(component, 1, 2, "Компонента напряжения")
            integer(group, 1, np, "Группа напряжения")
        for group, voltage_group, electrode, component, _ in case.power_terms:
            integer(group, 1, np, "Группа мощности")
            integer(voltage_group, 1, np, "Группа источника")
            integer(electrode, 1, n, "Электрод мощности")
            integer(component, 1, 2, "Компонента тока")
    case.pairs = [[integer(v, 1, n, f"Пара № {i + 1}, электрод № {j + 1} в паре (всего электродов: {n})")
                   for j, v in enumerate(pair)] for i, pair in enumerate(case.pairs)]
    if any(a == b for a, b in case.pairs):
        raise CalculationError("Пара должна содержать разные электроды.")
    if position != len(values):
        raise CalculationError(f"После расчётных данных осталось {len(values) - position} чисел; формат отличается от PTOK.")
    return case


def geometry_problems(case):
    """Возвращает выходы координат за ванну для предупреждений формы и calculate.

    Ось X отсчитывается от середины поперечного размера, Y — от начала ванны.
    Концы плоских электродов допускаются на границе; координаты не исправляются.
    """
    problems = []
    for i, (x, y) in enumerate(case.coordinates):
        label = f"Электрод № {i // 2 + 1}, конец {i % 2 + 1}" if case.flat else f"Электрод № {i + 1}"
        if not -case.length / 2 <= x <= case.length / 2:
            problems.append(f"{label}: X = {x:.2f}, допустимо от {-case.length / 2:.2f} до {case.length / 2:.2f}.")
        if not 0 <= y <= case.height:
            problems.append(f"{label}: Y = {y:.2f}, допустимо от 0.00 до {case.height:.2f}.")
    return problems


def solve_linear(matrix, right):
    """Решает Ax=b с выбором главного элемента; используется вместо GELG.

    Матрица и правая часть не изменяются. Вырожденность и нечисловой результат
    сообщаются вызывающему calculate как CalculationError.
    """
    n = len(matrix)
    if n == 0 or len(right) != n or any(len(row) != n for row in matrix):
        raise CalculationError("Линейная система должна быть квадратной.")
    work = [list(row) + [right[i]] for i, row in enumerate(matrix)]
    scale = max(abs(v) for row in matrix for v in row)
    if not math.isfinite(scale) or scale == 0:
        raise CalculationError("Матрица системы нулевая или содержит бесконечность.")
    for column in range(n):
        pivot = max(range(column, n), key=lambda row: abs(work[row][column]))
        if abs(work[pivot][column]) <= scale * 1e-12:
            raise CalculationError("Вырожденная система: проверьте пары электродов и силовые группы.")
        work[column], work[pivot] = work[pivot], work[column]
        for row in range(column + 1, n):
            factor = work[row][column] / work[column][column]
            for j in range(column + 1, n + 1):
                work[row][j] -= factor * work[column][j]
            work[row][column] = 0.0
    solution = [0.0] * n
    for row in range(n - 1, -1, -1):
        solution[row] = (work[row][n] - sum(work[row][j] * solution[j] for j in range(row + 1, n))) / work[row][row]
    if not all(math.isfinite(v) for v in solution):
        raise CalculationError("Линейная система дала нечисловой результат.")
    return solution


def round_resistances(case, radii=None, electrode_lengths=None):
    """Восстанавливает POLER для круглых электродов по TOKP.EXE:1983–1CFD.

    Вызывается calculate; радиусы удваиваются как в PTOK, длина в знаменателе
    берётся у первого электрода пары. Это часть совместимости, а не новая
    физическая модель. Нулевые радиус/длина в DAT требуют явного ввода массивов.
    """
    n = case.electrode_count
    radii = list(radii) if radii is not None else [case.radius] * n
    lengths = list(electrode_lengths) if electrode_lengths is not None else [case.electrode_length] * n
    if len(radii) != n or len(lengths) != n or any(not math.isfinite(v) or v <= 0 for v in radii + lengths):
        raise CalculationError("Укажите положительные радиус и длину для каждого электрода: в DAT нуль означает ручной ввод.")
    a = math.pi / case.length
    boundary = math.cosh(a * case.height)
    mapped = []
    for u, v in case.coordinates:
        p = math.sin(a * u) * math.cosh(a * v) / boundary
        q = math.cos(a * u) * math.sinh(a * v) / boundary
        s = p * p + q * q
        if s <= 0:
            raise CalculationError("Электрод находится в особой точке преобразования (S=0).")
        derivative = a / s * math.sqrt((s - 1) ** 2 + 4 * q * q) * math.sqrt(s + math.cos(2 * a * u) / boundary ** 2)
        mapped.append((p + p / s, q - q / s, derivative))
    result = [[0.0] * n for _ in range(n)]
    for i, (x_i, y_i, derivative_i) in enumerate(mapped):
        for j, (x_j, y_j, derivative_j) in enumerate(mapped):
            if i == j:
                continue
            distance = (x_i - x_j) ** 2 + (y_i - y_j) ** 2
            reflected = (x_i - x_j) ** 2 + (y_i + y_j) ** 2
            denominator = derivative_i * (2 * radii[i]) * y_i * derivative_j * (2 * radii[j]) * y_j
            if denominator == 0 or distance * reflected / denominator <= 0:
                raise CalculationError("Недопустимая геометрия круглых электродов: аргумент логарифма неположителен.")
            result[i][j] = case.resistivity / (2 * math.pi * lengths[i]) * math.log(distance * reflected / denominator)
    return result


def flat_resistances(case):
    """Вычисляет POLERPL по TOKPL.FOR и проверенной ветви TOKP.EXE.

    Пары координат обозначают концы электрода; размещение 1 меняет ветвь
    формулы для первого электрода. Особые/перекрывающиеся концы отвергаются.
    """
    a = math.pi / case.length
    boundary = math.cosh(a * case.height)
    mapped = []
    for u, v in case.coordinates:
        p = math.sin(a * u) * math.cosh(a * v) / boundary
        q = math.cos(a * u) * math.sinh(a * v) / boundary
        s = p * p + q * q
        if s == 0:
            raise CalculationError("Конец электрода находится в особой точке преобразования.")
        mapped.append(p + p / s)
    n = case.electrode_count
    result = [[0.0] * n for _ in range(n)]
    for i in range(n):
        for j in range(n):
            if i == j:
                continue
            l0, l1, m0, m1 = mapped[2 * i], mapped[2 * i + 1], mapped[2 * j], mapped[2 * j + 1]
            denominator = (l0 - m0) * (l1 - m1)
            if denominator == 0:
                raise CalculationError("Совпадают концы разных электродов.")
            parameter = (l0 - m1) * (l1 - m0) / denominator
            special = case.placement == 1 and (i == 0 or j == 0)
            if special:
                parameter = 1 - parameter
            if not 0 < parameter < 1:
                raise CalculationError("Геометрия плоских электродов дала параметр вне (0, 1).")
            root = (parameter if parameter >= 0.5 else 1 - parameter) ** 0.125
            logarithm = math.log((1 + root) / (1 - root))
            direct = (parameter >= 0.5) != special
            result[i][j] = (case.resistivity / math.pi / case.width * logarithm if direct
                            else math.pi * case.resistivity / case.width / logarithm)
    return result


def isolated_group_equations(case):
    """Строит ΣI=0 для явно выбранного режима изолированных источников.

    GUI применяет функцию только по отдельной кнопке пользователя: связные
    компоненты заданных пар считаются изолированными цепями питания. Для всех,
    кроме последней, задаётся нулевой суммарный комплексный ток; последняя
    следует из общего баланса. Этот режим нельзя применять к общему источнику
    с неуказанными связями между группами.
    """
    n = case.electrode_count
    neighbors = [set() for _ in range(n)]
    for first, second in case.pairs:
        neighbors[first - 1].add(second - 1)
        neighbors[second - 1].add(first - 1)
    remaining = set(range(n))
    components = []
    while remaining:
        pending = [min(remaining)]
        component = set()
        while pending:
            electrode = pending.pop()
            if electrode in component:
                continue
            component.add(electrode)
            pending.extend(neighbors[electrode] - component)
        remaining -= component
        components.append(component)
    return [{"coefficients": [float(i in component) for i in range(n)], "voltage": [0.0, 0.0]}
            for component in components[:-1]]


def calculate(case, radii=None, electrode_lengths=None, extra_equations=None, max_iterations=10000):
    """Выполняет PTOK: сопротивления, баланс токов, подбор мощностей.

    GUI/CLI передают Case из parse_dat. Дополнительные уравнения задаются как
    коэффициенты токов N электродов и две компоненты правой части.
    Релаксация и критерий остановки сохранены из TOKS.FOR; матрица DA —
    исходная итерационная матрица, не полный якобиан. Возвращает JSON-совместимый
    словарь; несходимость ограничена max_iterations и не выдаётся за результат.
    До вычислений geometry_problems запрещает электроды вне размеров ванны.
    """
    try:
        problems = geometry_problems(case)
        if problems:
            raise CalculationError("Электроды находятся за пределами печи:\n" + "\n".join(problems) +
                                   "\nИсправьте координаты в таблице «Печь и электроды» либо верните правильные размеры печи. Координаты автоматически не масштабируются.")
        resistance = flat_resistances(case) if case.flat else round_resistances(case, radii, electrode_lengths)
        n = case.electrode_count
        matrix = []
        for first, second in case.pairs:
            i, j = first - 1, second - 1
            matrix.append([(resistance[j][k] - resistance[i][k] - resistance[j][-1] + resistance[i][-1]) / 2
                           for k in range(n - 1)])
        extra_equations = extra_equations or []
        for equation in extra_equations:
            coefficients = equation["coefficients"]
            rhs = equation["voltage"]
            if len(coefficients) != n or len(rhs) != 2 or not all(math.isfinite(v) for v in coefficients + rhs):
                raise CalculationError("Дополнительное уравнение требует N конечных коэффициентов и 2 компоненты напряжения.")
            matrix.append([coefficients[k] - coefficients[-1] for k in range(n - 1)])
        if len(matrix) != n - 1:
            missing = n - 1 - len(matrix)
            if missing < 0:
                raise CalculationError("Дополнительных уравнений больше, чем независимых токов. Уберите лишние условия.")
            raise CalculationError(f"Недостаточно независимых уравнений: требуется ещё {missing}. В DOS они вводились вручную; задайте их в JSON-параметрах.")
        voltages = list(case.initial_voltages or []) if case.fixed_voltages is None else []
        for iteration in range(max_iterations + 1):
            rhs = [[0.0, 0.0] for _ in case.pairs]
            if case.fixed_voltages is not None:
                rhs = [list(row) for row in case.fixed_voltages]
            else:
                for row, component, group, coefficient in case.voltage_terms:
                    rhs[int(row) - 1][int(component) - 1] += coefficient * voltages[int(group) - 1]
            rhs.extend([list(equation["voltage"]) for equation in extra_equations])
            components = [solve_linear(matrix, [row[j] for row in rhs]) for j in range(2)]
            for component in components:
                component.append(-sum(component))
            currents = [[components[0][i], components[1][i]] for i in range(n)]
            powers = [0.0] * len(voltages)
            da = [[0.0] * len(voltages) for _ in voltages]
            if case.fixed_voltages is None:
                for group, source, electrode, component, coefficient in case.power_terms:
                    k, l, i, j = int(group) - 1, int(source) - 1, int(electrode) - 1, int(component) - 1
                    powers[k] += coefficient * voltages[l] * currents[i][j]
                    da[k][l] += coefficient * currents[i][j]
            errors = ([target - actual for target, actual in zip(case.target_powers or [], powers)]
                      if case.fixed_voltages is None else [])
            if not errors or max(abs(v) for v in errors) <= case.tolerance:
                return {"name": case.name, "case": asdict(case), "iterations": iteration,
                        "calculation_options": {"radii": radii, "electrode_lengths": electrode_lengths,
                                                "extra_equations": extra_equations, "max_iterations": max_iterations},
                        "group_voltages": voltages, "powers": powers, "power_errors": errors,
                        "pair_voltages": rhs[:len(case.pairs)], "currents": currents,
                        "current_magnitudes": [math.hypot(*row) for row in currents],
                        "resistance_matrix": resistance, "system_matrix": matrix}
            if iteration == max_iterations:
                raise CalculationError(f"Нет сходимости за {max_iterations} итераций; последняя ошибка мощности {max(abs(v) for v in errors):.6g}.")
            delta = solve_linear(da, [case.relaxation * value for value in errors])
            voltages = [voltage + correction for voltage, correction in zip(voltages, delta)]
    except (OverflowError, ZeroDivisionError) as error:
        raise CalculationError("Численное переполнение или деление на нуль; проверьте геометрию и начальные напряжения.") from error
    except ValueError as error:
        if isinstance(error, CalculationError):
            raise
        raise CalculationError(f"Формулы неприменимы к заданным данным: {error}") from error


def load_case(path):
    """Читает исходный DOS DAT в CP866 для GUI/CLI, не меняя файл."""
    path = Path(path)
    return parse_dat(path.read_bytes().decode("cp866"), path.name)
