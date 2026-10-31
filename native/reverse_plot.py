"""Исследовательский разбор PLOT6.EXE; не входит в готовое приложение."""

from pathlib import Path
import struct


def reverse():
    """Сохраняет функции PLOT6 с восстановленными командами x87 Microsoft."""
    from capstone import Cs, CS_ARCH_X86, CS_MODE_16

    native = Path(__file__).resolve().parent
    raw = (native.parent / "ТОК1/PLOT6.EXE").read_bytes()
    header = struct.unpack_from("<14H", raw)
    image = raw[header[4] * 16:]
    image = image.replace(b"\xcd\x3c", b"\x9b\x26").replace(b"\xcd\x3d", b"\x9b\x90")
    for n in range(8):
        image = image.replace(bytes([0xcd, 0x34 + n]), bytes([0x9b, 0xd8 + n]))
    decoder = Cs(CS_ARCH_X86, CS_MODE_16)
    for name, start, end in (("main", 0, 0x1490), ("field", 0x1490, 0x1d6d), ("round", 0x1d6d, 0x2ff0)):
        (native / f"evidence/PLOT6-{name}.asm").write_text("\n".join(f"{i.address:04X}: {i.mnemonic:10s} {i.op_str}".rstrip() for i in decoder.disasm(image[start:end], start)) + "\n", encoding="utf-8")
    data = raw[header[4] * 16 + 0x25bd0:]
    print(ascii(data[:500].decode("cp866")))
    print([(hex(i), struct.unpack_from("<f", data, i)[0]) for i in range(0xeba, 0xef0, 4)])


if __name__ == "__main__":
    reverse()
