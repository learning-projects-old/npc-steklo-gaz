"""Проверяет самостоятельные EXE с минимальным PATH вне рабочего каталога."""

import hashlib
import argparse
import json
import os
from pathlib import Path
import subprocess
import tempfile

from tok_core import calculate, load_case


def smoke(binary_directory=None):
    """Проверяет токи и PLOT6 в единственной сборке TOK26-fast.exe.

    Для проверки независимости удаляет Python/Tcl-переменные и оставляет в PATH
    только системный каталог Windows. Сопоставляет EXE с Python и записывает
    SHA-256 сборок; не управляет окнами и не использует DOSBox.
    """
    native = Path(__file__).resolve().parent
    binaries_path = Path(binary_directory).resolve() if binary_directory else native / "dist/update-fast"
    executables = ["TOK26-fast.exe"]
    sources = native.parent / "ТОК1"
    manifest = [{"source": "CIRCLE.DAT"}, {"source": "BOX.DAT"}]
    environment = {key: value for key, value in os.environ.items()
                   if key.upper() not in ("PYTHONPATH", "PYTHONHOME", "TCL_LIBRARY", "TK_LIBRARY", "VIRTUAL_ENV")}
    environment["PATH"] = str(Path(os.environ["SystemRoot"]) / "System32")
    results = []
    with tempfile.TemporaryDirectory(prefix="tok-native-check-") as directory:
        output = Path(directory) / "result.json"
        for executable in executables:
            fixtures = manifest
            for fixture in fixtures:
                source = sources / fixture["source"]
                process = subprocess.run([str(binaries_path / executable), "calculate", str(source), "--output", str(output)],
                                         cwd=directory, env=environment, capture_output=True, timeout=60,
                                         creationflags=subprocess.CREATE_NO_WINDOW)
                if process.returncode != 0:
                    raise RuntimeError(f"{executable}: {process.returncode}, {process.stderr!r}")
                actual = json.loads(output.read_text(encoding="utf-8"))
                expected = calculate(load_case(source))
                if actual != expected:
                    raise AssertionError(f"EXE отличается от исходников: {fixture['source']}")
                results.append({"executable": executable, "source": fixture["source"], "passed": True})
        for executable in executables:
            source = sources / "PLOT6.DAT"
            process = subprocess.run([str(binaries_path / executable), "field", str(source), "--output", str(output)],
                                     cwd=directory, env=environment, capture_output=True, timeout=60,
                                     creationflags=subprocess.CREATE_NO_WINDOW)
            if process.returncode != 0:
                raise RuntimeError(f"PLOT6 {executable}: {process.returncode}, {process.stderr!r}")
            from plot_core import calculate_field
            if json.loads(output.read_text(encoding="utf-8")) != calculate_field(load_case(source)):
                raise AssertionError("PLOT6 в EXE отличается от исходников.")
            results.append({"executable": executable, "source": "PLOT6.DAT", "mode": "field", "passed": True})
    binaries = [{"file": path.name, "bytes": path.stat().st_size, "sha256": hashlib.sha256(path.read_bytes()).hexdigest()}
                for path in sorted(binaries_path.glob("TOK26*.exe"))]
    report = {"minimal_environment": True, "checks": results, "binaries": binaries}
    (native / "evidence/compiled-checks.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(report, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--binary-directory")
    smoke(parser.parse_args().binary_directory)
