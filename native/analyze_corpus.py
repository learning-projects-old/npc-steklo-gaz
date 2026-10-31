"""Составляет воспроизводимый перечень старых файлов и проверяет новый расчёт."""

from collections import Counter
import hashlib
import json
from pathlib import Path

from tok_core import CalculationError, calculate, load_case


def analyze(root, destination):
    """Проверяет все файлы ТОК1, сохраняя хеши, статусы DAT и листинги UTF-8.

    Вызывается как отдельный инструмент анализа. Ничего не запускает в DOS и
    не меняет архив; копии FORTRAN предназначены для чтения, не для сборки.
    В читаемых копиях нормализуются переводы строк и конечные пробелы.
    """
    destination.mkdir(parents=True, exist_ok=True)
    entries = []
    counts = Counter()
    for path in sorted(root.rglob("*")):
        if not path.is_file():
            continue
        raw = path.read_bytes()
        relative = path.relative_to(root)
        entry = {"path": str(relative), "bytes": len(raw), "sha256": hashlib.sha256(raw).hexdigest()}
        if path.suffix.lower() == ".for":
            entry["kind"] = "FORTRAN compiler listing/transcription"
            decoded = destination / "decoded" / relative
            decoded.parent.mkdir(parents=True, exist_ok=True)
            text = raw.decode("cp866").replace("\x1a", "")
            decoded.write_text("\n".join(line.rstrip() for line in text.splitlines()).rstrip() + "\n", encoding="utf-8")
        elif raw[:2] == b"MZ":
            entry["kind"] = "DOS MZ executable"
        elif path.suffix.lower() in (".zip", ".xls", ".lst") or any(p in relative.parts for p in ("ТОК zip", "FOR", "TT")):
            entry["kind"] = "archive/report/reference"
        else:
            try:
                case = load_case(path)
                entry.update(kind="PTOK DAT", flat=case.flat, electrodes=case.electrode_count,
                             missing_equations=case.electrode_count - 1 - len(case.pairs))
                try:
                    result = calculate(case)
                    entry.update(status="calculated", iterations=result["iterations"],
                                 max_power_error=max(map(abs, result["power_errors"]), default=0))
                except CalculationError as error:
                    entry.update(status="requires_input_or_geometry_review", reason=str(error))
            except (CalculationError, UnicodeError) as error:
                entry.update(kind="other_format", reason=str(error))
        counts[entry.get("status", entry["kind"])] += 1
        entries.append(entry)
    report = {"root": str(root), "counts": dict(counts), "files": entries}
    (destination / "inventory.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(counts, ensure_ascii=False, indent=2))
    return report


if __name__ == "__main__":
    native = Path(__file__).resolve().parent
    analyze(native.parent / "ТОК1", native / "evidence")
