1490: enter      0x1c, 0
1494: push       di
1495: push       si
1496: mov        ax, 0xb4c4
1499: mov        dx, 1
149C: add        ax, 0
149F: adc        dx, 0
14A2: mov        cx, 0xc
14A5: shl        dx, cl
14A7: add        dx, 0xa47
14AB: mov        es, dx
14AD: mov        bx, ax
14AF: cmp        word ptr es:[bx + 2], 0
14B4: jle        0x14b9
14B6: jmp        0x18c4
14B9: jl         0x14c4
14BB: cmp        word ptr es:[bx], 1
14BF: jbe        0x14c4
14C1: jmp        0x18c4
14C4: les        bx, ptr [bp + 0x1a]
14C7: wait
14C8: fld        dword ptr es:[bx]
14CB: wait
14CC: fmul       dword ptr [0xede]
14D0: wait
14D1: fstp       dword ptr [0x16ea]
14D5: wait
14D6: nop
14D7: mov        ax, 0xb4cc
14DA: mov        dx, 1
14DD: add        ax, 0
14E0: adc        dx, 0
14E3: mov        cx, 0xc
14E6: shl        dx, cl
14E8: add        dx, 0xa47
14EC: mov        es, dx
14EE: mov        bx, ax
14F0: wait
14F1: fldz
14F3: wait
14F4: fstp       dword ptr es:[bx]
14F7: wait
14F8: nop
14F9: mov        word ptr [0x16c6], 1
14FF: mov        word ptr [0x16c8], 0
1505: jmp        0x18a5
1508: add        word ptr [0x16ca], 1
150D: adc        word ptr [0x16cc], 0
1512: cmp        word ptr [0x16cc], 0
1517: jle        0x151c
1519: jmp        0x189b
151C: jl         0x1529
151E: cmp        word ptr [0x16ca], 0x89
1524: jbe        0x1529
1526: jmp        0x189b
1529: mov        ax, 0xb4b0
152C: mov        dx, 1
152F: add        ax, 0
1532: adc        dx, 0
1535: mov        cx, 0xc
1538: shl        dx, cl
153A: add        dx, 0xa47
153E: mov        es, dx
1540: mov        bx, ax
1542: mov        ax, word ptr [0x16c6]
1545: mov        dx, word ptr [0x16c8]
1549: cmp        word ptr es:[bx], ax
154C: jne        0x1562
154E: cmp        word ptr es:[bx + 2], dx
1552: jne        0x1562
1554: cmp        word ptr [0x16ca], 1
1559: jne        0x1562
155B: cmp        word ptr [0x16cc], 0
1560: je         0x1508
1562: mov        ax, word ptr [0x16c6]
1565: mov        dx, word ptr [0x16c8]
1569: sub        ax, 1
156C: sbb        dx, 0
156F: mov        word ptr [bp - 0x16], dx
1572: mov        word ptr [bp - 0x18], ax
1575: wait
1576: fild       dword ptr [bp - 0x18]
1579: les        bx, ptr [bp + 0x1a]
157C: wait
157D: fmul       dword ptr es:[bx]
1580: mov        ax, 0xb4b8
1583: mov        dx, 1
1586: add        ax, 0
1589: adc        dx, 0
158C: mov        cx, 0xc
158F: shl        dx, cl
1591: add        dx, 0xa47
1595: mov        es, dx
1597: mov        bx, ax
1599: wait
159A: fidiv      dword ptr es:[bx]
159D: wait
159E: fsub       dword ptr [0x16ea]
15A2: wait
15A3: fstp       dword ptr [0x16b2]
15A7: wait
15A8: nop
15A9: mov        ax, word ptr [0x16ca]
15AC: mov        dx, word ptr [0x16cc]
15B0: sub        ax, 1
15B3: sbb        dx, 0
15B6: mov        word ptr [bp - 0x16], dx
15B9: mov        word ptr [bp - 0x18], ax
15BC: wait
15BD: fild       dword ptr [bp - 0x18]
15C0: les        bx, ptr [bp + 0x16]
15C3: wait
15C4: fmul       dword ptr es:[bx]
15C7: mov        ax, 0xb4bc
15CA: mov        dx, 1
15CD: add        ax, 0
15D0: adc        dx, 0
15D3: shl        dx, cl
15D5: add        dx, 0xa47
15D9: mov        es, dx
15DB: mov        bx, ax
15DD: wait
15DE: fidiv      dword ptr es:[bx]
15E1: wait
15E2: fstp       dword ptr [0x16ba]
15E6: wait
15E7: nop
15E8: mov        es, word ptr [0xeee]
15EC: wait
15ED: fld        dword ptr es:[0]
15F2: wait
15F3: fmul       dword ptr [0x16b2]
15F7: wait
15F8: fstp       dword ptr [0x16de]
15FC: wait
15FD: fld        dword ptr es:[0]
1602: wait
1603: fmul       dword ptr [0x16ba]
1607: wait
1608: fst        dword ptr [0x16e2]
160C: lcall      0x2ff, 0x14d0
1611: wait
1612: fstp       xword ptr [bp - 0xa]
1615: wait
1616: fld        dword ptr [0x16de]
161A: lcall      0x2ff, 0x14b5
161F: wait
1620: fld        xword ptr [bp - 0xa]
1623: wait
1624: fmulp      st(1)
1626: mov        es, word ptr [0xeee]
162A: wait
162B: fdiv       dword ptr es:[4]
1630: mov        ax, 0xb4cc
1633: mov        dx, 1
1636: add        ax, 0
1639: adc        dx, 0
163C: mov        cx, 0xc
163F: shl        dx, cl
1641: add        dx, 0xa47
1645: mov        es, dx
1647: mov        bx, ax
1649: wait
164A: fstp       dword ptr es:[bx]
164D: wait
164E: fld        dword ptr [0x16e2]
1652: lcall      0x2ff, 0x14ca
1657: wait
1658: fstp       xword ptr [bp - 0x14]
165B: wait
165C: fld        dword ptr [0x16de]
1660: lcall      0x2ff, 0x14bb
1665: wait
1666: fld        xword ptr [bp - 0x14]
1669: wait
166A: fmulp      st(1)
166C: mov        es, word ptr [0xeee]
1670: wait
1671: fdiv       dword ptr es:[4]
1676: wait
1677: fstp       dword ptr [0x16d2]
167B: wait
167C: nop
167D: mov        ax, 0xb4cc
1680: mov        dx, 1
1683: add        ax, 0
1686: adc        dx, 0
1689: mov        cx, 0xc
168C: shl        dx, cl
168E: add        dx, 0xa47
1692: mov        es, dx
1694: mov        bx, ax
1696: wait
1697: fld        dword ptr es:[bx]
169A: mov        ax, 0xb4cc
169D: mov        dx, 1
16A0: add        ax, 0
16A3: adc        dx, 0
16A6: shl        dx, cl
16A8: add        dx, 0xa47
16AC: mov        es, dx
16AE: mov        bx, ax
16B0: wait
16B1: fmul       dword ptr es:[bx]
16B4: wait
16B5: fld        dword ptr [0x16d2]
16B9: wait
16BA: fmul       dword ptr [0x16d2]
16BE: wait
16BF: faddp      st(1)
16C1: wait
16C2: fstp       dword ptr [0x16a6]
16C6: wait
16C7: nop
16C8: push       0
16CA: push       0xcc
16CD: push       word ptr [0x16cc]
16D1: push       word ptr [0x16ca]
16D5: lcall      0x2ff, 0xb4
16DA: mov        cx, ax
16DC: mov        bx, dx
16DE: mov        ax, word ptr [0x16c6]
16E1: mov        dx, word ptr [0x16c8]
16E5: mov        si, cx
16E7: mov        cl, 2
16E9: mov        di, bx
16EB: lcall      0x2ff, 0x18a
16F0: add        ax, si
16F2: adc        dx, di
16F4: sub        ax, 0xd0
16F7: sbb        dx, 0
16FA: add        ax, 0
16FD: adc        dx, 0
1700: mov        cx, 0xc
1703: shl        dx, cl
1705: add        dx, 0xa47
1709: mov        es, dx
170B: mov        bx, ax
170D: mov        ax, 0xb4cc
1710: mov        dx, 1
1713: add        ax, 0
1716: adc        dx, 0
1719: shl        dx, cl
171B: add        dx, 0xa47
171F: mov        cx, bx
1721: mov        si, es
1723: mov        es, dx
1725: mov        bx, ax
1727: wait
1728: fld        dword ptr es:[bx]
172B: wait
172C: fdiv       dword ptr [0x16a6]
1730: mov        ax, 0xb4cc
1733: mov        dx, 1
1736: mov        bx, cx
1738: add        ax, 0
173B: adc        dx, 0
173E: mov        cx, 0xc
1741: shl        dx, cl
1743: add        dx, 0xa47
1747: mov        es, dx
1749: mov        di, ax
174B: wait
174C: fadd       dword ptr es:[di]
174F: mov        di, bx
1751: mov        es, si
1753: wait
1754: fstp       dword ptr es:[di]
1757: wait
1758: nop
1759: push       0
175B: push       0xcc
175E: push       word ptr [0x16cc]
1762: push       word ptr [0x16ca]
1766: lcall      0x2ff, 0xb4
176B: mov        cx, ax
176D: mov        bx, dx
176F: mov        ax, word ptr [0x16c6]
1772: mov        dx, word ptr [0x16c8]
1776: mov        si, cx
1778: mov        cl, 2
177A: mov        di, bx
177C: lcall      0x2ff, 0x18a
1781: add        ax, si
1783: adc        dx, di
1785: add        ax, 0x6c5c
1788: adc        dx, 0
178B: add        ax, 0
178E: adc        dx, 0
1791: mov        cx, 0xc
1794: shl        dx, cl
1796: add        dx, 0xa47
179A: mov        es, dx
179C: mov        bx, ax
179E: wait
179F: fld        dword ptr [0x16d2]
17A3: wait
17A4: fld        dword ptr [0x16d2]
17A8: wait
17A9: fdiv       dword ptr [0x16a6]
17AD: wait
17AE: fsubp      st(1)
17B0: wait
17B1: fstp       dword ptr es:[bx]
17B4: wait
17B5: fld        dword ptr [0x16de]
17B9: wait
17BA: fmul       dword ptr [0xeba]
17BE: lcall      0x2ff, 0x14bb
17C3: wait
17C4: fst        dword ptr [0x16aa]
17C8: mov        es, word ptr [0xeee]
17CC: wait
17CD: fdiv       dword ptr es:[8]
17D2: wait
17D3: fadd       dword ptr [0x16a6]
17D7: wait
17D8: fst        dword ptr [0x16e6]
17DC: wait
17DD: fcom       dword ptr [0xef0]
17E1: wait
17E2: fstp       st(0)
17E4: wait
17E5: fnstsw     ax
17E7: sahf
17E8: ja         0x17f2
17EA: wait
17EB: fldz
17ED: wait
17EE: fstp       dword ptr [0x16e6]
17F2: wait
17F3: fld        dword ptr [0x16e6]
17F7: lcall      0x2ff, 0x14da
17FC: wait
17FD: fstp       dword ptr [0x16ae]
1801: wait
1802: fld        dword ptr [0x16a6]
1806: wait
1807: fsub       dword ptr [0xed8]
180B: wait
180C: fld        st(0)
180E: wait
180F: fmul       st(1)
1811: wait
1812: fld        dword ptr [0x16d2]
1816: wait
1817: fmul       dword ptr [0x16d2]
181B: wait
181C: fmul       dword ptr [0xef4]
1820: wait
1821: faddp      st(1)
1823: lcall      0x2ff, 0x14da
1828: wait
1829: fstp       dword ptr [0x16b6]
182D: wait
182E: nop
182F: push       0
1831: push       0xcc
1834: push       word ptr [0x16cc]
1838: push       word ptr [0x16ca]
183C: lcall      0x2ff, 0xb4
1841: mov        cx, ax
1843: mov        bx, dx
1845: mov        ax, word ptr [0x16c6]
1848: mov        dx, word ptr [0x16c8]
184C: mov        si, cx
184E: mov        cl, 2
1850: mov        di, bx
1852: lcall      0x2ff, 0x18a
1857: add        ax, si
1859: adc        dx, di
185B: add        ax, 0xd988
185E: adc        dx, 0
1861: add        ax, 0
1864: adc        dx, 0
1867: mov        cx, 0xc
186A: shl        dx, cl
186C: add        dx, 0xa47
1870: mov        es, dx
1872: mov        bx, ax
1874: mov        es, word ptr [0xeee]
1878: wait
1879: fld        dword ptr es:[0]
187E: wait
187F: fdiv       dword ptr [0x16a6]
1883: wait
1884: fmul       dword ptr [0x16ae]
1888: wait
1889: fmul       dword ptr [0x16b6]
188D: mov        bx, ax
188F: mov        es, dx
1891: wait
1892: fstp       dword ptr es:[bx]
1895: wait
1896: ffree      st(0)
1898: jmp        0x1508
189B: add        word ptr [0x16c6], 1
18A0: adc        word ptr [0x16c8], 0
18A5: cmp        word ptr [0x16c8], 0
18AA: jg         0x18c4
18AC: jl         0x18b5
18AE: cmp        word ptr [0x16c6], 0x33
18B3: ja         0x18c4
18B5: mov        word ptr [0x16ca], 1
18BB: mov        word ptr [0x16cc], 0
18C1: jmp        0x1512
18C4: mov        word ptr [0x16c6], 1
18CA: mov        word ptr [0x16c8], 0
18D0: jmp        0x1c95
18D3: mov        si, word ptr [0x16c2]
18D7: shl        si, 2
18DA: push       0
18DC: push       0xcc
18DF: push       word ptr [0x16cc]
18E3: push       word ptr [0x16ca]
18E7: lcall      0x2ff, 0xb4
18EC: mov        cx, ax
18EE: mov        bx, dx
18F0: mov        ax, word ptr [0x16c6]
18F3: mov        dx, word ptr [0x16c8]
18F7: mov        di, cx
18F9: mov        cl, 2
18FB: mov        word ptr [bp - 0x18], di
18FE: mov        word ptr [bp - 0x16], bx
1901: lcall      0x2ff, 0x18a
1906: add        ax, di
1908: adc        dx, word ptr [bp - 0x16]
190B: add        ax, 0x6c5c
190E: adc        dx, 0
1911: add        ax, 0
1914: adc        dx, 0
1917: mov        cx, 0xc
191A: shl        dx, cl
191C: add        dx, 0xa47
1920: mov        es, dx
1922: mov        bx, ax
1924: wait
1925: fld        dword ptr es:[bx]
1928: mov        es, word ptr [0xedc]
192C: lea        bx, [si + 0x28]
1930: wait
1931: fadd       dword ptr es:[bx - 4]
1935: wait
1936: fstp       dword ptr [0x16ae]
193A: wait
193B: nop
193C: les        bx, ptr [bp + 6]
193F: wait
1940: fld        dword ptr es:[bx + si - 4]
1944: wait
1945: fmul       dword ptr [0xef8]
1949: wait
194A: fstp       dword ptr [0x16f6]
194E: wait
194F: fld        dword ptr [0x16a6]
1953: wait
1954: fmul       dword ptr [0x16a6]
1958: wait
1959: fstp       dword ptr [0x16d6]
195D: wait
195E: fld        dword ptr [0x16aa]
1962: wait
1963: fmul       dword ptr [0x16aa]
1967: wait
1968: fadd       dword ptr [0x16d6]
196C: wait
196D: fmul       dword ptr [0x16f6]
1971: wait
1972: fstp       dword ptr [0x16b6]
1976: wait
1977: fld        dword ptr [0x16ae]
197B: wait
197C: fmul       dword ptr [0x16ae]
1980: wait
1981: fadd       dword ptr [0x16d6]
1985: wait
1986: fmul       dword ptr [0x16f6]
198A: wait
198B: fstp       dword ptr [0x16be]
198F: wait
1990: nop
1991: mov        es, word ptr [0xedc]
1995: lea        bx, [si + 0x78]
1999: wait
199A: fld        dword ptr es:[bx - 0x2c]
199E: wait
199F: fld        dword ptr [0x16a6]
19A3: wait
19A4: fmul       st(1)
19A6: wait
19A7: fld        st(0)
19A9: wait
19AA: fdiv       dword ptr [0x16b6]
19AE: wait
19AF: fld        st(1)
19B1: wait
19B2: fdiv       dword ptr [0x16be]
19B6: wait
19B7: faddp      st(1)
19B9: wait
19BA: fadd       dword ptr [0x16ee]
19BE: wait
19BF: fstp       dword ptr [0x16ee]
19C3: wait
19C4: fld        dword ptr [0x16aa]
19C8: wait
19C9: fmul       st(2)
19CB: wait
19CC: fdiv       dword ptr [0x16b6]
19D0: wait
19D1: fld        dword ptr [0x16ae]
19D5: wait
19D6: fmul       st(3)
19D8: wait
19D9: fdiv       dword ptr [0x16be]
19DD: wait
19DE: faddp      st(1)
19E0: wait
19E1: fadd       dword ptr [0x16f2]
19E5: wait
19E6: fstp       dword ptr [0x16f2]
19EA: wait
19EB: ffree      st(1)
19ED: wait
19EE: ffree      st(0)
19F0: add        word ptr [0x16c2], 1
19F5: adc        word ptr [0x16c4], 0
19FA: jno        0x19ff
19FC: jmp        0x1b35
19FF: mov        ax, word ptr [0x16c2]
1A02: mov        dx, word ptr [0x16c4]
1A06: cmp        word ptr [bp - 0x1a], dx
1A09: jge        0x1a0e
1A0B: jmp        0x1b35
1A0E: jg         0x1a18
1A10: cmp        word ptr [bp - 0x1c], ax
1A13: jae        0x1a18
1A15: jmp        0x1b35
1A18: mov        si, word ptr [0x16c2]
1A1C: shl        si, 2
1A1F: push       0
1A21: push       0xcc
1A24: push       word ptr [0x16cc]
1A28: push       word ptr [0x16ca]
1A2C: lcall      0x2ff, 0xb4
1A31: mov        cx, ax
1A33: mov        bx, dx
1A35: mov        ax, word ptr [0x16c6]
1A38: mov        dx, word ptr [0x16c8]
1A3C: mov        di, cx
1A3E: mov        cl, 2
1A40: mov        word ptr [bp - 0x18], di
1A43: mov        word ptr [bp - 0x16], bx
1A46: lcall      0x2ff, 0x18a
1A4B: add        ax, di
1A4D: adc        dx, word ptr [bp - 0x16]
1A50: mov        word ptr [bp - 0x14], ax
1A53: mov        word ptr [bp - 0x12], dx
1A56: sub        ax, 0xd0
1A59: sbb        dx, 0
1A5C: add        ax, 0
1A5F: adc        dx, 0
1A62: mov        cx, 0xc
1A65: shl        dx, cl
1A67: add        dx, 0xa47
1A6B: mov        es, dx
1A6D: mov        bx, ax
1A6F: wait
1A70: fld        dword ptr es:[bx]
1A73: mov        es, word ptr [0xedc]
1A77: lea        bx, [si]
1A7B: wait
1A7C: fsub       dword ptr es:[bx - 4]
1A80: wait
1A81: fstp       dword ptr [0x16a6]
1A85: wait
1A86: nop
1A87: mov        ax, word ptr [bp - 0x14]
1A8A: mov        dx, word ptr [bp - 0x12]
1A8D: add        ax, 0x6c5c
1A90: adc        dx, 0
1A93: add        ax, 0
1A96: adc        dx, 0
1A99: shl        dx, cl
1A9B: add        dx, 0xa47
1A9F: mov        es, dx
1AA1: mov        bx, ax
1AA3: wait
1AA4: fld        dword ptr es:[bx]
1AA7: mov        es, word ptr [0xedc]
1AAB: lea        bx, [si + 0x28]
1AAF: wait
1AB0: fsub       dword ptr es:[bx - 4]
1AB4: wait
1AB5: fstp       dword ptr [0x16aa]
1AB9: wait
1ABA: fld        dword ptr [0x16a6]
1ABE: wait
1ABF: fmul       dword ptr [0x16a6]
1AC3: wait
1AC4: fld        dword ptr [0x16aa]
1AC8: wait
1AC9: fmul       dword ptr [0x16aa]
1ACD: wait
1ACE: faddp      st(1)
1AD0: lcall      0x2ff, 0x14da
1AD5: wait
1AD6: fstp       dword ptr [0x16ce]
1ADA: wait
1ADB: nop
1ADC: les        bx, ptr [bp + 0xa]
1ADF: wait
1AE0: fld        dword ptr es:[bx + si - 4]
1AE4: mov        es, word ptr [0xeca]
1AE8: lea        bx, [si + 0x28]
1AEC: wait
1AED: fmul       dword ptr es:[bx - 4]
1AF1: wait
1AF2: fmul       dword ptr [0xede]
1AF6: wait
1AF7: fcom       dword ptr [0x16ce]
1AFB: wait
1AFC: fstp       st(0)
1AFE: wait
1AFF: fnstsw     ax
1B01: sahf
1B02: jae        0x1b07
1B04: jmp        0x18d3
1B07: mov        es, word ptr [0xedc]
1B0B: lea        bx, [si + 0x78]
1B0F: wait
1B10: fld        dword ptr es:[bx - 0x2c]
1B14: wait
1B15: fdiv       dword ptr [0xebe]
1B19: les        bx, ptr [bp + 6]
1B1C: wait
1B1D: fdiv       dword ptr es:[bx + si - 4]
1B21: les        bx, ptr [bp + 0xa]
1B24: wait
1B25: fdiv       dword ptr es:[bx + si - 4]
1B29: wait
1B2A: fld        st(0)
1B2C: wait
1B2D: fstp       xword ptr [bp - 0xa]
1B30: wait
1B31: fld        st(0)
1B33: jmp        0x1b9f
1B35: push       0
1B37: push       0xcc
1B3A: push       word ptr [0x16cc]
1B3E: push       word ptr [0x16ca]
1B42: lcall      0x2ff, 0xb4
1B47: mov        cx, ax
1B49: mov        bx, dx
1B4B: mov        ax, word ptr [0x16c6]
1B4E: mov        dx, word ptr [0x16c8]
1B52: mov        si, cx
1B54: mov        cl, 2
1B56: mov        di, bx
1B58: lcall      0x2ff, 0x18a
1B5D: add        ax, si
1B5F: adc        dx, di
1B61: add        ax, 0xd988
1B64: adc        dx, 0
1B67: add        ax, 0
1B6A: adc        dx, 0
1B6D: mov        cx, 0xc
1B70: shl        dx, cl
1B72: add        dx, 0xa47
1B76: mov        es, dx
1B78: mov        bx, ax
1B7A: wait
1B7B: fld        dword ptr es:[bx]
1B7E: wait
1B7F: fld        st(0)
1B81: wait
1B82: fstp       xword ptr [bp - 0x14]
1B85: wait
1B86: fld        dword ptr [0x16ee]
1B8A: wait
1B8B: fmul       dword ptr [0x16ee]
1B8F: wait
1B90: fld        dword ptr [0x16f2]
1B94: wait
1B95: fmul       dword ptr [0x16f2]
1B99: wait
1B9A: faddp      st(1)
1B9C: wait
1B9D: fmul       st(1)
1B9F: wait
1BA0: fmul       st(1)
1BA2: wait
1BA3: fstp       dword ptr [0x16da]
1BA7: wait
1BA8: ffree      st(0)
1BAA: push       0
1BAC: push       0xcc
1BAF: push       word ptr [0x16cc]
1BB3: push       word ptr [0x16ca]
1BB7: lcall      0x2ff, 0xb4
1BBC: mov        cx, ax
1BBE: mov        bx, dx
1BC0: mov        ax, word ptr [0x16c6]
1BC3: mov        dx, word ptr [0x16c8]
1BC7: mov        si, cx
1BC9: mov        cl, 2
1BCB: mov        di, bx
1BCD: lcall      0x2ff, 0x18a
1BD2: add        ax, si
1BD4: adc        dx, di
1BD6: add        ax, 0x46b4
1BD9: adc        dx, 1
1BDC: add        ax, 0
1BDF: adc        dx, 0
1BE2: mov        cx, 0xc
1BE5: shl        dx, cl
1BE7: add        dx, 0xa47
1BEB: mov        es, dx
1BED: mov        bx, ax
1BEF: les        bx, ptr [bp + 0x12]
1BF2: wait
1BF3: fld        dword ptr es:[bx]
1BF6: wait
1BF7: fmul       dword ptr [0x16da]
1BFB: mov        bx, ax
1BFD: mov        es, dx
1BFF: wait
1C00: fadd       dword ptr es:[bx]
1C03: wait
1C04: fstp       dword ptr es:[bx]
1C07: wait
1C08: nop
1C09: add        word ptr [0x16ca], 1
1C0E: adc        word ptr [0x16cc], 0
1C13: cmp        word ptr [0x16cc], 0
1C18: jg         0x1c8b
1C1A: jl         0x1c24
1C1C: cmp        word ptr [0x16ca], 0x89
1C22: ja         0x1c8b
1C24: mov        ax, 0xb4b0
1C27: mov        dx, 1
1C2A: add        ax, 0
1C2D: adc        dx, 0
1C30: mov        cx, 0xc
1C33: shl        dx, cl
1C35: add        dx, 0xa47
1C39: mov        es, dx
1C3B: mov        bx, ax
1C3D: mov        ax, word ptr [0x16c6]
1C40: mov        dx, word ptr [0x16c8]
1C44: cmp        word ptr es:[bx], ax
1C47: jne        0x1c5d
1C49: cmp        word ptr es:[bx + 2], dx
1C4D: jne        0x1c5d
1C4F: cmp        word ptr [0x16ca], 1
1C54: jne        0x1c5d
1C56: cmp        word ptr [0x16cc], 0
1C5B: je         0x1c09
1C5D: wait
1C5E: fldz
1C60: wait
1C61: fst        dword ptr [0x16ee]
1C65: wait
1C66: fstp       dword ptr [0x16f2]
1C6A: wait
1C6B: nop
1C6C: les        bx, ptr [bp + 0xe]
1C6F: mov        ax, word ptr es:[bx]
1C72: mov        dx, word ptr es:[bx + 2]
1C76: mov        word ptr [bp - 0x1c], ax
1C79: mov        word ptr [bp - 0x1a], dx
1C7C: mov        word ptr [0x16c2], 1
1C82: mov        word ptr [0x16c4], 0
1C88: jmp        0x19ff
1C8B: add        word ptr [0x16c6], 1
1C90: adc        word ptr [0x16c8], 0
1C95: cmp        word ptr [0x16c8], 0
1C9A: jg         0x1cb4
1C9C: jl         0x1ca5
1C9E: cmp        word ptr [0x16c6], 0x33
1CA3: ja         0x1cb4
1CA5: mov        word ptr [0x16ca], 1
1CAB: mov        word ptr [0x16cc], 0
1CB1: jmp        0x1c13
1CB4: mov        ax, 0xb4b0
1CB7: mov        dx, 1
1CBA: add        ax, 0
1CBD: adc        dx, 0
1CC0: mov        cx, 0xc
1CC3: shl        dx, cl
1CC5: add        dx, 0xa47
1CC9: mov        es, dx
1CCB: mov        bx, ax
1CCD: mov        ax, word ptr es:[bx]
1CD0: or         ax, word ptr es:[bx + 2]
1CD4: jne        0x1cd9
1CD6: jmp        0x1d67
1CD9: mov        ax, 0xb4b0
1CDC: mov        dx, 1
1CDF: add        ax, 0
1CE2: adc        dx, 0
1CE5: shl        dx, cl
1CE7: add        dx, 0xa47
1CEB: mov        es, dx
1CED: mov        bx, ax
1CEF: mov        ax, word ptr es:[bx]
1CF2: mov        dx, word ptr es:[bx + 2]
1CF6: mov        cl, 2
1CF8: lcall      0x2ff, 0x18a
1CFD: mov        word ptr [bp - 0x14], ax
1D00: mov        word ptr [bp - 0x12], dx
1D03: add        ax, 0x477c
1D06: adc        dx, 1
1D09: add        ax, 0
1D0C: adc        dx, 0
1D0F: mov        cx, 0xc
1D12: shl        dx, cl
1D14: add        dx, 0xa47
1D18: mov        es, dx
1D1A: mov        bx, ax
1D1C: wait
1D1D: fld        dword ptr es:[bx]
1D20: mov        ax, word ptr [bp - 0x14]
1D23: mov        dx, word ptr [bp - 0x12]
1D26: add        ax, 0x4784
1D29: adc        dx, 1
1D2C: add        ax, 0
1D2F: adc        dx, 0
1D32: shl        dx, cl
1D34: add        dx, 0xa47
1D38: mov        es, dx
1D3A: mov        bx, ax
1D3C: wait
1D3D: fadd       dword ptr es:[bx]
1D40: wait
1D41: fmul       dword ptr [0xede]
1D45: mov        ax, word ptr [bp - 0x14]
1D48: mov        dx, word ptr [bp - 0x12]
1D4B: add        ax, 0x4780
1D4E: adc        dx, 1
1D51: add        ax, 0
1D54: adc        dx, 0
1D57: shl        dx, cl
1D59: add        dx, 0xa47
1D5D: mov        es, dx
1D5F: mov        bx, ax
1D61: wait
1D62: fstp       dword ptr es:[bx]
1D65: wait
1D66: nop
1D67: pop        si
1D68: pop        di
1D69: leave
1D6A: retf       0x18
