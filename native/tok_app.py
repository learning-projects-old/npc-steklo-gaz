"""Общие параметры и отчёт приложения ТОК; точка запуска современного GUI/CLI."""

import json
from pathlib import Path
import sys

from tok_core import CalculationError


def parameters_from_text(text):
    """Проверяет JSON дополнительных данных для GUI/CLI перед calculate."""
    value = json.loads(text or "{}")
    allowed = {"radii", "electrode_lengths", "extra_equations", "max_iterations"}
    if not isinstance(value, dict) or set(value) - allowed:
        raise CalculationError("Параметры: допустим объект с radii, electrode_lengths, extra_equations, max_iterations.")
    iterations = value.get("max_iterations", 10000)
    if isinstance(iterations, bool) or not isinstance(iterations, int) or not 1 <= iterations <= 100000:
        raise CalculationError("max_iterations должен быть целым от 1 до 100000.")
    for key in ("radii", "electrode_lengths"):
        if key in value and (not isinstance(value[key], list) or any(isinstance(v, bool) or not isinstance(v, (int, float)) for v in value[key])):
            raise CalculationError(f"{key}: требуется массив чисел.")
    if "extra_equations" in value:
        rows = value["extra_equations"]
        if not isinstance(rows, list):
            raise CalculationError("extra_equations: требуется массив уравнений.")
        for row in rows:
            if not isinstance(row, dict) or set(row) != {"coefficients", "voltage"}:
                raise CalculationError("Уравнение: требуются coefficients и voltage.")
            if any(not isinstance(row[k], list) or any(isinstance(v, bool) or not isinstance(v, (int, float)) for v in row[k]) for k in row):
                raise CalculationError("Коэффициенты и напряжение уравнения должны быть массивами чисел.")
    return value


def format_result(result):
    """Форматирует отчёт GUI до двух десятичных знаков, не изменяя результаты calculate."""
    case = result["case"]
    lines = [f"ТОК — {result['name']}", "",
             f"Электроды: {'плоские' if case['flat'] else 'круглые'}; количество: {case['electrode_count']}",
             f"Итераций подбора напряжения: {result['iterations']}",
             "Числа сохраняют единицы исходного DAT; преобразование единиц не выполняется.", ""]
    for i, voltage in enumerate(result["group_voltages"]):
        lines.append(f"Группа {i + 1}: U₀ = {voltage:.2f}; P = {result['powers'][i]:.2f}; ΔP = {result['power_errors'][i]:.2f}")
    lines.extend(["", "Электрод        Re(I)          Im(I)           |I|", "─" * 62])
    for i, ((real, imaginary), magnitude) in enumerate(zip(result["currents"], result["current_magnitudes"]), 1):
        lines.append(f"{i:8d}  {real:14.2f} {imaginary:14.2f} {magnitude:14.2f}")
    for key, title in (("resistance_matrix", "Матрица сопротивлений"), ("system_matrix", "Матрица линейной системы")):
        if key in result:
            lines.extend(["", title])
            lines.extend(" ".join(f"{v:12.2f}" for v in row) for row in result[key])
    if "field" in result:
        field = result["field"]
        lines.extend(["", f"Поле PLOT6: сетка 51 × 137, минимум {field['minimum']:.2f}, максимум {field['maximum']:.2f}"])
    return "\n".join(lines)


def resources_path():
    """Находит встроенные примеры в EXE PyInstaller либо рядом с исходниками."""
    return Path(getattr(sys, "_MEIPASS", Path(__file__).parent)) / "presets"
if __name__ == "__main__":
    import multiprocessing
    multiprocessing.freeze_support()
    from cli import main
    raise SystemExit(main())
