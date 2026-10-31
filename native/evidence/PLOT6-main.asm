0000: enter      0x7a, 0
0004: push       di
0005: push       si
0006: mov        ax, 0xb4c0
0009: mov        dx, 1
000C: add        ax, 0
000F: adc        dx, 0
0012: mov        cx, 0xc
0015: shl        dx, cl
0017: add        dx, 0xa47
001B: mov        es, dx
001D: mov        bx, ax
001F: mov        word ptr es:[bx], 6
0024: mov        word ptr es:[bx + 2], 0
002A: mov        ax, 0x65
002D: push       ds
002E: push       ax
002F: push       0x68
0032: lcall      0x2ff, 0x2b92
0037: add        sp, 6
003A: wait
003B: fld        dword ptr [0xeba]
003F: lcall      0x2ff, 0x14da
0044: wait
0045: fstp       dword ptr [0x1326]
0049: wait
004A: nop
004B: mov        ax, 0x5c
004E: push       ds
004F: push       ax
0050: push       0x6e
0053: lcall      0x2ff, 0x2b92
0058: add        sp, 6
005B: push       0x74
005E: lcall      0x2ff, 0x2edc
0063: add        sp, 2
0066: mov        ax, word ptr [0x1342]
0069: mov        dx, word ptr [0x1344]
006D: mov        word ptr [bp - 6], ax
0070: mov        word ptr [bp - 4], dx
0073: mov        word ptr [0x1332], 1
0079: mov        word ptr [0x1334], 0
007F: mov        ax, word ptr [0x1332]
0082: mov        dx, word ptr [0x1334]
0086: cmp        word ptr [bp - 4], dx
0089: jl         0xc5
008B: jg         0x92
008D: cmp        word ptr [bp - 6], ax
0090: jb         0xc5
0092: mov        si, word ptr [0x1332]
0096: shl        si, 2
0099: lea        ax, [si + 0x28]
009D: mov        dx, 0x259f
00A0: sub        ax, 4
00A3: push       dx
00A4: push       ax
00A5: lea        ax, [si]
00A9: sub        ax, 4
00AC: push       dx
00AD: push       ax
00AE: push       0x96
00B1: lcall      0x2ff, 0x2f9c
00B6: add        sp, 0xa
00B9: add        word ptr [0x1332], 1
00BE: adc        word ptr [0x1334], 0
00C3: jno        0x7f
00C5: push       0x9a
00C8: lcall      0x2ff, 0x2f9c
00CD: add        sp, 2
00D0: mov        ax, word ptr [0x1646]
00D3: mov        dx, word ptr [0x1648]
00D7: mov        word ptr [bp - 0xa], ax
00DA: mov        word ptr [bp - 8], dx
00DD: mov        word ptr [0x1332], 1
00E3: mov        word ptr [0x1334], 0
00E9: mov        ax, word ptr [0x1332]
00EC: mov        dx, word ptr [0x1334]
00F0: cmp        word ptr [bp - 8], dx
00F3: jl         0x136
00F5: jg         0xfc
00F7: cmp        word ptr [bp - 0xa], ax
00FA: jb         0x136
00FC: mov        si, word ptr [0x1332]
0100: shl        si, 2
0103: mov        ax, si
0105: add        ax, 0x136a
0108: push       ds
0109: push       ax
010A: mov        ax, si
010C: add        ax, 0x1396
010F: push       ds
0110: push       ax
0111: mov        ax, si
0113: add        ax, 0x164a
0116: push       ds
0117: push       ax
0118: mov        ax, si
011A: add        ax, 0x1676
011D: push       ds
011E: push       ax
011F: push       0xa0
0122: lcall      0x2ff, 0x2f9c
0127: add        sp, 0x12
012A: add        word ptr [0x1332], 1
012F: adc        word ptr [0x1334], 0
0134: jno        0xe9
0136: push       0xa5
0139: lcall      0x2ff, 0x2f9c
013E: add        sp, 2
0141: push       0xa6
0144: lcall      0x2ff, 0x355c
0149: add        sp, 2
014C: push       0xaa
014F: lcall      0x2ff, 0x355c
0154: add        sp, 2
0157: mov        ax, word ptr [0x1342]
015A: mov        dx, word ptr [0x1344]
015E: mov        word ptr [bp - 0xe], ax
0161: mov        word ptr [bp - 0xc], dx
0164: mov        word ptr [0x1332], 1
016A: mov        word ptr [0x1334], 0
0170: mov        ax, word ptr [0x1332]
0173: mov        dx, word ptr [0x1334]
0177: cmp        word ptr [bp - 0xc], dx
017A: jl         0x1bd
017C: jg         0x183
017E: cmp        word ptr [bp - 0xe], ax
0181: jb         0x1bd
0183: mov        bx, word ptr [0x1332]
0187: shl        bx, 2
018A: mov        ax, word ptr [0x13c2]
018D: mov        dx, word ptr [0x13c4]
0191: mov        word ptr [bx + 0x1342], ax
0195: mov        word ptr [bx + 0x1344], dx
0199: mov        bx, word ptr [0x1332]
019D: shl        bx, 2
01A0: wait
01A1: fld        dword ptr [0x13fe]
01A5: wait
01A6: fmul       dword ptr [0xeba]
01AA: wait
01AB: fstp       dword ptr [bx + 0x13ca]
01AF: wait
01B0: nop
01B1: add        word ptr [0x1332], 1
01B6: adc        word ptr [0x1334], 0
01BB: jno        0x170
01BD: mov        ax, word ptr [0x1646]
01C0: mov        dx, word ptr [0x1648]
01C4: mov        word ptr [bp - 0x12], ax
01C7: mov        word ptr [bp - 0x10], dx
01CA: mov        word ptr [0x1332], 1
01D0: mov        word ptr [0x1334], 0
01D6: mov        ax, word ptr [0x1332]
01D9: mov        dx, word ptr [0x1334]
01DD: cmp        word ptr [bp - 0x10], dx
01E0: jl         0x212
01E2: jg         0x1e9
01E4: cmp        word ptr [bp - 0x12], ax
01E7: jb         0x212
01E9: mov        si, word ptr [0x1332]
01ED: shl        si, 2
01F0: add        si, 0x136a
01F4: wait
01F5: fld        dword ptr [si]
01F7: wait
01F8: fmul       dword ptr [0xebe]
01FC: wait
01FD: fdiv       dword ptr [0xec2]
0201: wait
0202: fstp       dword ptr [si]
0204: wait
0205: nop
0206: add        word ptr [0x1332], 1
020B: adc        word ptr [0x1334], 0
0210: jno        0x1d6
0212: wait
0213: fld        dword ptr [0xec6]
0217: wait
0218: fstp       dword ptr [0x1406]
021C: wait
021D: nop
021E: mov        ax, 0xb4b8
0221: mov        dx, 1
0224: add        ax, 0
0227: adc        dx, 0
022A: mov        cx, 0xc
022D: shl        dx, cl
022F: add        dx, 0xa47
0233: mov        es, dx
0235: mov        bx, ax
0237: mov        word ptr es:[bx], 0x32
023C: mov        word ptr es:[bx + 2], 0
0242: mov        ax, 0xb4bc
0245: mov        dx, 1
0248: add        ax, 0
024B: adc        dx, 0
024E: shl        dx, cl
0250: add        dx, 0xa47
0254: mov        es, dx
0256: mov        bx, ax
0258: mov        word ptr es:[bx], 0x88
025D: mov        word ptr es:[bx + 2], 0
0263: mov        ax, 0xb4b4
0266: mov        dx, 1
0269: add        ax, 0
026C: adc        dx, 0
026F: shl        dx, cl
0271: add        dx, 0xa47
0275: mov        es, dx
0277: mov        bx, ax
0279: mov        word ptr es:[bx], 0x44
027E: mov        word ptr es:[bx + 2], 0
0284: mov        ax, 0xb4b0
0287: mov        dx, 1
028A: add        ax, 0
028D: adc        dx, 0
0290: shl        dx, cl
0292: add        dx, 0xa47
0296: mov        es, dx
0298: mov        bx, ax
029A: sub        ax, ax
029C: mov        word ptr es:[bx + 2], ax
02A0: mov        word ptr es:[bx], ax
02A3: mov        word ptr [0x163e], 0x33
02A9: mov        word ptr [0x1640], ax
02AC: push       ax
02AD: push       2
02AF: push       ax
02B0: push       word ptr [0x163e]
02B4: lcall      0x2ff, 0xe8
02B9: or         dx, ax
02BB: je         0x2e1
02BD: mov        ax, 0xb4b0
02C0: mov        dx, 1
02C3: add        ax, 0
02C6: adc        dx, 0
02C9: mov        cx, 0xc
02CC: shl        dx, cl
02CE: add        dx, 0xa47
02D2: mov        es, dx
02D4: mov        bx, ax
02D6: mov        word ptr es:[bx], 0x1a
02DB: mov        word ptr es:[bx + 2], 0
02E1: mov        ax, 0xb4c8
02E4: mov        dx, 1
02E7: add        ax, 0
02EA: adc        dx, 0
02ED: mov        cx, 0xc
02F0: shl        dx, cl
02F2: add        dx, 0xa47
02F6: mov        es, dx
02F8: mov        bx, ax
02FA: mov        word ptr es:[bx], 0x14
02FF: mov        word ptr es:[bx + 2], 0
0305: mov        ax, word ptr [0x1342]
0308: mov        dx, word ptr [0x1344]
030C: mov        word ptr [bp - 0x16], ax
030F: mov        word ptr [bp - 0x14], dx
0312: mov        word ptr [0x1332], 1
0318: mov        word ptr [0x1334], 0
031E: mov        ax, word ptr [0x1332]
0321: mov        dx, word ptr [0x1334]
0325: cmp        word ptr [bp - 0x14], dx
0328: jl         0x38d
032A: jg         0x331
032C: cmp        word ptr [bp - 0x16], ax
032F: jb         0x38d
0331: mov        si, word ptr [0x1332]
0335: shl        si, 2
0338: mov        es, word ptr [0xeca]
033C: lea        bx, [si]
0340: wait
0341: fld        dword ptr es:[bx - 4]
0345: wait
0346: fdiv       dword ptr [0x133e]
034A: wait
034B: fmul       dword ptr [0xecc]
034F: wait
0350: fadd       dword ptr [0xed0]
0354: wait
0355: fstp       dword ptr [si + 0x1406]
0359: wait
035A: nop
035B: mov        si, word ptr [0x1332]
035F: shl        si, 2
0362: lea        bx, [si + 0x28]
0366: wait
0367: fld        dword ptr es:[bx - 4]
036B: wait
036C: fdiv       dword ptr [0x132e]
0370: wait
0371: fmul       dword ptr [0xed4]
0375: wait
0376: fadd       dword ptr [0xed8]
037A: wait
037B: fstp       dword ptr [si + 0x142e]
037F: wait
0380: nop
0381: add        word ptr [0x1332], 1
0386: adc        word ptr [0x1334], 0
038B: jno        0x31e
038D: mov        ax, 0xb4c4
0390: mov        dx, 1
0393: add        ax, 0
0396: adc        dx, 0
0399: mov        cx, 0xc
039C: shl        dx, cl
039E: add        dx, 0xa47
03A2: mov        es, dx
03A4: mov        bx, ax
03A6: mov        word ptr es:[bx], 1
03AB: mov        word ptr es:[bx + 2], 0
03B1: mov        word ptr [0x1336], 1
03B7: mov        word ptr [0x1338], 0
03BD: jmp        0x433
03BF: add        word ptr [0x1332], 1
03C4: adc        word ptr [0x1334], 0
03C9: cmp        word ptr [0x1334], 0
03CE: jg         0x429
03D0: jl         0x3d9
03D2: cmp        word ptr [0x1332], 0x33
03D7: ja         0x429
03D9: push       0
03DB: push       0xcc
03DE: push       word ptr [0x1338]
03E2: push       word ptr [0x1336]
03E6: lcall      0x2ff, 0xb4
03EB: mov        cx, ax
03ED: mov        bx, dx
03EF: mov        ax, word ptr [0x1332]
03F2: mov        dx, word ptr [0x1334]
03F6: mov        si, cx
03F8: mov        cl, 2
03FA: mov        di, bx
03FC: lcall      0x2ff, 0x18a
0401: add        ax, si
0403: adc        dx, di
0405: add        ax, 0x46b4
0408: adc        dx, 1
040B: add        ax, 0
040E: adc        dx, 0
0411: mov        cx, 0xc
0414: shl        dx, cl
0416: add        dx, 0xa47
041A: mov        es, dx
041C: mov        bx, ax
041E: wait
041F: fldz
0421: wait
0422: fstp       dword ptr es:[bx]
0425: wait
0426: nop
0427: jmp        0x3bf
0429: add        word ptr [0x1336], 1
042E: adc        word ptr [0x1338], 0
0433: cmp        word ptr [0x1338], 0
0438: jg         0x453
043A: jl         0x444
043C: cmp        word ptr [0x1336], 0x89
0442: ja         0x453
0444: mov        word ptr [0x1332], 1
044A: mov        word ptr [0x1334], 0
0450: jmp        0x3c9
0453: push       0xae
0456: lcall      0x2ff, 0x2290
045B: add        sp, 2
045E: mov        ax, word ptr [0x1342]
0461: mov        dx, word ptr [0x1344]
0465: add        ax, 1
0468: adc        dx, 0
046B: mov        word ptr [0x118a], ax
046E: mov        word ptr [0x118c], dx
0472: mov        word ptr [0x1332], ax
0475: mov        word ptr [0x1334], dx
0479: sub        ax, 1
047C: sbb        dx, 0
047F: mov        word ptr [0x1186], ax
0482: mov        word ptr [0x1188], dx
0486: cmp        word ptr [0x118c], 0
048B: jg         0x4aa
048D: jl         0x496
048F: cmp        word ptr [0x118a], 1
0494: ja         0x4aa
0496: mov        word ptr [0x1332], 1
049C: mov        word ptr [0x1334], 0
04A2: sub        ax, ax
04A4: mov        word ptr [0x1188], ax
04A7: mov        word ptr [0x1186], ax
04AA: push       word ptr [0x1188]
04AE: push       word ptr [0x1186]
04B2: push       0xb6
04B5: lcall      0x2ff, 0x2290
04BA: add        sp, 6
04BD: mov        ax, word ptr [0x1342]
04C0: mov        dx, word ptr [0x1344]
04C4: add        ax, 1
04C7: adc        dx, 0
04CA: mov        word ptr [0x1182], ax
04CD: mov        word ptr [0x1184], dx
04D1: mov        word ptr [0x1332], ax
04D4: mov        word ptr [0x1334], dx
04D8: sub        ax, 1
04DB: sbb        dx, 0
04DE: mov        word ptr [0x117e], ax
04E1: mov        word ptr [0x1180], dx
04E5: cmp        word ptr [0x1184], 0
04EA: jg         0x509
04EC: jl         0x4f5
04EE: cmp        word ptr [0x1182], 1
04F3: ja         0x509
04F5: mov        word ptr [0x1332], 1
04FB: mov        word ptr [0x1334], 0
0501: sub        ax, ax
0503: mov        word ptr [0x1180], ax
0506: mov        word ptr [0x117e], ax
0509: push       word ptr [0x1180]
050D: push       word ptr [0x117e]
0511: push       0xc4
0514: lcall      0x2ff, 0x2290
0519: add        sp, 6
051C: push       0xd2
051F: lcall      0x2ff, 0x2290
0524: add        sp, 2
0527: mov        ax, word ptr [0x1342]
052A: mov        dx, word ptr [0x1344]
052E: add        ax, 1
0531: adc        dx, 0
0534: mov        word ptr [0x117a], ax
0537: mov        word ptr [0x117c], dx
053B: mov        word ptr [0x1332], ax
053E: mov        word ptr [0x1334], dx
0542: sub        ax, 1
0545: sbb        dx, 0
0548: mov        word ptr [0x1176], ax
054B: mov        word ptr [0x1178], dx
054F: cmp        word ptr [0x117c], 0
0554: jg         0x573
0556: jl         0x55f
0558: cmp        word ptr [0x117a], 1
055D: ja         0x573
055F: mov        word ptr [0x1332], 1
0565: mov        word ptr [0x1334], 0
056B: sub        ax, ax
056D: mov        word ptr [0x1178], ax
0570: mov        word ptr [0x1176], ax
0573: push       word ptr [0x1178]
0577: push       word ptr [0x1176]
057B: push       0xe4
057E: lcall      0x2ff, 0x2290
0583: add        sp, 6
0586: mov        ax, word ptr [0x1342]
0589: mov        dx, word ptr [0x1344]
058D: add        ax, 1
0590: adc        dx, 0
0593: mov        word ptr [0x1172], ax
0596: mov        word ptr [0x1174], dx
059A: mov        word ptr [0x1332], ax
059D: mov        word ptr [0x1334], dx
05A1: sub        ax, 1
05A4: sbb        dx, 0
05A7: mov        word ptr [0x116e], ax
05AA: mov        word ptr [0x1170], dx
05AE: cmp        word ptr [0x1174], 0
05B3: jg         0x5d2
05B5: jl         0x5be
05B7: cmp        word ptr [0x1172], 1
05BC: ja         0x5d2
05BE: mov        word ptr [0x1332], 1
05C4: mov        word ptr [0x1334], 0
05CA: sub        ax, ax
05CC: mov        word ptr [0x1170], ax
05CF: mov        word ptr [0x116e], ax
05D2: push       word ptr [0x1170]
05D6: push       word ptr [0x116e]
05DA: push       0xf2
05DD: lcall      0x2ff, 0x2290
05E2: add        sp, 6
05E5: push       0x100
05E8: lcall      0x2ff, 0x2290
05ED: add        sp, 2
05F0: push       0x112
05F3: lcall      0x2ff, 0x2290
05F8: add        sp, 2
05FB: push       0x120
05FE: lcall      0x2ff, 0x2290
0603: add        sp, 2
0606: push       0x12e
0609: lcall      0x2ff, 0x2290
060E: add        sp, 2
0611: mov        ax, 0x132e
0614: push       ds
0615: push       ax
0616: mov        ax, 0x13fa
0619: push       ds
061A: push       ax
061B: mov        ax, 0x1342
061E: push       ds
061F: push       ax
0620: mov        ax, 0x13ce
0623: push       ds
0624: push       ax
0625: mov        ax, 0x1346
0628: push       ds
0629: push       ax
062A: mov        ax, 0x133e
062D: push       ds
062E: push       ax
062F: lcall      0, 0x1d6d
0634: push       0x136
0637: lcall      0x2ff, 0x2290
063C: add        sp, 2
063F: mov        ax, word ptr [0x1342]
0642: mov        dx, word ptr [0x1344]
0646: mov        word ptr [bp - 0x1a], ax
0649: mov        word ptr [bp - 0x18], dx
064C: mov        word ptr [0x1332], 1
0652: mov        word ptr [0x1334], 0
0658: jmp        0x6b3
065A: mov        ax, word ptr [0x1336]
065D: mov        dx, word ptr [0x1338]
0661: cmp        word ptr [bp - 0x1c], dx
0664: jl         0x69c
0666: jg         0x66d
0668: cmp        word ptr [bp - 0x1e], ax
066B: jb         0x69c
066D: imul       si, word ptr [0x1336], 0x28
0672: mov        bx, word ptr [0x1332]
0676: shl        bx, 2
0679: lea        ax, [bx + si + 0x50]
067D: mov        dx, 0x259f
0680: sub        ax, 0x2c
0683: push       dx
0684: push       ax
0685: push       0x148
0688: lcall      0x2ff, 0x23ee
068D: add        sp, 6
0690: add        word ptr [0x1336], 1
0695: adc        word ptr [0x1338], 0
069A: jno        0x65a
069C: push       0x14a
069F: lcall      0x2ff, 0x23ee
06A4: add        sp, 2
06A7: add        word ptr [0x1332], 1
06AC: adc        word ptr [0x1334], 0
06B1: jo         0x6f5
06B3: mov        ax, word ptr [0x1332]
06B6: mov        dx, word ptr [0x1334]
06BA: cmp        word ptr [bp - 0x18], dx
06BD: jl         0x6f5
06BF: jg         0x6c6
06C1: cmp        word ptr [bp - 0x1a], ax
06C4: jb         0x6f5
06C6: push       word ptr [0x1334]
06CA: push       word ptr [0x1332]
06CE: push       0x13e
06D1: lcall      0x2ff, 0x2290
06D6: add        sp, 6
06D9: mov        ax, word ptr [0x1342]
06DC: mov        dx, word ptr [0x1344]
06E0: mov        word ptr [bp - 0x1e], ax
06E3: mov        word ptr [bp - 0x1c], dx
06E6: mov        word ptr [0x1336], 1
06EC: mov        word ptr [0x1338], 0
06F2: jmp        0x65a
06F5: mov        ax, word ptr [0x1342]
06F8: mov        dx, word ptr [0x1344]
06FC: sub        ax, 1
06FF: sbb        dx, 0
0702: mov        word ptr [0x16a2], ax
0705: mov        word ptr [0x16a4], dx
0709: sub        ax, word ptr [0x1646]
070D: sbb        dx, word ptr [0x1648]
0711: mov        word ptr [0x118e], ax
0714: mov        word ptr [0x1190], dx
0718: mov        ax, word ptr [0x16a2]
071B: mov        dx, word ptr [0x16a4]
071F: cmp        word ptr [0x1648], dx
0723: jle        0x728
0725: jmp        0x850
0728: jl         0x733
072A: cmp        word ptr [0x1646], ax
072E: jb         0x733
0730: jmp        0x850
0733: push       word ptr [0x1190]
0737: push       word ptr [0x118e]
073B: push       word ptr [0x16a4]
073F: push       word ptr [0x16a2]
0743: push       0x14c
0746: lcall      0x2ff, 0x2290
074B: add        sp, 0xa
074E: mov        ax, word ptr [0x1646]
0751: mov        dx, word ptr [0x1648]
0755: add        ax, 1
0758: adc        dx, 0
075B: mov        word ptr [0x1192], ax
075E: mov        word ptr [0x1194], dx
0762: mov        ax, word ptr [0x16a2]
0765: mov        dx, word ptr [0x16a4]
0769: mov        word ptr [bp - 0x22], ax
076C: mov        word ptr [bp - 0x20], dx
076F: mov        ax, word ptr [0x1192]
0772: mov        dx, word ptr [0x1194]
0776: mov        word ptr [0x1332], ax
0779: mov        word ptr [0x1334], dx
077D: jmp        0x7dc
077F: mov        ax, word ptr [0x1336]
0782: mov        dx, word ptr [0x1338]
0786: cmp        word ptr [bp - 0x24], dx
0789: jl         0x7c5
078B: jg         0x792
078D: cmp        word ptr [bp - 0x26], ax
0790: jb         0x7c5
0792: mov        ax, word ptr [0x1332]
0795: shl        ax, 2
0798: cdq
0799: mov        cx, ax
079B: mov        ax, word ptr [0x1336]
079E: mov        bx, 0x28
07A1: mov        si, dx
07A3: imul       bx
07A5: add        ax, cx
07A7: adc        dx, si
07A9: add        ax, 0x116a
07AC: push       ds
07AD: push       ax
07AE: push       0x160
07B1: lcall      0x2ff, 0x2f9c
07B6: add        sp, 6
07B9: add        word ptr [0x1336], 1
07BE: adc        word ptr [0x1338], 0
07C3: jno        0x77f
07C5: push       0x162
07C8: lcall      0x2ff, 0x2f9c
07CD: add        sp, 2
07D0: add        word ptr [0x1332], 1
07D5: adc        word ptr [0x1334], 0
07DA: jo         0x850
07DC: mov        ax, word ptr [0x1332]
07DF: mov        dx, word ptr [0x1334]
07E3: cmp        word ptr [bp - 0x20], dx
07E6: jl         0x850
07E8: jg         0x7ef
07EA: cmp        word ptr [bp - 0x22], ax
07ED: jb         0x850
07EF: mov        si, word ptr [0x1332]
07F3: shl        si, 2
07F6: mov        es, word ptr [0xedc]
07FA: lea        bx, [si + 0x78]
07FE: wait
07FF: fldz
0801: wait
0802: fstp       dword ptr es:[bx - 0x2c]
0806: wait
0807: nop
0808: lea        bx, [si + 0xa0]
080C: wait
080D: fldz
080F: wait
0810: fstp       dword ptr es:[bx - 0x2c]
0814: wait
0815: nop
0816: push       word ptr [0x1334]
081A: push       word ptr [0x1332]
081E: push       0x156
0821: lcall      0x2ff, 0x2290
0826: add        sp, 6
0829: push       0x15e
082C: lcall      0x2ff, 0x2edc
0831: add        sp, 2
0834: mov        ax, word ptr [0x16a2]
0837: mov        dx, word ptr [0x16a4]
083B: mov        word ptr [bp - 0x26], ax
083E: mov        word ptr [bp - 0x24], dx
0841: mov        word ptr [0x1336], 1
0847: mov        word ptr [0x1338], 0
084D: jmp        0x77f
0850: mov        ax, word ptr [0x1646]
0853: mov        dx, word ptr [0x1648]
0857: mov        word ptr [bp - 0x2a], ax
085A: mov        word ptr [bp - 0x28], dx
085D: mov        word ptr [0x1676], 1
0863: mov        word ptr [0x1678], 0
0869: jmp        0x8ff
086C: add        word ptr [0x1336], 1
0871: adc        word ptr [0x1338], 0
0876: jo         0x8f3
0878: mov        ax, word ptr [0x1336]
087B: mov        dx, word ptr [0x1338]
087F: cmp        word ptr [bp - 0x2c], dx
0882: jl         0x8f3
0884: jg         0x88b
0886: cmp        word ptr [bp - 0x2e], ax
0889: jb         0x8f3
088B: imul       ax, word ptr [0x1336], 0x28
0890: mov        si, ax
0892: imul       ax, word ptr [0x1342], 0x28
0897: mov        di, ax
0899: mov        ax, word ptr [0x133a]
089C: shl        ax, 2
089F: mov        word ptr [bp - 0x30], ax
08A2: mov        ax, word ptr [0x1332]
08A5: shl        ax, 2
08A8: mov        bx, ax
08AA: mov        es, word ptr [0xeca]
08AE: lea        bx, [bx + si + 0x50]
08B2: wait
08B3: fld        dword ptr es:[bx - 0x2c]
08B7: mov        bx, word ptr [bp - 0x30]
08BA: lea        bx, [bx + si + 0x50]
08BE: wait
08BF: fsub       dword ptr es:[bx - 0x2c]
08C3: mov        bx, ax
08C5: lea        bx, [bx + di + 0x50]
08C9: wait
08CA: fsub       dword ptr es:[bx - 0x2c]
08CE: mov        bx, word ptr [bp - 0x30]
08D1: lea        bx, [bx + di + 0x50]
08D5: wait
08D6: fadd       dword ptr es:[bx - 0x2c]
08DA: wait
08DB: fmul       dword ptr [0xede]
08DF: wait
08E0: fchs
08E2: mov        bx, word ptr [0x1676]
08E6: shl        bx, 2
08E9: wait
08EA: fstp       dword ptr [bx + si + 0x116a]
08EE: wait
08EF: nop
08F0: jmp        0x86c
08F3: add        word ptr [0x1676], 1
08F8: adc        word ptr [0x1678], 0
08FD: jo         0x953
08FF: mov        ax, word ptr [0x1676]
0902: mov        dx, word ptr [0x1678]
0906: cmp        word ptr [bp - 0x28], dx
0909: jl         0x953
090B: jg         0x912
090D: cmp        word ptr [bp - 0x2a], ax
0910: jb         0x953
0912: mov        si, word ptr [0x1676]
0916: shl        si, 2
0919: mov        ax, word ptr [si + 0x1676]
091D: mov        dx, word ptr [si + 0x1678]
0921: mov        word ptr [0x1332], ax
0924: mov        word ptr [0x1334], dx
0928: mov        ax, word ptr [si + 0x164a]
092C: mov        dx, word ptr [si + 0x164c]
0930: mov        word ptr [0x133a], ax
0933: mov        word ptr [0x133c], dx
0937: mov        ax, word ptr [0x16a2]
093A: mov        dx, word ptr [0x16a4]
093E: mov        word ptr [bp - 0x2e], ax
0941: mov        word ptr [bp - 0x2c], dx
0944: mov        word ptr [0x1336], 1
094A: mov        word ptr [0x1338], 0
0950: jmp        0x878
0953: wait
0954: fld        dword ptr [0xee2]
0958: wait
0959: fst        dword ptr [0x13c6]
095D: wait
095E: fstp       dword ptr [bp - 0x3a]
0961: wait
0962: nop
0963: mov        ax, word ptr [0x1406]
0966: mov        dx, word ptr [0x1408]
096A: mov        word ptr [bp - 0x36], ax
096D: mov        word ptr [bp - 0x34], dx
0970: wait
0971: fld        dword ptr [0x1406]
0975: wait
0976: fsubr      dword ptr [0xee2]
097A: wait
097B: fadd       dword ptr [bp - 0x36]
097E: wait
097F: fdiv       dword ptr [bp - 0x36]
0982: lcall      0x2ff, 0x1313
0987: mov        word ptr [bp - 0x3e], ax
098A: mov        word ptr [bp - 0x3c], dx
098D: mov        ax, word ptr [0x1406]
0990: mov        dx, word ptr [0x1408]
0994: mov        word ptr [0x1402], ax
0997: mov        word ptr [0x1404], dx
099B: jmp        0xb25
099E: add        word ptr [0x1336], 1
09A3: adc        word ptr [0x1338], 0
09A8: cmp        word ptr [0x1338], 0
09AD: jg         0xa2b
09AF: jl         0x9b8
09B1: cmp        word ptr [0x1336], 2
09B6: ja         0xa2b
09B8: mov        ax, word ptr [0x1342]
09BB: mov        dx, word ptr [0x1344]
09BF: add        ax, 1
09C2: adc        dx, 0
09C5: mov        word ptr [0x116a], ax
09C8: mov        word ptr [0x116c], dx
09CC: mov        word ptr [0x1332], ax
09CF: mov        word ptr [0x1334], dx
09D3: sub        ax, 1
09D6: sbb        dx, 0
09D9: mov        word ptr [0x1166], ax
09DC: mov        word ptr [0x1168], dx
09E0: cmp        word ptr [0x116c], 0
09E5: jg         0xa04
09E7: jl         0x9f0
09E9: cmp        word ptr [0x116a], 1
09EE: ja         0xa04
09F0: mov        word ptr [0x1332], 1
09F6: mov        word ptr [0x1334], 0
09FC: sub        ax, ax
09FE: mov        word ptr [0x1168], ax
0A01: mov        word ptr [0x1166], ax
0A04: push       word ptr [0x1168]
0A08: push       word ptr [0x1166]
0A0C: imul       bx, word ptr [0x1336], 0x28
0A11: lea        ax, [bx + 0x54]
0A15: mov        dx, 0x2595
0A18: sub        ax, 0x2c
0A1B: push       dx
0A1C: push       ax
0A1D: push       0x184
0A20: lcall      0x2ff, 0x2290
0A25: add        sp, 0xa
0A28: jmp        0x99e
0A2B: push       0x18e
0A2E: lcall      0x2ff, 0x2290
0A33: add        sp, 2
0A36: mov        ax, word ptr [0x1342]
0A39: mov        dx, word ptr [0x1344]
0A3D: mov        word ptr [bp - 0x68], ax
0A40: mov        word ptr [bp - 0x66], dx
0A43: mov        word ptr [0x1332], 1
0A49: mov        word ptr [0x1334], 0
0A4F: mov        ax, word ptr [0x1332]
0A52: mov        dx, word ptr [0x1334]
0A56: cmp        word ptr [bp - 0x66], dx
0A59: jl         0xabd
0A5B: jg         0xa62
0A5D: cmp        word ptr [bp - 0x68], ax
0A60: jb         0xabd
0A62: mov        si, word ptr [0x1332]
0A66: shl        si, 2
0A69: mov        es, word ptr [0xedc]
0A6D: lea        bx, [si + 0xa0]
0A71: wait
0A72: fld        dword ptr es:[bx - 0x2c]
0A76: wait
0A77: nop
0A78: lea        bx, [si + 0x78]
0A7C: wait
0A7D: fld        dword ptr es:[bx - 0x2c]
0A81: wait
0A82: fld        st(0)
0A84: wait
0A85: fmul       st(1)
0A87: wait
0A88: fld        st(2)
0A8A: wait
0A8B: fmul       st(3)
0A8D: wait
0A8E: faddp      st(1)
0A90: lcall      0x2ff, 0x14da
0A95: wait
0A96: fstp       dword ptr [bp - 0x5c]
0A99: wait
0A9A: nop
0A9B: lea        ax, [bp - 0x5c]
0A9E: push       ss
0A9F: push       ax
0AA0: push       0x196
0AA3: wait
0AA4: ffree      st(1)
0AA6: wait
0AA7: ffree      st(0)
0AA9: lcall      0x2ff, 0x23ee
0AAE: add        sp, 6
0AB1: add        word ptr [0x1332], 1
0AB6: adc        word ptr [0x1334], 0
0ABB: jno        0xa4f
0ABD: push       0x198
0AC0: lcall      0x2ff, 0x23ee
0AC5: add        sp, 2
0AC8: mov        ax, 0x133e
0ACB: push       ds
0ACC: push       ax
0ACD: mov        ax, 0x132e
0AD0: push       ds
0AD1: push       ax
0AD2: mov        ax, 0x13fa
0AD5: push       ds
0AD6: push       ax
0AD7: mov        ax, 0x1342
0ADA: push       ds
0ADB: push       ax
0ADC: mov        ax, 0x13ce
0ADF: push       ds
0AE0: push       ax
0AE1: mov        ax, 0x1346
0AE4: push       ds
0AE5: push       ax
0AE6: lcall      0, 0x1490
0AEB: mov        ax, 0xb4c4
0AEE: mov        dx, 1
0AF1: add        ax, 0
0AF4: adc        dx, 0
0AF7: mov        cx, 0xc
0AFA: shl        dx, cl
0AFC: add        dx, 0xa47
0B00: mov        es, dx
0B02: mov        bx, ax
0B04: add        word ptr es:[bx], 1
0B08: adc        word ptr es:[bx + 2], 0
0B0D: wait
0B0E: fld        dword ptr [bp - 0x36]
0B11: wait
0B12: fadd       dword ptr [0x1402]
0B16: wait
0B17: fstp       dword ptr [0x1402]
0B1B: wait
0B1C: nop
0B1D: sub        word ptr [bp - 0x3e], 1
0B21: sbb        word ptr [bp - 0x3c], 0
0B25: cmp        word ptr [bp - 0x3c], 0
0B29: jge        0xb2e
0B2B: jmp        0xe93
0B2E: jg         0xb39
0B30: cmp        word ptr [bp - 0x3e], 0
0B34: jne        0xb39
0B36: jmp        0xe93
0B39: mov        ax, word ptr [0x1646]
0B3C: mov        dx, word ptr [0x1648]
0B40: mov        word ptr [bp - 0x42], ax
0B43: mov        word ptr [bp - 0x40], dx
0B46: mov        word ptr [0x1332], 1
0B4C: mov        word ptr [0x1334], 0
0B52: mov        ax, word ptr [0x1332]
0B55: mov        dx, word ptr [0x1334]
0B59: cmp        word ptr [bp - 0x40], dx
0B5C: jge        0xb61
0B5E: jmp        0xc46
0B61: jg         0xb6b
0B63: cmp        word ptr [bp - 0x42], ax
0B66: jae        0xb6b
0B68: jmp        0xc46
0B6B: mov        si, word ptr [0x1332]
0B6F: shl        si, 2
0B72: wait
0B73: fld        dword ptr [si + 0x136a]
0B77: wait
0B78: fadd       dword ptr [0x1402]
0B7C: lcall      0x2ff, 0x14bb
0B81: wait
0B82: fstp       xword ptr [bp - 0x4c]
0B85: wait
0B86: nop
0B87: mov        es, word ptr [0xedc]
0B8B: lea        bx, [si + 0x78]
0B8F: wait
0B90: fld        dword ptr [si + 0x1396]
0B94: wait
0B95: fld        xword ptr [bp - 0x4c]
0B98: wait
0B99: fmulp      st(1)
0B9B: wait
0B9C: fmul       dword ptr [0x1326]
0BA0: wait
0BA1: fstp       dword ptr es:[bx - 0x2c]
0BA5: wait
0BA6: nop
0BA7: mov        si, word ptr [0x1332]
0BAB: shl        si, 2
0BAE: wait
0BAF: fld        dword ptr [si + 0x136a]
0BB3: wait
0BB4: fadd       dword ptr [0x1402]
0BB8: lcall      0x2ff, 0x14b5
0BBD: wait
0BBE: fstp       xword ptr [bp - 0x4c]
0BC1: wait
0BC2: nop
0BC3: mov        es, word ptr [0xedc]
0BC7: lea        bx, [si + 0xa0]
0BCB: wait
0BCC: fld        dword ptr [si + 0x1396]
0BD0: wait
0BD1: fld        xword ptr [bp - 0x4c]
0BD4: wait
0BD5: fmulp      st(1)
0BD7: wait
0BD8: fmul       dword ptr [0x1326]
0BDC: wait
0BDD: fstp       dword ptr es:[bx - 0x2c]
0BE1: wait
0BE2: nop
0BE3: mov        si, word ptr [0x1332]
0BE7: shl        si, 2
0BEA: lea        bx, [si + 0x78]
0BEE: wait
0BEF: fld        dword ptr es:[bx - 0x2c]
0BF3: wait
0BF4: fdiv       dword ptr [0x1326]
0BF8: wait
0BF9: fstp       dword ptr [bp - 0x50]
0BFC: wait
0BFD: nop
0BFE: lea        bx, [si + 0xa0]
0C02: wait
0C03: fld        dword ptr es:[bx - 0x2c]
0C07: wait
0C08: fdiv       dword ptr [0x1326]
0C0C: wait
0C0D: fstp       dword ptr [bp - 0x54]
0C10: wait
0C11: nop
0C12: lea        ax, [bp - 0x54]
0C15: push       ss
0C16: push       ax
0C17: lea        ax, [bp - 0x50]
0C1A: push       ss
0C1B: push       ax
0C1C: push       word ptr [si + 0x164c]
0C20: push       word ptr [si + 0x164a]
0C24: push       word ptr [si + 0x1678]
0C28: push       word ptr [si + 0x1676]
0C2C: push       0x164
0C2F: lcall      0x2ff, 0x2290
0C34: add        sp, 0x12
0C37: add        word ptr [0x1332], 1
0C3C: adc        word ptr [0x1334], 0
0C41: jo         0xc46
0C43: jmp        0xb52
0C46: mov        word ptr [bp - 0x58], 0xa
0C4B: mov        word ptr [bp - 0x56], 0
0C50: mov        word ptr [bp - 0x50], 0xa
0C55: mov        word ptr [bp - 0x4e], 0
0C5A: mov        word ptr [bp - 0x54], 2
0C5F: mov        word ptr [bp - 0x52], 0
0C64: lea        ax, [bp - 0x54]
0C67: push       ss
0C68: push       ax
0C69: mov        ax, 0x16a2
0C6C: push       ds
0C6D: push       ax
0C6E: push       ds
0C6F: push       ax
0C70: lea        ax, [bp - 0x50]
0C73: push       ss
0C74: push       ax
0C75: lea        ax, [bp - 0x58]
0C78: push       ss
0C79: push       ax
0C7A: mov        ax, 0x145a
0C7D: push       ds
0C7E: push       ax
0C7F: mov        ax, 0x1196
0C82: push       ds
0C83: push       ax
0C84: lcall      0x21d, 0xb21
0C89: mov        word ptr [bp - 0x5c], 2
0C8E: mov        word ptr [bp - 0x5a], 0
0C93: mov        word ptr [bp - 0x50], 0xa
0C98: mov        word ptr [bp - 0x4e], 0
0C9D: mov        word ptr [bp - 0x54], 2
0CA2: mov        word ptr [bp - 0x52], 0
0CA7: mov        word ptr [bp - 0x58], 2
0CAC: mov        word ptr [bp - 0x56], 0
0CB1: lea        ax, [bp - 0x58]
0CB4: push       ss
0CB5: push       ax
0CB6: mov        ax, 0x16a2
0CB9: push       ds
0CBA: push       ax
0CBB: lea        ax, [bp - 0x54]
0CBE: push       ss
0CBF: push       ax
0CC0: lea        ax, [bp - 0x50]
0CC3: push       ss
0CC4: push       ax
0CC5: lea        ax, [bp - 0x5c]
0CC8: push       ss
0CC9: push       ax
0CCA: mov        ax, 0x15ea
0CCD: push       ds
0CCE: push       ax
0CCF: mov        ax, 0x50
0CD2: mov        dx, 0x2595
0CD5: push       dx
0CD6: push       ax
0CD7: lcall      0x21d, 0xb21
0CDC: mov        word ptr [bp - 0x5c], 2
0CE1: mov        word ptr [bp - 0x5a], 0
0CE6: mov        ax, 0x15ea
0CE9: push       ds
0CEA: push       ax
0CEB: mov        ax, 0x145a
0CEE: push       ds
0CEF: push       ax
0CF0: mov        ax, 0x16a2
0CF3: push       ds
0CF4: push       ax
0CF5: lea        ax, [bp - 0x5c]
0CF8: push       ss
0CF9: push       ax
0CFA: lea        ax, [0xee6]
0CFE: push       ds
0CFF: push       ax
0D00: mov        ax, 0x13f6
0D03: push       ds
0D04: push       ax
0D05: lcall      0x21d, 2
0D0A: mov        word ptr [bp - 0x50], 2
0D0F: mov        word ptr [bp - 0x4e], 0
0D14: mov        word ptr [bp - 0x54], 0xa
0D19: mov        word ptr [bp - 0x52], 0
0D1E: mov        word ptr [bp - 0x58], 2
0D23: mov        word ptr [bp - 0x56], 0
0D28: mov        word ptr [bp - 0x5c], 1
0D2D: mov        word ptr [bp - 0x5a], 0
0D32: lea        ax, [bp - 0x5c]
0D35: push       ss
0D36: push       ax
0D37: mov        ax, 0x16a2
0D3A: push       ds
0D3B: push       ax
0D3C: lea        ax, [bp - 0x58]
0D3F: push       ss
0D40: push       ax
0D41: lea        ax, [bp - 0x54]
0D44: push       ss
0D45: push       ax
0D46: lea        ax, [bp - 0x50]
0D49: push       ss
0D4A: push       ax
0D4B: mov        ax, 0x15ea
0D4E: push       ds
0D4F: push       ax
0D50: mov        ax, 0x50
0D53: mov        dx, 0x2595
0D56: push       dx
0D57: push       ax
0D58: lcall      0x21d, 0xb21
0D5D: push       0x170
0D60: lcall      0x2ff, 0x2290
0D65: add        sp, 2
0D68: wait
0D69: fldz
0D6B: wait
0D6C: fst        dword ptr [0x1396]
0D70: wait
0D71: fstp       dword ptr [0x132a]
0D75: wait
0D76: nop
0D77: mov        ax, word ptr [0x16a2]
0D7A: mov        dx, word ptr [0x16a4]
0D7E: mov        word ptr [bp - 0x60], ax
0D81: mov        word ptr [bp - 0x5e], dx
0D84: mov        word ptr [0x1332], 1
0D8A: mov        word ptr [0x1334], 0
0D90: mov        ax, word ptr [0x1332]
0D93: mov        dx, word ptr [0x1334]
0D97: cmp        word ptr [bp - 0x5e], dx
0D9A: jl         0xdeb
0D9C: jg         0xda3
0D9E: cmp        word ptr [bp - 0x60], ax
0DA1: jb         0xdeb
0DA3: mov        bx, word ptr [0x1332]
0DA7: shl        bx, 2
0DAA: mov        es, word ptr [0xedc]
0DAE: lea        bx, [bx + 0xa0]
0DB2: wait
0DB3: fld        dword ptr es:[bx - 0x2c]
0DB7: wait
0DB8: fadd       dword ptr [0x132a]
0DBC: wait
0DBD: fstp       dword ptr [0x132a]
0DC1: wait
0DC2: nop
0DC3: mov        bx, word ptr [0x1332]
0DC7: shl        bx, 2
0DCA: lea        bx, [bx + 0x78]
0DCE: wait
0DCF: fld        dword ptr es:[bx - 0x2c]
0DD3: wait
0DD4: fadd       dword ptr [0x1396]
0DD8: wait
0DD9: fstp       dword ptr [0x1396]
0DDD: wait
0DDE: nop
0DDF: add        word ptr [0x1332], 1
0DE4: adc        word ptr [0x1334], 0
0DE9: jno        0xd90
0DEB: mov        bx, word ptr [0x1342]
0DEF: shl        bx, 2
0DF2: mov        es, word ptr [0xedc]
0DF6: lea        bx, [bx + 0x78]
0DFA: wait
0DFB: fld        dword ptr [0x1396]
0DFF: wait
0E00: fchs
0E02: wait
0E03: fstp       dword ptr es:[bx - 0x2c]
0E07: wait
0E08: nop
0E09: mov        bx, word ptr [0x1342]
0E0D: shl        bx, 2
0E10: lea        bx, [bx + 0xa0]
0E14: wait
0E15: fld        dword ptr [0x132a]
0E19: wait
0E1A: fchs
0E1C: wait
0E1D: fstp       dword ptr es:[bx - 0x2c]
0E21: wait
0E22: nop
0E23: push       0x178
0E26: lcall      0x2ff, 0x2290
0E2B: add        sp, 2
0E2E: mov        ax, word ptr [0x1342]
0E31: mov        dx, word ptr [0x1344]
0E35: mov        word ptr [bp - 0x64], ax
0E38: mov        word ptr [bp - 0x62], dx
0E3B: mov        word ptr [0x1332], 1
0E41: mov        word ptr [0x1334], 0
0E47: mov        ax, word ptr [0x1332]
0E4A: mov        dx, word ptr [0x1334]
0E4E: cmp        word ptr [bp - 0x62], dx
0E51: jl         0xe79
0E53: jg         0xe5a
0E55: cmp        word ptr [bp - 0x64], ax
0E58: jb         0xe79
0E5A: push       word ptr [0x1334]
0E5E: push       word ptr [0x1332]
0E62: push       0x180
0E65: lcall      0x2ff, 0x23ee
0E6A: add        sp, 6
0E6D: add        word ptr [0x1332], 1
0E72: adc        word ptr [0x1334], 0
0E77: jno        0xe47
0E79: push       0x182
0E7C: lcall      0x2ff, 0x23ee
0E81: add        sp, 2
0E84: mov        word ptr [0x1336], 1
0E8A: mov        word ptr [0x1338], 0
0E90: jmp        0x9a8
0E93: mov        word ptr [0x1336], 1
0E99: mov        word ptr [0x1338], 0
0E9F: jmp        0xfae
0EA2: add        word ptr [0x1332], 1
0EA7: adc        word ptr [0x1334], 0
0EAC: cmp        word ptr [0x1334], 0
0EB1: jle        0xeb6
0EB3: jmp        0xfa4
0EB6: jl         0xec2
0EB8: cmp        word ptr [0x1332], 0x33
0EBD: jbe        0xec2
0EBF: jmp        0xfa4
0EC2: push       0
0EC4: push       0xcc
0EC7: push       word ptr [0x1338]
0ECB: push       word ptr [0x1336]
0ECF: lcall      0x2ff, 0xb4
0ED4: mov        cx, ax
0ED6: mov        bx, dx
0ED8: mov        ax, word ptr [0x1332]
0EDB: mov        dx, word ptr [0x1334]
0EDF: mov        si, cx
0EE1: mov        cl, 2
0EE3: mov        di, bx
0EE5: lcall      0x2ff, 0x18a
0EEA: add        ax, si
0EEC: adc        dx, di
0EEE: add        ax, 0x46b4
0EF1: adc        dx, 1
0EF4: add        ax, 0
0EF7: adc        dx, 0
0EFA: mov        cx, 0xc
0EFD: shl        dx, cl
0EFF: add        dx, 0xa47
0F03: mov        word ptr [bp - 0x72], ax
0F06: mov        word ptr [bp - 0x70], dx
0F09: les        bx, ptr [bp - 0x72]
0F0C: wait
0F0D: fld        dword ptr es:[bx]
0F10: mov        ax, 0xb4c0
0F13: mov        dx, 1
0F16: add        ax, 0
0F19: adc        dx, 0
0F1C: shl        dx, cl
0F1E: add        dx, 0xa47
0F22: mov        es, dx
0F24: mov        bx, ax
0F26: wait
0F27: fidiv      dword ptr es:[bx]
0F2A: wait
0F2B: fmul       dword ptr [0xeea]
0F2F: les        bx, ptr [bp - 0x72]
0F32: wait
0F33: fstp       dword ptr es:[bx]
0F36: wait
0F37: nop
0F38: push       0
0F3A: push       0xcc
0F3D: push       word ptr [0x1338]
0F41: push       word ptr [0x1336]
0F45: lcall      0x2ff, 0xb4
0F4A: mov        cx, ax
0F4C: mov        bx, dx
0F4E: mov        ax, word ptr [0x1332]
0F51: mov        dx, word ptr [0x1334]
0F55: mov        si, cx
0F57: mov        cl, 2
0F59: mov        di, bx
0F5B: lcall      0x2ff, 0x18a
0F60: add        ax, si
0F62: adc        dx, di
0F64: add        ax, 0x46b4
0F67: adc        dx, 1
0F6A: add        ax, 0
0F6D: adc        dx, 0
0F70: mov        cx, 0xc
0F73: shl        dx, cl
0F75: add        dx, 0xa47
0F79: mov        es, dx
0F7B: mov        bx, ax
0F7D: wait
0F7E: fld        dword ptr es:[bx]
0F81: mov        ax, 0xb4cc
0F84: mov        dx, 1
0F87: add        ax, 0
0F8A: adc        dx, 0
0F8D: shl        dx, cl
0F8F: add        dx, 0xa47
0F93: mov        es, dx
0F95: mov        bx, ax
0F97: wait
0F98: fadd       dword ptr es:[bx]
0F9B: wait
0F9C: fstp       dword ptr es:[bx]
0F9F: wait
0FA0: nop
0FA1: jmp        0xea2
0FA4: add        word ptr [0x1336], 1
0FA9: adc        word ptr [0x1338], 0
0FAE: cmp        word ptr [0x1338], 0
0FB3: jg         0xfce
0FB5: jl         0xfbf
0FB7: cmp        word ptr [0x1336], 0x89
0FBD: ja         0xfce
0FBF: mov        word ptr [0x1332], 1
0FC5: mov        word ptr [0x1334], 0
0FCB: jmp        0xeac
0FCE: mov        word ptr [0x13ca], 5
0FD4: mov        word ptr [0x13cc], 0
0FDA: mov        ax, 0x54
0FDD: push       ds
0FDE: push       ax
0FDF: push       word ptr [0x13ca]
0FE3: push       0x19a
0FE6: lcall      0x2ff, 0x2b92
0FEB: add        sp, 8
0FEE: push       word ptr [0x13ca]
0FF2: push       0x1a0
0FF5: lcall      0x2ff, 0x2290
0FFA: add        sp, 4
0FFD: push       0x1a8
1000: lcall      0x2ff, 0x2290
1005: add        sp, 2
1008: mov        ax, 0xb4c8
100B: mov        dx, 1
100E: add        ax, 0
1011: adc        dx, 0
1014: mov        cx, 0xc
1017: shl        dx, cl
1019: add        dx, 0xa47
101D: mov        es, dx
101F: mov        bx, ax
1021: mov        ax, word ptr es:[bx]
1024: or         ax, word ptr es:[bx + 2]
1028: je         0x102d
102A: jmp        0x10f0
102D: mov        word ptr [0x1336], 1
1033: mov        word ptr [0x1338], 0
1039: jmp        0x10bc
103C: add        word ptr [0x133a], 1
1041: adc        word ptr [0x133c], 0
1046: cmp        word ptr [0x133c], 0
104B: jg         0x10a7
104D: jl         0x1057
104F: cmp        word ptr [0x133a], 0x89
1055: ja         0x10a7
1057: push       0
1059: push       0xcc
105C: push       word ptr [0x133c]
1060: push       word ptr [0x133a]
1064: lcall      0x2ff, 0xb4
1069: mov        cx, ax
106B: mov        bx, dx
106D: mov        ax, word ptr [0x1336]
1070: mov        dx, word ptr [0x1338]
1074: mov        si, cx
1076: mov        cl, 2
1078: mov        di, bx
107A: lcall      0x2ff, 0x18a
107F: add        ax, si
1081: adc        dx, di
1083: add        ax, 0x46b4
1086: adc        dx, 1
1089: add        ax, 0
108C: adc        dx, 0
108F: mov        cx, 0xc
1092: shl        dx, cl
1094: add        dx, 0xa47
1098: push       dx
1099: push       ax
109A: push       0x1be
109D: lcall      0x2ff, 0x23ee
10A2: add        sp, 6
10A5: jmp        0x103c
10A7: push       0x1c0
10AA: lcall      0x2ff, 0x23ee
10AF: add        sp, 2
10B2: add        word ptr [0x1336], 1
10B7: adc        word ptr [0x1338], 0
10BC: cmp        word ptr [0x1338], 0
10C1: jle        0x10c6
10C3: jmp        0x12f6
10C6: jl         0x10d2
10C8: cmp        word ptr [0x1336], 0x33
10CD: jbe        0x10d2
10CF: jmp        0x12f6
10D2: push       word ptr [0x13ca]
10D6: push       0x1b6
10D9: lcall      0x2ff, 0x2290
10DE: add        sp, 4
10E1: mov        word ptr [0x133a], 1
10E7: mov        word ptr [0x133c], 0
10ED: jmp        0x1046
10F0: mov        word ptr [0x1642], 1
10F6: mov        word ptr [0x1644], 0
10FC: mov        ax, 0xb4c8
10FF: mov        dx, 1
1102: add        ax, 0
1105: adc        dx, 0
1108: mov        cx, 0xc
110B: shl        dx, cl
110D: add        dx, 0xa47
1111: mov        es, dx
1113: mov        bx, ax
1115: mov        ax, word ptr es:[bx]
1118: mov        dx, word ptr es:[bx + 2]
111C: mov        word ptr [0x164a], ax
111F: mov        word ptr [0x164c], dx
1123: mov        word ptr [0x163a], 0x33
1129: mov        word ptr [0x163c], 0
112F: push       word ptr [0x13ca]
1133: push       0x1c2
1136: lcall      0x2ff, 0x2290
113B: add        sp, 4
113E: mov        ax, word ptr [0x164a]
1141: mov        dx, word ptr [0x164c]
1145: mov        word ptr [bp - 0x76], ax
1148: mov        word ptr [bp - 0x74], dx
114B: mov        ax, word ptr [0x1642]
114E: mov        dx, word ptr [0x1644]
1152: mov        word ptr [0x1336], ax
1155: mov        word ptr [0x1338], dx
1159: mov        ax, word ptr [0x1336]
115C: mov        dx, word ptr [0x1338]
1160: cmp        word ptr [bp - 0x74], dx
1163: jl         0x118b
1165: jg         0x116c
1167: cmp        word ptr [bp - 0x76], ax
116A: jb         0x118b
116C: push       word ptr [0x1338]
1170: push       word ptr [0x1336]
1174: push       0x1ca
1177: lcall      0x2ff, 0x23ee
117C: add        sp, 6
117F: add        word ptr [0x1336], 1
1184: adc        word ptr [0x1338], 0
1189: jno        0x1159
118B: push       0x1cc
118E: lcall      0x2ff, 0x23ee
1193: add        sp, 2
1196: mov        word ptr [0x1332], 1
119C: mov        word ptr [0x1334], 0
11A2: jmp        0x1231
11A5: mov        ax, word ptr [0x1336]
11A8: mov        dx, word ptr [0x1338]
11AC: cmp        word ptr [bp - 0x78], dx
11AF: jl         0x1212
11B1: jg         0x11b8
11B3: cmp        word ptr [bp - 0x7a], ax
11B6: jb         0x1212
11B8: push       0
11BA: push       0xcc
11BD: push       word ptr [0x1338]
11C1: push       word ptr [0x1336]
11C5: lcall      0x2ff, 0xb4
11CA: mov        cx, ax
11CC: mov        bx, dx
11CE: mov        ax, word ptr [0x1332]
11D1: mov        dx, word ptr [0x1334]
11D5: mov        si, cx
11D7: mov        cl, 2
11D9: mov        di, bx
11DB: lcall      0x2ff, 0x18a
11E0: add        ax, si
11E2: adc        dx, di
11E4: add        ax, 0x46b4
11E7: adc        dx, 1
11EA: add        ax, 0
11ED: adc        dx, 0
11F0: mov        cx, 0xc
11F3: shl        dx, cl
11F5: add        dx, 0xa47
11F9: push       dx
11FA: push       ax
11FB: push       0x1d6
11FE: lcall      0x2ff, 0x23ee
1203: add        sp, 6
1206: add        word ptr [0x1336], 1
120B: adc        word ptr [0x1338], 0
1210: jno        0x11a5
1212: push       0x1d8
1215: lcall      0x2ff, 0x23ee
121A: add        sp, 2
121D: sub        word ptr [0x163a], 1
1222: sbb        word ptr [0x163c], 0
1227: add        word ptr [0x1332], 1
122C: adc        word ptr [0x1334], 0
1231: cmp        word ptr [0x1334], 0
1236: jg         0x1276
1238: jl         0x1241
123A: cmp        word ptr [0x1332], 0x33
123F: ja         0x1276
1241: push       word ptr [0x163c]
1245: push       word ptr [0x163a]
1249: push       word ptr [0x13ca]
124D: push       0x1ce
1250: lcall      0x2ff, 0x2290
1255: add        sp, 8
1258: mov        ax, word ptr [0x164a]
125B: mov        dx, word ptr [0x164c]
125F: mov        word ptr [bp - 0x7a], ax
1262: mov        word ptr [bp - 0x78], dx
1265: mov        ax, word ptr [0x1642]
1268: mov        dx, word ptr [0x1644]
126C: mov        word ptr [0x1336], ax
126F: mov        word ptr [0x1338], dx
1273: jmp        0x11a5
1276: cmp        word ptr [0x164a], 0x89
127C: jne        0x1285
127E: cmp        word ptr [0x164c], 0
1283: je         0x12e7
1285: mov        ax, word ptr [0x164a]
1288: mov        dx, word ptr [0x164c]
128C: add        ax, 1
128F: adc        dx, 0
1292: mov        word ptr [0x1642], ax
1295: mov        word ptr [0x1644], dx
1299: mov        ax, 0xb4c8
129C: mov        dx, 1
129F: add        ax, 0
12A2: adc        dx, 0
12A5: mov        cx, 0xc
12A8: shl        dx, cl
12AA: add        dx, 0xa47
12AE: mov        es, dx
12B0: mov        bx, ax
12B2: mov        ax, word ptr es:[bx]
12B5: mov        dx, word ptr es:[bx + 2]
12B9: add        word ptr [0x164a], ax
12BD: adc        word ptr [0x164c], dx
12C1: cmp        word ptr [0x164c], 0
12C6: jge        0x12cb
12C8: jmp        0x112f
12CB: jg         0x12d8
12CD: cmp        word ptr [0x164a], 0x89
12D3: ja         0x12d8
12D5: jmp        0x112f
12D8: mov        word ptr [0x164a], 0x89
12DE: mov        word ptr [0x164c], 0
12E4: jmp        0x112f
12E7: push       word ptr [0x13ca]
12EB: push       0x1da
12EE: lcall      0x2ff, 0x355c
12F3: add        sp, 4
12F6: mov        ax, 0x4d
12F9: push       ds
12FA: push       ax
12FB: push       0x1dc
12FE: lcall      0x2ff, 0x2b92
1303: add        sp, 6
1306: mov        word ptr [0x1336], 1
130C: mov        word ptr [0x1338], 0
1312: jmp        0x131e
1314: add        word ptr [0x1336], 1
1319: adc        word ptr [0x1338], 0
131E: cmp        word ptr [0x1338], 0
1323: jg         0x1374
1325: jl         0x132f
1327: cmp        word ptr [0x1336], 0x89
132D: ja         0x1374
132F: mov        word ptr [0x1332], 0x34
1335: mov        word ptr [0x1334], 0
133B: push       0
133D: push       0xcc
1340: push       word ptr [0x1338]
1344: push       word ptr [0x1336]
1348: lcall      0x2ff, 0xb4
134D: add        ax, 0x46b8
1350: adc        dx, 1
1353: add        ax, 0
1356: adc        dx, 0
1359: mov        cx, 0xc
135C: shl        dx, cl
135E: add        dx, 0xa47
1362: push       dx
1363: push       ax
1364: push       0xcc
1367: push       0x1e4
136A: lcall      0x2ff, 0x361c
136F: add        sp, 8
1372: jmp        0x1314
1374: push       0x1ec
1377: lcall      0x2ff, 0x355c
137C: add        sp, 2
137F: mov        word ptr [0x13ca], 0xb
1385: mov        word ptr [0x13cc], 0
138B: mov        ax, 0x42
138E: push       ds
138F: push       ax
1390: push       word ptr [0x13ca]
1394: push       0x1f0
1397: lcall      0x2ff, 0x2b92
139C: add        sp, 8
139F: push       word ptr [0x13ca]
13A3: push       0x1f6
13A6: lcall      0x2ff, 0x2290
13AB: add        sp, 4
13AE: mov        word ptr [0x1332], 1
13B4: mov        word ptr [0x1334], 0
13BA: jmp        0x1431
13BC: add        word ptr [0x1336], 1
13C1: adc        word ptr [0x1338], 0
13C6: cmp        word ptr [0x1338], 0
13CB: jg         0x1427
13CD: jl         0x13d7
13CF: cmp        word ptr [0x1336], 0x89
13D5: ja         0x1427
13D7: push       0
13D9: push       0xcc
13DC: push       word ptr [0x1338]
13E0: push       word ptr [0x1336]
13E4: lcall      0x2ff, 0xb4
13E9: mov        cx, ax
13EB: mov        bx, dx
13ED: mov        ax, word ptr [0x1332]
13F0: mov        dx, word ptr [0x1334]
13F4: mov        si, cx
13F6: mov        cl, 2
13F8: mov        di, bx
13FA: lcall      0x2ff, 0x18a
13FF: add        ax, si
1401: adc        dx, di
1403: add        ax, 0x46b4
1406: adc        dx, 1
1409: add        ax, 0
140C: adc        dx, 0
140F: mov        cx, 0xc
1412: shl        dx, cl
1414: add        dx, 0xa47
1418: push       dx
1419: push       ax
141A: push       0x1fe
141D: lcall      0x2ff, 0x23ee
1422: add        sp, 6
1425: jmp        0x13bc
1427: add        word ptr [0x1332], 1
142C: adc        word ptr [0x1334], 0
1431: cmp        word ptr [0x1334], 0
1436: jg         0x1450
1438: jl         0x1441
143A: cmp        word ptr [0x1332], 0x33
143F: ja         0x1450
1441: mov        word ptr [0x1336], 1
1447: mov        word ptr [0x1338], 0
144D: jmp        0x13c6
1450: push       0x200
1453: lcall      0x2ff, 0x23ee
1458: add        sp, 2
145B: push       word ptr [0x13ca]
145F: push       0x202
1462: lcall      0x2ff, 0x355c
1467: add        sp, 4
146A: push       0x204
146D: lcall      0x2ff, 0x355c
1472: add        sp, 2
1475: push       0
1477: push       0
1479: push       0
147B: lcall      0x2ff, 0x2e04
1480: add        sp, 6
1483: mov        word ptr [bp - 2], 0
1488: mov        ax, word ptr [bp - 2]
148B: cdq
148C: pop        si
148D: pop        di
148E: leave
148F: retf
