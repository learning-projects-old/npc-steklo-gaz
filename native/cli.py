"""Командный интерфейс расчётов PTOK, PLOT6 и чтения старых диаграмм."""

import argparse
from dataclasses import asdict, replace
import json
import math
import os
from pathlib import Path
import sys

from legacy_io import read_tokgr, write_field, write_tokgr
from plot_core import calculate_field
from tok_app import parameters_from_text
from tok_core import CalculationError, calculate, load_case


def main():
    """Выбирает окно, PTOK, PLOT6 или графику; ошибки дают код возврата 2."""
    parser = argparse.ArgumentParser(description="ТОК: перенос FORTRAN на Python без DOS")
    parser.add_argument("command", nargs="?", choices=["calculate", "field", "inspect", "graphics", "gui"], default="gui")
    parser.add_argument("file", nargs="?", type=Path)
    parser.add_argument("--output", type=Path, help="Файл результата JSON")
    parser.add_argument("--parameters", type=Path, help="JSON дополнительных данных")
    parser.add_argument("--voltage-format", choices=["cartesian", "amplitude_phase"], help="Формат заданных напряжений")
    parser.add_argument("--legacy-directory", type=Path, help="Новый каталог экспорта TOKGR, IST, POLE и CSV")
    parser.add_argument("--auto-calculate", action="store_true", help="Сразу рассчитать пример при открытии окна")
    parser.add_argument("--workers", type=int, default=None, help="Число процессов PLOT6")
    args = parser.parse_args()
    fast = "fast" in Path(sys.executable).stem.lower() or os.environ.get("TOK26_FAST") == "1"
    workers = args.workers if args.workers is not None else (os.cpu_count() or 1) if fast else 1
    if workers < 1:
        parser.error("Количество процессов должно быть положительным.")
    try:
        if args.command == "gui":
            from desktop import run_gui
            run_gui(args.file, auto_calculate=args.auto_calculate, workers=workers)
            return 0
        if args.file is None:
            parser.error("Укажите исходный файл.")
        if args.output and args.output.resolve() in [p.resolve() for p in (args.file, args.parameters) if p]:
            raise CalculationError("Результат нельзя записать поверх исходного файла или параметров.")
        options = parameters_from_text(args.parameters.read_text(encoding="utf-8")) if args.parameters else {}
        if args.command == "graphics":
            result = read_tokgr(args.file)
        else:
            case = load_case(args.file)
            if args.command == "inspect":
                result = asdict(case)
            elif args.command == "field":
                result = calculate_field(case, workers=workers, voltage_format=args.voltage_format or "amplitude_phase", **options)
            elif args.voltage_format == "amplitude_phase" and case.fixed_voltages is not None:
                effective = replace(case, fixed_voltages=[[v * math.cos(math.radians(p)), v * math.sin(math.radians(p))] for v, p in case.fixed_voltages])
                result = calculate(effective, **options)
            else:
                result = calculate(case, **options)
        if args.legacy_directory:
            if args.command == "inspect":
                raise CalculationError("Команда inspect не создаёт результаты расчёта.")
            if args.legacy_directory.exists():
                raise CalculationError("Для экспорта укажите новый каталог, чтобы сохранить существующие данные.")
            args.legacy_directory.mkdir(parents=True)
            write_tokgr(result, args.legacy_directory / "TOKGR.DAT")
            if "field" in result:
                write_field(result, args.legacy_directory)
        text = json.dumps(result, ensure_ascii=False, indent=2, allow_nan=False)
        if args.output:
            args.output.write_text(text, encoding="utf-8")
        elif sys.stdout is not None:
            print(text)
        else:
            raise CalculationError("Для командного режима оконной сборки укажите --output.")
        return 0
    except (OSError, ValueError) as error:
        if sys.stderr is not None:
            print(f"Ошибка: {error}", file=sys.stderr)
        else:
            import tkinter.messagebox
            tkinter.messagebox.showerror("ТОК — ошибка", str(error))
        return 2
