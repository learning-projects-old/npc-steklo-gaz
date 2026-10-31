1CFE: push       bp
1CFF: mov        bp, sp
1D01: sub        sp, 0x48
1D04: push       di
1D05: push       si
1D06: wait
1D07: fld        dword ptr [0x10ce]
1D0B: mov        es, word ptr [0x10bc]
1D0F: wait
1D10: fdiv       dword ptr es:[0x2bcc]
1D15: wait
1D16: fst        dword ptr [0x76bc]
1D1A: wait
1D1B: fmul       dword ptr es:[0x2a30]
1D20: wait
1D21: fst        dword ptr [0xa070]
1D25: lcall      0x329, 0x1412
1D2A: wait
1D2B: fld        dword ptr [0xa070]
1D2F: wait
1D30: fchs
1D32: lcall      0x329, 0x1412
1D37: wait
1D38: faddp      st(1)
1D3A: wait
1D3B: fmul       dword ptr [0x10c6]
1D3F: wait
1D40: fstp       dword ptr [0x76c0]
1D44: wait
1D45: nop
1D46: mov        es, word ptr [0x10bc]
1D4A: wait
1D4B: fld        dword ptr es:[0x2a34]
1D50: wait
1D51: fdiv       dword ptr [0x10ce]
1D55: wait
1D56: fdiv       dword ptr es:[0x2bd0]
1D5B: wait
1D5C: fstp       dword ptr [0xa078]
1D60: wait
1D61: fld        dword ptr es:[0x2a34]
1D66: wait
1D67: fmul       dword ptr [0x10ce]
1D6B: wait
1D6C: fdiv       dword ptr es:[0x2bd0]
1D71: wait
1D72: fstp       dword ptr [0xa080]
1D76: wait
1D77: nop
1D78: mov        ax, word ptr es:[0x2bd4]
1D7C: mov        dx, word ptr es:[0x2bd6]
1D81: mov        word ptr [bp - 4], ax
1D84: mov        word ptr [bp - 2], dx
1D87: mov        word ptr [0x76dc], 1
1D8D: mov        word ptr [0x76de], 0
1D93: mov        ax, word ptr [0x76dc]
1D96: mov        dx, word ptr [0x76de]
1D9A: cmp        word ptr [bp - 2], dx
1D9D: jge        0x1da2
1D9F: jmp        0x1e8d
1DA2: jg         0x1dac
1DA4: cmp        word ptr [bp - 4], ax
1DA7: jae        0x1dac
1DA9: jmp        0x1e8d
1DAC: mov        si, word ptr [0x76dc]
1DB0: mov        cl, 2
1DB2: shl        si, cl
1DB4: mov        es, word ptr [0x10bc]
1DB8: lea        bx, [si]
1DBC: wait
1DBD: fld        dword ptr es:[bx - 4]
1DC1: wait
1DC2: fmul       dword ptr [0x76bc]
1DC6: wait
1DC7: fstp       dword ptr [0xa074]
1DCB: wait
1DCC: nop
1DCD: lea        bx, [si + 0x190]
1DD1: wait
1DD2: fld        dword ptr es:[bx - 4]
1DD6: wait
1DD7: fmul       dword ptr [0x76bc]
1DDB: wait
1DDC: fst        dword ptr [0xa070]
1DE0: lcall      0x329, 0x1412
1DE5: wait
1DE6: fmul       dword ptr [0x10c6]
1DEA: wait
1DEB: fstp       dword ptr [0xa07c]
1DEF: wait
1DF0: fld        dword ptr [0xa070]
1DF4: wait
1DF5: fchs
1DF7: lcall      0x329, 0x1412
1DFC: wait
1DFD: fmul       dword ptr [0x10c6]
1E01: wait
1E02: fst        dword ptr [0xa084]
1E06: wait
1E07: fadd       dword ptr [0xa07c]
1E0B: wait
1E0C: fstp       dword ptr [0x76e8]
1E10: wait
1E11: fld        dword ptr [0xa07c]
1E15: wait
1E16: fsub       dword ptr [0xa084]
1E1A: wait
1E1B: fstp       dword ptr [0xa06c]
1E1F: wait
1E20: fld        dword ptr [0xa074]
1E24: lcall      0x329, 0x1417
1E29: wait
1E2A: fmul       dword ptr [0x76e8]
1E2E: wait
1E2F: fdiv       dword ptr [0x76c0]
1E33: wait
1E34: fstp       dword ptr [0x76f4]
1E38: wait
1E39: fld        dword ptr [0xa074]
1E3D: lcall      0x329, 0x141d
1E42: wait
1E43: fmul       dword ptr [0xa06c]
1E47: wait
1E48: fdiv       dword ptr [0x76c0]
1E4C: wait
1E4D: fstp       dword ptr [0x76f8]
1E51: wait
1E52: fld        dword ptr [0x76f4]
1E56: wait
1E57: fmul       dword ptr [0x76f4]
1E5B: wait
1E5C: fld        dword ptr [0x76f8]
1E60: wait
1E61: fmul       dword ptr [0x76f8]
1E65: wait
1E66: faddp      st(1)
1E68: wait
1E69: fst        dword ptr [0x9e0c]
1E6D: wait
1E6E: fdivr      dword ptr [0x76f4]
1E72: wait
1E73: fadd       dword ptr [0x76f4]
1E77: wait
1E78: fstp       dword ptr [si - 0x61f4]
1E7C: wait
1E7D: nop
1E7E: add        word ptr [0x76dc], 1
1E83: adc        word ptr [0x76de], 0
1E88: jo         0x1e8d
1E8A: jmp        0x1d93
1E8D: mov        es, word ptr [0x10bc]
1E91: mov        ax, word ptr es:[0x2a38]
1E95: mov        dx, word ptr es:[0x2a3a]
1E9A: mov        word ptr [bp - 8], ax
1E9D: mov        word ptr [bp - 6], dx
1EA0: mov        word ptr [0x76ec], 1
1EA6: mov        word ptr [0x76ee], 0
1EAC: jmp        0x2136
1EAF: mov        ax, word ptr [0x76ec]
1EB2: mov        dx, word ptr [0x76ee]
1EB6: shl        ax, 1
1EB8: rcl        dx, 1
1EBA: mov        word ptr [0xa090], ax
1EBD: mov        word ptr [0xa092], dx
1EC1: sub        ax, 1
1EC4: sbb        dx, 0
1EC7: mov        word ptr [0xa098], ax
1ECA: mov        word ptr [0xa09a], dx
1ECE: mov        ax, word ptr [0x76f0]
1ED1: mov        dx, word ptr [0x76f2]
1ED5: shl        ax, 1
1ED7: rcl        dx, 1
1ED9: mov        word ptr [0xa094], ax
1EDC: mov        word ptr [0xa096], dx
1EE0: sub        ax, 1
1EE3: sbb        dx, 0
1EE6: mov        word ptr [0xa09c], ax
1EE9: mov        word ptr [0xa09e], dx
1EED: mov        bx, word ptr [0xa094]
1EF1: shl        bx, 1
1EF3: shl        bx, 1
1EF5: wait
1EF6: fld        dword ptr [bx - 0x61f4]
1EFA: wait
1EFB: fld        st(0)
1EFD: wait
1EFE: fstp       xword ptr [bp - 0x16]
1F01: wait
1F02: nop
1F03: mov        bx, word ptr [0xa098]
1F07: shl        bx, 1
1F09: shl        bx, 1
1F0B: wait
1F0C: fld        dword ptr [bx - 0x61f4]
1F10: wait
1F11: fld        st(0)
1F13: wait
1F14: fstp       xword ptr [bp - 0x20]
1F17: wait
1F18: fld        st(0)
1F1A: wait
1F1B: fsub       st(2)
1F1D: wait
1F1E: fstp       dword ptr [0x76c4]
1F22: wait
1F23: nop
1F24: mov        bx, ax
1F26: shl        bx, 1
1F28: shl        bx, 1
1F2A: wait
1F2B: fld        dword ptr [bx - 0x61f4]
1F2F: wait
1F30: fld        st(0)
1F32: wait
1F33: fstp       xword ptr [bp - 0x2a]
1F36: wait
1F37: nop
1F38: mov        bx, word ptr [0xa090]
1F3C: shl        bx, 1
1F3E: shl        bx, 1
1F40: wait
1F41: fld        dword ptr [bx - 0x61f4]
1F45: wait
1F46: fld        st(0)
1F48: wait
1F49: fstp       xword ptr [bp - 0x34]
1F4C: wait
1F4D: fld        st(0)
1F4F: wait
1F50: fsub       st(2)
1F52: wait
1F53: fstp       dword ptr [0x76c8]
1F57: wait
1F58: fld        st(2)
1F5A: wait
1F5B: fsub       st(2)
1F5D: wait
1F5E: fstp       dword ptr [0x76cc]
1F62: wait
1F63: fld        st(0)
1F65: wait
1F66: fsub       st(4)
1F68: wait
1F69: fstp       dword ptr [0x76d0]
1F6D: wait
1F6E: fld        dword ptr [0x76c4]
1F72: wait
1F73: fmul       dword ptr [0x76c8]
1F77: wait
1F78: fdiv       dword ptr [0x76cc]
1F7C: wait
1F7D: fdiv       dword ptr [0x76d0]
1F81: wait
1F82: fstp       dword ptr [0xa068]
1F86: wait
1F87: nop
1F88: mov        es, word ptr [0x10bc]
1F8C: cmp        word ptr es:[0x2bd8], 1
1F92: wait
1F93: ffree      st(3)
1F95: wait
1F96: ffree      st(2)
1F98: wait
1F99: ffree      st(1)
1F9B: wait
1F9C: ffree      st(0)
1F9E: je         0x1fa3
1FA0: jmp        0x2059
1FA3: cmp        word ptr es:[0x2bda], 0
1FA9: je         0x1fae
1FAB: jmp        0x2059
1FAE: cmp        word ptr [0x76ec], 1
1FB3: jne        0x1fbc
1FB5: cmp        word ptr [0x76ee], 0
1FBA: je         0x1fd0
1FBC: cmp        word ptr [0x76f0], 1
1FC1: je         0x1fc6
1FC3: jmp        0x2059
1FC6: cmp        word ptr [0x76f2], 0
1FCB: je         0x1fd0
1FCD: jmp        0x2059
1FD0: wait
1FD1: fld        dword ptr [0xa068]
1FD5: wait
1FD6: fsubr      dword ptr [0x10d2]
1FDA: wait
1FDB: fst        dword ptr [0xa068]
1FDF: wait
1FE0: fcom       dword ptr [0x10c6]
1FE4: wait
1FE5: fstp       st(0)
1FE7: wait
1FE8: fnstsw     word ptr [bp - 0x36]
1FEB: wait
1FEC: nop
1FED: mov        ah, byte ptr [bp - 0x35]
1FF0: sahf
1FF1: jae        0x2000
1FF3: wait
1FF4: fld        dword ptr [0xa068]
1FF8: wait
1FF9: fsubr      dword ptr [0x10d2]
1FFD: jmp        0x2083
2000: wait
2001: fld        dword ptr [0xa068]
2005: lcall      0x329, 0x143c
200A: lcall      0x329, 0x143c
200F: lcall      0x329, 0x143c
2014: wait
2015: fst        dword ptr [0x76d4]
2019: wait
201A: fadd       dword ptr [0x10d2]
201E: wait
201F: fld        dword ptr [0x76d4]
2023: wait
2024: fsubr      dword ptr [0x10d2]
2028: wait
2029: fdivp      st(1)
202B: wait
202C: fst        dword ptr [0x76d8]
2030: lcall      0x329, 0x1407
2035: wait
2036: fstp       dword ptr [0x76e4]
203A: wait
203B: nop
203C: mov        ax, 0xc8
203F: imul       word ptr [0x76f0]
2043: mov        si, ax
2045: mov        bx, word ptr [0x76ec]
2049: shl        bx, 1
204B: shl        bx, 1
204D: wait
204E: fld        dword ptr [0xa080]
2052: wait
2053: fdiv       dword ptr [0x76e4]
2057: jmp        0x20d5
2059: wait
205A: fld        dword ptr [0xa068]
205E: wait
205F: fcom       dword ptr [0x10c6]
2063: wait
2064: fstp       st(0)
2066: wait
2067: fnstsw     word ptr [bp - 0x36]
206A: wait
206B: nop
206C: mov        ah, byte ptr [bp - 0x35]
206F: sahf
2070: jae        0x207e
2072: wait
2073: fld        dword ptr [0xa068]
2077: wait
2078: fsubr      dword ptr [0x10d2]
207C: jmp        0x2005
207E: wait
207F: fld        dword ptr [0xa068]
2083: lcall      0x329, 0x143c
2088: lcall      0x329, 0x143c
208D: lcall      0x329, 0x143c
2092: wait
2093: fst        dword ptr [0x76d4]
2097: wait
2098: fadd       dword ptr [0x10d2]
209C: wait
209D: fld        dword ptr [0x76d4]
20A1: wait
20A2: fsubr      dword ptr [0x10d2]
20A6: wait
20A7: fdivp      st(1)
20A9: wait
20AA: fst        dword ptr [0x76d8]
20AE: lcall      0x329, 0x1407
20B3: wait
20B4: fstp       dword ptr [0x76e4]
20B8: wait
20B9: nop
20BA: mov        ax, 0xc8
20BD: imul       word ptr [0x76f0]
20C1: mov        si, ax
20C3: mov        bx, word ptr [0x76ec]
20C7: shl        bx, 1
20C9: shl        bx, 1
20CB: wait
20CC: fld        dword ptr [0xa078]
20D0: wait
20D1: fmul       dword ptr [0x76e4]
20D5: wait
20D6: fstp       dword ptr [bx + si + 0x7630]
20DA: wait
20DB: nop
20DC: add        word ptr [0x76f0], 1
20E1: adc        word ptr [0x76f2], 0
20E6: jo         0x212a
20E8: mov        ax, word ptr [0x76f0]
20EB: mov        dx, word ptr [0x76f2]
20EF: cmp        word ptr [bp - 0xa], dx
20F2: jl         0x212a
20F4: jg         0x20fb
20F6: cmp        word ptr [bp - 0xc], ax
20F9: jb         0x212a
20FB: mov        ax, word ptr [0x76f0]
20FE: mov        dx, word ptr [0x76f2]
2102: cmp        word ptr [0x76ec], ax
2106: je         0x210b
2108: jmp        0x1eaf
210B: cmp        word ptr [0x76ee], dx
210F: je         0x2114
2111: jmp        0x1eaf
2114: mov        ax, 0xc8
2117: imul       word ptr [0x76f0]
211B: mov        si, ax
211D: mov        bx, word ptr [0x76ec]
2121: shl        bx, 1
2123: shl        bx, 1
2125: wait
2126: fldz
2128: jmp        0x20d5
212A: add        word ptr [0x76ec], 1
212F: adc        word ptr [0x76ee], 0
2134: jo         0x216b
2136: mov        ax, word ptr [0x76ec]
2139: mov        dx, word ptr [0x76ee]
213D: cmp        word ptr [bp - 6], dx
2140: jl         0x216b
2142: jg         0x2149
2144: cmp        word ptr [bp - 8], ax
2147: jb         0x216b
2149: mov        es, word ptr [0x10bc]
214D: mov        ax, word ptr es:[0x2a38]
2151: mov        dx, word ptr es:[0x2a3a]
2156: mov        word ptr [bp - 0xc], ax
2159: mov        word ptr [bp - 0xa], dx
215C: mov        word ptr [0x76f0], 1
2162: mov        word ptr [0x76f2], 0
2168: jmp        0x20e8
216B: mov        ax, 0x38a
216E: push       ds
216F: push       ax
2170: mov        ax, 0x3b8
2173: push       ax
2174: lcall      0x329, 0x2230
2179: add        sp, 6
217C: mov        es, word ptr [0x10bc]
2180: push       word ptr es:[0x2bda]
2185: push       word ptr es:[0x2bd8]
218A: push       word ptr es:[0x2a3a]
218F: push       word ptr es:[0x2a38]
2194: mov        ax, 0x3be
2197: push       ax
2198: lcall      0x329, 0x2230
219D: add        sp, 0xa
21A0: mov        es, word ptr [0x10bc]
21A4: mov        ax, word ptr es:[0x2bd4]
21A8: mov        dx, word ptr es:[0x2bd6]
21AD: add        ax, 1
21B0: adc        dx, 0
21B3: mov        word ptr [0x76b8], ax
21B6: mov        word ptr [0x76ba], dx
21BA: mov        word ptr [0x76dc], ax
21BD: mov        word ptr [0x76de], dx
21C1: sub        ax, 1
21C4: sbb        dx, 0
21C7: mov        word ptr [0x76b4], ax
21CA: mov        word ptr [0x76b6], dx
21CE: cmp        word ptr [0x76ba], 0
21D3: jg         0x21f2
21D5: jl         0x21de
21D7: cmp        word ptr [0x76b8], 1
21DC: ja         0x21f2
21DE: mov        word ptr [0x76dc], 1
21E4: mov        word ptr [0x76de], 0
21EA: sub        ax, ax
21EC: mov        word ptr [0x76b6], ax
21EF: mov        word ptr [0x76b4], ax
21F2: push       word ptr [0x76b6]
21F6: push       word ptr [0x76b4]
21FA: mov        ax, 0x3dc
21FD: push       ax
21FE: lcall      0x329, 0x2230
2203: add        sp, 6
2206: mov        es, word ptr [0x10bc]
220A: mov        ax, word ptr es:[0x2bd4]
220E: mov        dx, word ptr es:[0x2bd6]
2213: add        ax, 1
2216: adc        dx, 0
2219: mov        word ptr [0x76b0], ax
221C: mov        word ptr [0x76b2], dx
2220: mov        word ptr [0x76dc], ax
2223: mov        word ptr [0x76de], dx
2227: sub        ax, 1
222A: sbb        dx, 0
222D: mov        word ptr [0x76ac], ax
2230: mov        word ptr [0x76ae], dx
2234: cmp        word ptr [0x76b2], 0
2239: jg         0x2258
223B: jl         0x2244
223D: cmp        word ptr [0x76b0], 1
2242: ja         0x2258
2244: mov        word ptr [0x76dc], 1
224A: mov        word ptr [0x76de], 0
2250: sub        ax, ax
2252: mov        word ptr [0x76ae], ax
2255: mov        word ptr [0x76ac], ax
2258: push       word ptr [0x76ae]
225C: push       word ptr [0x76ac]
2260: mov        ax, 0x3ea
2263: push       ax
2264: lcall      0x329, 0x2230
2269: add        sp, 6
226C: mov        ax, 0x367
226F: push       ds
2270: push       ax
2271: mov        ax, 0x3f8
2274: push       ax
2275: lcall      0x329, 0x2230
227A: add        sp, 6
227D: mov        es, word ptr [0x10bc]
2281: mov        ax, word ptr es:[0x2a38]
2285: mov        dx, word ptr es:[0x2a3a]
228A: mov        word ptr [bp - 0x3a], ax
228D: mov        word ptr [bp - 0x38], dx
2290: mov        word ptr [0x76dc], 1
2296: mov        word ptr [0x76de], 0
229C: or         dx, dx
229E: jl         0x22f2
22A0: jg         0x22a7
22A2: cmp        ax, 1
22A5: jb         0x22f2
22A7: push       word ptr [0x76de]
22AB: push       word ptr [0x76dc]
22AF: mov        ax, 0x3fe
22B2: push       ax
22B3: lcall      0x329, 0x2230
22B8: add        sp, 6
22BB: mov        ax, word ptr [0x76dc]
22BE: shl        ax, 1
22C0: shl        ax, 1
22C2: add        ax, 0x9f9c
22C5: push       ds
22C6: push       ax
22C7: mov        ax, 0x406
22CA: push       ax
22CB: lcall      0x329, 0x30f2
22D0: add        sp, 6
22D3: add        word ptr [0x76dc], 1
22D8: adc        word ptr [0x76de], 0
22DD: jo         0x22f2
22DF: mov        ax, word ptr [0x76dc]
22E2: mov        dx, word ptr [0x76de]
22E6: cmp        word ptr [bp - 0x38], dx
22E9: jl         0x22f2
22EB: jg         0x22a7
22ED: cmp        word ptr [bp - 0x3a], ax
22F0: jae        0x22a7
22F2: mov        es, word ptr [0x10bc]
22F6: mov        ax, word ptr es:[0x2a38]
22FA: mov        dx, word ptr es:[0x2a3a]
22FF: mov        word ptr [bp - 0x34], ax
2302: mov        word ptr [bp - 0x32], dx
2305: mov        word ptr [0x76dc], 1
230B: mov        word ptr [0x76de], 0
2311: or         dx, dx
2313: jge        0x2318
2315: jmp        0x2435
2318: jg         0x2322
231A: cmp        ax, 1
231D: jae        0x2322
231F: jmp        0x2435
2322: mov        ax, word ptr [0x76dc]
2325: shl        ax, 1
2327: shl        ax, 1
2329: mov        word ptr [bp - 0x48], ax
232C: add        ax, 0x9f9c
232F: mov        word ptr [bp - 0x42], ax
2332: mov        ax, word ptr [bp - 0x48]
2335: mov        word ptr [bp - 0x36], ax
2338: mov        ax, word ptr [bp - 0x34]
233B: mov        dx, word ptr [bp - 0x32]
233E: add        word ptr [0x76dc], ax
2342: adc        word ptr [0x76de], dx
2346: mov        word ptr [bp - 0x44], ax
2349: mov        ax, dx
234B: mov        word ptr [bp - 0x46], ax
234E: neg        word ptr [bp - 0x44]
2351: neg        word ptr [bp - 0x44]
2354: adc        word ptr [bp - 0x46], -1
2358: mov        bx, word ptr [bp - 0x42]
235B: mov        ax, word ptr [bx]
235D: mov        dx, word ptr [bx + 2]
2360: mov        word ptr [0xa088], ax
2363: mov        word ptr [0xa08a], dx
2367: mov        es, word ptr [0x10bc]
236B: mov        ax, word ptr es:[0x2a38]
236F: mov        dx, word ptr es:[0x2a3a]
2374: mov        word ptr [bp - 0x2a], ax
2377: mov        word ptr [bp - 0x28], dx
237A: mov        word ptr [0x76e0], 1
2380: mov        word ptr [0x76e2], 0
2386: or         dx, dx
2388: jge        0x238d
238A: jmp        0x241d
238D: jg         0x2397
238F: cmp        ax, 1
2392: jae        0x2397
2394: jmp        0x241d
2397: mov        ax, word ptr [0xa088]
239A: shl        ax, 1
239C: shl        ax, 1
239E: mov        word ptr [bp - 0x20], ax
23A1: mov        si, word ptr [0x76e0]
23A5: mov        cl, 2
23A7: shl        si, cl
23A9: add        si, 0x9f9c
23AD: mov        ax, 0xc8
23B0: imul       word ptr [0x76e0]
23B4: mov        di, ax
23B6: add        di, word ptr [bp - 0x36]
23B9: add        di, 0x7630
23BD: mov        ax, word ptr [bp - 0x2a]
23C0: mov        dx, word ptr [bp - 0x28]
23C3: add        word ptr [0x76e0], ax
23C7: adc        word ptr [0x76e2], dx
23CB: mov        word ptr [bp - 0x3e], ax
23CE: mov        ax, dx
23D0: mov        word ptr [bp - 0x40], ax
23D3: neg        word ptr [bp - 0x3e]
23D6: neg        word ptr [bp - 0x3e]
23D9: adc        word ptr [bp - 0x40], -1
23DD: mov        cx, word ptr [bp - 0x3e]
23E0: mov        ax, word ptr [si]
23E2: mov        dx, word ptr [si + 2]
23E5: mov        word ptr [0xa08c], ax
23E8: mov        word ptr [0xa08e], dx
23EC: mov        ax, 0xc8
23EF: imul       word ptr [0xa08c]
23F3: mov        bx, ax
23F5: add        bx, word ptr [bp - 0x20]
23F8: mov        es, word ptr [0x10bc]
23FC: lea        bx, [bx + 0x320]
2400: mov        ax, word ptr [di]
2402: mov        dx, word ptr [di + 2]
2405: mov        word ptr es:[bx - 0xcc], ax
240A: mov        word ptr es:[bx - 0xca], dx
240F: add        si, 4
2412: add        di, 0xc8
2416: loop       0x23e0
2418: dec        word ptr [bp - 0x40]
241B: jns        0x23e0
241D: add        word ptr [bp - 0x42], 4
2421: add        word ptr [bp - 0x36], 4
2425: dec        word ptr [bp - 0x44]
2428: je         0x242d
242A: jmp        0x2358
242D: dec        word ptr [bp - 0x46]
2430: js         0x2435
2432: jmp        0x2358
2435: pop        si
2436: pop        di
2437: mov        sp, bp
2439: pop        bp
243A: retf
243B: add        byte ptr [di - 0x75], dl
243E: in         al, dx
243F: sub        sp, 0x6e
2442: push       di
2443: push       si
2444: les        bx, ptr [bp + 0x12]
2447: cmp        word ptr es:[bx + 2], 0
244C: jge        0x2451
244E: jmp        0x2f78
2451: jg         0x245c
2453: cmp        word ptr es:[bx], 0
2457: jne        0x245c
2459: jmp        0x2f78
245C: les        bx, ptr [bp + 6]
245F: sub        ax, ax
2461: mov        word ptr es:[bx + 2], ax
2465: mov        word ptr es:[bx], ax
2468: wait
2469: fldz
246B: wait
246C: fstp       dword ptr [0xa0cc]
2470: wait
2471: nop
2472: les        bx, ptr [bp + 0x12]
2475: push       word ptr es:[bx + 2]
2479: push       word ptr es:[bx]
247C: push       word ptr es:[bx + 2]
2480: push       word ptr es:[bx]
2483: lcall      0x329, 0xb8
2488: mov        word ptr [0xa0bc], ax
248B: mov        word ptr [0xa0be], dx
248F: les        bx, ptr [bp + 0x12]
2492: push       word ptr es:[bx + 2]
2496: push       word ptr es:[bx]
2499: les        bx, ptr [bp + 0xe]
249C: push       word ptr es:[bx + 2]
24A0: push       word ptr es:[bx]
24A3: lcall      0x329, 0xb8
24A8: mov        word ptr [0xa0c0], ax
24AB: mov        word ptr [0xa0c2], dx
24AF: mov        word ptr [0xa0ac], 1
24B5: mov        word ptr [0xa0ae], 0
24BB: mov        ax, word ptr [0xa0bc]
24BE: mov        dx, word ptr [0xa0be]
24C2: cmp        word ptr [0xa0ae], dx
24C6: jg         0x2529
24C8: jl         0x24d0
24CA: cmp        word ptr [0xa0ac], ax
24CE: ja         0x2529
24D0: mov        bx, word ptr [0xa0ac]
24D4: shl        bx, 1
24D6: shl        bx, 1
24D8: les        si, ptr [bp + 0x16]
24DB: wait
24DC: fld        dword ptr es:[bx + si - 4]
24E0: wait
24E1: fabs
24E3: wait
24E4: fst        dword ptr [0xa0b4]
24E8: wait
24E9: fsub       dword ptr [0xa0cc]
24ED: wait
24EE: fcom       dword ptr [0x10de]
24F2: wait
24F3: fstp       st(0)
24F5: wait
24F6: fnstsw     word ptr [bp - 6]
24F9: wait
24FA: nop
24FB: mov        ah, byte ptr [bp - 5]
24FE: sahf
24FF: jbe        0x251d
2501: mov        ax, word ptr [0xa0b4]
2504: mov        dx, word ptr [0xa0b6]
2508: mov        word ptr [0xa0cc], ax
250B: mov        word ptr [0xa0ce], dx
250F: mov        ax, word ptr [0xa0ac]
2512: mov        dx, word ptr [0xa0ae]
2516: mov        word ptr [0xa0a0], ax
2519: mov        word ptr [0xa0a2], dx
251D: add        word ptr [0xa0ac], 1
2522: adc        word ptr [0xa0ae], 0
2527: jno        0x24bb
2529: les        bx, ptr [bp + 0xa]
252C: wait
252D: fld        dword ptr es:[bx]
2530: wait
2531: fmul       dword ptr [0xa0cc]
2535: wait
2536: fstp       dword ptr [0xa0c8]
253A: wait
253B: nop
253C: mov        word ptr [0xa0d4], 1
2542: mov        word ptr [0xa0d6], 0
2548: les        bx, ptr [bp + 0x12]
254B: mov        ax, word ptr es:[bx]
254E: mov        dx, word ptr es:[bx + 2]
2552: mov        word ptr [bp - 0xa], ax
2555: mov        word ptr [bp - 8], dx
2558: mov        word ptr [0xa0a8], 1
255E: mov        word ptr [0xa0aa], 0
2564: jmp        0x294a
2567: wait
2568: fstp       dword ptr [0xa0b4]
256C: wait
256D: nop
256E: les        bx, ptr [bp + 0x12]
2571: mov        ax, word ptr es:[bx]
2574: mov        dx, word ptr es:[bx + 2]
2578: mov        word ptr [bp - 0x26], ax
257B: mov        word ptr [bp - 0x24], dx
257E: push       dx
257F: push       ax
2580: add        ax, word ptr [0xa0bc]
2584: adc        dx, word ptr [0xa0be]
2588: sub        ax, word ptr [0xa0d4]
258C: sbb        dx, word ptr [0xa0d6]
2590: push       dx
2591: push       ax
2592: lcall      0x329, 0x1c
2597: mov        word ptr [bp - 0x1e], ax
259A: mov        word ptr [bp - 0x1c], dx
259D: mov        ax, word ptr [0xa0d4]
25A0: mov        dx, word ptr [0xa0d6]
25A4: mov        word ptr [0xa0ac], ax
25A7: mov        word ptr [0xa0ae], dx
25AB: cmp        word ptr [bp - 0x1c], 0
25AF: jge        0x25b4
25B1: jmp        0x269c
25B4: jg         0x25bf
25B6: cmp        word ptr [bp - 0x1e], 0
25BA: jne        0x25bf
25BC: jmp        0x269c
25BF: mov        ax, word ptr [0xa0ac]
25C2: shl        ax, 1
25C4: shl        ax, 1
25C6: add        ax, word ptr [bp + 0x16]
25C9: mov        dx, word ptr [bp + 0x18]
25CC: sub        ax, 4
25CF: mov        word ptr [bp - 0x1a], ax
25D2: mov        word ptr [bp - 0x18], dx
25D5: mov        ax, word ptr [bp - 0x26]
25D8: mov        dx, word ptr [bp - 0x24]
25DB: mov        cl, 2
25DD: lcall      0x329, 0xec
25E2: mov        word ptr [bp - 0x32], ax
25E5: mov        word ptr [bp - 0x30], dx
25E8: mov        ax, word ptr [bp - 0x1a]
25EB: mov        dx, word ptr [bp - 0x18]
25EE: mov        word ptr [bp - 0x36], ax
25F1: mov        word ptr [bp - 0x34], dx
25F4: mov        ax, word ptr [bp - 0x32]
25F7: mov        dx, word ptr [bp - 0x30]
25FA: mov        word ptr [bp - 0x3a], ax
25FD: mov        word ptr [bp - 0x38], dx
2600: mov        ax, word ptr [bp - 0x1e]
2603: mov        word ptr [bp - 0x2a], ax
2606: mov        ax, word ptr [bp - 0x1c]
2609: mov        word ptr [bp - 0x28], ax
260C: neg        word ptr [bp - 0x2a]
260F: neg        word ptr [bp - 0x2a]
2612: adc        word ptr [bp - 0x28], -1
2616: mov        si, word ptr [bp - 0x2a]
2619: wait
261A: fldz
261C: mov        ax, word ptr [0xa0ac]
261F: mov        dx, word ptr [0xa0ae]
2623: add        ax, word ptr [0xa0a0]
2627: adc        dx, word ptr [0xa0a2]
262B: mov        word ptr [0xa0b8], ax
262E: mov        word ptr [0xa0ba], dx
2632: shl        ax, 1
2634: shl        ax, 1
2636: add        ax, word ptr [bp + 0x16]
2639: mov        dx, word ptr [bp + 0x18]
263C: sub        ax, 4
263F: mov        word ptr [bp - 0x3e], ax
2642: mov        word ptr [bp - 0x3c], dx
2645: les        bx, ptr [bp - 0x3e]
2648: wait
2649: fld        dword ptr es:[bx]
264C: wait
264D: fmul       dword ptr [0xa0d8]
2651: wait
2652: fstp       st(1)
2654: wait
2655: nop
2656: les        bx, ptr [bp - 0x1a]
2659: mov        ax, word ptr es:[bx]
265C: mov        dx, word ptr es:[bx + 2]
2660: les        bx, ptr [bp - 0x3e]
2663: mov        word ptr es:[bx], ax
2666: mov        word ptr es:[bx + 2], dx
266A: les        bx, ptr [bp - 0x36]
266D: wait
266E: fst        dword ptr es:[bx]
2671: wait
2672: nop
2673: mov        ax, word ptr [bp - 0x32]
2676: add        word ptr [bp - 0x1a], ax
2679: mov        ax, word ptr [bp - 0x3a]
267C: add        word ptr [bp - 0x36], ax
267F: mov        ax, word ptr [bp - 0x26]
2682: mov        dx, word ptr [bp - 0x24]
2685: add        word ptr [0xa0ac], ax
2689: adc        word ptr [0xa0ae], dx
268D: dec        si
268E: jne        0x261c
2690: dec        word ptr [bp - 0x28]
2693: jns        0x261c
2695: wait
2696: fstp       dword ptr [0xa0b4]
269A: wait
269B: nop
269C: mov        si, word ptr [0xa0d4]
26A0: shl        si, 1
26A2: shl        si, 1
26A4: les        bx, ptr [bp + 0x16]
26A7: wait
26A8: fild       dword ptr [0xa0a4]
26AC: wait
26AD: fstp       dword ptr es:[bx + si - 4]
26B1: wait
26B2: fldz
26B4: wait
26B5: fstp       dword ptr [0xa0cc]
26B9: wait
26BA: nop
26BB: add        word ptr [0xa0d4], 1
26C0: adc        word ptr [0xa0d6], 0
26C5: sub        ax, ax
26C7: mov        word ptr [0xa0a6], ax
26CA: mov        word ptr [0xa0a4], ax
26CD: mov        ax, word ptr [0xa0c4]
26D0: mov        dx, word ptr [0xa0c6]
26D4: mov        word ptr [bp - 0x3e], ax
26D7: mov        word ptr [bp - 0x3c], dx
26DA: mov        ax, word ptr [0xa0d4]
26DD: mov        dx, word ptr [0xa0d6]
26E1: mov        word ptr [0xa0b0], ax
26E4: mov        word ptr [0xa0b2], dx
26E8: jmp        0x27e0
26EB: les        bx, ptr [bp + 0x12]
26EE: mov        ax, word ptr es:[bx]
26F1: mov        dx, word ptr es:[bx + 2]
26F5: mov        word ptr [bp - 0x1a], ax
26F8: mov        word ptr [bp - 0x18], dx
26FB: push       dx
26FC: push       ax
26FD: add        ax, word ptr [0xa0c0]
2701: adc        dx, word ptr [0xa0c2]
2705: sub        ax, word ptr [0xa0a8]
2709: sbb        dx, word ptr [0xa0aa]
270D: push       dx
270E: push       ax
270F: lcall      0x329, 0x1c
2714: mov        word ptr [bp - 0x46], ax
2717: mov        word ptr [bp - 0x44], dx
271A: mov        ax, word ptr [0xa0a8]
271D: mov        dx, word ptr [0xa0aa]
2721: mov        word ptr [0xa0ac], ax
2724: mov        word ptr [0xa0ae], dx
2728: cmp        word ptr [bp - 0x44], 0
272C: jge        0x2731
272E: jmp        0x27d1
2731: jg         0x273c
2733: cmp        word ptr [bp - 0x46], 0
2737: jne        0x273c
2739: jmp        0x27d1
273C: mov        ax, word ptr [0xa0ac]
273F: shl        ax, 1
2741: shl        ax, 1
2743: add        ax, word ptr [bp + 0x1a]
2746: mov        dx, word ptr [bp + 0x1c]
2749: sub        ax, 4
274C: mov        word ptr [bp - 0x4a], ax
274F: mov        word ptr [bp - 0x48], dx
2752: mov        ax, word ptr [bp - 0x1a]
2755: mov        dx, word ptr [bp - 0x18]
2758: mov        cl, 2
275A: lcall      0x329, 0xec
275F: mov        word ptr [bp - 0x4e], ax
2762: mov        word ptr [bp - 0x4c], dx
2765: mov        ax, word ptr [bp - 0x46]
2768: mov        word ptr [bp - 0x28], ax
276B: mov        ax, word ptr [bp - 0x44]
276E: mov        word ptr [bp - 6], ax
2771: neg        word ptr [bp - 0x28]
2774: neg        word ptr [bp - 0x28]
2777: adc        word ptr [bp - 6], -1
277B: mov        si, word ptr [bp - 0x28]
277E: mov        ax, word ptr [0xa0ac]
2781: mov        dx, word ptr [0xa0ae]
2785: add        ax, word ptr [0xa0a4]
2789: adc        dx, word ptr [0xa0a6]
278D: mov        word ptr [0xa0b8], ax
2790: mov        word ptr [0xa0ba], dx
2794: les        bx, ptr [bp - 0x4a]
2797: wait
2798: fld        dword ptr es:[bx]
279B: wait
279C: fmul       dword ptr [0xa0d8]
27A0: mov        di, ax
27A2: shl        di, 1
27A4: shl        di, 1
27A6: les        bx, ptr [bp + 0x1a]
27A9: wait
27AA: fadd       dword ptr es:[bx + di - 4]
27AE: wait
27AF: fstp       dword ptr es:[bx + di - 4]
27B3: wait
27B4: nop
27B5: mov        ax, word ptr [bp - 0x4e]
27B8: add        word ptr [bp - 0x4a], ax
27BB: mov        ax, word ptr [bp - 0x1a]
27BE: mov        dx, word ptr [bp - 0x18]
27C1: add        word ptr [0xa0ac], ax
27C5: adc        word ptr [0xa0ae], dx
27C9: dec        si
27CA: jne        0x277e
27CC: dec        word ptr [bp - 6]
27CF: jns        0x277e
27D1: add        word ptr [0xa0b0], 1
27D6: adc        word ptr [0xa0b2], 0
27DB: jno        0x27e0
27DD: jmp        0x2929
27E0: mov        ax, word ptr [0xa0b0]
27E3: mov        dx, word ptr [0xa0b2]
27E7: cmp        word ptr [bp - 0x3c], dx
27EA: jge        0x27ef
27EC: jmp        0x2929
27EF: jg         0x27f9
27F1: cmp        word ptr [bp - 0x3e], ax
27F4: jae        0x27f9
27F6: jmp        0x2929
27F9: mov        bx, word ptr [0xa0b0]
27FD: shl        bx, 1
27FF: shl        bx, 1
2801: les        si, ptr [bp + 0x16]
2804: wait
2805: fld        dword ptr es:[bx + si - 4]
2809: wait
280A: fchs
280C: wait
280D: fstp       dword ptr [0xa0d8]
2811: wait
2812: nop
2813: les        bx, ptr [bp + 0x12]
2816: mov        ax, word ptr es:[bx]
2819: mov        dx, word ptr es:[bx + 2]
281D: add        ax, word ptr [0xa0b0]
2821: adc        dx, word ptr [0xa0b2]
2825: mov        word ptr [0xa0d0], ax
2828: mov        word ptr [0xa0d2], dx
282C: add        word ptr [0xa0a4], 1
2831: adc        word ptr [0xa0a6], 0
2836: mov        ax, word ptr es:[bx]
2839: mov        dx, word ptr es:[bx + 2]
283D: mov        word ptr [bp - 0x3a], ax
2840: mov        word ptr [bp - 0x38], dx
2843: push       dx
2844: push       ax
2845: mov        ax, word ptr [0xa0bc]
2848: mov        dx, word ptr [0xa0be]
284C: sub        ax, word ptr [0xa0d0]
2850: sbb        dx, word ptr [0xa0d2]
2854: add        ax, word ptr [bp - 0x3a]
2857: adc        dx, word ptr [bp - 0x38]
285A: push       dx
285B: push       ax
285C: lcall      0x329, 0x1c
2861: mov        word ptr [bp - 0x32], ax
2864: mov        word ptr [bp - 0x30], dx
2867: mov        ax, word ptr [0xa0d0]
286A: mov        dx, word ptr [0xa0d2]
286E: mov        word ptr [0xa0ac], ax
2871: mov        word ptr [0xa0ae], dx
2875: cmp        word ptr [bp - 0x30], 0
2879: jge        0x287e
287B: jmp        0x26eb
287E: jg         0x2889
2880: cmp        word ptr [bp - 0x32], 0
2884: jne        0x2889
2886: jmp        0x26eb
2889: mov        ax, word ptr [0xa0ac]
288C: mov        dx, word ptr [0xa0ae]
2890: sub        ax, word ptr [0xa0a4]
2894: sbb        dx, word ptr [0xa0a6]
2898: mov        word ptr [0xa0b8], ax
289B: mov        word ptr [0xa0ba], dx
289F: mov        bx, ax
28A1: shl        bx, 1
28A3: shl        bx, 1
28A5: les        si, ptr [bp + 0x16]
28A8: wait
28A9: fld        dword ptr es:[bx + si - 4]
28AD: wait
28AE: fmul       dword ptr [0xa0d8]
28B2: mov        bx, word ptr [0xa0ac]
28B6: shl        bx, 1
28B8: shl        bx, 1
28BA: wait
28BB: fadd       dword ptr es:[bx + si - 4]
28BF: wait
28C0: fstp       dword ptr es:[bx + si - 4]
28C4: wait
28C5: nop
28C6: mov        bx, word ptr [0xa0ac]
28CA: shl        bx, 1
28CC: shl        bx, 1
28CE: wait
28CF: fld        dword ptr es:[bx + si - 4]
28D3: wait
28D4: fabs
28D6: wait
28D7: fst        dword ptr [0xa0b4]
28DB: wait
28DC: fsub       dword ptr [0xa0cc]
28E0: wait
28E1: fcom       dword ptr [0x10de]
28E5: wait
28E6: fstp       st(0)
28E8: wait
28E9: fnstsw     word ptr [bp - 0x2a]
28EC: wait
28ED: nop
28EE: mov        ah, byte ptr [bp - 0x29]
28F1: sahf
28F2: jbe        0x2910
28F4: mov        ax, word ptr [0xa0b4]
28F7: mov        dx, word ptr [0xa0b6]
28FB: mov        word ptr [0xa0cc], ax
28FE: mov        word ptr [0xa0ce], dx
2902: mov        ax, word ptr [0xa0ac]
2905: mov        dx, word ptr [0xa0ae]
2909: mov        word ptr [0xa0a0], ax
290C: mov        word ptr [0xa0a2], dx
2910: mov        ax, word ptr [bp - 0x3a]
2913: mov        dx, word ptr [bp - 0x38]
2916: add        word ptr [0xa0ac], ax
291A: adc        word ptr [0xa0ae], dx
291E: sub        word ptr [bp - 0x32], 1
2922: sbb        word ptr [bp - 0x30], 0
2926: jmp        0x2875
2929: les        bx, ptr [bp + 0x12]
292C: mov        ax, word ptr es:[bx]
292F: mov        dx, word ptr es:[bx + 2]
2933: add        word ptr [0xa0d4], ax
2937: adc        word ptr [0xa0d6], dx
293B: add        word ptr [0xa0a8], 1
2940: adc        word ptr [0xa0aa], 0
2945: jno        0x294a
2947: jmp        0x2ca0
294A: mov        ax, word ptr [0xa0a8]
294D: mov        dx, word ptr [0xa0aa]
2951: cmp        word ptr [bp - 8], dx
2954: jge        0x2959
2956: jmp        0x2ca0
2959: jg         0x2963
295B: cmp        word ptr [bp - 0xa], ax
295E: jae        0x2963
2960: jmp        0x2ca0
2963: wait
2964: fld        dword ptr [0xa0cc]
2968: wait
2969: fcom       dword ptr [0x10de]
296D: wait
296E: fstp       st(0)
2970: wait
2971: fnstsw     word ptr [bp - 6]
2974: wait
2975: nop
2976: mov        ah, byte ptr [bp - 5]
2979: sahf
297A: ja         0x297f
297C: jmp        0x2f78
297F: les        bx, ptr [bp + 6]
2982: mov        ax, word ptr es:[bx]
2985: or         ax, word ptr es:[bx + 2]
2989: jne        0x29bd
298B: wait
298C: fld        dword ptr [0xa0cc]
2990: wait
2991: fsub       dword ptr [0xa0c8]
2995: wait
2996: fcom       dword ptr [0x10de]
299A: wait
299B: fstp       st(0)
299D: wait
299E: fnstsw     word ptr [bp - 6]
29A1: wait
29A2: nop
29A3: mov        ah, byte ptr [bp - 5]
29A6: sahf
29A7: ja         0x29bd
29A9: mov        ax, word ptr [0xa0a8]
29AC: mov        dx, word ptr [0xa0aa]
29B0: sub        ax, 1
29B3: sbb        dx, 0
29B6: mov        word ptr es:[bx], ax
29B9: mov        word ptr es:[bx + 2], dx
29BD: wait
29BE: fld        dword ptr [0x10e2]
29C2: mov        si, word ptr [0xa0a0]
29C6: shl        si, 1
29C8: shl        si, 1
29CA: les        bx, ptr [bp + 0x16]
29CD: wait
29CE: fdiv       dword ptr es:[bx + si - 4]
29D2: wait
29D3: fstp       dword ptr [0xa0d8]
29D7: wait
29D8: nop
29D9: les        bx, ptr [bp + 0x12]
29DC: push       word ptr es:[bx + 2]
29E0: push       word ptr es:[bx]
29E3: mov        ax, word ptr [0xa0a0]
29E6: mov        dx, word ptr [0xa0a2]
29EA: sub        ax, 1
29ED: sbb        dx, 0
29F0: push       dx
29F1: push       ax
29F2: lcall      0x329, 0x1c
29F7: mov        word ptr [0xa0a4], ax
29FA: mov        word ptr [0xa0a6], dx
29FE: push       dx
29FF: push       ax
