"""Готовит независимую проверку PTOK на копиях DAT, сохраняя оригиналы."""

import json
from pathlib import Path
import shutil

from tok_core import load_case


def prepare():
    """Создаёт DOSBox-пакет нескольких категорий и manifest для compare_oracle.

    Эталонный DOS запускается только при разработке; его нет в сборке TOK.
    Два первых ответа включают печать системы и сопротивлений.
    """
    native = Path(__file__).resolve().parent
    root = native.parent / "ТОК1"
    inventory = json.loads((native / "evidence/inventory.json").read_text(encoding="utf-8"))
    selected = ["CIRCLE.DAT", "BOX.DAT", "CHRUSTAL/PL05T.DAT", "SPEZ/BOROSIL0", "TARA/TARA.DAT", "DEP/ANOP3.DAT"]
    for category in ("BESCWET", "CHRUSTAL", "DEP", "FRITTA", "PITATEL", "SPEZ", "TARA", "TARA2"):
        matches = [row for row in inventory["files"] if row.get("status") == "calculated"
                   and row["path"].replace("\\", "/").startswith(category + "/")]
        if matches:
            selected.append(max(matches, key=lambda row: row["electrodes"])["path"])
    oracle = native / "oracle/batch"
    oracle.mkdir(parents=True, exist_ok=True)
    commands = ["[cpu]", "cycles=max", "[autoexec]", f"mount c {oracle}", "c:"]
    manifest = []
    selected = list(dict.fromkeys(path.replace("\\", "/") for path in selected))
    for i, relative in enumerate(selected):
        case = load_case(root / relative)
        if case.fixed_voltages is not None:
            continue
        directory = f"C{i:04d}"
        destination = oracle / directory
        destination.mkdir(exist_ok=True)
        shutil.copyfile(root / "TOKP.EXE", destination / "TOKP.EXE")
        shutil.copyfile(root / relative, destination / ("BOX.DAT" if case.flat else "CIRCLE.DAT"))
        answers = f"{int(case.flat)}\n1\n1\n"
        if case.flat:
            answers += "\n".join(str(i) for i in range(1, case.electrode_count + 1)) + "\n"
        (destination / "INPUT.TXT").write_text(answers, encoding="ascii")
        commands.extend([f"cd {directory}", "tokp < INPUT.TXT > SCREEN.TXT", "cd .."])
        manifest.append({"directory": directory, "source": relative})
    commands.append("exit")
    (oracle / "batch.conf").write_text("\n".join(commands) + "\n", encoding="ascii")
    (oracle / "manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"Подготовлено контрольных расчётов: {len(manifest)}")


if __name__ == "__main__":
    prepare()
