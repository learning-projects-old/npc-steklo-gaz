1983: push       bp
1984: mov        bp, sp
1986: sub        sp, 0x5c
1989: push       di
198A: push       si
198B: wait
198C: fld        dword ptr [0x10ce]
1990: mov        es, word ptr [0x10bc]
1994: wait
1995: fdiv       dword ptr es:[0x2bcc]
199A: wait
199B: fst        dword ptr [0x74ec]
199F: wait
19A0: fmul       dword ptr es:[0x2a30]
19A5: lcall      0x329, 0x1432
19AA: wait
19AB: fst        dword ptr [0x74f0]
19AF: wait
19B0: fmul       dword ptr [0x74f0]
19B4: wait
19B5: fstp       dword ptr [0x7508]
19B9: wait
19BA: nop
19BB: mov        es, word ptr [0x10bc]
19BF: mov        ax, word ptr es:[0x2a38]
19C3: mov        dx, word ptr es:[0x2a3a]
19C8: mov        word ptr [bp - 4], ax
19CB: mov        word ptr [bp - 2], dx
19CE: mov        word ptr [0x74f4], 1
19D4: mov        word ptr [0x74f6], 0
19DA: mov        ax, word ptr [0x74f4]
19DD: mov        dx, word ptr [0x74f6]
19E1: cmp        word ptr [bp - 2], dx
19E4: jge        0x19e9
19E6: jmp        0x1b2f
19E9: jg         0x19f3
19EB: cmp        word ptr [bp - 4], ax
19EE: jae        0x19f3
19F0: jmp        0x1b2f
19F3: mov        si, word ptr [0x74f4]
19F7: mov        cl, 2
19F9: shl        si, cl
19FB: mov        es, word ptr [0x10bc]
19FF: lea        bx, [si]
1A03: wait
1A04: fld        dword ptr es:[bx - 4]
1A08: wait
1A09: fmul       dword ptr [0x74ec]
1A0D: wait
1A0E: fstp       dword ptr [0x750c]
1A12: wait
1A13: nop
1A14: lea        bx, [si + 0x190]
1A18: wait
1A19: fld        dword ptr es:[bx - 4]
1A1D: wait
1A1E: fmul       dword ptr [0x74ec]
1A22: wait
1A23: fst        dword ptr [0x7510]
1A27: lcall      0x329, 0x1432
1A2C: wait
1A2D: fstp       xword ptr [bp - 0x18]
1A30: wait
1A31: fld        dword ptr [0x750c]
1A35: lcall      0x329, 0x1417
1A3A: wait
1A3B: fld        xword ptr [bp - 0x18]
1A3E: wait
1A3F: fmulp      st(1)
1A41: wait
1A42: fdiv       dword ptr [0x74f0]
1A46: wait
1A47: fstp       dword ptr [0x74fc]
1A4B: wait
1A4C: fld        dword ptr [0x7510]
1A50: lcall      0x329, 0x142c
1A55: wait
1A56: fstp       xword ptr [bp - 0x22]
1A59: wait
1A5A: fld        dword ptr [0x750c]
1A5E: lcall      0x329, 0x141d
1A63: wait
1A64: fld        xword ptr [bp - 0x22]
1A67: wait
1A68: fmulp      st(1)
1A6A: wait
1A6B: fdiv       dword ptr [0x74f0]
1A6F: wait
1A70: fst        dword ptr [0x7500]
1A74: wait
1A75: fmul       dword ptr [0x7500]
1A79: wait
1A7A: fstp       dword ptr [0x76a8]
1A7E: wait
1A7F: fld        dword ptr [0x74fc]
1A83: wait
1A84: fmul       dword ptr [0x74fc]
1A88: wait
1A89: fadd       dword ptr [0x76a8]
1A8D: wait
1A8E: fst        dword ptr [0x76a4]
1A92: wait
1A93: fdivr      dword ptr [0x74fc]
1A97: wait
1A98: fadd       dword ptr [0x74fc]
1A9C: wait
1A9D: fstp       dword ptr [si + 0x7510]
1AA1: wait
1AA2: fld        dword ptr [0x7500]
1AA6: wait
1AA7: fld        dword ptr [0x7500]
1AAB: wait
1AAC: fdiv       dword ptr [0x76a4]
1AB0: wait
1AB1: fsubp      st(1)
1AB3: wait
1AB4: fstp       dword ptr [si + 0x75d8]
1AB8: wait
1AB9: fld        dword ptr [0x76a4]
1ABD: wait
1ABE: fsub       dword ptr [0x10d2]
1AC2: wait
1AC3: fld        dword ptr [0x750c]
1AC7: wait
1AC8: fmul       dword ptr [0x10c2]
1ACC: lcall      0x329, 0x141d
1AD1: wait
1AD2: fstp       xword ptr [bp - 0x2c]
1AD5: wait
1AD6: fld        dword ptr [0x74ec]
1ADA: wait
1ADB: fdiv       dword ptr [0x76a4]
1ADF: wait
1AE0: fld        st(1)
1AE2: wait
1AE3: fmul       st(2)
1AE5: wait
1AE6: fld        dword ptr [0x76a8]
1AEA: wait
1AEB: fmul       dword ptr [0x10d6]
1AEF: wait
1AF0: faddp      st(1)
1AF2: lcall      0x329, 0x143c
1AF7: wait
1AF8: fmulp      st(1)
1AFA: wait
1AFB: fld        xword ptr [bp - 0x2c]
1AFE: wait
1AFF: fdiv       dword ptr [0x7508]
1B03: wait
1B04: fadd       dword ptr [0x76a4]
1B08: lcall      0x329, 0x143c
1B0D: wait
1B0E: fmulp      st(1)
1B10: mov        es, word ptr [0x10bc]
1B14: lea        bx, [si + 0x190]
1B18: wait
1B19: fstp       dword ptr es:[bx - 4]
1B1D: wait
1B1E: ffree      st(0)
1B20: add        word ptr [0x74f4], 1
1B25: adc        word ptr [0x74f6], 0
1B2A: jo         0x1b2f
1B2C: jmp        0x19da
1B2F: mov        es, word ptr [0x10bc]
1B33: mov        ax, word ptr es:[0x2a38]
1B37: mov        dx, word ptr es:[0x2a3a]
1B3C: mov        word ptr [bp - 0x30], ax
1B3F: mov        word ptr [bp - 0x2e], dx
1B42: mov        word ptr [0x74f4], 1
1B48: mov        word ptr [0x74f6], 0
1B4E: jmp        0x1cc3
1B51: mov        bx, word ptr [0x74f4]
1B55: shl        bx, 1
1B57: shl        bx, 1
1B59: wait
1B5A: fld        dword ptr [bx + 0x7510]
1B5E: mov        bx, word ptr [0x74f8]
1B62: shl        bx, 1
1B64: shl        bx, 1
1B66: wait
1B67: fsub       dword ptr [bx + 0x7510]
1B6B: wait
1B6C: fld        st(0)
1B6E: wait
1B6F: fmul       st(1)
1B71: wait
1B72: fstp       dword ptr [0x7504]
1B76: wait
1B77: ffree      st(0)
1B79: mov        si, word ptr [0x74f4]
1B7D: mov        cl, 2
1B7F: shl        si, cl
1B81: mov        di, word ptr [0x74f8]
1B85: shl        di, cl
1B87: wait
1B88: fld        dword ptr [si + 0x75d8]
1B8C: wait
1B8D: fsub       dword ptr [di + 0x75d8]
1B91: wait
1B92: fld        st(0)
1B94: wait
1B95: fmul       st(1)
1B97: wait
1B98: fadd       dword ptr [0x7504]
1B9C: mov        es, word ptr [0x10bc]
1BA0: lea        bx, [si + 0x190]
1BA4: wait
1BA5: fld        dword ptr es:[bx - 4]
1BA9: lea        bx, [si + 0x2a3c]
1BAD: wait
1BAE: fmul       dword ptr es:[bx - 4]
1BB2: wait
1BB3: fmul       dword ptr [si + 0x75d8]
1BB7: wait
1BB8: fdivp      st(1)
1BBA: wait
1BBB: fstp       xword ptr [bp - 0x3e]
1BBE: wait
1BBF: fld        dword ptr [si + 0x75d8]
1BC3: wait
1BC4: fadd       dword ptr [di + 0x75d8]
1BC8: wait
1BC9: fld        st(0)
1BCB: wait
1BCC: fmul       st(1)
1BCE: wait
1BCF: fadd       dword ptr [0x7504]
1BD3: wait
1BD4: fld        xword ptr [bp - 0x3e]
1BD7: wait
1BD8: fmulp      st(1)
1BDA: wait
1BDB: fstp       xword ptr [bp - 0x48]
1BDE: wait
1BDF: nop
1BE0: lea        bx, [di + 0x190]
1BE4: wait
1BE5: fld        dword ptr es:[bx - 4]
1BE9: lea        bx, [di + 0x2a3c]
1BED: wait
1BEE: fmul       dword ptr es:[bx - 4]
1BF2: wait
1BF3: fstp       xword ptr [bp - 0x52]
1BF6: wait
1BF7: fld        xword ptr [bp - 0x48]
1BFA: wait
1BFB: fld        dword ptr [di + 0x75d8]
1BFF: wait
1C00: fld        xword ptr [bp - 0x52]
1C03: wait
1C04: fmulp      st(1)
1C06: wait
1C07: fdivp      st(1)
1C09: lcall      0x329, 0x1407
1C0E: wait
1C0F: fstp       xword ptr [bp - 0x18]
1C12: wait
1C13: nop
1C14: mov        es, word ptr [0x10bc]
1C18: wait
1C19: fld        dword ptr es:[0x2a34]
1C1E: lea        bx, [si + 0x2b04]
1C22: wait
1C23: fld        dword ptr es:[bx - 4]
1C27: wait
1C28: fmul       dword ptr [0x10da]
1C2C: wait
1C2D: fdivp      st(1)
1C2F: wait
1C30: fld        xword ptr [bp - 0x18]
1C33: wait
1C34: fmulp      st(1)
1C36: wait
1C37: fstp       xword ptr [bp - 0x5c]
1C3A: wait
1C3B: ffree      st(1)
1C3D: wait
1C3E: ffree      st(0)
1C40: mov        ax, 0xc8
1C43: imul       word ptr [0x74f8]
1C47: mov        si, ax
1C49: mov        bx, word ptr [0x74f4]
1C4D: shl        bx, 1
1C4F: shl        bx, 1
1C51: lea        bx, [bx + si + 0x320]
1C55: wait
1C56: fld        xword ptr [bp - 0x5c]
1C59: wait
1C5A: fstp       dword ptr es:[bx - 0xcc]
1C5F: wait
1C60: nop
1C61: add        word ptr [0x74f8], 1
1C66: adc        word ptr [0x74fa], 0
1C6B: jo         0x1cb7
1C6D: mov        ax, word ptr [0x74f8]
1C70: mov        dx, word ptr [0x74fa]
1C74: cmp        word ptr [bp - 0x32], dx
1C77: jl         0x1cb7
1C79: jg         0x1c80
1C7B: cmp        word ptr [bp - 0x34], ax
1C7E: jb         0x1cb7
1C80: mov        ax, word ptr [0x74f8]
1C83: mov        dx, word ptr [0x74fa]
1C87: cmp        word ptr [0x74f4], ax
1C8B: je         0x1c90
1C8D: jmp        0x1b51
1C90: cmp        word ptr [0x74f6], dx
1C94: je         0x1c99
1C96: jmp        0x1b51
1C99: mov        ax, 0xc8
1C9C: imul       word ptr [0x74f8]
1CA0: mov        si, ax
1CA2: mov        bx, word ptr [0x74f4]
1CA6: shl        bx, 1
1CA8: shl        bx, 1
1CAA: mov        es, word ptr [0x10bc]
1CAE: lea        bx, [bx + si + 0x320]
1CB2: wait
1CB3: fldz
1CB5: jmp        0x1c59
1CB7: add        word ptr [0x74f4], 1
1CBC: adc        word ptr [0x74f6], 0
1CC1: jo         0x1cf8
1CC3: mov        ax, word ptr [0x74f4]
1CC6: mov        dx, word ptr [0x74f6]
1CCA: cmp        word ptr [bp - 0x2e], dx
1CCD: jl         0x1cf8
1CCF: jg         0x1cd6
1CD1: cmp        word ptr [bp - 0x30], ax
1CD4: jb         0x1cf8
1CD6: mov        es, word ptr [0x10bc]
1CDA: mov        ax, word ptr es:[0x2a38]
1CDE: mov        dx, word ptr es:[0x2a3a]
1CE3: mov        word ptr [bp - 0x34], ax
1CE6: mov        word ptr [bp - 0x32], dx
1CE9: mov        word ptr [0x74f8], 1
1CEF: mov        word ptr [0x74fa], 0
1CF5: jmp        0x1c6d
1CF8: pop        si
1CF9: pop        di
1CFA: mov        sp, bp
1CFC: pop        bp
1CFD: retf
