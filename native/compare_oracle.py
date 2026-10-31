"""Сверяет Python с результатами TOKP.EXE, полученными prepare_oracle."""

import json
from pathlib import Path
import re

from tok_core import calculate, load_case


def compare():
    """Сравнивает U0, компоненты и модули токов всех завершённых DOS-примеров.

    Допуск U0 учитывает одинарную точность FORTRAN; токи в LST напечатаны
    целыми. Отклонение до единицы учитывает округление на границе .5.
    Незавершённый эталон считается ошибкой проверки.
    """
    native = Path(__file__).resolve().parent
    root = native.parent / "ТОК1"
    oracle = native / "oracle/batch"
    manifest = json.loads((oracle / "manifest.json").read_text(encoding="utf-8"))
    rows = []
    for item in manifest:
        report_path = oracle / item["directory"] / "TOKA.LST"
        if not report_path.exists():
            rows.append({**item, "passed": False, "reason": "Эталон ещё не создан"})
            continue
        report = report_path.read_text(encoding="cp866")
        result = calculate(load_case(root / item["source"]))
        match = re.search(r"НАПРЯЖЕНИЯ\s+U0:\s*(.*?)\s*U\(", report, re.DOTALL)
        if not match or "   ТОКИ" not in report:
            rows.append({**item, "passed": False, "reason": "Эталонный расчёт не завершён"})
            continue
        voltages = [float(v) for v in match.group(1).split()]
        voltage_error = max(abs(a - b) for a, b in zip(voltages, result["group_voltages"]))
        block = report.split("   ТОКИ", 1)[1].strip().splitlines()[1:]
        current_rows = [[float(v) for v in row.split()] for row in block if row.strip()]
        expected = [[r[j] for r in result["currents"]] for j in range(2)] + [result["current_magnitudes"]]
        shape_ok = (len(voltages) == len(result["group_voltages"]) and len(current_rows) == 3
                    and all(len(row) == result["case"]["electrode_count"] for row in current_rows))
        current_error = max((abs(a - b) for row_a, row_b in zip(current_rows, expected) for a, b in zip(row_a, row_b)), default=float("inf"))
        passed = shape_ok and voltage_error < 0.01 and current_error <= 1.0
        rows.append({**item, "passed": passed, "max_voltage_error": voltage_error,
                     "max_current_error_against_rounded_report": current_error, "dos_voltages": voltages,
                     "python_voltages": result["group_voltages"]})
    (native / "evidence/oracle_comparison.json").write_text(json.dumps(rows, ensure_ascii=False, indent=2), encoding="utf-8")
    for row in rows:
        print(json.dumps(row, ensure_ascii=False))
    return all(row["passed"] for row in rows)


if __name__ == "__main__":
    raise SystemExit(0 if compare() else 1)
