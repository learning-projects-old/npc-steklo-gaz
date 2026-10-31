"""Извлекает значения и формулы исходных XLS для переноса калькулятора."""

import inspect
import json
from pathlib import Path
import struct

import olefile
import xlrd
from xlrd.formula import FMLA_TYPE_CELL, decompile_formula


def inspect_workbooks():
    """Читает BIFF FORMULA без запуска Excel и сохраняет доказательства формул."""
    native = Path(__file__).resolve().parent
    report = []
    for path in (native.parent / "ТОК1").glob("*.XLS"):
        book = xlrd.open_workbook(str(path))
        entry = {"path": path.name, "sheets": [], "formulas": []}
        for sheet in book.sheets():
            entry["sheets"].append({"name": sheet.name, "values": [sheet.row_values(row) for row in range(sheet.nrows)]})
        with olefile.OleFileIO(path) as compound:
            stream = compound.openstream("Workbook" if compound.exists("Workbook") else "Book").read()
        position = 0
        while position + 4 <= len(stream):
            code, size = struct.unpack_from("<HH", stream, position)
            data = stream[position + 4:position + 4 + size]
            position += 4 + size
            if code == 0x0006 and len(data) >= 22:
                row, column = struct.unpack_from("<HH", data)
                length = struct.unpack_from("<H", data, 20)[0]
                tokens = data[22:22 + length]
                try:
                    expression = decompile_formula(book, tokens, length, FMLA_TYPE_CELL, browx=row, bcolx=column)
                except Exception as error:
                    expression = f"unparsed: {error}; tokens={tokens.hex()}"
                entry["formulas"].append({"row": row + 1, "column": column + 1, "formula": expression})
        report.append(entry)
    (native / "evidence/workbooks.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    for entry in report:
        print(entry["path"], [(s["name"], len(s["values"])) for s in entry["sheets"]])
        for formula in entry["formulas"][:25]:
            print(formula)
        for sheet in entry["sheets"]:
            print(sheet["name"], sheet["values"][:8])


if __name__ == "__main__":
    inspect_workbooks()
