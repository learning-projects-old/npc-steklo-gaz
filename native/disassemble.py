"""Восстанавливает x87-инструкции Microsoft DOS и сохраняет листинг PTOK."""

import hashlib
import json
from pathlib import Path
import struct


def disassemble():
    """Разбирает TOKP.EXE без исполнения; нужен capstone==5.0.9.

    Microsoft эмулирует x87 через INT 34h–3Dh. Замена ниже сохраняет длины и
    адреса: INT 34h–3Bh → WAIT D8h–DFh, INT 3Ch → WAIT ES, INT 3Dh → WAIT NOP.
    Листинг интерпретируется только в известных функциях, не как весь образ.
    Исходный EXE никогда не изменяется; результат пишется в evidence.
    """
    from capstone import Cs, CS_ARCH_X86, CS_MODE_16

    native = Path(__file__).resolve().parent
    path = native.parent / "ТОК1/TOKP.EXE"
    raw = path.read_bytes()
    header = struct.unpack_from("<14H", raw)
    header_bytes = header[4] * 16
    image = raw[header_bytes:]
    image = image.replace(b"\xcd\x3c", b"\x9b\x26").replace(b"\xcd\x3d", b"\x9b\x90")
    for n in range(8):
        image = image.replace(bytes([0xcd, 0x34 + n]), bytes([0x9b, 0xd8 + n]))
    decoder = Cs(CS_ARCH_X86, CS_MODE_16)
    evidence = native / "evidence"
    evidence.mkdir(exist_ok=True)
    for name, start, end in (("main", 0, 0x1983), ("round", 0x1983, 0x1cfe), ("flat", 0x1cfe, 0x2a00)):
        instructions = decoder.disasm(image[start:end], start)
        (evidence / f"TOKP-{name}.asm").write_text("\n".join(f"{i.address:04X}: {i.mnemonic:10s} {i.op_str}".rstrip() for i in instructions) + "\n", encoding="utf-8")
    ds_base = header_bytes + 0xd68 * 16
    constants = {f"DS:{offset:04X}": struct.unpack_from("<f", raw, ds_base + offset)[0]
                 for offset in (0x10c2, 0x10ce, 0x10d2, 0x10d6, 0x10da)}
    description = {"source": str(path), "sha256": hashlib.sha256(raw).hexdigest(),
                   "MZ_header_bytes": header_bytes, "data_segment_relative": "0D68",
                   "common_segment_relative": "0AAA", "constants": constants,
                   "math_functions": {"0329:1407": "log", "0329:1417": "sin", "0329:141D": "cos",
                                      "0329:142C": "sinh", "0329:1432": "cosh", "0329:143C": "sqrt"}}
    (evidence / "binary-analysis.json").write_text(json.dumps(description, ensure_ascii=False, indent=2), encoding="utf-8")
    print(json.dumps(description, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    disassemble()
