"""Сверка PLOT6, TOK и TOKP1 с переносом на Python на независимых копиях."""

from dataclasses import replace
import json
from pathlib import Path
import shutil
import struct
import subprocess

from legacy_io import read_tokgr, serialize_case
from plot_core import calculate_field
from tok_core import calculate, load_case


def run_reference(executable, input_name, text, answers, directory, dosbox, fix_tok_output=False):
    """Исполняет старую программу на копии; необязательная правка TOK касается только имени вывода.

    В сохранённом TOK.EXE имя UNIT 6 пустое/пробельное и не открывается. Режим
    fix_tok_output заменяет этот единственный байт на R, не меняя инструкции
    и математические данные; это позволяет проверить сохранённый расчётчик.
    """
    directory.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(executable, directory / executable.name)
    if fix_tok_output:
        raw = bytearray(executable.read_bytes())
        offset = 2048 + 0x11850 + 0xdc
        if raw[offset] not in (0, 32) or executable.name.upper() != "TOK.EXE":
            raise RuntimeError("Неожиданный образ TOK.EXE для исправления имени вывода.")
        raw[offset] = ord("R")
        (directory / executable.name).write_bytes(raw)
    (directory / input_name).write_text(text, encoding="cp866")
    (directory / "INPUT.TXT").write_text(answers, encoding="ascii")
    configuration = directory / "reference.conf"
    configuration.write_text(f"[cpu]\ncycles=max\n[autoexec]\nmount c {directory}\nc:\n{executable.name} < INPUT.TXT > SCREEN.TXT\nexit\n", encoding="ascii")
    process = subprocess.Popen([str(dosbox), "-conf", str(configuration), "-noconsole"], cwd=directory,
                               creationflags=subprocess.CREATE_NO_WINDOW)
    try:
        process.wait(timeout=45)
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait()
        raise RuntimeError(f"Эталон не завершён за 45 секунд: {directory.name}")


def compare_extended():
    """Проверяет всю сетку PLOT6 при трёх наборах параметров и варианты TOK/TOKP1."""
    native = Path(__file__).resolve().parent
    root = native.parent / "ТОК1"
    dosbox = native.parent / "DOSBox-0.74-3/DOSBox.exe"
    report = []
    original = load_case(root / "PLOT6.DAT")
    for label, voltage_scale, resistivity_scale in (("original", 1.0, 1.0), ("voltage", 1.2, 1.0), ("rho", 1.0, 2.0)):
        case = replace(original, resistivity=original.resistivity * resistivity_scale,
                       fixed_voltages=[[voltage * voltage_scale, phase] for voltage, phase in original.fixed_voltages])
        directory = native / "oracle" / f"plot-{label}"
        run_reference(root / "PLOT6.EXE", "PLOT6.DAT", serialize_case(case), "", directory, dosbox)
        expected = struct.unpack("<6987f", (directory / "IST.DAT").read_bytes())
        result = calculate_field(case)
        actual = [result["field"]["values"][i][j] for j in range(137) for i in range(51)]
        absolute = max(abs(a - b) for a, b in zip(actual, expected))
        relative = max(abs(a - b) / max(abs(b), 1.0) for a, b in zip(actual, expected))
        report.append({"program": "PLOT6", "case": label, "nodes": len(actual), "max_absolute_error": absolute,
                       "max_relative_error_above_unit": relative, "passed": relative < 0.0001})
    for relative in ("CIRCLE.DAT", "BOX.DAT"):
        case = load_case(root / relative)
        answers = f"{int(case.flat)}\n1\n1\n" + ("1\n2\n3\n" if case.flat else "")
        directory = native / "oracle" / f"tokp1-{int(case.flat)}"
        run_reference(root / "TOKP1.EXE", relative, serialize_case(case), answers, directory, dosbox)
        text = (directory / "TOKA.LST").read_text(encoding="cp866")
        import re
        match = re.search(r"НАПРЯЖЕНИЯ\s+U0:\s*(.*?)\s*U\(", text, re.DOTALL)
        expected = float(match.group(1).strip()) if match else None
        actual = calculate(case)["group_voltages"][0]
        report.append({"program": "TOKP1", "case": relative, "reference_voltage": expected, "python_voltage": actual,
                       "passed": expected is not None and abs(actual - expected) < 0.001})
    case = load_case(root / "CIRCLE.DAT")
    calculated = calculate(case)
    fixed = replace(case, fixed_voltages=calculated["pair_voltages"], initial_voltages=None, target_powers=None,
                    voltage_terms=None, power_terms=None)
    directory = native / "oracle/tok-fixed"
    run_reference(root / "ТОК zip/ТОК/TOK.EXE", "TOK.DAT", serialize_case(fixed), "0\n51 137\n", directory, dosbox, fix_tok_output=True)
    if (directory / "TOKGR.DAT").exists():
        reference = read_tokgr(directory / "TOKGR.DAT")
        actual = calculate(fixed)
        error = max(abs(a - b) for expected_row, actual_row in zip(reference["currents"], actual["currents"]) for a, b in zip(expected_row, actual_row))
        report.append({"program": "TOK", "case": "fixed complex voltages", "output_filename_patched": True,
                       "max_current_error": error, "passed": error < 0.01})
    else:
        report.append({"program": "TOK", "passed": False, "reason": "Не создан TOKGR.DAT; требуется уточнить интерактивный ввод"})
    (native / "evidence/extended-comparison.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False, indent=2))
    return all(row["passed"] for row in report)


if __name__ == "__main__":
    raise SystemExit(0 if compare_extended() else 1)
