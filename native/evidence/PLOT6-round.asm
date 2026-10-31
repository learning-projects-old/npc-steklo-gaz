1D6D: enter      0x70, 0
1D71: push       di
1D72: push       si
1D73: wait
1D74: fld        dword ptr [0xebe]
1D78: les        bx, ptr [bp + 6]
1D7B: wait
1D7C: fdiv       dword ptr es:[bx]
1D7F: mov        es, word ptr [0xeee]
1D83: wait
1D84: fstp       dword ptr es:[0]
1D89: wait
1D8A: nop
1D8B: les        bx, ptr [bp + 0x1a]
1D8E: wait
1D8F: fld        dword ptr es:[bx]
1D92: mov        es, word ptr [0xeee]
1D96: wait
1D97: fmul       dword ptr es:[0]
1D9C: lcall      0x2ff, 0x14d0
1DA1: mov        es, word ptr [0xeee]
1DA5: wait
1DA6: fst        dword ptr es:[4]
1DAB: wait
1DAC: fmul       dword ptr es:[4]
1DB1: wait
1DB2: fstp       dword ptr es:[8]
1DB7: wait
1DB8: nop
1DB9: les        bx, ptr [bp + 0x12]
1DBC: mov        ax, word ptr es:[bx]
1DBF: mov        dx, word ptr es:[bx + 2]
1DC3: mov        word ptr [bp - 4], ax
1DC6: mov        word ptr [bp - 2], dx
1DC9: mov        word ptr [0x16fa], 1
1DCF: mov        word ptr [0x16fc], 0
1DD5: mov        ax, word ptr [0x16fa]
1DD8: mov        dx, word ptr [0x16fc]
1DDC: cmp        word ptr [bp - 2], dx
1DDF: jge        0x1de4
1DE1: jmp        0x1fd3
1DE4: jg         0x1dee
1DE6: cmp        word ptr [bp - 4], ax
1DE9: jae        0x1dee
1DEB: jmp        0x1fd3
1DEE: mov        si, word ptr [0x16fa]
1DF2: shl        si, 2
1DF5: mov        es, word ptr [0xeca]
1DF9: lea        bx, [si]
1DFD: wait
1DFE: fld        dword ptr es:[bx - 4]
1E02: mov        es, word ptr [0xeee]
1E06: wait
1E07: fmul       dword ptr es:[0]
1E0C: wait
1E0D: fstp       dword ptr [0x170a]
1E11: wait
1E12: nop
1E13: mov        es, word ptr [0xeca]
1E17: lea        bx, [si + 0x28]
1E1B: wait
1E1C: fld        dword ptr es:[bx - 4]
1E20: mov        es, word ptr [0xeee]
1E24: wait
1E25: fmul       dword ptr es:[0]
1E2A: wait
1E2B: fst        dword ptr [0x170e]
1E2F: lcall      0x2ff, 0x14d0
1E34: wait
1E35: fstp       xword ptr [bp - 0x18]
1E38: wait
1E39: fld        dword ptr [0x170a]
1E3D: lcall      0x2ff, 0x14b5
1E42: wait
1E43: fld        xword ptr [bp - 0x18]
1E46: wait
1E47: fmulp      st(1)
1E49: mov        es, word ptr [0xeee]
1E4D: wait
1E4E: fdiv       dword ptr es:[4]
1E53: mov        ax, 0xb4cc
1E56: mov        dx, 1
1E59: add        ax, 0
1E5C: adc        dx, 0
1E5F: mov        cx, 0xc
1E62: shl        dx, cl
1E64: add        dx, 0xa47
1E68: mov        es, dx
1E6A: mov        bx, ax
1E6C: wait
1E6D: fstp       dword ptr es:[bx]
1E70: wait
1E71: fld        dword ptr [0x170e]
1E75: lcall      0x2ff, 0x14ca
1E7A: wait
1E7B: fstp       xword ptr [bp - 0x22]
1E7E: wait
1E7F: fld        dword ptr [0x170a]
1E83: lcall      0x2ff, 0x14bb
1E88: wait
1E89: fld        xword ptr [bp - 0x22]
1E8C: wait
1E8D: fmulp      st(1)
1E8F: mov        es, word ptr [0xeee]
1E93: wait
1E94: fdiv       dword ptr es:[4]
1E99: wait
1E9A: fst        dword ptr [0x1702]
1E9E: wait
1E9F: fmul       dword ptr [0x1702]
1EA3: wait
1EA4: fstp       dword ptr [0x1716]
1EA8: wait
1EA9: nop
1EAA: mov        ax, 0xb4cc
1EAD: mov        dx, 1
1EB0: add        ax, 0
1EB3: adc        dx, 0
1EB6: mov        cx, 0xc
1EB9: shl        dx, cl
1EBB: add        dx, 0xa47
1EBF: mov        es, dx
1EC1: mov        bx, ax
1EC3: wait
1EC4: fld        dword ptr es:[bx]
1EC7: mov        ax, 0xb4cc
1ECA: mov        dx, 1
1ECD: add        ax, 0
1ED0: adc        dx, 0
1ED3: shl        dx, cl
1ED5: add        dx, 0xa47
1ED9: mov        es, dx
1EDB: mov        bx, ax
1EDD: wait
1EDE: fmul       dword ptr es:[bx]
1EE1: wait
1EE2: fadd       dword ptr [0x1716]
1EE6: wait
1EE7: fstp       dword ptr [0x1712]
1EEB: wait
1EEC: nop
1EED: mov        ax, 0xb4cc
1EF0: mov        dx, 1
1EF3: add        ax, 0
1EF6: adc        dx, 0
1EF9: shl        dx, cl
1EFB: add        dx, 0xa47
1EFF: mov        es, dx
1F01: mov        bx, ax
1F03: wait
1F04: fld        dword ptr es:[bx]
1F07: wait
1F08: fdiv       dword ptr [0x1712]
1F0C: mov        ax, 0xb4cc
1F0F: mov        dx, 1
1F12: add        ax, 0
1F15: adc        dx, 0
1F18: shl        dx, cl
1F1A: add        dx, 0xa47
1F1E: mov        es, dx
1F20: mov        bx, ax
1F22: wait
1F23: fadd       dword ptr es:[bx]
1F26: mov        es, word ptr [0xedc]
1F2A: lea        bx, [si]
1F2E: wait
1F2F: fstp       dword ptr es:[bx - 4]
1F33: wait
1F34: nop
1F35: lea        bx, [si + 0x28]
1F39: wait
1F3A: fld        dword ptr [0x1702]
1F3E: wait
1F3F: fld        dword ptr [0x1702]
1F43: wait
1F44: fdiv       dword ptr [0x1712]
1F48: wait
1F49: fsubp      st(1)
1F4B: wait
1F4C: fstp       dword ptr es:[bx - 4]
1F50: wait
1F51: fld        dword ptr [0x1712]
1F55: wait
1F56: fsub       dword ptr [0xed8]
1F5A: wait
1F5B: fld        dword ptr [0x170a]
1F5F: wait
1F60: fmul       dword ptr [0xeba]
1F64: lcall      0x2ff, 0x14bb
1F69: wait
1F6A: fstp       xword ptr [bp - 0x2c]
1F6D: wait
1F6E: nop
1F6F: mov        es, word ptr [0xeee]
1F73: wait
1F74: fld        dword ptr es:[0]
1F79: wait
1F7A: fdiv       dword ptr [0x1712]
1F7E: wait
1F7F: fld        st(1)
1F81: wait
1F82: fmul       st(2)
1F84: wait
1F85: fld        dword ptr [0x1716]
1F89: wait
1F8A: fmul       dword ptr [0xef4]
1F8E: wait
1F8F: faddp      st(1)
1F91: lcall      0x2ff, 0x14da
1F96: wait
1F97: fmulp      st(1)
1F99: wait
1F9A: fld        xword ptr [bp - 0x2c]
1F9D: mov        es, word ptr [0xeee]
1FA1: wait
1FA2: fdiv       dword ptr es:[8]
1FA7: wait
1FA8: fadd       dword ptr [0x1712]
1FAC: lcall      0x2ff, 0x14da
1FB1: wait
1FB2: fmulp      st(1)
1FB4: mov        es, word ptr [0xeca]
1FB8: lea        bx, [si + 0x28]
1FBC: wait
1FBD: fstp       dword ptr es:[bx - 4]
1FC1: wait
1FC2: ffree      st(0)
1FC4: add        word ptr [0x16fa], 1
1FC9: adc        word ptr [0x16fc], 0
1FCE: jo         0x1fd3
1FD0: jmp        0x1dd5
1FD3: les        bx, ptr [bp + 0x12]
1FD6: mov        ax, word ptr es:[bx]
1FD9: mov        dx, word ptr es:[bx + 2]
1FDD: mov        word ptr [bp - 0x30], ax
1FE0: mov        word ptr [bp - 0x2e], dx
1FE3: mov        word ptr [0x16fa], 1
1FE9: mov        word ptr [0x16fc], 0
1FEF: jmp        0x219a
1FF2: mov        bx, word ptr [0x16fa]
1FF6: shl        bx, 2
1FF9: mov        es, word ptr [0xedc]
1FFD: lea        bx, [bx]
2001: wait
2002: fld        dword ptr es:[bx - 4]
2006: mov        bx, word ptr [0x16fe]
200A: shl        bx, 2
200D: lea        bx, [bx]
2011: wait
2012: fsub       dword ptr es:[bx - 4]
2016: wait
2017: fld        st(0)
2019: wait
201A: fmul       st(1)
201C: wait
201D: fstp       dword ptr [0x1706]
2021: wait
2022: ffree      st(0)
2024: mov        si, word ptr [0x16fa]
2028: shl        si, 2
202B: lea        bx, [si + 0x28]
202F: wait
2030: fld        dword ptr es:[bx - 4]
2034: wait
2035: nop
2036: les        bx, ptr [bp + 0xe]
2039: wait
203A: fld        dword ptr es:[bx + si - 4]
203E: mov        es, word ptr [0xeca]
2042: lea        bx, [si + 0x28]
2046: wait
2047: fmul       dword ptr es:[bx - 4]
204B: wait
204C: fmul       st(1)
204E: wait
204F: fstp       xword ptr [bp - 0x3e]
2052: wait
2053: nop
2054: mov        di, word ptr [0x16fe]
2058: shl        di, 2
205B: mov        es, word ptr [0xedc]
205F: lea        bx, [di + 0x28]
2063: wait
2064: fld        dword ptr es:[bx - 4]
2068: wait
2069: fld        st(1)
206B: wait
206C: fsub       st(1)
206E: wait
206F: fld        st(0)
2071: wait
2072: fmul       st(1)
2074: wait
2075: fadd       dword ptr [0x1706]
2079: wait
207A: fld        xword ptr [bp - 0x3e]
207D: wait
207E: fdivp      st(1)
2080: wait
2081: fstp       xword ptr [bp - 0x48]
2084: wait
2085: fld        st(2)
2087: wait
2088: fadd       st(2)
208A: wait
208B: fstp       xword ptr [bp - 0x52]
208E: wait
208F: nop
2090: les        bx, ptr [bp + 0xe]
2093: wait
2094: fld        dword ptr es:[bx + di - 4]
2098: mov        es, word ptr [0xeca]
209C: lea        bx, [di + 0x28]
20A0: wait
20A1: fmul       dword ptr es:[bx - 4]
20A5: wait
20A6: fstp       xword ptr [bp - 0x5c]
20A9: wait
20AA: ffree      st(2)
20AC: wait
20AD: ffree      st(1)
20AF: wait
20B0: ffree      st(0)
20B2: wait
20B3: fld        xword ptr [bp - 0x52]
20B6: wait
20B7: fld        xword ptr [bp - 0x52]
20BA: wait
20BB: fmulp      st(1)
20BD: wait
20BE: fadd       dword ptr [0x1706]
20C2: wait
20C3: fld        xword ptr [bp - 0x48]
20C6: wait
20C7: fmulp      st(1)
20C9: mov        bx, word ptr [0x16fe]
20CD: shl        bx, 2
20D0: mov        es, word ptr [0xedc]
20D4: lea        bx, [bx + 0x28]
20D8: wait
20D9: fld        dword ptr es:[bx - 4]
20DD: wait
20DE: fld        xword ptr [bp - 0x5c]
20E1: wait
20E2: fmulp      st(1)
20E4: wait
20E5: fdivp      st(1)
20E7: wait
20E8: fstp       xword ptr [bp - 0x66]
20EB: wait
20EC: nop
20ED: mov        si, word ptr [0x16fa]
20F1: shl        si, 2
20F4: wait
20F5: fld        xword ptr [bp - 0x66]
20F8: lcall      0x2ff, 0x14a5
20FD: wait
20FE: fstp       xword ptr [bp - 0x2c]
2101: wait
2102: nop
2103: les        bx, ptr [bp + 0x16]
2106: wait
2107: fld        dword ptr es:[bx]
210A: les        bx, ptr [bp + 0xa]
210D: wait
210E: fld        dword ptr es:[bx + si - 4]
2112: wait
2113: fmul       dword ptr [0xef8]
2117: wait
2118: fdivp      st(1)
211A: wait
211B: fld        xword ptr [bp - 0x2c]
211E: wait
211F: fmulp      st(1)
2121: wait
2122: fstp       xword ptr [bp - 0x70]
2125: wait
2126: nop
2127: imul       bx, word ptr [0x16fe], 0x28
212C: mov        es, word ptr [0xeca]
2130: lea        bx, [bx + si + 0x50]
2134: wait
2135: fld        xword ptr [bp - 0x70]
2138: wait
2139: fstp       dword ptr es:[bx - 0x2c]
213D: wait
213E: nop
213F: add        word ptr [0x16fe], 1
2144: adc        word ptr [0x1700], 0
2149: jo         0x218e
214B: mov        ax, word ptr [0x16fe]
214E: mov        dx, word ptr [0x1700]
2152: cmp        word ptr [bp - 0x32], dx
2155: jl         0x218e
2157: jg         0x215e
2159: cmp        word ptr [bp - 0x34], ax
215C: jb         0x218e
215E: mov        ax, word ptr [0x16fe]
2161: mov        dx, word ptr [0x1700]
2165: cmp        word ptr [0x16fa], ax
2169: je         0x216e
216B: jmp        0x1ff2
216E: cmp        word ptr [0x16fc], dx
2172: je         0x2177
2174: jmp        0x1ff2
2177: imul       si, ax, 0x28
217A: mov        bx, word ptr [0x16fa]
217E: shl        bx, 2
2181: mov        es, word ptr [0xeca]
2185: lea        bx, [bx + si + 0x50]
2189: wait
218A: fldz
218C: jmp        0x2138
218E: add        word ptr [0x16fa], 1
2193: adc        word ptr [0x16fc], 0
2198: jo         0x21cc
219A: mov        ax, word ptr [0x16fa]
219D: mov        dx, word ptr [0x16fc]
21A1: cmp        word ptr [bp - 0x2e], dx
21A4: jl         0x21cc
21A6: jg         0x21ad
21A8: cmp        word ptr [bp - 0x30], ax
21AB: jb         0x21cc
21AD: les        bx, ptr [bp + 0x12]
21B0: mov        ax, word ptr es:[bx]
21B3: mov        dx, word ptr es:[bx + 2]
21B7: mov        word ptr [bp - 0x34], ax
21BA: mov        word ptr [bp - 0x32], dx
21BD: mov        word ptr [0x16fe], 1
21C3: mov        word ptr [0x1700], 0
21C9: jmp        0x214b
21CC: pop        si
21CD: pop        di
21CE: leave
21CF: retf       0x18
21D2: enter      0x6c, 0
21D6: push       di
21D7: push       si
21D8: les        bx, ptr [bp + 0x12]
21DB: cmp        word ptr es:[bx + 2], 0
21E0: jge        0x21e5
21E2: jmp        0x2cdd
21E5: jg         0x21f0
21E7: cmp        word ptr es:[bx], 0
21EB: jne        0x21f0
21ED: jmp        0x2cdd
21F0: les        bx, ptr [bp + 6]
21F3: sub        ax, ax
21F5: mov        word ptr es:[bx + 2], ax
21F9: mov        word ptr es:[bx], ax
21FC: wait
21FD: fldz
21FF: wait
2200: fstp       dword ptr [0x1746]
2204: wait
2205: nop
2206: les        bx, ptr [bp + 0x12]
2209: push       word ptr es:[bx + 2]
220D: push       word ptr es:[bx]
2210: push       word ptr es:[bx + 2]
2214: push       word ptr es:[bx]
2217: lcall      0x2ff, 0xb4
221C: mov        word ptr [0x1736], ax
221F: mov        word ptr [0x1738], dx
2223: les        bx, ptr [bp + 0x12]
2226: push       word ptr es:[bx + 2]
222A: push       word ptr es:[bx]
222D: les        bx, ptr [bp + 0xe]
2230: push       word ptr es:[bx + 2]
2234: push       word ptr es:[bx]
2237: lcall      0x2ff, 0xb4
223C: mov        word ptr [0x173a], ax
223F: mov        word ptr [0x173c], dx
2243: mov        word ptr [0x1726], 1
2249: mov        word ptr [0x1728], 0
224F: mov        ax, word ptr [0x1736]
2252: mov        dx, word ptr [0x1738]
2256: cmp        word ptr [0x1728], dx
225A: jg         0x22b6
225C: jl         0x2264
225E: cmp        word ptr [0x1726], ax
2262: ja         0x22b6
2264: mov        bx, word ptr [0x1726]
2268: shl        bx, 2
226B: les        si, ptr [bp + 0x16]
226E: wait
226F: fld        dword ptr es:[bx + si - 4]
2273: wait
2274: fabs
2276: wait
2277: fst        dword ptr [0x172e]
227B: wait
227C: fsub       dword ptr [0x1746]
2280: wait
2281: fcom       dword ptr [0xefc]
2285: wait
2286: fstp       st(0)
2288: wait
2289: fnstsw     ax
228B: sahf
228C: jbe        0x22aa
228E: mov        ax, word ptr [0x172e]
2291: mov        dx, word ptr [0x1730]
2295: mov        word ptr [0x1746], ax
2298: mov        word ptr [0x1748], dx
229C: mov        ax, word ptr [0x1726]
229F: mov        dx, word ptr [0x1728]
22A3: mov        word ptr [0x171a], ax
22A6: mov        word ptr [0x171c], dx
22AA: add        word ptr [0x1726], 1
22AF: adc        word ptr [0x1728], 0
22B4: jno        0x224f
22B6: les        bx, ptr [bp + 0xa]
22B9: wait
22BA: fld        dword ptr es:[bx]
22BD: wait
22BE: fmul       dword ptr [0x1746]
22C2: wait
22C3: fstp       dword ptr [0x1742]
22C7: wait
22C8: nop
22C9: mov        word ptr [0x174e], 1
22CF: mov        word ptr [0x1750], 0
22D5: les        bx, ptr [bp + 0x12]
22D8: mov        ax, word ptr es:[bx]
22DB: mov        dx, word ptr es:[bx + 2]
22DF: mov        word ptr [bp - 8], ax
22E2: mov        word ptr [bp - 6], dx
22E5: mov        word ptr [0x1722], 1
22EB: mov        word ptr [0x1724], 0
22F1: jmp        0x26c8
22F4: wait
22F5: fstp       dword ptr [0x172e]
22F9: wait
22FA: nop
22FB: les        bx, ptr [bp + 0x12]
22FE: mov        ax, word ptr es:[bx]
2301: mov        dx, word ptr es:[bx + 2]
2305: mov        word ptr [bp - 0x24], ax
2308: mov        word ptr [bp - 0x22], dx
230B: push       dx
230C: push       ax
230D: add        ax, word ptr [0x1736]
2311: adc        dx, word ptr [0x1738]
2315: sub        ax, word ptr [0x174e]
2319: sbb        dx, word ptr [0x1750]
231D: push       dx
231E: push       ax
231F: lcall      0x2ff, 0x18
2324: mov        word ptr [bp - 0x1c], ax
2327: mov        word ptr [bp - 0x1a], dx
232A: mov        ax, word ptr [0x174e]
232D: mov        dx, word ptr [0x1750]
2331: mov        word ptr [0x1726], ax
2334: mov        word ptr [0x1728], dx
2338: cmp        word ptr [bp - 0x1a], 0
233C: jge        0x2341
233E: jmp        0x2427
2341: jg         0x234c
2343: cmp        word ptr [bp - 0x1c], 0
2347: jne        0x234c
2349: jmp        0x2427
234C: mov        ax, word ptr [0x1726]
234F: shl        ax, 2
2352: add        ax, word ptr [bp + 0x16]
2355: mov        dx, word ptr [bp + 0x18]
2358: sub        ax, 4
235B: mov        word ptr [bp - 0x18], ax
235E: mov        word ptr [bp - 0x16], dx
2361: mov        ax, word ptr [bp - 0x24]
2364: mov        dx, word ptr [bp - 0x22]
2367: mov        cl, 2
2369: lcall      0x2ff, 0x18a
236E: mov        word ptr [bp - 0x30], ax
2371: mov        word ptr [bp - 0x2e], dx
2374: mov        ax, word ptr [bp - 0x18]
2377: mov        dx, word ptr [bp - 0x16]
237A: mov        word ptr [bp - 0x34], ax
237D: mov        word ptr [bp - 0x32], dx
2380: mov        ax, word ptr [bp - 0x30]
2383: mov        dx, word ptr [bp - 0x2e]
2386: mov        word ptr [bp - 0x38], ax
2389: mov        word ptr [bp - 0x36], dx
238C: mov        ax, word ptr [bp - 0x1c]
238F: mov        word ptr [bp - 0x28], ax
2392: mov        ax, word ptr [bp - 0x1a]
2395: mov        word ptr [bp - 0x26], ax
2398: neg        word ptr [bp - 0x28]
239B: neg        word ptr [bp - 0x28]
239E: adc        word ptr [bp - 0x26], -1
23A2: mov        si, word ptr [bp - 0x28]
23A5: wait
23A6: fldz
23A8: mov        ax, word ptr [0x1726]
23AB: mov        dx, word ptr [0x1728]
23AF: add        ax, word ptr [0x171a]
23B3: adc        dx, word ptr [0x171c]
23B7: mov        word ptr [0x1732], ax
23BA: mov        word ptr [0x1734], dx
23BE: shl        ax, 2
23C1: add        ax, word ptr [bp + 0x16]
23C4: mov        dx, word ptr [bp + 0x18]
23C7: sub        ax, 4
23CA: mov        word ptr [bp - 0x3c], ax
23CD: mov        word ptr [bp - 0x3a], dx
23D0: les        bx, ptr [bp - 0x3c]
23D3: wait
23D4: fld        dword ptr es:[bx]
23D7: wait
23D8: fmul       dword ptr [0x1752]
23DC: wait
23DD: fstp       st(1)
23DF: wait
23E0: nop
23E1: les        bx, ptr [bp - 0x18]
23E4: mov        ax, word ptr es:[bx]
23E7: mov        dx, word ptr es:[bx + 2]
23EB: les        bx, ptr [bp - 0x3c]
23EE: mov        word ptr es:[bx], ax
23F1: mov        word ptr es:[bx + 2], dx
23F5: les        bx, ptr [bp - 0x34]
23F8: wait
23F9: fst        dword ptr es:[bx]
23FC: wait
23FD: nop
23FE: mov        ax, word ptr [bp - 0x30]
2401: add        word ptr [bp - 0x18], ax
2404: mov        ax, word ptr [bp - 0x38]
2407: add        word ptr [bp - 0x34], ax
240A: mov        ax, word ptr [bp - 0x24]
240D: mov        dx, word ptr [bp - 0x22]
2410: add        word ptr [0x1726], ax
2414: adc        word ptr [0x1728], dx
2418: dec        si
2419: jne        0x23a8
241B: dec        word ptr [bp - 0x26]
241E: jns        0x23a8
2420: wait
2421: fstp       dword ptr [0x172e]
2425: wait
2426: nop
2427: mov        si, word ptr [0x174e]
242B: shl        si, 2
242E: les        bx, ptr [bp + 0x16]
2431: wait
2432: fild       dword ptr [0x171e]
2436: wait
2437: fstp       dword ptr es:[bx + si - 4]
243B: wait
243C: fldz
243E: wait
243F: fstp       dword ptr [0x1746]
2443: wait
2444: nop
2445: add        word ptr [0x174e], 1
244A: adc        word ptr [0x1750], 0
244F: sub        ax, ax
2451: mov        word ptr [0x1720], ax
2454: mov        word ptr [0x171e], ax
2457: mov        ax, word ptr [0x173e]
245A: mov        dx, word ptr [0x1740]
245E: mov        word ptr [bp - 0x3c], ax
2461: mov        word ptr [bp - 0x3a], dx
2464: mov        ax, word ptr [0x174e]
2467: mov        dx, word ptr [0x1750]
246B: mov        word ptr [0x172a], ax
246E: mov        word ptr [0x172c], dx
2472: jmp        0x2568
2475: les        bx, ptr [bp + 0x12]
2478: mov        ax, word ptr es:[bx]
247B: mov        dx, word ptr es:[bx + 2]
247F: mov        word ptr [bp - 0x18], ax
2482: mov        word ptr [bp - 0x16], dx
2485: push       dx
2486: push       ax
2487: add        ax, word ptr [0x173a]
248B: adc        dx, word ptr [0x173c]
248F: sub        ax, word ptr [0x1722]
2493: sbb        dx, word ptr [0x1724]
2497: push       dx
2498: push       ax
2499: lcall      0x2ff, 0x18
249E: mov        word ptr [bp - 0x44], ax
24A1: mov        word ptr [bp - 0x42], dx
24A4: mov        ax, word ptr [0x1722]
24A7: mov        dx, word ptr [0x1724]
24AB: mov        word ptr [0x1726], ax
24AE: mov        word ptr [0x1728], dx
24B2: cmp        word ptr [bp - 0x42], 0
24B6: jge        0x24bb
24B8: jmp        0x2559
24BB: jg         0x24c6
24BD: cmp        word ptr [bp - 0x44], 0
24C1: jne        0x24c6
24C3: jmp        0x2559
24C6: mov        ax, word ptr [0x1726]
24C9: shl        ax, 2
24CC: add        ax, word ptr [bp + 0x1a]
24CF: mov        dx, word ptr [bp + 0x1c]
24D2: sub        ax, 4
24D5: mov        word ptr [bp - 0x48], ax
24D8: mov        word ptr [bp - 0x46], dx
24DB: mov        ax, word ptr [bp - 0x18]
24DE: mov        dx, word ptr [bp - 0x16]
24E1: mov        cl, 2
24E3: lcall      0x2ff, 0x18a
24E8: mov        word ptr [bp - 0x4c], ax
24EB: mov        word ptr [bp - 0x4a], dx
24EE: mov        ax, word ptr [bp - 0x44]
24F1: mov        word ptr [bp - 0x28], ax
24F4: mov        ax, word ptr [bp - 0x42]
24F7: mov        word ptr [bp - 0x26], ax
24FA: neg        word ptr [bp - 0x28]
24FD: neg        word ptr [bp - 0x28]
2500: adc        word ptr [bp - 0x26], -1
2504: mov        si, word ptr [bp - 0x28]
2507: mov        ax, word ptr [0x1726]
250A: mov        dx, word ptr [0x1728]
250E: add        ax, word ptr [0x171e]
2512: adc        dx, word ptr [0x1720]
2516: mov        word ptr [0x1732], ax
2519: mov        word ptr [0x1734], dx
251D: les        bx, ptr [bp - 0x48]
2520: wait
2521: fld        dword ptr es:[bx]
2524: wait
2525: fmul       dword ptr [0x1752]
2529: mov        di, ax
252B: shl        di, 2
252E: les        bx, ptr [bp + 0x1a]
2531: wait
2532: fadd       dword ptr es:[bx + di - 4]
2536: wait
2537: fstp       dword ptr es:[bx + di - 4]
253B: wait
253C: nop
253D: mov        ax, word ptr [bp - 0x4c]
2540: add        word ptr [bp - 0x48], ax
2543: mov        ax, word ptr [bp - 0x18]
2546: mov        dx, word ptr [bp - 0x16]
2549: add        word ptr [0x1726], ax
254D: adc        word ptr [0x1728], dx
2551: dec        si
2552: jne        0x2507
2554: dec        word ptr [bp - 0x26]
2557: jns        0x2507
2559: add        word ptr [0x172a], 1
255E: adc        word ptr [0x172c], 0
2563: jno        0x2568
2565: jmp        0x26a7
2568: mov        ax, word ptr [0x172a]
256B: mov        dx, word ptr [0x172c]
256F: cmp        word ptr [bp - 0x3a], dx
2572: jge        0x2577
2574: jmp        0x26a7
2577: jg         0x2581
2579: cmp        word ptr [bp - 0x3c], ax
257C: jae        0x2581
257E: jmp        0x26a7
2581: mov        bx, word ptr [0x172a]
2585: shl        bx, 2
2588: les        si, ptr [bp + 0x16]
258B: wait
258C: fld        dword ptr es:[bx + si - 4]
2590: wait
2591: fchs
2593: wait
2594: fstp       dword ptr [0x1752]
2598: wait
2599: nop
259A: les        bx, ptr [bp + 0x12]
259D: mov        ax, word ptr es:[bx]
25A0: mov        dx, word ptr es:[bx + 2]
25A4: add        ax, word ptr [0x172a]
25A8: adc        dx, word ptr [0x172c]
25AC: mov        word ptr [0x174a], ax
25AF: mov        word ptr [0x174c], dx
25B3: add        word ptr [0x171e], 1
25B8: adc        word ptr [0x1720], 0
25BD: mov        ax, word ptr es:[bx]
25C0: mov        dx, word ptr es:[bx + 2]
25C4: mov        word ptr [bp - 0x38], ax
25C7: mov        word ptr [bp - 0x36], dx
25CA: push       dx
25CB: push       ax
25CC: mov        ax, word ptr [0x1736]
25CF: mov        dx, word ptr [0x1738]
25D3: sub        ax, word ptr [0x174a]
25D7: sbb        dx, word ptr [0x174c]
25DB: add        ax, word ptr [bp - 0x38]
25DE: adc        dx, word ptr [bp - 0x36]
25E1: push       dx
25E2: push       ax
25E3: lcall      0x2ff, 0x18
25E8: mov        word ptr [bp - 0x30], ax
25EB: mov        word ptr [bp - 0x2e], dx
25EE: mov        ax, word ptr [0x174a]
25F1: mov        dx, word ptr [0x174c]
25F5: mov        word ptr [0x1726], ax
25F8: mov        word ptr [0x1728], dx
25FC: cmp        word ptr [bp - 0x2e], 0
2600: jge        0x2605
2602: jmp        0x2475
2605: jg         0x2610
2607: cmp        word ptr [bp - 0x30], 0
260B: jne        0x2610
260D: jmp        0x2475
2610: mov        ax, word ptr [0x1726]
2613: mov        dx, word ptr [0x1728]
2617: sub        ax, word ptr [0x171e]
261B: sbb        dx, word ptr [0x1720]
261F: mov        word ptr [0x1732], ax
2622: mov        word ptr [0x1734], dx
2626: mov        bx, ax
2628: shl        bx, 2
262B: les        si, ptr [bp + 0x16]
262E: wait
262F: fld        dword ptr es:[bx + si - 4]
2633: wait
2634: fmul       dword ptr [0x1752]
2638: mov        bx, word ptr [0x1726]
263C: shl        bx, 2
263F: wait
2640: fadd       dword ptr es:[bx + si - 4]
2644: wait
2645: fstp       dword ptr es:[bx + si - 4]
2649: wait
264A: nop
264B: mov        bx, word ptr [0x1726]
264F: shl        bx, 2
2652: wait
2653: fld        dword ptr es:[bx + si - 4]
2657: wait
2658: fabs
265A: wait
265B: fst        dword ptr [0x172e]
265F: wait
2660: fsub       dword ptr [0x1746]
2664: wait
2665: fcom       dword ptr [0xefc]
2669: wait
266A: fstp       st(0)
266C: wait
266D: fnstsw     ax
266F: sahf
2670: jbe        0x268e
2672: mov        ax, word ptr [0x172e]
2675: mov        dx, word ptr [0x1730]
2679: mov        word ptr [0x1746], ax
267C: mov        word ptr [0x1748], dx
2680: mov        ax, word ptr [0x1726]
2683: mov        dx, word ptr [0x1728]
2687: mov        word ptr [0x171a], ax
268A: mov        word ptr [0x171c], dx
268E: mov        ax, word ptr [bp - 0x38]
2691: mov        dx, word ptr [bp - 0x36]
2694: add        word ptr [0x1726], ax
2698: adc        word ptr [0x1728], dx
269C: sub        word ptr [bp - 0x30], 1
26A0: sbb        word ptr [bp - 0x2e], 0
26A4: jmp        0x25fc
26A7: les        bx, ptr [bp + 0x12]
26AA: mov        ax, word ptr es:[bx]
26AD: mov        dx, word ptr es:[bx + 2]
26B1: add        word ptr [0x174e], ax
26B5: adc        word ptr [0x1750], dx
26B9: add        word ptr [0x1722], 1
26BE: adc        word ptr [0x1724], 0
26C3: jno        0x26c8
26C5: jmp        0x2a0c
26C8: mov        ax, word ptr [0x1722]
26CB: mov        dx, word ptr [0x1724]
26CF: cmp        word ptr [bp - 6], dx
26D2: jge        0x26d7
26D4: jmp        0x2a0c
26D7: jg         0x26e1
26D9: cmp        word ptr [bp - 8], ax
26DC: jae        0x26e1
26DE: jmp        0x2a0c
26E1: wait
26E2: fld        dword ptr [0x1746]
26E6: wait
26E7: fcom       dword ptr [0xefc]
26EB: wait
26EC: fstp       st(0)
26EE: wait
26EF: fnstsw     ax
26F1: sahf
26F2: ja         0x26f7
26F4: jmp        0x2cdd
26F7: les        bx, ptr [bp + 6]
26FA: mov        ax, word ptr es:[bx]
26FD: or         ax, word ptr es:[bx + 2]
2701: jne        0x272f
2703: wait
2704: fld        dword ptr [0x1746]
2708: wait
2709: fsub       dword ptr [0x1742]
270D: wait
270E: fcom       dword ptr [0xefc]
2712: wait
2713: fstp       st(0)
2715: wait
2716: fnstsw     ax
2718: sahf
2719: ja         0x272f
271B: mov        ax, word ptr [0x1722]
271E: mov        dx, word ptr [0x1724]
2722: sub        ax, 1
2725: sbb        dx, 0
2728: mov        word ptr es:[bx], ax
272B: mov        word ptr es:[bx + 2], dx
272F: wait
2730: fld        dword ptr [0xf00]
2734: mov        si, word ptr [0x171a]
2738: shl        si, 2
273B: les        bx, ptr [bp + 0x16]
273E: wait
273F: fdiv       dword ptr es:[bx + si - 4]
2743: wait
2744: fstp       dword ptr [0x1752]
2748: wait
2749: nop
274A: les        bx, ptr [bp + 0x12]
274D: push       word ptr es:[bx + 2]
2751: push       word ptr es:[bx]
2754: mov        ax, word ptr [0x171a]
2757: mov        dx, word ptr [0x171c]
275B: sub        ax, 1
275E: sbb        dx, 0
2761: push       dx
2762: push       ax
2763: lcall      0x2ff, 0x18
2768: mov        word ptr [0x171e], ax
276B: mov        word ptr [0x1720], dx
276F: push       dx
2770: push       ax
2771: les        bx, ptr [bp + 0x12]
2774: push       word ptr es:[bx + 2]
2778: push       word ptr es:[bx]
277B: lcall      0x2ff, 0xb4
2780: mov        cx, word ptr [0x171a]
2784: mov        bx, word ptr [0x171c]
2788: sub        cx, ax
278A: sbb        bx, dx
278C: sub        cx, word ptr [0x1722]
2790: sbb        bx, word ptr [0x1724]
2794: mov        word ptr [0x171a], cx
2798: mov        word ptr [0x171c], bx
279C: mov        ax, word ptr [0x171e]
279F: mov        dx, word ptr [0x1720]
27A3: sub        ax, word ptr [0x1722]
27A7: sbb        dx, word ptr [0x1724]
27AB: add        ax, 1
27AE: adc        dx, 0
27B1: mov        word ptr [0x171e], ax
27B4: mov        word ptr [0x1720], dx
27B8: les        bx, ptr [bp + 0x12]
27BB: mov        ax, word ptr es:[bx]
27BE: mov        dx, word ptr es:[bx + 2]
27C2: mov        word ptr [bp - 0xc], ax
27C5: mov        word ptr [bp - 0xa], dx
27C8: push       dx
27C9: push       ax
27CA: add        ax, word ptr [0x173a]
27CE: adc        dx, word ptr [0x173c]
27D2: sub        ax, word ptr [0x1722]
27D6: sbb        dx, word ptr [0x1724]
27DA: push       dx
27DB: push       ax
27DC: lcall      0x2ff, 0x18
27E1: mov        word ptr [bp - 0x14], ax
27E4: mov        word ptr [bp - 0x12], dx
27E7: mov        ax, word ptr [0x1722]
27EA: mov        dx, word ptr [0x1724]
27EE: mov        word ptr [0x1726], ax
27F1: mov        word ptr [0x1728], dx
27F5: cmp        word ptr [bp - 0x12], 0
27F9: jge        0x27fe
27FB: jmp        0x28e4
27FE: jg         0x2809
2800: cmp        word ptr [bp - 0x14], 0
2804: jne        0x2809
2806: jmp        0x28e4
2809: mov        ax, word ptr [0x1726]
280C: shl        ax, 2
280F: add        ax, word ptr [bp + 0x1a]
2812: mov        dx, word ptr [bp + 0x1c]
2815: sub        ax, 4
2818: mov        word ptr [bp - 0x18], ax
281B: mov        word ptr [bp - 0x16], dx
281E: mov        ax, word ptr [bp - 0xc]
2821: mov        dx, word ptr [bp - 0xa]
2824: mov        cl, 2
2826: lcall      0x2ff, 0x18a
282B: mov        word ptr [bp - 0x1c], ax
282E: mov        word ptr [bp - 0x1a], dx
2831: mov        ax, word ptr [bp - 0x18]
2834: mov        dx, word ptr [bp - 0x16]
2837: mov        word ptr [bp - 0x20], ax
283A: mov        word ptr [bp - 0x1e], dx
283D: mov        ax, word ptr [bp - 0x1c]
2840: mov        dx, word ptr [bp - 0x1a]
2843: mov        word ptr [bp - 0x24], ax
2846: mov        word ptr [bp - 0x22], dx
2849: mov        ax, word ptr [bp - 0x14]
284C: mov        word ptr [bp - 0x26], ax
284F: mov        ax, word ptr [bp - 0x12]
2852: mov        word ptr [bp - 0x28], ax
2855: neg        word ptr [bp - 0x26]
2858: neg        word ptr [bp - 0x26]
285B: adc        word ptr [bp - 0x28], -1
285F: mov        si, word ptr [bp - 0x26]
2862: wait
2863: fldz
2865: mov        ax, word ptr [0x1726]
2868: mov        dx, word ptr [0x1728]
286C: add        ax, word ptr [0x171a]
2870: adc        dx, word ptr [0x171c]
2874: mov        word ptr [0x1732], ax
2877: mov        word ptr [0x1734], dx
287B: shl        ax, 2
287E: add        ax, word ptr [bp + 0x1a]
2881: mov        dx, word ptr [bp + 0x1c]
2884: sub        ax, 4
2887: mov        word ptr [bp - 0x2c], ax
288A: mov        word ptr [bp - 0x2a], dx
288D: les        bx, ptr [bp - 0x2c]
2890: wait
2891: fld        dword ptr es:[bx]
2894: wait
2895: fmul       dword ptr [0x1752]
2899: wait
289A: fstp       st(1)
289C: wait
289D: nop
289E: les        bx, ptr [bp - 0x18]
28A1: mov        ax, word ptr es:[bx]
28A4: mov        dx, word ptr es:[bx + 2]
28A8: les        bx, ptr [bp - 0x2c]
28AB: mov        word ptr es:[bx], ax
28AE: mov        word ptr es:[bx + 2], dx
28B2: les        bx, ptr [bp - 0x20]
28B5: wait
28B6: fst        dword ptr es:[bx]
28B9: wait
28BA: nop
28BB: mov        ax, word ptr [bp - 0x1c]
28BE: add        word ptr [bp - 0x18], ax
28C1: mov        ax, word ptr [bp - 0x24]
28C4: add        word ptr [bp - 0x20], ax
28C7: mov        ax, word ptr [bp - 0xc]
28CA: mov        dx, word ptr [bp - 0xa]
28CD: add        word ptr [0x1726], ax
28D1: adc        word ptr [0x1728], dx
28D5: dec        si
28D6: jne        0x2865
28D8: dec        word ptr [bp - 0x28]
28DB: jns        0x2865
28DD: wait
28DE: fstp       dword ptr [0x172e]
28E2: wait
28E3: nop
28E4: mov        ax, word ptr [0x1722]
28E7: mov        dx, word ptr [0x1724]
28EB: les        bx, ptr [bp + 0x12]
28EE: sub        ax, word ptr es:[bx]
28F1: sbb        dx, word ptr es:[bx + 2]
28F5: or         dx, dx
28F7: jl         0x28fc
28F9: jmp        0x2a0c
28FC: mov        ax, word ptr es:[bx]
28FF: mov        dx, word ptr es:[bx + 2]
2903: add        ax, word ptr [0x174e]
2907: adc        dx, word ptr [0x1750]
290B: sub        ax, word ptr [0x1722]
290F: sbb        dx, word ptr [0x1724]
2913: mov        word ptr [0x173e], ax
2916: mov        word ptr [0x1740], dx
291A: cmp        word ptr [0x1720], 0
291F: jge        0x2924
2921: jmp        0x22fb
2924: jg         0x2930
2926: cmp        word ptr [0x171e], 0
292B: jne        0x2930
292D: jmp        0x22fb
2930: push       word ptr [0x1720]
2934: push       word ptr [0x171e]
2938: les        bx, ptr [bp + 0x12]
293B: push       word ptr es:[bx + 2]
293F: push       word ptr es:[bx]
2942: lcall      0x2ff, 0xb4
2947: mov        word ptr [0x172a], ax
294A: mov        word ptr [0x172c], dx
294E: mov        ax, word ptr [0x174e]
2951: mov        dx, word ptr [0x1750]
2955: mov        word ptr [0x1726], ax
2958: mov        word ptr [0x1728], dx
295C: mov        ax, word ptr [0x173e]
295F: mov        dx, word ptr [0x1740]
2963: cmp        word ptr [0x1728], dx
2967: jle        0x296c
2969: jmp        0x22fb
296C: jl         0x2977
296E: cmp        word ptr [0x1726], ax
2972: jbe        0x2977
2974: jmp        0x22fb
2977: mov        ax, word ptr [0x1726]
297A: shl        ax, 2
297D: add        ax, word ptr [bp + 0x16]
2980: mov        dx, word ptr [bp + 0x18]
2983: sub        ax, 4
2986: mov        word ptr [bp - 0x24], ax
2989: mov        word ptr [bp - 0x22], dx
298C: wait
298D: fldz
298F: les        bx, ptr [bp - 0x24]
2992: wait
2993: fld        dword ptr es:[bx]
2996: wait
2997: fstp       st(1)
2999: wait
299A: nop
299B: mov        ax, word ptr [0x1726]
299E: mov        dx, word ptr [0x1728]
29A2: add        ax, word ptr [0x172a]
29A6: adc        dx, word ptr [0x172c]
29AA: mov        word ptr [0x1732], ax
29AD: mov        word ptr [0x1734], dx
29B1: mov        si, ax
29B3: shl        si, 2
29B6: les        bx, ptr [bp + 0x16]
29B9: mov        ax, word ptr es:[bx + si - 4]
29BD: mov        dx, word ptr es:[bx + si - 2]
29C1: les        bx, ptr [bp - 0x24]
29C4: mov        word ptr es:[bx], ax
29C7: mov        word ptr es:[bx + 2], dx
29CB: mov        si, word ptr [0x1732]
29CF: shl        si, 2
29D2: les        bx, ptr [bp + 0x16]
29D5: wait
29D6: fst        dword ptr es:[bx + si - 4]
29DA: wait
29DB: nop
29DC: add        word ptr [bp - 0x24], 4
29E0: add        word ptr [0x1726], 1
29E5: adc        word ptr [0x1728], 0
29EA: jno        0x29ef
29EC: jmp        0x22f4
29EF: mov        ax, word ptr [0x173e]
29F2: mov        dx, word ptr [0x1740]
29F6: cmp        word ptr [0x1728], dx
29FA: jle        0x29ff
29FC: jmp        0x22f4
29FF: jl         0x298f
2A01: cmp        word ptr [0x1726], ax
2A05: jbe        0x2a0a
2A07: jmp        0x22f4
2A0A: jmp        0x298f
2A0C: les        bx, ptr [bp + 0x12]
2A0F: mov        ax, word ptr es:[bx]
2A12: mov        dx, word ptr es:[bx + 2]
2A16: sub        ax, 1
2A19: sbb        dx, 0
2A1C: or         dx, dx
2A1E: jge        0x2a23
2A20: jmp        0x2cdd
2A23: jg         0x2a2c
2A25: or         ax, ax
2A27: jne        0x2a2c
2A29: jmp        0x2ceb
2A2C: les        bx, ptr [bp + 0x12]
2A2F: mov        ax, word ptr es:[bx]
2A32: mov        dx, word ptr es:[bx + 2]
2A36: add        ax, word ptr [0x1736]
2A3A: adc        dx, word ptr [0x1738]
2A3E: mov        word ptr [0x174a], ax
2A41: mov        word ptr [0x174c], dx
2A45: mov        ax, word ptr es:[bx]
2A48: mov        dx, word ptr es:[bx + 2]
2A4C: add        ax, 1
2A4F: adc        dx, 0
2A52: mov        word ptr [0x174e], ax
2A55: mov        word ptr [0x1750], dx
2A59: mov        ax, word ptr es:[bx]
2A5C: mov        dx, word ptr es:[bx + 2]
2A60: mov        word ptr [bp - 0x4c], ax
2A63: mov        word ptr [bp - 0x4a], dx
2A66: mov        word ptr [0x171a], 2
2A6C: mov        word ptr [0x171c], 0
2A72: jmp        0x2c18
2A75: mov        ax, word ptr [bp - 0x48]
2A78: mov        dx, word ptr [bp - 0x46]
2A7B: add        word ptr [0x171e], ax
2A7F: adc        word ptr [0x1720], dx
2A83: sub        word ptr [bp - 0x54], 1
2A87: sbb        word ptr [bp - 0x52], 0
2A8B: cmp        word ptr [bp - 0x52], 0
2A8F: jge        0x2a94
2A91: jmp        0x2c09
2A94: jg         0x2a9f
2A96: cmp        word ptr [bp - 0x54], 0
2A9A: jne        0x2a9f
2A9C: jmp        0x2c09
2A9F: mov        si, word ptr [0x171e]
2AA3: shl        si, 2
2AA6: les        bx, ptr [bp + 0x1a]
2AA9: mov        ax, word ptr es:[bx + si - 4]
2AAD: mov        dx, word ptr es:[bx + si - 2]
2AB1: mov        word ptr [0x172e], ax
2AB4: mov        word ptr [0x1730], dx
2AB8: mov        ax, word ptr [0x171e]
2ABB: mov        dx, word ptr [0x1720]
2ABF: mov        word ptr [0x1732], ax
2AC2: mov        word ptr [0x1734], dx
2AC6: les        bx, ptr [bp + 0x12]
2AC9: mov        ax, word ptr es:[bx]
2ACC: mov        dx, word ptr es:[bx + 2]
2AD0: mov        word ptr [bp - 0x58], ax
2AD3: mov        word ptr [bp - 0x56], dx
2AD6: push       dx
2AD7: push       ax
2AD8: add        ax, word ptr [0x1736]
2ADC: adc        dx, word ptr [0x1738]
2AE0: sub        ax, word ptr [0x174a]
2AE4: sbb        dx, word ptr [0x174c]
2AE8: push       dx
2AE9: push       ax
2AEA: lcall      0x2ff, 0x18
2AEF: mov        word ptr [bp - 0x60], ax
2AF2: mov        word ptr [bp - 0x5e], dx
2AF5: mov        ax, word ptr [0x174a]
2AF8: mov        dx, word ptr [0x174c]
2AFC: mov        word ptr [0x1722], ax
2AFF: mov        word ptr [0x1724], dx
2B03: cmp        word ptr [bp - 0x5e], 0
2B07: jge        0x2b0c
2B09: jmp        0x2bbb
2B0C: jg         0x2b17
2B0E: cmp        word ptr [bp - 0x60], 0
2B12: jne        0x2b17
2B14: jmp        0x2bbb
2B17: mov        ax, word ptr [0x1722]
2B1A: shl        ax, 2
2B1D: add        ax, word ptr [bp + 0x16]
2B20: mov        dx, word ptr [bp + 0x18]
2B23: sub        ax, 4
2B26: mov        word ptr [bp - 0x64], ax
2B29: mov        word ptr [bp - 0x62], dx
2B2C: mov        ax, word ptr [bp - 0x58]
2B2F: mov        dx, word ptr [bp - 0x56]
2B32: mov        cl, 2
2B34: lcall      0x2ff, 0x18a
2B39: mov        word ptr [bp - 0x68], ax
2B3C: mov        word ptr [bp - 0x66], dx
2B3F: mov        ax, word ptr [0x1732]
2B42: shl        ax, 2
2B45: add        ax, word ptr [bp + 0x1a]
2B48: mov        dx, word ptr [bp + 0x1c]
2B4B: sub        ax, 4
2B4E: mov        word ptr [bp - 0x6c], ax
2B51: mov        word ptr [bp - 0x6a], dx
2B54: push       word ptr [bp - 0x56]
2B57: push       word ptr [bp - 0x58]
2B5A: push       word ptr [bp - 0x5e]
2B5D: push       word ptr [bp - 0x60]
2B60: lcall      0x2ff, 0xb4
2B65: add        word ptr [0x1722], ax
2B69: adc        word ptr [0x1724], dx
2B6D: mov        ax, word ptr [bp - 0x60]
2B70: mov        dx, word ptr [bp - 0x5e]
2B73: add        word ptr [0x1732], ax
2B77: adc        word ptr [0x1734], dx
2B7B: mov        word ptr [bp - 0x28], ax
2B7E: mov        ax, dx
2B80: mov        word ptr [bp - 0x26], ax
2B83: neg        word ptr [bp - 0x28]
2B86: neg        word ptr [bp - 0x28]
2B89: adc        word ptr [bp - 0x26], -1
2B8D: mov        cx, word ptr [bp - 0x28]
2B90: add        word ptr [bp - 0x6c], 4
2B94: les        bx, ptr [bp - 0x64]
2B97: wait
2B98: fld        dword ptr es:[bx]
2B9B: les        bx, ptr [bp - 0x6c]
2B9E: wait
2B9F: fmul       dword ptr es:[bx]
2BA2: wait
2BA3: fsubr      dword ptr [0x172e]
2BA7: wait
2BA8: fstp       dword ptr [0x172e]
2BAC: wait
2BAD: nop
2BAE: mov        ax, word ptr [bp - 0x68]
2BB1: add        word ptr [bp - 0x64], ax
2BB4: loop       0x2b90
2BB6: dec        word ptr [bp - 0x26]
2BB9: jns        0x2b90
2BBB: mov        ax, word ptr [0x171e]
2BBE: mov        dx, word ptr [0x1720]
2BC2: add        ax, word ptr [0x1726]
2BC6: adc        dx, word ptr [0x1728]
2BCA: mov        word ptr [0x1722], ax
2BCD: mov        word ptr [0x1724], dx
2BD1: mov        si, ax
2BD3: shl        si, 2
2BD6: les        bx, ptr [bp + 0x1a]
2BD9: mov        ax, word ptr es:[bx + si - 4]
2BDD: mov        dx, word ptr es:[bx + si - 2]
2BE1: mov        si, word ptr [0x171e]
2BE5: shl        si, 2
2BE8: mov        word ptr es:[bx + si - 4], ax
2BEC: mov        word ptr es:[bx + si - 2], dx
2BF0: mov        si, word ptr [0x1722]
2BF4: shl        si, 2
2BF7: mov        ax, word ptr [0x172e]
2BFA: mov        dx, word ptr [0x1730]
2BFE: mov        word ptr es:[bx + si - 4], ax
2C02: mov        word ptr es:[bx + si - 2], dx
2C06: jmp        0x2a75
2C09: add        word ptr [0x171a], 1
2C0E: adc        word ptr [0x171c], 0
2C13: jno        0x2c18
2C15: jmp        0x2ceb
2C18: mov        ax, word ptr [0x171a]
2C1B: mov        dx, word ptr [0x171c]
2C1F: cmp        word ptr [bp - 0x4a], dx
2C22: jge        0x2c27
2C24: jmp        0x2ceb
2C27: jg         0x2c31
2C29: cmp        word ptr [bp - 0x4c], ax
2C2C: jae        0x2c31
2C2E: jmp        0x2ceb
2C31: mov        ax, word ptr [0x174e]
2C34: mov        dx, word ptr [0x1750]
2C38: sub        ax, word ptr [0x171a]
2C3C: sbb        dx, word ptr [0x171c]
2C40: mov        word ptr [0x172a], ax
2C43: mov        word ptr [0x172c], dx
2C47: mov        ax, word ptr [0x174e]
2C4A: mov        dx, word ptr [0x1750]
2C4E: sub        word ptr [0x174a], ax
2C52: sbb        word ptr [0x174c], dx
2C56: mov        ax, word ptr [0x174a]
2C59: mov        dx, word ptr [0x174c]
2C5D: les        bx, ptr [bp + 0x12]
2C60: sub        ax, word ptr es:[bx]
2C63: sbb        dx, word ptr es:[bx + 2]
2C67: mov        word ptr [0x1726], ax
2C6A: mov        word ptr [0x1728], dx
2C6E: mov        si, ax
2C70: shl        si, 2
2C73: les        bx, ptr [bp + 0x16]
2C76: wait
2C77: fld        dword ptr es:[bx + si - 4]
2C7B: wait
2C7C: fadd       dword ptr [0xf04]
2C80: lcall      0x2ff, 0x1313
2C85: mov        word ptr [0x1726], ax
2C88: mov        word ptr [0x1728], dx
2C8C: mov        ax, word ptr [0x173a]
2C8F: mov        dx, word ptr [0x173c]
2C93: mov        word ptr [bp - 0x50], ax
2C96: mov        word ptr [bp - 0x4e], dx
2C99: les        bx, ptr [bp + 0x12]
2C9C: mov        ax, word ptr es:[bx]
2C9F: mov        dx, word ptr es:[bx + 2]
2CA3: mov        word ptr [bp - 0x48], ax
2CA6: mov        word ptr [bp - 0x46], dx
2CA9: push       dx
2CAA: push       ax
2CAB: mov        ax, word ptr [bp - 0x50]
2CAE: mov        dx, word ptr [bp - 0x4e]
2CB1: add        ax, word ptr [bp - 0x48]
2CB4: adc        dx, word ptr [bp - 0x46]
2CB7: sub        ax, word ptr [0x172a]
2CBB: sbb        dx, word ptr [0x172c]
2CBF: push       dx
2CC0: push       ax
2CC1: lcall      0x2ff, 0x18
2CC6: mov        word ptr [bp - 0x54], ax
2CC9: mov        word ptr [bp - 0x52], dx
2CCC: mov        ax, word ptr [0x172a]
2CCF: mov        dx, word ptr [0x172c]
2CD3: mov        word ptr [0x171e], ax
2CD6: mov        word ptr [0x1720], dx
2CDA: jmp        0x2a8b
2CDD: les        bx, ptr [bp + 6]
2CE0: mov        word ptr es:[bx], 0xffff
2CE5: mov        word ptr es:[bx + 2], 0xffff
2CEB: pop        si
2CEC: pop        di
2CED: leave
2CEE: retf       0x18
2CF1: enter      0x24, 0
2CF5: push       si
2CF6: les        bx, ptr [bp + 0x12]
2CF9: mov        ax, word ptr es:[bx]
2CFC: mov        dx, word ptr es:[bx + 2]
2D00: les        bx, ptr [bp + 0x1a]
2D03: sub        ax, word ptr es:[bx]
2D06: sbb        dx, word ptr es:[bx + 2]
2D0A: mov        word ptr [0x1762], ax
2D0D: mov        word ptr [0x1764], dx
2D11: les        bx, ptr [bp + 0x1e]
2D14: cmp        word ptr es:[bx + 2], 0
2D19: jge        0x2d1e
2D1B: jmp        0x2e49
2D1E: jg         0x2d29
2D20: cmp        word ptr es:[bx], 1
2D24: ja         0x2d29
2D26: jmp        0x2e49
2D29: sub        ax, ax
2D2B: mov        word ptr [0x1760], ax
2D2E: mov        word ptr [0x175e], ax
2D31: mov        word ptr [0x1768], ax
2D34: mov        word ptr [0x1766], ax
2D37: les        bx, ptr [bp + 0x16]
2D3A: mov        ax, word ptr es:[bx]
2D3D: mov        dx, word ptr es:[bx + 2]
2D41: mov        word ptr [bp - 0x18], ax
2D44: mov        word ptr [bp - 0x16], dx
2D47: mov        word ptr [0x1756], 1
2D4D: mov        word ptr [0x1758], 0
2D53: or         dx, dx
2D55: jge        0x2d5a
2D57: jmp        0x2ff0
2D5A: jg         0x2d64
2D5C: cmp        ax, 1
2D5F: jae        0x2d64
2D61: jmp        0x2ff0
2D64: les        bx, ptr [bp + 0x1a]
2D67: mov        ax, word ptr es:[bx]
2D6A: mov        dx, word ptr es:[bx + 2]
2D6E: mov        word ptr [bp - 0x24], ax
2D71: mov        word ptr [bp - 0x22], dx
2D74: mov        ax, word ptr [bp - 0x18]
2D77: mov        dx, word ptr [bp - 0x16]
2D7A: add        word ptr [0x1756], ax
2D7E: adc        word ptr [0x1758], dx
2D82: mov        word ptr [bp - 0x14], ax
2D85: mov        ax, dx
2D87: mov        word ptr [bp - 0x12], ax
2D8A: neg        word ptr [bp - 0x14]
2D8D: neg        word ptr [bp - 0x14]
2D90: adc        word ptr [bp - 0x12], -1
2D94: mov        si, word ptr [bp - 0x14]
2D97: mov        ax, word ptr [bp - 0x24]
2D9A: mov        dx, word ptr [bp - 0x22]
2D9D: mov        word ptr [bp - 0x10], ax
2DA0: mov        word ptr [bp - 0xe], dx
2DA3: mov        word ptr [0x175a], 1
2DA9: mov        word ptr [0x175c], 0
2DAF: or         dx, dx
2DB1: jge        0x2db6
2DB3: jmp        0x2fd3
2DB6: jg         0x2dc0
2DB8: cmp        ax, 1
2DBB: jae        0x2dc0
2DBD: jmp        0x2fd3
2DC0: mov        ax, word ptr [0x175e]
2DC3: shl        ax, 2
2DC6: add        ax, word ptr [bp + 0xa]
2DC9: mov        dx, word ptr [bp + 0xc]
2DCC: sub        ax, 4
2DCF: mov        word ptr [bp - 0xc], ax
2DD2: mov        word ptr [bp - 0xa], dx
2DD5: mov        ax, word ptr [0x1766]
2DD8: shl        ax, 2
2DDB: add        ax, word ptr [bp + 6]
2DDE: mov        dx, word ptr [bp + 8]
2DE1: sub        ax, 4
2DE4: mov        word ptr [bp - 0x20], ax
2DE7: mov        word ptr [bp - 0x1e], dx
2DEA: mov        ax, word ptr [bp - 0x24]
2DED: mov        dx, word ptr [bp - 0x22]
2DF0: add        word ptr [0x175a], ax
2DF4: adc        word ptr [0x175c], dx
2DF8: add        word ptr [0x1766], ax
2DFC: adc        word ptr [0x1768], dx
2E00: add        word ptr [0x175e], ax
2E04: adc        word ptr [0x1760], dx
2E08: mov        ax, word ptr [bp - 0x10]
2E0B: mov        word ptr [bp - 0x1c], ax
2E0E: mov        ax, word ptr [bp - 0xe]
2E11: mov        word ptr [bp - 0x1a], ax
2E14: neg        word ptr [bp - 0x1c]
2E17: neg        word ptr [bp - 0x1c]
2E1A: adc        word ptr [bp - 0x1a], -1
2E1E: mov        cx, word ptr [bp - 0x1c]
2E21: add        word ptr [bp - 0xc], 4
2E25: add        word ptr [bp - 0x20], 4
2E29: les        bx, ptr [bp - 0x20]
2E2C: mov        ax, word ptr es:[bx]
2E2F: mov        dx, word ptr es:[bx + 2]
2E33: les        bx, ptr [bp - 0xc]
2E36: mov        word ptr es:[bx], ax
2E39: mov        word ptr es:[bx + 2], dx
2E3D: loop       0x2e21
2E3F: dec        word ptr [bp - 0x1a]
2E42: jns        0x2e47
2E44: jmp        0x2fd3
2E47: jmp        0x2e21
2E49: les        bx, ptr [bp + 0x16]
2E4C: push       word ptr es:[bx + 2]
2E50: push       word ptr es:[bx]
2E53: les        bx, ptr [bp + 0x1a]
2E56: push       word ptr es:[bx + 2]
2E5A: push       word ptr es:[bx]
2E5D: lcall      0x2ff, 0xb4
2E62: add        ax, 1
2E65: adc        dx, 0
2E68: mov        word ptr [0x175e], ax
2E6B: mov        word ptr [0x1760], dx
2E6F: les        bx, ptr [bp + 0x16]
2E72: push       word ptr es:[bx + 2]
2E76: push       word ptr es:[bx]
2E79: les        bx, ptr [bp + 0x12]
2E7C: push       word ptr es:[bx + 2]
2E80: push       word ptr es:[bx]
2E83: lcall      0x2ff, 0xb4
2E88: add        ax, 1
2E8B: adc        dx, 0
2E8E: mov        word ptr [0x1766], ax
2E91: mov        word ptr [0x1768], dx
2E95: les        bx, ptr [bp + 0x16]
2E98: mov        ax, word ptr es:[bx]
2E9B: mov        dx, word ptr es:[bx + 2]
2E9F: mov        word ptr [bp - 4], ax
2EA2: mov        word ptr [bp - 2], dx
2EA5: mov        word ptr [0x1756], 1
2EAB: mov        word ptr [0x1758], 0
2EB1: or         dx, dx
2EB3: jge        0x2eb8
2EB5: jmp        0x2ff0
2EB8: jg         0x2ec2
2EBA: cmp        ax, 1
2EBD: jae        0x2ec2
2EBF: jmp        0x2ff0
2EC2: les        bx, ptr [bp + 0x1a]
2EC5: mov        ax, word ptr es:[bx]
2EC8: mov        dx, word ptr es:[bx + 2]
2ECC: mov        word ptr [bp - 0x18], ax
2ECF: mov        word ptr [bp - 0x16], dx
2ED2: mov        ax, word ptr [bp - 4]
2ED5: mov        dx, word ptr [bp - 2]
2ED8: add        word ptr [0x1756], ax
2EDC: adc        word ptr [0x1758], dx
2EE0: mov        word ptr [bp - 0x1a], ax
2EE3: mov        ax, dx
2EE5: mov        word ptr [bp - 0x1c], ax
2EE8: neg        word ptr [bp - 0x1a]
2EEB: neg        word ptr [bp - 0x1a]
2EEE: adc        word ptr [bp - 0x1c], -1
2EF2: mov        si, word ptr [bp - 0x1a]
2EF5: mov        ax, word ptr [0x1762]
2EF8: mov        dx, word ptr [0x1764]
2EFC: sub        word ptr [0x1766], ax
2F00: sbb        word ptr [0x1768], dx
2F04: mov        ax, word ptr [bp - 0x18]
2F07: mov        dx, word ptr [bp - 0x16]
2F0A: mov        word ptr [bp - 8], ax
2F0D: mov        word ptr [bp - 6], dx
2F10: mov        word ptr [0x175a], 1
2F16: mov        word ptr [0x175c], 0
2F1C: or         dx, dx
2F1E: jge        0x2f23
2F20: jmp        0x2fc5
2F23: jg         0x2f2d
2F25: cmp        ax, 1
2F28: jae        0x2f2d
2F2A: jmp        0x2fc5
2F2D: mov        ax, word ptr [0x1766]
2F30: shl        ax, 2
2F33: add        ax, word ptr [bp + 6]
2F36: mov        dx, word ptr [bp + 8]
2F39: sub        ax, 4
2F3C: mov        word ptr [bp - 0xc], ax
2F3F: mov        word ptr [bp - 0xa], dx
2F42: mov        ax, word ptr [0x175e]
2F45: shl        ax, 2
2F48: add        ax, word ptr [bp + 0xa]
2F4B: mov        dx, word ptr [bp + 0xc]
2F4E: sub        ax, 4
2F51: mov        word ptr [bp - 0x10], ax
2F54: mov        word ptr [bp - 0xe], dx
2F57: mov        ax, word ptr [bp - 0x18]
2F5A: mov        dx, word ptr [bp - 0x16]
2F5D: add        word ptr [0x175a], ax
2F61: adc        word ptr [0x175c], dx
2F65: neg        ax
2F67: adc        dx, 0
2F6A: neg        dx
2F6C: add        word ptr [0x1766], ax
2F70: adc        word ptr [0x1768], dx
2F74: mov        ax, word ptr [bp - 0x18]
2F77: mov        dx, word ptr [bp - 0x16]
2F7A: neg        ax
2F7C: adc        dx, 0
2F7F: neg        dx
2F81: add        word ptr [0x175e], ax
2F85: adc        word ptr [0x1760], dx
2F89: mov        ax, word ptr [bp - 8]
2F8C: mov        word ptr [bp - 0x12], ax
2F8F: mov        ax, word ptr [bp - 6]
2F92: mov        word ptr [bp - 0x14], ax
2F95: neg        word ptr [bp - 0x12]
2F98: neg        word ptr [bp - 0x12]
2F9B: adc        word ptr [bp - 0x14], -1
2F9F: mov        cx, word ptr [bp - 0x12]
2FA2: sub        word ptr [bp - 0x10], 4
2FA6: sub        word ptr [bp - 0xc], 4
2FAA: les        bx, ptr [bp - 0x10]
2FAD: mov        ax, word ptr es:[bx]
2FB0: mov        dx, word ptr es:[bx + 2]
2FB4: les        bx, ptr [bp - 0xc]
2FB7: mov        word ptr es:[bx], ax
2FBA: mov        word ptr es:[bx + 2], dx
2FBE: loop       0x2fa2
2FC0: dec        word ptr [bp - 0x14]
2FC3: jns        0x2fa2
2FC5: dec        si
2FC6: je         0x2fcb
2FC8: jmp        0x2ef5
2FCB: dec        word ptr [bp - 0x1c]
2FCE: js         0x2ff0
2FD0: jmp        0x2ef5
2FD3: mov        ax, word ptr [0x1762]
2FD6: mov        dx, word ptr [0x1764]
2FDA: add        word ptr [0x1766], ax
2FDE: adc        word ptr [0x1768], dx
2FE2: dec        si
2FE3: je         0x2fe8
2FE5: jmp        0x2d97
2FE8: dec        word ptr [bp - 0x12]
2FEB: js         0x2ff0
2FED: jmp        0x2d97
