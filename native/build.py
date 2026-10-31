"""Сборка самостоятельных Windows EXE; запускать из изолированной среды."""

from pathlib import Path
import argparse
import shutil
import subprocess
import sys

from tok_core import CalculationError, load_case


def build(output_directory=None):
    """Собирает GUI/CLI с текстовыми примерами, без DOS EXE и без DOSBox.

    Использует установленный PyInstaller из текущего Python. Отбирает только
    распознаваемые DAT; оригинальные каталоги остаются неизменными.
    output_directory позволяет собрать обновление рядом с работающей версией.
    """
    native = Path(__file__).resolve().parent
    destination_directory = Path(output_directory).resolve() if output_directory else native / "dist/release"
    root = native.parent / "ТОК1"
    presets = native / "presets"
    presets.mkdir(exist_ok=True)
    count = 0
    for source in sorted(root.rglob("*")):
        if not source.is_file():
            continue
        relative = source.relative_to(root)
        if any(p in relative.parts for p in ("ТОК zip", "FOR", "TT")):
            continue
        if source.suffix.lower() in (".exe", ".zip", ".xls", ".lst"):
            continue
        try:
            load_case(source)
        except (CalculationError, UnicodeError):
            continue
        destination = presets / relative
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source, destination)
        count += 1
    for name, console in (("TOK26", False), ("TOK26-console", True), ("TOK26-fast", False)):
        command = [sys.executable, "-m", "PyInstaller", "--noconfirm", "--clean", "--onefile",
                   "--distpath", str(destination_directory),
                   "--name", name, "--console" if console else "--windowed",
                   "--icon", str(native / 'assets/tok26.ico'),
                   "--version-file", str(native / 'assets/version.txt'),
                   "--add-data", f"{native / 'assets'};assets",
                   "--add-data", f"{presets};presets", "--add-data", f"{native / 'README.md'};.",
                   "--exclude-module", "numpy", "--exclude-module", "matplotlib",
                   "--exclude-module", "PySide6", "--exclude-module", "PyQt5",
                   "--exclude-module", "capstone", str(native / "tok_app.py")]
        subprocess.run(command, cwd=native, check=True)
    print(f"Готово: {destination_directory}; примеров DAT: {count}.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--output-directory")
    build(parser.parse_args().output_directory)
