0000: push       bp
0001: mov        bp, sp
0003: sub        sp, 0x90
0007: push       di
0008: push       si
0009: mov        ax, 0xdd
000C: push       ds
000D: push       ax
000E: mov        ax, 0xfe
0011: push       ax
0012: lcall      0x329, 0x2230
0017: add        sp, 6
001A: mov        ax, 0x104
001D: push       ax
001E: lcall      0x329, 0x30f2
0023: add        sp, 2
0026: mov        ax, word ptr [0x4724]
0029: or         ax, word ptr [0x4726]
002D: je         0x32
002F: jmp        0x122
0032: mov        ax, 0xd3
0035: push       ds
0036: push       ax
0037: mov        ax, 0x10c
003A: push       ax
003B: lcall      0x329, 0x2da8
0040: add        sp, 6
0043: mov        ax, 0x112
0046: push       ax
0047: lcall      0x329, 0x30f2
004C: add        sp, 2
004F: mov        es, word ptr [0x10bc]
0053: mov        ax, word ptr es:[0x2a38]
0057: mov        dx, word ptr es:[0x2a3a]
005C: mov        word ptr [bp - 6], ax
005F: mov        word ptr [bp - 4], dx
0062: mov        word ptr [0x4068], 1
0068: mov        word ptr [0x406a], 0
006E: mov        ax, word ptr [0x4068]
0071: mov        dx, word ptr [0x406a]
0075: cmp        word ptr [bp - 4], dx
0078: jl         0xb6
007A: jg         0x81
007C: cmp        word ptr [bp - 6], ax
007F: jb         0xb6
0081: mov        si, word ptr [0x4068]
0085: mov        cl, 2
0087: shl        si, cl
0089: lea        ax, [si + 0x190]
008D: mov        dx, 0xaaa
0090: sub        ax, 4
0093: push       dx
0094: push       ax
0095: lea        ax, [si]
0099: sub        ax, 4
009C: push       dx
009D: push       ax
009E: mov        ax, 0x134
00A1: push       ax
00A2: lcall      0x329, 0x31b2
00A7: add        sp, 0xa
00AA: add        word ptr [0x4068], 1
00AF: adc        word ptr [0x406a], 0
00B4: jno        0x6e
00B6: mov        ax, 0x138
00B9: push       ax
00BA: lcall      0x329, 0x31b2
00BF: add        sp, 2
00C2: mov        ax, word ptr [0x7354]
00C5: mov        dx, word ptr [0x7356]
00C9: mov        word ptr [bp - 0xa], ax
00CC: mov        word ptr [bp - 8], dx
00CF: mov        word ptr [0x4068], 1
00D5: mov        word ptr [0x406a], 0
00DB: mov        ax, word ptr [0x4068]
00DE: mov        dx, word ptr [0x406a]
00E2: cmp        word ptr [bp - 8], dx
00E5: jl         0x11c
00E7: jg         0xee
00E9: cmp        word ptr [bp - 0xa], ax
00EC: jb         0x11c
00EE: mov        si, word ptr [0x4068]
00F2: mov        cl, 2
00F4: shl        si, cl
00F6: mov        ax, si
00F8: add        ax, 0x7354
00FB: push       ds
00FC: push       ax
00FD: mov        ax, si
00FF: add        ax, 0x7420
0102: push       ds
0103: push       ax
0104: mov        ax, 0x13e
0107: push       ax
0108: lcall      0x329, 0x31b2
010D: add        sp, 0xa
0110: add        word ptr [0x4068], 1
0115: adc        word ptr [0x406a], 0
011A: jno        0xdb
011C: mov        ax, 0x141
011F: jmp        0x20f
0122: mov        ax, 0xcc
0125: push       ds
0126: push       ax
0127: mov        ax, 0x142
012A: push       ax
012B: lcall      0x329, 0x2da8
0130: add        sp, 6
0133: mov        ax, 0x148
0136: push       ax
0137: lcall      0x329, 0x30f2
013C: add        sp, 2
013F: mov        es, word ptr [0x10bc]
0143: mov        ax, word ptr es:[0x2bd4]
0147: mov        dx, word ptr es:[0x2bd6]
014C: mov        word ptr [bp - 0xe], ax
014F: mov        word ptr [bp - 0xc], dx
0152: mov        word ptr [0x4068], 1
0158: mov        word ptr [0x406a], 0
015E: mov        ax, word ptr [0x4068]
0161: mov        dx, word ptr [0x406a]
0165: cmp        word ptr [bp - 0xc], dx
0168: jl         0x1a6
016A: jg         0x171
016C: cmp        word ptr [bp - 0xe], ax
016F: jb         0x1a6
0171: mov        si, word ptr [0x4068]
0175: mov        cl, 2
0177: shl        si, cl
0179: lea        ax, [si + 0x190]
017D: mov        dx, 0xaaa
0180: sub        ax, 4
0183: push       dx
0184: push       ax
0185: lea        ax, [si]
0189: sub        ax, 4
018C: push       dx
018D: push       ax
018E: mov        ax, 0x16e
0191: push       ax
0192: lcall      0x329, 0x31b2
0197: add        sp, 0xa
019A: add        word ptr [0x4068], 1
019F: adc        word ptr [0x406a], 0
01A4: jno        0x15e
01A6: mov        ax, 0x172
01A9: push       ax
01AA: lcall      0x329, 0x31b2
01AF: add        sp, 2
01B2: mov        ax, word ptr [0x7354]
01B5: mov        dx, word ptr [0x7356]
01B9: mov        word ptr [bp - 0x12], ax
01BC: mov        word ptr [bp - 0x10], dx
01BF: mov        word ptr [0x4068], 1
01C5: mov        word ptr [0x406a], 0
01CB: mov        ax, word ptr [0x4068]
01CE: mov        dx, word ptr [0x406a]
01D2: cmp        word ptr [bp - 0x10], dx
01D5: jl         0x20c
01D7: jg         0x1de
01D9: cmp        word ptr [bp - 0x12], ax
01DC: jb         0x20c
01DE: mov        si, word ptr [0x4068]
01E2: mov        cl, 2
01E4: shl        si, cl
01E6: mov        ax, si
01E8: add        ax, 0x7354
01EB: push       ds
01EC: push       ax
01ED: mov        ax, si
01EF: add        ax, 0x7420
01F2: push       ds
01F3: push       ax
01F4: mov        ax, 0x178
01F7: push       ax
01F8: lcall      0x329, 0x31b2
01FD: add        sp, 0xa
0200: add        word ptr [0x4068], 1
0205: adc        word ptr [0x406a], 0
020A: jno        0x1cb
020C: mov        ax, 0x17b
020F: push       ax
0210: lcall      0x329, 0x31b2
0215: add        sp, 2
0218: mov        ax, 0x17c
021B: push       ax
021C: lcall      0x329, 0x2230
0221: add        sp, 2
0224: mov        ax, 0xb8
0227: push       ds
0228: push       ax
0229: mov        ax, 0x184
022C: push       ax
022D: lcall      0x329, 0x2230
0232: add        sp, 6
0235: mov        ax, 0x18a
0238: push       ax
0239: lcall      0x329, 0x30f2
023E: add        sp, 2
0241: mov        ax, 0xa7
0244: push       ds
0245: push       ax
0246: mov        ax, 0x192
0249: push       ax
024A: lcall      0x329, 0x2230
024F: add        sp, 6
0252: mov        ax, 0x198
0255: push       ax
0256: lcall      0x329, 0x30f2
025B: add        sp, 2
025E: mov        ax, 0x9f
0261: push       ds
0262: push       ax
0263: mov        ax, 0x1a0
0266: push       ax
0267: lcall      0x329, 0x2da8
026C: add        sp, 6
026F: mov        ax, word ptr [0x4724]
0272: or         ax, word ptr [0x4726]
0276: je         0x27b
0278: jmp        0x615
027B: wait
027C: fld        dword ptr [0x4728]
0280: wait
0281: fcom       dword ptr [0x10be]
0285: wait
0286: fstp       st(0)
0288: wait
0289: fnstsw     word ptr [bp - 0x14]
028C: wait
028D: nop
028E: mov        ah, byte ptr [bp - 0x13]
0291: sahf
0292: je         0x297
0294: jmp        0x387
0297: mov        ax, 0x83
029A: push       ds
029B: push       ax
029C: mov        ax, 0x1a6
029F: push       ax
02A0: lcall      0x329, 0x2230
02A5: add        sp, 6
02A8: mov        es, word ptr [0x10bc]
02AC: mov        ax, word ptr es:[0x2a38]
02B0: mov        dx, word ptr es:[0x2a3a]
02B5: add        ax, 1
02B8: adc        dx, 0
02BB: mov        word ptr [0x13bc], ax
02BE: mov        word ptr [0x13be], dx
02C2: mov        word ptr [0x4068], ax
02C5: mov        word ptr [0x406a], dx
02C9: sub        ax, 1
02CC: sbb        dx, 0
02CF: mov        word ptr [0x13b8], ax
02D2: mov        word ptr [0x13ba], dx
02D6: cmp        word ptr [0x13be], 0
02DB: jg         0x2fa
02DD: jl         0x2e6
02DF: cmp        word ptr [0x13bc], 1
02E4: ja         0x2fa
02E6: mov        word ptr [0x4068], 1
02EC: mov        word ptr [0x406a], 0
02F2: sub        ax, ax
02F4: mov        word ptr [0x13ba], ax
02F7: mov        word ptr [0x13b8], ax
02FA: push       word ptr [0x13ba]
02FE: push       word ptr [0x13b8]
0302: mov        ax, 0x1ac
0305: push       ax
0306: lcall      0x329, 0x30f2
030B: add        sp, 6
030E: mov        ax, 0x69
0311: push       ds
0312: push       ax
0313: mov        ax, 0x1b4
0316: push       ax
0317: lcall      0x329, 0x2230
031C: add        sp, 6
031F: mov        es, word ptr [0x10bc]
0323: mov        ax, word ptr es:[0x2a38]
0327: mov        dx, word ptr es:[0x2a3a]
032C: add        ax, 1
032F: adc        dx, 0
0332: mov        word ptr [0x13b4], ax
0335: mov        word ptr [0x13b6], dx
0339: mov        word ptr [0x4068], ax
033C: mov        word ptr [0x406a], dx
0340: sub        ax, 1
0343: sbb        dx, 0
0346: mov        word ptr [0x13b0], ax
0349: mov        word ptr [0x13b2], dx
034D: cmp        word ptr [0x13b6], 0
0352: jg         0x371
0354: jl         0x35d
0356: cmp        word ptr [0x13b4], 1
035B: ja         0x371
035D: mov        word ptr [0x4068], 1
0363: mov        word ptr [0x406a], 0
0369: sub        ax, ax
036B: mov        word ptr [0x13b2], ax
036E: mov        word ptr [0x13b0], ax
0371: push       word ptr [0x13b2]
0375: push       word ptr [0x13b0]
0379: mov        ax, 0x1ba
037C: push       ax
037D: lcall      0x329, 0x30f2
0382: add        sp, 6
0385: jmp        0x3ff
0387: mov        es, word ptr [0x10bc]
038B: mov        ax, word ptr es:[0x2a38]
038F: mov        dx, word ptr es:[0x2a3a]
0394: mov        word ptr [bp - 0x18], ax
0397: mov        word ptr [bp - 0x16], dx
039A: mov        word ptr [0x4068], 1
03A0: mov        word ptr [0x406a], 0
03A6: mov        ax, word ptr [0x4068]
03A9: mov        dx, word ptr [0x406a]
03AD: cmp        word ptr [bp - 0x16], dx
03B0: jl         0x3ff
03B2: jg         0x3b9
03B4: cmp        word ptr [bp - 0x18], ax
03B7: jb         0x3ff
03B9: mov        bx, word ptr [0x4068]
03BD: shl        bx, 1
03BF: shl        bx, 1
03C1: mov        es, word ptr [0x10bc]
03C5: lea        bx, [bx + 0x2a3c]
03C9: mov        ax, word ptr [0x4728]
03CC: mov        dx, word ptr [0x472a]
03D0: mov        word ptr es:[bx - 4], ax
03D4: mov        word ptr es:[bx - 2], dx
03D8: mov        bx, word ptr [0x4068]
03DC: shl        bx, 1
03DE: shl        bx, 1
03E0: lea        bx, [bx + 0x2b04]
03E4: mov        ax, word ptr [0x4694]
03E7: mov        dx, word ptr [0x4696]
03EB: mov        word ptr es:[bx - 4], ax
03EF: mov        word ptr es:[bx - 2], dx
03F3: add        word ptr [0x4068], 1
03F8: adc        word ptr [0x406a], 0
03FD: jno        0x3a6
03FF: mov        ax, 0x1c2
0402: push       ax
0403: lcall      0x329, 0x2230
0408: add        sp, 2
040B: mov        ax, 0x1d4
040E: push       ax
040F: lcall      0x329, 0x2230
0414: add        sp, 2
0417: mov        es, word ptr [0x10bc]
041B: mov        ax, word ptr es:[0x2a38]
041F: mov        dx, word ptr es:[0x2a3a]
0424: add        ax, 1
0427: adc        dx, 0
042A: mov        word ptr [0x13ac], ax
042D: mov        word ptr [0x13ae], dx
0431: mov        word ptr [0x4068], ax
0434: mov        word ptr [0x406a], dx
0438: sub        ax, 1
043B: sbb        dx, 0
043E: mov        word ptr [0x13a8], ax
0441: mov        word ptr [0x13aa], dx
0445: cmp        word ptr [0x13ae], 0
044A: jg         0x469
044C: jl         0x455
044E: cmp        word ptr [0x13ac], 1
0453: ja         0x469
0455: mov        word ptr [0x4068], 1
045B: mov        word ptr [0x406a], 0
0461: sub        ax, ax
0463: mov        word ptr [0x13aa], ax
0466: mov        word ptr [0x13a8], ax
0469: push       word ptr [0x13aa]
046D: push       word ptr [0x13a8]
0471: mov        ax, 0x1e2
0474: push       ax
0475: lcall      0x329, 0x2230
047A: add        sp, 6
047D: mov        es, word ptr [0x10bc]
0481: mov        ax, word ptr es:[0x2a38]
0485: mov        dx, word ptr es:[0x2a3a]
048A: add        ax, 1
048D: adc        dx, 0
0490: mov        word ptr [0x13a4], ax
0493: mov        word ptr [0x13a6], dx
0497: mov        word ptr [0x4068], ax
049A: mov        word ptr [0x406a], dx
049E: sub        ax, 1
04A1: sbb        dx, 0
04A4: mov        word ptr [0x13a0], ax
04A7: mov        word ptr [0x13a2], dx
04AB: cmp        word ptr [0x13a6], 0
04B0: jg         0x4cf
04B2: jl         0x4bb
04B4: cmp        word ptr [0x13a4], 1
04B9: ja         0x4cf
04BB: mov        word ptr [0x4068], 1
04C1: mov        word ptr [0x406a], 0
04C7: sub        ax, ax
04C9: mov        word ptr [0x13a2], ax
04CC: mov        word ptr [0x13a0], ax
04CF: push       word ptr [0x13a2]
04D3: push       word ptr [0x13a0]
04D7: mov        ax, 0x1f0
04DA: push       ax
04DB: lcall      0x329, 0x2230
04E0: add        sp, 6
04E3: mov        es, word ptr [0x10bc]
04E7: mov        ax, word ptr es:[0x2a38]
04EB: mov        dx, word ptr es:[0x2a3a]
04F0: add        ax, 1
04F3: adc        dx, 0
04F6: mov        word ptr [0x139c], ax
04F9: mov        word ptr [0x139e], dx
04FD: mov        word ptr [0x4068], ax
0500: mov        word ptr [0x406a], dx
0504: sub        ax, 1
0507: sbb        dx, 0
050A: mov        word ptr [0x1398], ax
050D: mov        word ptr [0x139a], dx
0511: cmp        word ptr [0x139e], 0
0516: jg         0x535
0518: jl         0x521
051A: cmp        word ptr [0x139c], 1
051F: ja         0x535
0521: mov        word ptr [0x4068], 1
0527: mov        word ptr [0x406a], 0
052D: sub        ax, ax
052F: mov        word ptr [0x139a], ax
0532: mov        word ptr [0x1398], ax
0535: push       word ptr [0x139a]
0539: push       word ptr [0x1398]
053D: mov        ax, 0x1fe
0540: push       ax
0541: lcall      0x329, 0x2230
0546: add        sp, 6
0549: mov        es, word ptr [0x10bc]
054D: mov        ax, word ptr es:[0x2a38]
0551: mov        dx, word ptr es:[0x2a3a]
0556: add        ax, 1
0559: adc        dx, 0
055C: mov        word ptr [0x1394], ax
055F: mov        word ptr [0x1396], dx
0563: mov        word ptr [0x4068], ax
0566: mov        word ptr [0x406a], dx
056A: sub        ax, 1
056D: sbb        dx, 0
0570: mov        word ptr [0x1390], ax
0573: mov        word ptr [0x1392], dx
0577: cmp        word ptr [0x1396], 0
057C: jg         0x59b
057E: jl         0x587
0580: cmp        word ptr [0x1394], 1
0585: ja         0x59b
0587: mov        word ptr [0x4068], 1
058D: mov        word ptr [0x406a], 0
0593: sub        ax, ax
0595: mov        word ptr [0x1392], ax
0598: mov        word ptr [0x1390], ax
059B: push       word ptr [0x1392]
059F: push       word ptr [0x1390]
05A3: mov        ax, 0x20c
05A6: push       ax
05A7: lcall      0x329, 0x2230
05AC: add        sp, 6
05AF: mov        es, word ptr [0x10bc]
05B3: mov        ax, word ptr es:[0x2a38]
05B7: mov        dx, word ptr es:[0x2a3a]
05BC: mov        word ptr [bp - 0x1c], ax
05BF: mov        word ptr [bp - 0x1a], dx
05C2: mov        word ptr [0x4068], 1
05C8: mov        word ptr [0x406a], 0
05CE: mov        ax, word ptr [0x4068]
05D1: mov        dx, word ptr [0x406a]
05D5: cmp        word ptr [bp - 0x1a], dx
05D8: jl         0x60e
05DA: jg         0x5e1
05DC: cmp        word ptr [bp - 0x1c], ax
05DF: jb         0x60e
05E1: mov        bx, word ptr [0x4068]
05E5: shl        bx, 1
05E7: shl        bx, 1
05E9: mov        es, word ptr [0x10bc]
05ED: lea        bx, [bx + 0x2a3c]
05F1: wait
05F2: fld        dword ptr [0x10c2]
05F6: wait
05F7: fmul       dword ptr es:[bx - 4]
05FB: wait
05FC: fstp       dword ptr es:[bx - 4]
0600: wait
0601: nop
0602: add        word ptr [0x4068], 1
0607: adc        word ptr [0x406a], 0
060C: jno        0x5ce
060E: lcall      0, 0x1983
0613: jmp        0x61a
0615: lcall      0, 0x1cfe
061A: cmp        word ptr [0x434c], 1
061F: je         0x624
0621: jmp        0x704
0624: cmp        word ptr [0x434e], 0
0629: je         0x62e
062B: jmp        0x704
062E: mov        ax, 0x21a
0631: push       ax
0632: lcall      0x329, 0x2230
0637: add        sp, 2
063A: mov        es, word ptr [0x10bc]
063E: mov        ax, word ptr es:[0x2a38]
0642: mov        dx, word ptr es:[0x2a3a]
0647: mov        word ptr [bp - 0x20], ax
064A: mov        word ptr [bp - 0x1e], dx
064D: mov        word ptr [0x4068], 1
0653: mov        word ptr [0x406a], 0
0659: jmp        0x6bb
065B: mov        ax, word ptr [0x406c]
065E: mov        dx, word ptr [0x406e]
0662: cmp        word ptr [bp - 0x22], dx
0665: jl         0x6a3
0667: jg         0x66e
0669: cmp        word ptr [bp - 0x24], ax
066C: jb         0x6a3
066E: mov        ax, 0xc8
0671: imul       word ptr [0x406c]
0675: mov        si, ax
0677: mov        bx, word ptr [0x4068]
067B: shl        bx, 1
067D: shl        bx, 1
067F: lea        ax, [bx + si + 0x320]
0683: mov        dx, 0xaaa
0686: sub        ax, 0xcc
0689: push       dx
068A: push       ax
068B: mov        ax, 0x22c
068E: push       ax
068F: lcall      0x329, 0x238e
0694: add        sp, 6
0697: add        word ptr [0x406c], 1
069C: adc        word ptr [0x406e], 0
06A1: jno        0x65b
06A3: mov        ax, 0x22e
06A6: push       ax
06A7: lcall      0x329, 0x238e
06AC: add        sp, 2
06AF: add        word ptr [0x4068], 1
06B4: adc        word ptr [0x406a], 0
06B9: jo         0x704
06BB: mov        ax, word ptr [0x4068]
06BE: mov        dx, word ptr [0x406a]
06C2: cmp        word ptr [bp - 0x1e], dx
06C5: jl         0x704
06C7: jg         0x6ce
06C9: cmp        word ptr [bp - 0x20], ax
06CC: jb         0x704
06CE: push       word ptr [0x406a]
06D2: push       word ptr [0x4068]
06D6: mov        ax, 0x222
06D9: push       ax
06DA: lcall      0x329, 0x2230
06DF: add        sp, 6
06E2: mov        es, word ptr [0x10bc]
06E6: mov        ax, word ptr es:[0x2a38]
06EA: mov        dx, word ptr es:[0x2a3a]
06EF: mov        word ptr [bp - 0x24], ax
06F2: mov        word ptr [bp - 0x22], dx
06F5: mov        word ptr [0x406c], 1
06FB: mov        word ptr [0x406e], 0
0701: jmp        0x65b
0704: mov        ax, 0x230
0707: push       ax
0708: lcall      0x329, 0x30f2
070D: add        sp, 2
0710: mov        ax, word ptr [0x4714]
0713: mov        dx, word ptr [0x4716]
0717: mov        word ptr [bp - 0x28], ax
071A: mov        word ptr [bp - 0x26], dx
071D: mov        word ptr [0x4068], 1
0723: mov        word ptr [0x406a], 0
0729: mov        ax, word ptr [0x4068]
072C: mov        dx, word ptr [0x406a]
0730: cmp        word ptr [bp - 0x26], dx
0733: jl         0x76a
0735: jg         0x73c
0737: cmp        word ptr [bp - 0x28], ax
073A: jb         0x76a
073C: mov        si, word ptr [0x4068]
0740: mov        cl, 2
0742: shl        si, cl
0744: mov        ax, si
0746: add        ax, 0x13bc
0749: push       ds
074A: push       ax
074B: mov        ax, si
074D: add        ax, 0x4028
0750: push       ds
0751: push       ax
0752: mov        ax, 0x242
0755: push       ax
0756: lcall      0x329, 0x31b2
075B: add        sp, 0xa
075E: add        word ptr [0x4068], 1
0763: adc        word ptr [0x406a], 0
0768: jno        0x729
076A: mov        ax, 0x246
076D: push       ax
076E: lcall      0x329, 0x31b2
0773: add        sp, 2
0776: mov        ax, word ptr [0x43c8]
0779: mov        dx, word ptr [0x43ca]
077D: mov        word ptr [bp - 0x2c], ax
0780: mov        word ptr [bp - 0x2a], dx
0783: mov        word ptr [0x4068], 1
0789: mov        word ptr [0x406a], 0
078F: mov        ax, word ptr [0x4068]
0792: mov        dx, word ptr [0x406a]
0796: cmp        word ptr [bp - 0x2a], dx
0799: jl         0x7de
079B: jg         0x7a2
079D: cmp        word ptr [bp - 0x2c], ax
07A0: jb         0x7de
07A2: mov        si, word ptr [0x4068]
07A6: mov        cl, 2
07A8: shl        si, cl
07AA: mov        ax, si
07AC: add        ax, 0x4694
07AF: push       ds
07B0: push       ax
07B1: mov        ax, si
07B3: add        ax, 0x42cc
07B6: push       ds
07B7: push       ax
07B8: mov        ax, si
07BA: add        ax, 0x41d8
07BD: push       ds
07BE: push       ax
07BF: mov        ax, si
07C1: add        ax, 0x434c
07C4: push       ds
07C5: push       ax
07C6: mov        ax, 0x252
07C9: push       ax
07CA: lcall      0x329, 0x31b2
07CF: add        sp, 0x12
07D2: add        word ptr [0x4068], 1
07D7: adc        word ptr [0x406a], 0
07DC: jno        0x78f
07DE: mov        ax, word ptr [0x4348]
07E1: mov        dx, word ptr [0x434a]
07E5: mov        word ptr [bp - 0x30], ax
07E8: mov        word ptr [bp - 0x2e], dx
07EB: mov        word ptr [0x4068], 1
07F1: mov        word ptr [0x406a], 0
07F7: mov        ax, word ptr [0x4068]
07FA: mov        dx, word ptr [0x406a]
07FE: cmp        word ptr [bp - 0x2e], dx
0801: jl         0x84d
0803: jg         0x80a
0805: cmp        word ptr [bp - 0x30], ax
0808: jb         0x84d
080A: mov        si, word ptr [0x4068]
080E: mov        cl, 2
0810: shl        si, cl
0812: mov        ax, si
0814: add        ax, 0x4404
0817: push       ds
0818: push       ax
0819: mov        ax, si
081B: add        ax, 0x40e8
081E: push       ds
081F: push       ax
0820: mov        ax, si
0822: add        ax, 0x406c
0825: push       ds
0826: push       ax
0827: mov        ax, si
0829: add        ax, 0x4254
082C: push       ds
082D: push       ax
082E: mov        ax, si
0830: add        ax, 0x4160
0833: push       ds
0834: push       ax
0835: mov        ax, 0x258
0838: push       ax
0839: lcall      0x329, 0x31b2
083E: add        sp, 0x16
0841: add        word ptr [0x4068], 1
0846: adc        word ptr [0x406a], 0
084B: jno        0x7f7
084D: mov        ax, 0x25e
0850: push       ax
0851: lcall      0x329, 0x31b2
0856: add        sp, 2
0859: mov        ax, 0x260
085C: push       ax
085D: lcall      0x329, 0x3772
0862: add        sp, 2
0865: push       word ptr [0x4716]
0869: push       word ptr [0x4714]
086D: mov        ax, 0x264
0870: push       ax
0871: lcall      0x329, 0x2230
0876: add        sp, 6
0879: mov        ax, word ptr [0x4714]
087C: mov        dx, word ptr [0x4716]
0880: add        ax, 1
0883: adc        dx, 0
0886: mov        word ptr [0x138c], ax
0889: mov        word ptr [0x138e], dx
088D: mov        word ptr [0x4068], ax
0890: mov        word ptr [0x406a], dx
0894: sub        ax, 1
0897: sbb        dx, 0
089A: mov        word ptr [0x1388], ax
089D: mov        word ptr [0x138a], dx
08A1: cmp        word ptr [0x138e], 0
08A6: jg         0x8c5
08A8: jl         0x8b1
08AA: cmp        word ptr [0x138c], 1
08AF: ja         0x8c5
08B1: mov        word ptr [0x4068], 1
08B7: mov        word ptr [0x406a], 0
08BD: sub        ax, ax
08BF: mov        word ptr [0x138a], ax
08C2: mov        word ptr [0x1388], ax
08C5: push       word ptr [0x138a]
08C9: push       word ptr [0x1388]
08CD: mov        ax, 0x26e
08D0: push       ax
08D1: lcall      0x329, 0x2230
08D6: add        sp, 6
08D9: mov        ax, word ptr [0x4714]
08DC: mov        dx, word ptr [0x4716]
08E0: add        ax, 1
08E3: adc        dx, 0
08E6: mov        word ptr [0x1384], ax
08E9: mov        word ptr [0x1386], dx
08ED: mov        word ptr [0x4068], ax
08F0: mov        word ptr [0x406a], dx
08F4: sub        ax, 1
08F7: sbb        dx, 0
08FA: mov        word ptr [0x1380], ax
08FD: mov        word ptr [0x1382], dx
0901: cmp        word ptr [0x1386], 0
0906: jg         0x925
0908: jl         0x911
090A: cmp        word ptr [0x1384], 1
090F: ja         0x925
0911: mov        word ptr [0x4068], 1
0917: mov        word ptr [0x406a], 0
091D: sub        ax, ax
091F: mov        word ptr [0x1382], ax
0922: mov        word ptr [0x1380], ax
0925: push       word ptr [0x1382]
0929: push       word ptr [0x1380]
092D: mov        ax, 0x27c
0930: push       ax
0931: lcall      0x329, 0x2230
0936: add        sp, 6
0939: mov        ax, 0x28a
093C: push       ax
093D: lcall      0x329, 0x2230
0942: add        sp, 2
0945: mov        ax, 0x292
0948: push       ax
0949: lcall      0x329, 0x2230
094E: add        sp, 2
0951: mov        ax, word ptr [0x43c8]
0954: mov        dx, word ptr [0x43ca]
0958: mov        word ptr [bp - 0x34], ax
095B: mov        word ptr [bp - 0x32], dx
095E: mov        word ptr [0x4068], 1
0964: mov        word ptr [0x406a], 0
096A: mov        ax, word ptr [0x4068]
096D: mov        dx, word ptr [0x406a]
0971: cmp        word ptr [bp - 0x32], dx
0974: jl         0x9bc
0976: jg         0x97d
0978: cmp        word ptr [bp - 0x34], ax
097B: jb         0x9bc
097D: mov        si, word ptr [0x4068]
0981: mov        cl, 2
0983: shl        si, cl
0985: mov        ax, si
0987: add        ax, 0x4694
098A: push       ds
098B: push       ax
098C: push       word ptr [si + 0x42ce]
0990: push       word ptr [si + 0x42cc]
0994: push       word ptr [si + 0x41da]
0998: push       word ptr [si + 0x41d8]
099C: push       word ptr [si + 0x434e]
09A0: push       word ptr [si + 0x434c]
09A4: mov        ax, 0x29a
09A7: push       ax
09A8: lcall      0x329, 0x238e
09AD: add        sp, 0x12
09B0: add        word ptr [0x4068], 1
09B5: adc        word ptr [0x406a], 0
09BA: jno        0x96a
09BC: mov        ax, 0x29f
09BF: push       ax
09C0: lcall      0x329, 0x238e
09C5: add        sp, 2
09C8: mov        ax, 0x2a0
09CB: push       ax
09CC: lcall      0x329, 0x2230
09D1: add        sp, 2
09D4: mov        ax, 0x2a8
09D7: push       ax
09D8: lcall      0x329, 0x2230
09DD: add        sp, 2
09E0: mov        ax, word ptr [0x4348]
09E3: mov        dx, word ptr [0x434a]
09E7: mov        word ptr [bp - 0x38], ax
09EA: mov        word ptr [bp - 0x36], dx
09ED: mov        word ptr [0x4068], 1
09F3: mov        word ptr [0x406a], 0
09F9: mov        ax, word ptr [0x4068]
09FC: mov        dx, word ptr [0x406a]
0A00: cmp        word ptr [bp - 0x36], dx
0A03: jl         0xa53
0A05: jg         0xa0c
0A07: cmp        word ptr [bp - 0x38], ax
0A0A: jb         0xa53
0A0C: mov        si, word ptr [0x4068]
0A10: mov        cl, 2
0A12: shl        si, cl
0A14: mov        ax, si
0A16: add        ax, 0x4404
0A19: push       ds
0A1A: push       ax
0A1B: push       word ptr [si + 0x40ea]
0A1F: push       word ptr [si + 0x40e8]
0A23: push       word ptr [si + 0x406e]
0A27: push       word ptr [si + 0x406c]
0A2B: push       word ptr [si + 0x4256]
0A2F: push       word ptr [si + 0x4254]
0A33: push       word ptr [si + 0x4162]
0A37: push       word ptr [si + 0x4160]
0A3B: mov        ax, 0x2b0
0A3E: push       ax
0A3F: lcall      0x329, 0x238e
0A44: add        sp, 0x16
0A47: add        word ptr [0x4068], 1
0A4C: adc        word ptr [0x406a], 0
0A51: jno        0x9f9
0A53: mov        ax, 0x2b6
0A56: push       ax
0A57: lcall      0x329, 0x238e
0A5C: add        sp, 2
0A5F: mov        es, word ptr [0x10bc]
0A63: mov        ax, word ptr es:[0x2a38]
0A67: mov        dx, word ptr es:[0x2a3a]
0A6C: sub        ax, 1
0A6F: sbb        dx, 0
0A72: mov        word ptr es:[0x2bd8], ax
0A76: mov        word ptr es:[0x2bda], dx
0A7B: sub        ax, word ptr [0x7354]
0A7F: sbb        dx, word ptr [0x7356]
0A83: mov        word ptr es:[0x2bd4], ax
0A87: mov        word ptr es:[0x2bd6], dx
0A8C: mov        ax, word ptr [0x7354]
0A8F: mov        dx, word ptr [0x7356]
0A93: cmp        word ptr es:[0x2bda], dx
0A98: jge        0xa9d
0A9A: jmp        0xbb8
0A9D: jg         0xaa9
0A9F: cmp        word ptr es:[0x2bd8], ax
0AA4: ja         0xaa9
0AA6: jmp        0xbb8
0AA9: mov        es, word ptr [0x10bc]
0AAD: push       word ptr es:[0x2bd6]
0AB2: push       word ptr es:[0x2bd4]
0AB7: push       word ptr es:[0x2bda]
0ABC: push       word ptr es:[0x2bd8]
0AC1: mov        ax, 0x2b8
0AC4: push       ax
0AC5: lcall      0x329, 0x2230
0ACA: add        sp, 0xa
0ACD: mov        ax, word ptr [0x7354]
0AD0: mov        dx, word ptr [0x7356]
0AD4: add        ax, 1
0AD7: adc        dx, 0
0ADA: mov        word ptr [0x13fc], ax
0ADD: mov        word ptr [0x13fe], dx
0AE1: mov        es, word ptr [0x10bc]
0AE5: mov        ax, word ptr es:[0x2bd8]
0AE9: mov        dx, word ptr es:[0x2bda]
0AEE: mov        word ptr [bp - 0x3c], ax
0AF1: mov        word ptr [bp - 0x3a], dx
0AF4: mov        ax, word ptr [0x13fc]
0AF7: mov        dx, word ptr [0x13fe]
0AFB: mov        word ptr [0x4068], ax
0AFE: mov        word ptr [0x406a], dx
0B02: jmp        0xb63
0B04: mov        ax, word ptr [0x406c]
0B07: mov        dx, word ptr [0x406e]
0B0B: cmp        word ptr [bp - 0x3e], dx
0B0E: jl         0xb4b
0B10: jg         0xb17
0B12: cmp        word ptr [bp - 0x40], ax
0B15: jb         0xb4b
0B17: mov        ax, word ptr [0x4068]
0B1A: shl        ax, 1
0B1C: shl        ax, 1
0B1E: cdq
0B1F: mov        cx, ax
0B21: mov        ax, 0xc8
0B24: mov        bx, dx
0B26: imul       word ptr [0x406c]
0B2A: add        ax, cx
0B2C: adc        dx, bx
0B2E: add        ax, 0x1334
0B31: push       ds
0B32: push       ax
0B33: mov        ax, 0x2cc
0B36: push       ax
0B37: lcall      0x329, 0x31b2
0B3C: add        sp, 6
0B3F: add        word ptr [0x406c], 1
0B44: adc        word ptr [0x406e], 0
0B49: jno        0xb04
0B4B: mov        ax, 0x2ce
0B4E: push       ax
0B4F: lcall      0x329, 0x31b2
0B54: add        sp, 2
0B57: add        word ptr [0x4068], 1
0B5C: adc        word ptr [0x406a], 0
0B61: jo         0xbb8
0B63: mov        ax, word ptr [0x4068]
0B66: mov        dx, word ptr [0x406a]
0B6A: cmp        word ptr [bp - 0x3a], dx
0B6D: jl         0xbb8
0B6F: jg         0xb76
0B71: cmp        word ptr [bp - 0x3c], ax
0B74: jb         0xbb8
0B76: push       word ptr [0x406a]
0B7A: push       word ptr [0x4068]
0B7E: mov        ax, 0x2c2
0B81: push       ax
0B82: lcall      0x329, 0x2230
0B87: add        sp, 6
0B8A: mov        ax, 0x2ca
0B8D: push       ax
0B8E: lcall      0x329, 0x30f2
0B93: add        sp, 2
0B96: mov        es, word ptr [0x10bc]
0B9A: mov        ax, word ptr es:[0x2bd8]
0B9E: mov        dx, word ptr es:[0x2bda]
0BA3: mov        word ptr [bp - 0x40], ax
0BA6: mov        word ptr [bp - 0x3e], dx
0BA9: mov        word ptr [0x406c], 1
0BAF: mov        word ptr [0x406e], 0
0BB5: jmp        0xb04
0BB8: mov        ax, word ptr [0x7354]
0BBB: mov        dx, word ptr [0x7356]
0BBF: mov        word ptr [bp - 0x44], ax
0BC2: mov        word ptr [bp - 0x42], dx
0BC5: mov        word ptr [0x7420], 1
0BCB: mov        word ptr [0x7422], 0
0BD1: jmp        0xc79
0BD4: add        word ptr [0x406c], 1
0BD9: adc        word ptr [0x406e], 0
0BDE: jno        0xbe3
0BE0: jmp        0xc6d
0BE3: mov        ax, word ptr [0x406c]
0BE6: mov        dx, word ptr [0x406e]
0BEA: cmp        word ptr [bp - 0x46], dx
0BED: jl         0xc6d
0BEF: jg         0xbf6
0BF1: cmp        word ptr [bp - 0x48], ax
0BF4: jb         0xc6d
0BF6: mov        ax, 0xc8
0BF9: imul       word ptr [0x406c]
0BFD: mov        si, ax
0BFF: mov        di, word ptr [0x40e8]
0C03: mov        cl, 2
0C05: shl        di, cl
0C07: mov        es, word ptr [0x10bc]
0C0B: mov        ax, 0xc8
0C0E: imul       word ptr es:[0x2a38]
0C13: mov        word ptr [bp - 0x4a], ax
0C16: mov        ax, word ptr [0x4068]
0C19: shl        ax, 1
0C1B: shl        ax, 1
0C1D: mov        bx, ax
0C1F: lea        bx, [bx + si + 0x320]
0C23: wait
0C24: fld        dword ptr es:[bx - 0xcc]
0C29: mov        bx, word ptr [bp - 0x4a]
0C2C: add        bx, ax
0C2E: lea        bx, [bx + 0x320]
0C32: wait
0C33: fsub       dword ptr es:[bx - 0xcc]
0C38: mov        bx, word ptr [bp - 0x4a]
0C3B: lea        bx, [bx + di + 0x320]
0C3F: wait
0C40: fadd       dword ptr es:[bx - 0xcc]
0C45: mov        bx, di
0C47: add        bx, si
0C49: lea        bx, [bx + 0x320]
0C4D: wait
0C4E: fsub       dword ptr es:[bx - 0xcc]
0C53: wait
0C54: fmul       dword ptr [0x10c6]
0C58: wait
0C59: fchs
0C5B: mov        bx, word ptr [0x7420]
0C5F: shl        bx, 1
0C61: shl        bx, 1
0C63: wait
0C64: fstp       dword ptr [bx + si + 0x1334]
0C68: wait
0C69: nop
0C6A: jmp        0xbd4
0C6D: add        word ptr [0x7420], 1
0C72: adc        word ptr [0x7422], 0
0C77: jo         0xcdc
0C79: mov        ax, word ptr [0x7420]
0C7C: mov        dx, word ptr [0x7422]
0C80: cmp        word ptr [bp - 0x42], dx
0C83: jl         0xcdc
0C85: jg         0xc8c
0C87: cmp        word ptr [bp - 0x44], ax
0C8A: jb         0xcdc
0C8C: mov        bx, word ptr [0x7420]
0C90: shl        bx, 1
0C92: shl        bx, 1
0C94: mov        ax, word ptr [bx + 0x7420]
0C98: mov        dx, word ptr [bx + 0x7422]
0C9C: mov        word ptr [0x4068], ax
0C9F: mov        word ptr [0x406a], dx
0CA3: mov        bx, word ptr [0x7420]
0CA7: shl        bx, 1
0CA9: shl        bx, 1
0CAB: mov        ax, word ptr [bx + 0x7354]
0CAF: mov        dx, word ptr [bx + 0x7356]
0CB3: mov        word ptr [0x40e8], ax
0CB6: mov        word ptr [0x40ea], dx
0CBA: mov        es, word ptr [0x10bc]
0CBE: mov        ax, word ptr es:[0x2bd8]
0CC2: mov        dx, word ptr es:[0x2bda]
0CC7: mov        word ptr [bp - 0x48], ax
0CCA: mov        word ptr [bp - 0x46], dx
0CCD: mov        word ptr [0x406c], 1
0CD3: mov        word ptr [0x406e], 0
0CD9: jmp        0xbe3
0CDC: mov        ax, word ptr [0x4718]
0CDF: or         ax, word ptr [0x471a]
0CE3: jne        0xce8
0CE5: jmp        0x11d6
0CE8: mov        ax, 0x2d0
0CEB: push       ax
0CEC: lcall      0x329, 0x2230
0CF1: add        sp, 2
0CF4: mov        es, word ptr [0x10bc]
0CF8: mov        ax, word ptr es:[0x2bd8]
0CFC: mov        dx, word ptr es:[0x2bda]
0D01: mov        word ptr [bp - 0x50], ax
0D04: mov        word ptr [bp - 0x4e], dx
0D07: mov        word ptr [0x4068], 1
0D0D: mov        word ptr [0x406a], 0
0D13: jmp        0xd8d
0D15: mov        ax, word ptr [0x406c]
0D18: mov        dx, word ptr [0x406e]
0D1C: cmp        word ptr [bp - 0x52], dx
0D1F: jl         0xd5c
0D21: jg         0xd28
0D23: cmp        word ptr [bp - 0x54], ax
0D26: jb         0xd5c
0D28: mov        ax, word ptr [0x4068]
0D2B: shl        ax, 1
0D2D: shl        ax, 1
0D2F: cdq
0D30: mov        cx, ax
0D32: mov        ax, 0xc8
0D35: mov        bx, dx
0D37: imul       word ptr [0x406c]
0D3B: add        ax, cx
0D3D: adc        dx, bx
0D3F: add        ax, 0x1334
0D42: push       ds
0D43: push       ax
0D44: mov        ax, 0x2e0
0D47: push       ax
0D48: lcall      0x329, 0x238e
0D4D: add        sp, 6
0D50: add        word ptr [0x406c], 1
0D55: adc        word ptr [0x406e], 0
0D5A: jno        0xd15
0D5C: mov        si, word ptr [0x4068]
0D60: mov        cl, 2
0D62: shl        si, cl
0D64: mov        ax, si
0D66: add        ax, 0x3bd4
0D69: push       ds
0D6A: push       ax
0D6B: mov        ax, si
0D6D: add        ax, 0x3b0c
0D70: push       ds
0D71: push       ax
0D72: mov        ax, 0x2e2
0D75: push       ax
0D76: lcall      0x329, 0x238e
0D7B: add        sp, 0xa
0D7E: add        word ptr [0x4068], 1
0D83: adc        word ptr [0x406a], 0
0D88: jno        0xd8d
0D8A: jmp        0x11d6
0D8D: mov        ax, word ptr [0x4068]
0D90: mov        dx, word ptr [0x406a]
0D94: cmp        word ptr [bp - 0x4e], dx
0D97: jge        0xd9c
0D99: jmp        0x11d6
0D9C: jg         0xda6
0D9E: cmp        word ptr [bp - 0x50], ax
0DA1: jae        0xda6
0DA3: jmp        0x11d6
0DA6: mov        ax, 0x2d8
0DA9: push       ax
0DAA: lcall      0x329, 0x2230
0DAF: add        sp, 2
0DB2: mov        es, word ptr [0x10bc]
0DB6: mov        ax, word ptr es:[0x2bd8]
0DBA: mov        dx, word ptr es:[0x2bda]
0DBF: mov        word ptr [bp - 0x54], ax
0DC2: mov        word ptr [bp - 0x52], dx
0DC5: mov        word ptr [0x406c], 1
0DCB: mov        word ptr [0x406e], 0
0DD1: jmp        0xd15
0DD4: add        word ptr [0x406c], 1
0DD9: adc        word ptr [0x406e], 0
0DDE: jo         0xe10
0DE0: mov        ax, word ptr [0x406c]
0DE3: mov        dx, word ptr [0x406e]
0DE7: cmp        word ptr [bp - 0x76], dx
0DEA: jl         0xe10
0DEC: jg         0xdf3
0DEE: cmp        word ptr [bp - 0x78], ax
0DF1: jb         0xe10
0DF3: mov        ax, 0x3c
0DF6: imul       word ptr [0x406c]
0DFA: mov        si, ax
0DFC: mov        bx, word ptr [0x4068]
0E00: shl        bx, 1
0E02: shl        bx, 1
0E04: wait
0E05: fldz
0E07: wait
0E08: fstp       dword ptr [bx + si + 0x3c68]
0E0C: wait
0E0D: nop
0E0E: jmp        0xdd4
0E10: add        word ptr [0x4068], 1
0E15: adc        word ptr [0x406a], 0
0E1A: jo         0xe5c
0E1C: mov        ax, word ptr [0x4068]
0E1F: mov        dx, word ptr [0x406a]
0E23: cmp        word ptr [bp - 0x72], dx
0E26: jl         0xe5c
0E28: jg         0xe2f
0E2A: cmp        word ptr [bp - 0x74], ax
0E2D: jb         0xe5c
0E2F: mov        bx, word ptr [0x4068]
0E33: shl        bx, 1
0E35: shl        bx, 1
0E37: wait
0E38: fldz
0E3A: wait
0E3B: fstp       dword ptr [bx + 0x43c8]
0E3F: wait
0E40: nop
0E41: mov        ax, word ptr [0x4714]
0E44: mov        dx, word ptr [0x4716]
0E48: mov        word ptr [bp - 0x78], ax
0E4B: mov        word ptr [bp - 0x76], dx
0E4E: mov        word ptr [0x406c], 1
0E54: mov        word ptr [0x406e], 0
0E5A: jmp        0xde0
0E5C: mov        ax, word ptr [0x4348]
0E5F: mov        dx, word ptr [0x434a]
0E63: mov        word ptr [bp - 0x7c], ax
0E66: mov        word ptr [bp - 0x7a], dx
0E69: mov        word ptr [0x4068], 1
0E6F: mov        word ptr [0x406a], 0
0E75: mov        ax, word ptr [0x4068]
0E78: mov        dx, word ptr [0x406a]
0E7C: cmp        word ptr [bp - 0x7a], dx
0E7F: jge        0xe84
0E81: jmp        0xf97
0E84: jg         0xe8e
0E86: cmp        word ptr [bp - 0x7c], ax
0E89: jae        0xe8e
0E8B: jmp        0xf97
0E8E: mov        bx, word ptr [0x4068]
0E92: shl        bx, 1
0E94: shl        bx, 1
0E96: mov        ax, word ptr [bx + 0x4160]
0E9A: mov        dx, word ptr [bx + 0x4162]
0E9E: mov        word ptr [0x40e8], ax
0EA1: mov        word ptr [0x40ea], dx
0EA5: mov        es, word ptr [0x10bc]
0EA9: mov        bx, word ptr [0x4068]
0EAD: shl        bx, 1
0EAF: shl        bx, 1
0EB1: wait
0EB2: fild       dword ptr [bx + 0x4254]
0EB6: wait
0EB7: fstp       dword ptr es:[0x2bcc]
0EBC: wait
0EBD: nop
0EBE: mov        bx, word ptr [0x4068]
0EC2: shl        bx, 1
0EC4: shl        bx, 1
0EC6: mov        ax, word ptr [bx + 0x406c]
0ECA: mov        dx, word ptr [bx + 0x406e]
0ECE: mov        word ptr [0x7350], ax
0ED1: mov        word ptr [0x7352], dx
0ED5: mov        bx, word ptr [0x4068]
0ED9: shl        bx, 1
0EDB: shl        bx, 1
0EDD: mov        ax, word ptr [bx + 0x40e8]
0EE1: mov        dx, word ptr [bx + 0x40ea]
0EE5: mov        word ptr [0x406c], ax
0EE8: mov        word ptr [0x406e], dx
0EEC: mov        ax, 0xc8
0EEF: imul       word ptr [0x406c]
0EF3: mov        si, ax
0EF5: mov        bx, word ptr [0x7350]
0EF9: shl        bx, 1
0EFB: shl        bx, 1
0EFD: wait
0EFE: fld        dword ptr [bx + si + 0x3a44]
0F02: wait
0F03: fld        dword ptr es:[0x2bcc]
0F08: lcall      0x329, 0x1275
0F0D: mov        bx, ax
0F0F: shl        bx, 1
0F11: shl        bx, 1
0F13: wait
0F14: fmul       dword ptr [bx + 0x4028]
0F18: mov        bx, word ptr [0x4068]
0F1C: shl        bx, 1
0F1E: shl        bx, 1
0F20: wait
0F21: fmul       dword ptr [bx + 0x4404]
0F25: mov        bx, word ptr [0x40e8]
0F29: shl        bx, 1
0F2B: shl        bx, 1
0F2D: wait
0F2E: fadd       dword ptr [bx + 0x43c8]
0F32: wait
0F33: fstp       dword ptr [bx + 0x43c8]
0F37: wait
0F38: nop
0F39: mov        es, word ptr [0x10bc]
0F3D: wait
0F3E: fld        dword ptr es:[0x2bcc]
0F43: lcall      0x329, 0x1275
0F48: mov        cx, 0x3c
0F4B: imul       cx
0F4D: mov        si, ax
0F4F: mov        bx, word ptr [0x40e8]
0F53: shl        bx, 1
0F55: shl        bx, 1
0F57: mov        ax, 0xc8
0F5A: imul       word ptr [0x406c]
0F5E: mov        di, ax
0F60: lea        ax, [bx + si + 0x3c68]
0F64: mov        bx, word ptr [0x7350]
0F68: shl        bx, 1
0F6A: shl        bx, 1
0F6C: wait
0F6D: fld        dword ptr [bx + di + 0x3a44]
0F71: mov        bx, word ptr [0x4068]
0F75: shl        bx, 1
0F77: shl        bx, 1
0F79: wait
0F7A: fmul       dword ptr [bx + 0x4404]
0F7E: mov        bx, ax
0F80: wait
0F81: fadd       dword ptr [bx]
0F83: wait
0F84: fstp       dword ptr [bx]
0F86: wait
0F87: nop
0F88: add        word ptr [0x4068], 1
0F8D: adc        word ptr [0x406a], 0
0F92: jo         0xf97
0F94: jmp        0xe75
0F97: wait
0F98: fldz
0F9A: wait
0F9B: fstp       dword ptr [0x3ca0]
0F9F: wait
0FA0: nop
0FA1: mov        ax, word ptr [0x4714]
0FA4: mov        dx, word ptr [0x4716]
0FA8: mov        word ptr [bp - 0x80], ax
0FAB: mov        word ptr [bp - 0x7e], dx
0FAE: mov        word ptr [0x4068], 1
0FB4: mov        word ptr [0x406a], 0
0FBA: mov        ax, word ptr [0x4068]
0FBD: mov        dx, word ptr [0x406a]
0FC1: cmp        word ptr [bp - 0x7e], dx
0FC4: jl         0x102a
0FC6: jg         0xfcd
0FC8: cmp        word ptr [bp - 0x80], ax
0FCB: jb         0x102a
0FCD: mov        si, word ptr [0x4068]
0FD1: mov        cl, 2
0FD3: shl        si, cl
0FD5: wait
0FD6: fld        dword ptr [si + 0x13bc]
0FDA: wait
0FDB: fsub       dword ptr [si + 0x43c8]
0FDF: wait
0FE0: fstp       dword ptr [si + 0x44c4]
0FE4: wait
0FE5: nop
0FE6: mov        si, word ptr [0x4068]
0FEA: shl        si, cl
0FEC: wait
0FED: fld        dword ptr [si + 0x44c4]
0FF1: wait
0FF2: fmul       dword ptr [0x4710]
0FF6: wait
0FF7: fstp       dword ptr [si + 0x4488]
0FFB: wait
0FFC: nop
0FFD: mov        bx, word ptr [0x4068]
1001: shl        bx, 1
1003: shl        bx, 1
1005: wait
1006: fld        dword ptr [bx + 0x44c4]
100A: wait
100B: fabs
100D: wait
100E: fld        dword ptr [0x3ca0]
1012: lcall      0x329, 0x1442
1017: wait
1018: fstp       dword ptr [0x3ca0]
101C: wait
101D: nop
101E: add        word ptr [0x4068], 1
1023: adc        word ptr [0x406a], 0
1028: jno        0xfba
102A: mov        ax, word ptr [0x4714]
102D: mov        dx, word ptr [0x4716]
1031: add        ax, 1
1034: adc        dx, 0
1037: mov        word ptr [0x137c], ax
103A: mov        word ptr [0x137e], dx
103E: mov        word ptr [0x4068], ax
1041: mov        word ptr [0x406a], dx
1045: sub        ax, 1
1048: sbb        dx, 0
104B: mov        word ptr [0x1378], ax
104E: mov        word ptr [0x137a], dx
1052: cmp        word ptr [0x137e], 0
1057: jg         0x1076
1059: jl         0x1062
105B: cmp        word ptr [0x137c], 1
1060: ja         0x1076
1062: mov        word ptr [0x4068], 1
1068: mov        word ptr [0x406a], 0
106E: sub        ax, ax
1070: mov        word ptr [0x137a], ax
1073: mov        word ptr [0x1378], ax
1076: push       word ptr [0x137a]
107A: push       word ptr [0x1378]
107E: mov        ax, 0x66
1081: push       ds
1082: push       ax
1083: mov        ax, 0x2e6
1086: push       ax
1087: lcall      0x329, 0x2230
108C: add        sp, 0xa
108F: wait
1090: fld        dword ptr [0x3ca0]
1094: wait
1095: fcom       dword ptr [0x4720]
1099: wait
109A: fstp       st(0)
109C: wait
109D: fnstsw     word ptr [bp - 0x14]
10A0: wait
10A1: nop
10A2: mov        ah, byte ptr [bp - 0x13]
10A5: sahf
10A6: ja         0x10ab
10A8: jmp        0x14e4
10AB: mov        word ptr [bp - 0x64], 0xf
10B0: mov        word ptr [bp - 0x62], 0
10B5: mov        word ptr [bp - 0x68], 0xf
10BA: mov        word ptr [bp - 0x66], 0
10BF: mov        word ptr [bp - 0x6c], 2
10C4: mov        word ptr [bp - 0x6a], 0
10C9: lea        ax, [bp - 0x6c]
10CC: push       ss
10CD: push       ax
10CE: mov        ax, 0x4714
10D1: push       ds
10D2: push       ax
10D3: push       ds
10D4: push       ax
10D5: lea        ax, [bp - 0x68]
10D8: push       ss
10D9: push       ax
10DA: lea        ax, [bp - 0x64]
10DD: push       ss
10DE: push       ax
10DF: mov        ax, 0x6e3c
10E2: push       ds
10E3: push       ax
10E4: mov        ax, 0x3ca8
10E7: push       ds
10E8: push       ax
10E9: lcall      0x243, 0xb5e
10EE: mov        word ptr [bp - 0x6c], 1
10F3: mov        word ptr [bp - 0x6a], 0
10F8: mov        ax, 0x448c
10FB: push       ds
10FC: push       ax
10FD: mov        ax, 0x6e3c
1100: push       ds
1101: push       ax
1102: mov        ax, 0x4714
1105: push       ds
1106: push       ax
1107: lea        ax, [bp - 0x6c]
110A: push       ss
110B: push       ax
110C: lea        ax, [0x10ca]
1110: push       ds
1111: push       ax
1112: mov        ax, 0x471c
1115: push       ds
1116: push       ax
1117: lcall      0x243, 0xc
111C: mov        ax, word ptr [0x4714]
111F: mov        dx, word ptr [0x4716]
1123: mov        word ptr [bp - 0x84], ax
1127: mov        word ptr [bp - 0x82], dx
112B: mov        word ptr [0x4068], 1
1131: mov        word ptr [0x406a], 0
1137: mov        ax, word ptr [0x4068]
113A: mov        dx, word ptr [0x406a]
113E: cmp        word ptr [bp - 0x82], dx
1142: jl         0x1171
1144: jg         0x114c
1146: cmp        word ptr [bp - 0x84], ax
114A: jb         0x1171
114C: mov        si, word ptr [0x4068]
1150: mov        cl, 2
1152: shl        si, cl
1154: wait
1155: fld        dword ptr [si + 0x4488]
1159: wait
115A: fadd       dword ptr [si + 0x4028]
115E: wait
115F: fstp       dword ptr [si + 0x4028]
1163: wait
1164: nop
1165: add        word ptr [0x4068], 1
116A: adc        word ptr [0x406a], 0
116F: jno        0x1137
1171: mov        ax, word ptr [0x4714]
1174: mov        dx, word ptr [0x4716]
1178: add        ax, 1
117B: adc        dx, 0
117E: mov        word ptr [0x1374], ax
1181: mov        word ptr [0x1376], dx
1185: mov        word ptr [0x4068], ax
1188: mov        word ptr [0x406a], dx
118C: sub        ax, 1
118F: sbb        dx, 0
1192: mov        word ptr [0x1370], ax
1195: mov        word ptr [0x1372], dx
1199: cmp        word ptr [0x1376], 0
119E: jg         0x11bd
11A0: jl         0x11a9
11A2: cmp        word ptr [0x1374], 1
11A7: ja         0x11bd
11A9: mov        word ptr [0x4068], 1
11AF: mov        word ptr [0x406a], 0
11B5: sub        ax, ax
11B7: mov        word ptr [0x1372], ax
11BA: mov        word ptr [0x1370], ax
11BD: push       word ptr [0x1372]
11C1: push       word ptr [0x1370]
11C5: mov        ax, 0x61
11C8: push       ds
11C9: push       ax
11CA: mov        ax, 0x2f2
11CD: push       ax
11CE: lcall      0x329, 0x2230
11D3: add        sp, 0xa
11D6: mov        es, word ptr [0x10bc]
11DA: mov        ax, word ptr es:[0x2bd8]
11DE: mov        dx, word ptr es:[0x2bda]
11E3: mov        word ptr [bp - 0x58], ax
11E6: mov        word ptr [bp - 0x56], dx
11E9: mov        word ptr [0x4068], 1
11EF: mov        word ptr [0x406a], 0
11F5: mov        ax, word ptr [0x4068]
11F8: mov        dx, word ptr [0x406a]
11FC: cmp        word ptr [bp - 0x56], dx
11FF: jl         0x1238
1201: jg         0x1208
1203: cmp        word ptr [bp - 0x58], ax
1206: jb         0x1238
1208: mov        bx, word ptr [0x4068]
120C: shl        bx, 1
120E: shl        bx, 1
1210: wait
1211: fldz
1213: wait
1214: fstp       dword ptr [bx + 0x4500]
1218: wait
1219: nop
121A: mov        bx, word ptr [0x4068]
121E: shl        bx, 1
1220: shl        bx, 1
1222: wait
1223: fldz
1225: wait
1226: fstp       dword ptr [bx + 0x45c8]
122A: wait
122B: nop
122C: add        word ptr [0x4068], 1
1231: adc        word ptr [0x406a], 0
1236: jno        0x11f5
1238: mov        ax, word ptr [0x43c8]
123B: mov        dx, word ptr [0x43ca]
123F: mov        word ptr [bp - 0x5c], ax
1242: mov        word ptr [bp - 0x5a], dx
1245: mov        word ptr [0x4068], 1
124B: mov        word ptr [0x406a], 0
1251: mov        ax, word ptr [0x4068]
1254: mov        dx, word ptr [0x406a]
1258: cmp        word ptr [bp - 0x5a], dx
125B: jge        0x1260
125D: jmp        0x12f8
1260: jg         0x126a
1262: cmp        word ptr [bp - 0x5c], ax
1265: jae        0x126a
1267: jmp        0x12f8
126A: mov        bx, word ptr [0x4068]
126E: shl        bx, 1
1270: shl        bx, 1
1272: mov        ax, word ptr [bx + 0x434c]
1276: mov        dx, word ptr [bx + 0x434e]
127A: mov        word ptr [0x4254], ax
127D: mov        word ptr [0x4256], dx
1281: mov        bx, word ptr [0x4068]
1285: shl        bx, 1
1287: shl        bx, 1
1289: mov        ax, word ptr [bx + 0x41d8]
128D: mov        dx, word ptr [bx + 0x41da]
1291: mov        word ptr [0x406c], ax
1294: mov        word ptr [0x406e], dx
1298: mov        es, word ptr [0x10bc]
129C: mov        bx, word ptr [0x4068]
12A0: shl        bx, 1
12A2: shl        bx, 1
12A4: wait
12A5: fild       dword ptr [bx + 0x42cc]
12A9: wait
12AA: fst        dword ptr es:[0x2bcc]
12AF: lcall      0x329, 0x1275
12B4: mov        bx, ax
12B6: shl        bx, 1
12B8: shl        bx, 1
12BA: wait
12BB: fld        dword ptr [bx + 0x4028]
12BF: mov        bx, word ptr [0x4068]
12C3: shl        bx, 1
12C5: shl        bx, 1
12C7: wait
12C8: fmul       dword ptr [bx + 0x4694]
12CC: mov        ax, 0xc8
12CF: imul       word ptr [0x406c]
12D3: mov        si, ax
12D5: mov        bx, word ptr [0x4254]
12D9: shl        bx, 1
12DB: shl        bx, 1
12DD: wait
12DE: fadd       dword ptr [bx + si + 0x4438]
12E2: wait
12E3: fstp       dword ptr [bx + si + 0x4438]
12E7: wait
12E8: nop
12E9: add        word ptr [0x4068], 1
12EE: adc        word ptr [0x406a], 0
12F3: jo         0x12f8
12F5: jmp        0x1251
12F8: mov        word ptr [bp - 0x68], 0x32
12FD: mov        word ptr [bp - 0x66], 0
1302: mov        word ptr [bp - 0x64], 0x32
1307: mov        word ptr [bp - 0x62], 0
130C: mov        word ptr [bp - 0x60], 2
1311: mov        word ptr [bp - 0x5e], 0
1316: lea        ax, [bp - 0x60]
1319: push       ss
131A: push       ax
131B: mov        ax, 0x2bd8
131E: mov        dx, 0xaaa
1321: push       dx
1322: push       ax
1323: push       dx
1324: push       ax
1325: lea        ax, [bp - 0x64]
1328: push       ss
1329: push       ax
132A: lea        ax, [bp - 0x68]
132D: push       ss
132E: push       ax
132F: mov        ax, 0x472c
1332: push       ds
1333: push       ax
1334: mov        ax, 0x1400
1337: push       ds
1338: push       ax
1339: lcall      0x243, 0xb5e
133E: mov        word ptr [bp - 0x6c], 2
1343: mov        word ptr [bp - 0x6a], 0
1348: mov        word ptr [bp - 0x60], 0x32
134D: mov        word ptr [bp - 0x5e], 0
1352: mov        word ptr [bp - 0x64], 2
1357: mov        word ptr [bp - 0x62], 0
135C: mov        word ptr [bp - 0x68], 2
1361: mov        word ptr [bp - 0x66], 0
1366: lea        ax, [bp - 0x68]
1369: push       ss
136A: push       ax
136B: mov        ax, 0x2bd8
136E: mov        dx, 0xaaa
1371: push       dx
1372: push       ax
1373: lea        ax, [bp - 0x64]
1376: push       ss
1377: push       ax
1378: lea        ax, [bp - 0x60]
137B: push       ss
137C: push       ax
137D: lea        ax, [bp - 0x6c]
1380: push       ss
1381: push       ax
1382: mov        ax, 0x71c0
1385: push       ds
1386: push       ax
1387: mov        ax, 0x4504
138A: push       ds
138B: push       ax
138C: lcall      0x243, 0xb5e
1391: mov        word ptr [bp - 0x6c], 2
1396: mov        word ptr [bp - 0x6a], 0
139B: mov        ax, 0x71c0
139E: push       ds
139F: push       ax
13A0: mov        ax, 0x472c
13A3: push       ds
13A4: push       ax
13A5: mov        ax, 0x2bd8
13A8: mov        dx, 0xaaa
13AB: push       dx
13AC: push       ax
13AD: lea        ax, [bp - 0x6c]
13B0: push       ss
13B1: push       ax
13B2: lea        ax, [0x10ca]
13B6: push       ds
13B7: push       ax
13B8: mov        ax, 0x471c
13BB: push       ds
13BC: push       ax
13BD: lcall      0x243, 0xc
13C2: mov        word ptr [bp - 0x60], 2
13C7: mov        word ptr [bp - 0x5e], 0
13CC: mov        word ptr [bp - 0x64], 0x32
13D1: mov        word ptr [bp - 0x62], 0
13D6: mov        word ptr [bp - 0x68], 2
13DB: mov        word ptr [bp - 0x66], 0
13E0: mov        word ptr [bp - 0x6c], 1
13E5: mov        word ptr [bp - 0x6a], 0
13EA: lea        ax, [bp - 0x6c]
13ED: push       ss
13EE: push       ax
13EF: mov        ax, 0x2bd8
13F2: mov        dx, 0xaaa
13F5: push       dx
13F6: push       ax
13F7: lea        ax, [bp - 0x68]
13FA: push       ss
13FB: push       ax
13FC: lea        ax, [bp - 0x64]
13FF: push       ss
1400: push       ax
1401: lea        ax, [bp - 0x60]
1404: push       ss
1405: push       ax
1406: mov        ax, 0x71c0
1409: push       ds
140A: push       ax
140B: mov        ax, 0x3b10
140E: push       ds
140F: push       ax
1410: lcall      0x243, 0xb5e
1415: wait
1416: fldz
1418: wait
1419: fst        dword ptr [0x4484]
141D: wait
141E: fstp       dword ptr [0x3ca4]
1422: wait
1423: nop
1424: mov        es, word ptr [0x10bc]
1428: mov        ax, word ptr es:[0x2bd8]
142C: mov        dx, word ptr es:[0x2bda]
1431: mov        word ptr [bp - 0x70], ax
1434: mov        word ptr [bp - 0x6e], dx
1437: mov        word ptr [0x4068], 1
143D: mov        word ptr [0x406a], 0
1443: mov        ax, word ptr [0x4068]
1446: mov        dx, word ptr [0x406a]
144A: cmp        word ptr [bp - 0x6e], dx
144D: jl         0x1494
144F: jg         0x1456
1451: cmp        word ptr [bp - 0x70], ax
1454: jb         0x1494
1456: mov        bx, word ptr [0x4068]
145A: shl        bx, 1
145C: shl        bx, 1
145E: wait
145F: fld        dword ptr [bx + 0x3bd4]
1463: wait
1464: fadd       dword ptr [0x3ca4]
1468: wait
1469: fstp       dword ptr [0x3ca4]
146D: wait
146E: nop
146F: mov        bx, word ptr [0x4068]
1473: shl        bx, 1
1475: shl        bx, 1
1477: wait
1478: fld        dword ptr [bx + 0x3b0c]
147C: wait
147D: fadd       dword ptr [0x4484]
1481: wait
1482: fstp       dword ptr [0x4484]
1486: wait
1487: nop
1488: add        word ptr [0x4068], 1
148D: adc        word ptr [0x406a], 0
1492: jno        0x1443
1494: mov        es, word ptr [0x10bc]
1498: mov        bx, word ptr es:[0x2a38]
149D: shl        bx, 1
149F: shl        bx, 1
14A1: wait
14A2: fld        dword ptr [0x4484]
14A6: wait
14A7: fchs
14A9: wait
14AA: fstp       dword ptr [bx + 0x3b0c]
14AE: wait
14AF: nop
14B0: mov        bx, word ptr es:[0x2a38]
14B5: shl        bx, 1
14B7: shl        bx, 1
14B9: wait
14BA: fld        dword ptr [0x3ca4]
14BE: wait
14BF: fchs
14C1: wait
14C2: fstp       dword ptr [bx + 0x3bd4]
14C6: wait
14C7: nop
14C8: mov        ax, word ptr [0x4714]
14CB: mov        dx, word ptr [0x4716]
14CF: mov        word ptr [bp - 0x74], ax
14D2: mov        word ptr [bp - 0x72], dx
14D5: mov        word ptr [0x4068], 1
14DB: mov        word ptr [0x406a], 0
14E1: jmp        0xe1c
14E4: mov        ax, 0x55
14E7: push       ds
14E8: push       ax
14E9: mov        ax, 0x2fe
14EC: push       ax
14ED: lcall      0x329, 0x2230
14F2: add        sp, 6
14F5: mov        ax, word ptr [0x4714]
14F8: mov        dx, word ptr [0x4716]
14FC: add        ax, 1
14FF: adc        dx, 0
1502: mov        word ptr [0x136c], ax
1505: mov        word ptr [0x136e], dx
1509: mov        word ptr [0x4068], ax
150C: mov        word ptr [0x406a], dx
1510: sub        ax, 1
1513: sbb        dx, 0
1516: mov        word ptr [0x1368], ax
1519: mov        word ptr [0x136a], dx
151D: cmp        word ptr [0x136e], 0
1522: jg         0x1541
1524: jl         0x152d
1526: cmp        word ptr [0x136c], 1
152B: ja         0x1541
152D: mov        word ptr [0x4068], 1
1533: mov        word ptr [0x406a], 0
1539: sub        ax, ax
153B: mov        word ptr [0x136a], ax
153E: mov        word ptr [0x1368], ax
1541: push       word ptr [0x136a]
1545: push       word ptr [0x1368]
1549: mov        ax, 0x51
154C: push       ds
154D: push       ax
154E: mov        ax, 0x304
1551: push       ax
1552: lcall      0x329, 0x2230
1557: add        sp, 0xa
155A: mov        ax, word ptr [0x7354]
155D: mov        dx, word ptr [0x7356]
1561: mov        word ptr [bp - 0x88], ax
1565: mov        word ptr [bp - 0x86], dx
1569: mov        word ptr [0x7420], 1
156F: mov        word ptr [0x7422], 0
1575: mov        ax, word ptr [0x7420]
1578: mov        dx, word ptr [0x7422]
157C: cmp        word ptr [bp - 0x86], dx
1580: jl         0x15f9
1582: jg         0x158a
1584: cmp        word ptr [bp - 0x88], ax
1588: jb         0x15f9
158A: mov        bx, word ptr [0x7420]
158E: shl        bx, 1
1590: shl        bx, 1
1592: mov        ax, word ptr [bx + 0x7420]
1596: mov        dx, word ptr [bx + 0x7422]
159A: mov        word ptr [0x4068], ax
159D: mov        word ptr [0x406a], dx
15A1: mov        bx, word ptr [0x7420]
15A5: shl        bx, 1
15A7: shl        bx, 1
15A9: mov        ax, word ptr [bx + 0x7354]
15AD: mov        dx, word ptr [bx + 0x7356]
15B1: mov        word ptr [0x40e8], ax
15B4: mov        word ptr [0x40ea], dx
15B8: mov        si, word ptr [0x7420]
15BC: mov        cl, 2
15BE: shl        si, cl
15C0: mov        ax, si
15C2: add        ax, 0x45c8
15C5: push       ds
15C6: push       ax
15C7: mov        ax, si
15C9: add        ax, 0x4500
15CC: push       ds
15CD: push       ax
15CE: push       word ptr [si + 0x7356]
15D2: push       word ptr [si + 0x7354]
15D6: push       word ptr [si + 0x7422]
15DA: push       word ptr [si + 0x7420]
15DE: mov        ax, 0x310
15E1: push       ax
15E2: lcall      0x329, 0x2230
15E7: add        sp, 0x12
15EA: add        word ptr [0x7420], 1
15EF: adc        word ptr [0x7422], 0
15F4: jo         0x15f9
15F6: jmp        0x1575
15F9: mov        ax, 0x4b
15FC: push       ds
15FD: push       ax
15FE: mov        ax, 0x31c
1601: push       ax
1602: lcall      0x329, 0x2230
1607: add        sp, 6
160A: mov        ax, 0x322
160D: push       ax
160E: lcall      0x329, 0x2230
1613: add        sp, 2
1616: mov        es, word ptr [0x10bc]
161A: mov        ax, word ptr es:[0x2a38]
161E: mov        dx, word ptr es:[0x2a3a]
1623: mov        word ptr [bp - 0x8c], ax
1627: mov        word ptr [bp - 0x8a], dx
162B: mov        word ptr [0x4068], 1
1631: mov        word ptr [0x406a], 0
1637: mov        ax, word ptr [0x4068]
163A: mov        dx, word ptr [0x406a]
163E: cmp        word ptr [bp - 0x8a], dx
1642: jl         0x166c
1644: jg         0x164c
1646: cmp        word ptr [bp - 0x8c], ax
164A: jb         0x166c
164C: push       word ptr [0x406a]
1650: push       word ptr [0x4068]
1654: mov        ax, 0x32a
1657: push       ax
1658: lcall      0x329, 0x238e
165D: add        sp, 6
1660: add        word ptr [0x4068], 1
1665: adc        word ptr [0x406a], 0
166A: jno        0x1637
166C: mov        ax, 0x32c
166F: push       ax
1670: lcall      0x329, 0x238e
1675: add        sp, 2
1678: mov        word ptr [0x406c], 1
167E: mov        word ptr [0x406e], 0
1684: jmp        0x1690
1686: add        word ptr [0x406c], 1
168B: adc        word ptr [0x406e], 0
1690: cmp        word ptr [0x406e], 0
1695: jg         0x1715
1697: jl         0x16a0
1699: cmp        word ptr [0x406c], 2
169E: ja         0x1715
16A0: mov        es, word ptr [0x10bc]
16A4: mov        ax, word ptr es:[0x2a38]
16A8: mov        dx, word ptr es:[0x2a3a]
16AD: add        ax, 1
16B0: adc        dx, 0
16B3: mov        word ptr [0x1364], ax
16B6: mov        word ptr [0x1366], dx
16BA: mov        word ptr [0x4068], ax
16BD: mov        word ptr [0x406a], dx
16C1: sub        ax, 1
16C4: sbb        dx, 0
16C7: mov        word ptr [0x1360], ax
16CA: mov        word ptr [0x1362], dx
16CE: cmp        word ptr [0x1366], 0
16D3: jg         0x16f2
16D5: jl         0x16de
16D7: cmp        word ptr [0x1364], 1
16DC: ja         0x16f2
16DE: mov        word ptr [0x4068], 1
16E4: mov        word ptr [0x406a], 0
16EA: sub        ax, ax
16EC: mov        word ptr [0x1362], ax
16EF: mov        word ptr [0x1360], ax
16F2: push       word ptr [0x1362]
16F6: push       word ptr [0x1360]
16FA: mov        ax, 0xc8
16FD: imul       word ptr [0x406c]
1701: add        ax, 0x3a48
1704: push       ds
1705: push       ax
1706: mov        ax, 0x32e
1709: push       ax
170A: lcall      0x329, 0x2230
170F: add        sp, 0xa
1712: jmp        0x1686
1715: mov        es, word ptr [0x10bc]
1719: mov        ax, word ptr es:[0x2a38]
171D: mov        dx, word ptr es:[0x2a3a]
1722: mov        word ptr [bp - 0x90], ax
1726: mov        word ptr [bp - 0x8e], dx
172A: mov        word ptr [0x4068], 1
1730: mov        word ptr [0x406a], 0
1736: mov        ax, word ptr [0x4068]
1739: mov        dx, word ptr [0x406a]
173D: cmp        word ptr [bp - 0x8e], dx
1741: jl         0x1782
1743: jg         0x174b
1745: cmp        word ptr [bp - 0x90], ax
1749: jb         0x1782
174B: mov        si, word ptr [0x4068]
174F: mov        cl, 2
1751: shl        si, cl
1753: wait
1754: fld        dword ptr [si + 0x3b0c]
1758: wait
1759: fmul       dword ptr [si + 0x3b0c]
175D: wait
175E: fld        dword ptr [si + 0x3bd4]
1762: wait
1763: fmul       dword ptr [si + 0x3bd4]
1767: wait
1768: faddp      st(1)
176A: lcall      0x329, 0x143c
176F: wait
1770: fstp       dword ptr [si + 0x71bc]
1774: wait
1775: nop
1776: add        word ptr [0x4068], 1
177B: adc        word ptr [0x406a], 0
1780: jno        0x1736
1782: mov        es, word ptr [0x10bc]
1786: mov        ax, word ptr es:[0x2a38]
178A: mov        dx, word ptr es:[0x2a3a]
178F: add        ax, 1
1792: adc        dx, 0
1795: mov        word ptr [0x135c], ax
1798: mov        word ptr [0x135e], dx
179C: mov        word ptr [0x4068], ax
179F: mov        word ptr [0x406a], dx
17A3: sub        ax, 1
17A6: sbb        dx, 0
17A9: mov        word ptr [0x1358], ax
17AC: mov        word ptr [0x135a], dx
17B0: cmp        word ptr [0x135e], 0
17B5: jg         0x17d4
17B7: jl         0x17c0
17B9: cmp        word ptr [0x135c], 1
17BE: ja         0x17d4
17C0: mov        word ptr [0x4068], 1
17C6: mov        word ptr [0x406a], 0
17CC: sub        ax, ax
17CE: mov        word ptr [0x135a], ax
17D1: mov        word ptr [0x1358], ax
17D4: push       word ptr [0x135a]
17D8: push       word ptr [0x1358]
17DC: mov        ax, 0x338
17DF: push       ax
17E0: lcall      0x329, 0x2230
17E5: add        sp, 6
17E8: mov        ax, 0x42
17EB: push       ds
17EC: push       ax
17ED: mov        ax, 0x346
17F0: push       ax
17F1: lcall      0x329, 0x2da8
17F6: add        sp, 6
17F9: mov        ax, 0x34e
17FC: push       ax
17FD: lcall      0x329, 0x3832
1802: add        sp, 2
1805: mov        word ptr [0x4488], 1
180B: mov        word ptr [0x448a], 0
1811: jmp        0x181d
1813: add        word ptr [0x4488], 1
1818: adc        word ptr [0x448a], 0
181D: cmp        word ptr [0x448a], 0
1822: jle        0x1827
1824: jmp        0x18a7
1827: jl         0x1830
1829: cmp        word ptr [0x4488], 2
182E: ja         0x18a7
1830: mov        ax, word ptr [0x7354]
1833: mov        dx, word ptr [0x7356]
1837: add        ax, 1
183A: adc        dx, 0
183D: mov        word ptr [0x1354], ax
1840: mov        word ptr [0x1356], dx
1844: mov        word ptr [0x4480], ax
1847: mov        word ptr [0x4482], dx
184B: sub        ax, 1
184E: sbb        dx, 0
1851: mov        word ptr [0x1350], ax
1854: mov        word ptr [0x1352], dx
1858: cmp        word ptr [0x1356], 0
185D: jg         0x187c
185F: jl         0x1868
1861: cmp        word ptr [0x1354], 1
1866: ja         0x187c
1868: mov        word ptr [0x4480], 1
186E: mov        word ptr [0x4482], 0
1874: sub        ax, ax
1876: mov        word ptr [0x1352], ax
1879: mov        word ptr [0x1350], ax
187C: mov        ax, 0xc8
187F: imul       word ptr [0x4488]
1883: add        ax, 0x443c
1886: push       ds
1887: push       ax
1888: mov        ax, word ptr [0x1350]
188B: mov        dx, word ptr [0x1352]
188F: mov        cl, 2
1891: lcall      0x329, 0xec
1896: push       dx
1897: push       ax
1898: mov        ax, 0x35e
189B: push       ax
189C: lcall      0x329, 0x3832
18A1: add        sp, 0xa
18A4: jmp        0x1813
18A7: mov        word ptr [0x406c], 1
18AD: mov        word ptr [0x406e], 0
18B3: jmp        0x18bf
18B5: add        word ptr [0x406c], 1
18BA: adc        word ptr [0x406e], 0
18BF: cmp        word ptr [0x406e], 0
18C4: jle        0x18c9
18C6: jmp        0x194f
18C9: jl         0x18d2
18CB: cmp        word ptr [0x406c], 2
18D0: ja         0x194f
18D2: mov        es, word ptr [0x10bc]
18D6: mov        ax, word ptr es:[0x2a38]
18DA: mov        dx, word ptr es:[0x2a3a]
18DF: add        ax, 1
18E2: adc        dx, 0
18E5: mov        word ptr [0x134c], ax
18E8: mov        word ptr [0x134e], dx
18EC: mov        word ptr [0x4068], ax
18EF: mov        word ptr [0x406a], dx
18F3: sub        ax, 1
18F6: sbb        dx, 0
18F9: mov        word ptr [0x1348], ax
18FC: mov        word ptr [0x134a], dx
1900: cmp        word ptr [0x134e], 0
1905: jg         0x1924
1907: jl         0x1910
1909: cmp        word ptr [0x134c], 1
190E: ja         0x1924
1910: mov        word ptr [0x4068], 1
1916: mov        word ptr [0x406a], 0
191C: sub        ax, ax
191E: mov        word ptr [0x134a], ax
1921: mov        word ptr [0x1348], ax
1924: mov        ax, 0xc8
1927: imul       word ptr [0x406c]
192B: add        ax, 0x3a48
192E: push       ds
192F: push       ax
1930: mov        ax, word ptr [0x1348]
1933: mov        dx, word ptr [0x134a]
1937: mov        cl, 2
1939: lcall      0x329, 0xec
193E: push       dx
193F: push       ax
1940: mov        ax, 0x360
1943: push       ax
1944: lcall      0x329, 0x3832
1949: add        sp, 0xa
194C: jmp        0x18b5
194F: mov        ax, 0x362
1952: push       ax
1953: lcall      0x329, 0x3832
1958: add        sp, 2
195B: mov        ax, 0x364
195E: push       ax
195F: lcall      0x329, 0x3772
1964: add        sp, 2
1967: sub        ax, ax
1969: push       ax
196A: push       ax
196B: push       ax
196C: lcall      0x329, 0x301a
1971: add        sp, 6
1974: mov        word ptr [bp - 2], 0
1979: mov        ax, word ptr [bp - 2]
197C: cdq
197D: pop        si
197E: pop        di
197F: mov        sp, bp
1981: pop        bp
1982: retf
