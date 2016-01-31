VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName Virtex
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL A(15:0)
        SIGNAL B(15:0)
        SIGNAL RegA(2:0)
        SIGNAL RegB(2:0)
        SIGNAL RegW(2:0)
        SIGNAL Overflow
        SIGNAL Zero
        SIGNAL ldata(15:0)
        SIGNAL la(18:0)
        SIGNAL ppstatus(6:3)
        SIGNAL Dout(15:0)
        SIGNAL WrDone
        SIGNAL RdDone
        SIGNAL clock
        SIGNAL lcen
        SIGNAL loen
        SIGNAL lwen
        SIGNAL S(15:0)
        SIGNAL RegWrEn
        SIGNAL MemRd
        SIGNAL MemWr
        SIGNAL ResetL
        SIGNAL RegBusW(15:0)
        SIGNAL AluA(15:0)
        SIGNAL AluB(15:0)
        SIGNAL control(3:0)
        SIGNAL RdAddr(17:0)
        SIGNAL WrAddr(17:0)
        SIGNAL Din(15:0)
        SIGNAL XLXN_1
        SIGNAL clk
        SIGNAL lc
        SIGNAL zr
        SIGNAL lw
        SIGNAL lo
        SIGNAL ppstatus(6)
        SIGNAL ppstatus(5)
        SIGNAL ppstatus(4)
        SIGNAL ppstatus(3)
        SIGNAL ppstatus6
        SIGNAL ppstatus5
        SIGNAL ppstatus4
        SIGNAL ppstatus3
        SIGNAL laddr16
        SIGNAL laddr17
        SIGNAL laddr18
        SIGNAL laddr(15:0)
        SIGNAL la(15:0)
        SIGNAL la(16)
        SIGNAL la(17)
        SIGNAL la(18)
        SIGNAL ppdata(7:0)
        SIGNAL pp(7:0)
        SIGNAL Reset
        SIGNAL ovf
        SIGNAL PCwrEn
        SIGNAL PCwr(15:0)
        SIGNAL PC(15:0)
        SIGNAL rst
        SIGNAL st
        SIGNAL invResetL
        SIGNAL fin
        SIGNAL finish
        SIGNAL Start
        SIGNAL XLXN_10
        PORT Input clock
        PORT Output Overflow
        PORT Output Zero
        PORT Output lcen
        PORT Output loen
        PORT Output lwen
        PORT Output ppstatus6
        PORT Output ppstatus5
        PORT Output ppstatus4
        PORT Output ppstatus3
        PORT Output laddr(15:0)
        PORT Output laddr16
        PORT Output laddr17
        PORT Output laddr18
        PORT BiDirectional ldata(15:0)
        PORT Input ppdata(7:0)
        PORT Input Reset
        PORT Output finish
        PORT Input Start
        BEGIN BLOCKDEF alu
            TIMESTAMP 2004 8 1 14 34 26
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF memorymodule
            TIMESTAMP 2004 7 24 16 1 49
            RECTANGLE N 64 -576 320 0 
            LINE N 64 -544 0 -544 
            LINE N 64 -480 0 -480 
            LINE N 64 -416 0 -416 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF regfile
            TIMESTAMP 2004 7 20 17 18 4
            RECTANGLE N 64 -384 320 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -352 384 -352 
            RECTANGLE N 320 -364 384 -340 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2001 2 2 12 24 32
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF ibuf
            TIMESTAMP 2001 2 2 12 24 32
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF bufg
            TIMESTAMP 2001 2 2 12 22 16
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF obuf4
            TIMESTAMP 2001 2 2 12 24 32
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 64 -128 64 -192 
            LINE N 128 -160 64 -128 
            LINE N 64 -192 128 -160 
            LINE N 64 -192 64 -256 
            LINE N 128 -224 64 -192 
            LINE N 64 -256 128 -224 
            LINE N 224 -224 128 -224 
            LINE N 224 -160 128 -160 
            LINE N 0 -96 64 -96 
            LINE N 224 -96 128 -96 
            LINE N 64 -64 64 -128 
            LINE N 128 -96 64 -64 
            LINE N 64 -128 128 -96 
            LINE N 0 -160 64 -160 
            LINE N 0 -224 64 -224 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF obuf16
            TIMESTAMP 2001 2 2 12 24 32
            LINE N 224 -32 128 -32 
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 0 -32 64 -32 
            RECTANGLE N 128 -44 224 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF ibuf8
            TIMESTAMP 2001 2 2 12 24 32
            RECTANGLE N 128 -44 224 -20 
            LINE N 224 -32 128 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF ctrlunit
            TIMESTAMP 2004 8 6 11 3 40
            RECTANGLE N 64 -1088 320 0 
            LINE N 64 -1056 0 -1056 
            LINE N 64 -960 0 -960 
            LINE N 64 -864 0 -864 
            LINE N 64 -768 0 -768 
            LINE N 64 -672 0 -672 
            LINE N 64 -576 0 -576 
            RECTANGLE N 0 -588 64 -564 
            LINE N 64 -480 0 -480 
            RECTANGLE N 0 -492 64 -468 
            LINE N 64 -384 0 -384 
            RECTANGLE N 0 -396 64 -372 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -192 0 -192 
            RECTANGLE N 0 -204 64 -180 
            LINE N 320 -1056 384 -1056 
            LINE N 320 -992 384 -992 
            LINE N 320 -928 384 -928 
            LINE N 320 -864 384 -864 
            LINE N 320 -800 384 -800 
            LINE N 320 -736 384 -736 
            LINE N 320 -672 384 -672 
            RECTANGLE N 320 -684 384 -660 
            LINE N 320 -608 384 -608 
            RECTANGLE N 320 -620 384 -596 
            LINE N 320 -544 384 -544 
            RECTANGLE N 320 -556 384 -532 
            LINE N 320 -480 384 -480 
            RECTANGLE N 320 -492 384 -468 
            LINE N 320 -416 384 -416 
            RECTANGLE N 320 -428 384 -404 
            LINE N 320 -352 384 -352 
            RECTANGLE N 320 -364 384 -340 
            LINE N 320 -288 384 -288 
            RECTANGLE N 320 -300 384 -276 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF fd16ce
            TIMESTAMP 2001 2 2 12 23 58
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            RECTANGLE N 320 -268 384 -244 
            RECTANGLE N 0 -268 64 -244 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2001 2 2 12 25 36
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 alu
            PIN A(15:0) AluA(15:0)
            PIN B(15:0) AluB(15:0)
            PIN control(3:0) control(3:0)
            PIN Overflow ovf
            PIN S(15:0) S(15:0)
            PIN Zero zr
        END BLOCK
        BEGIN BLOCK XLXI_3 regfile
            PIN WrEn RegWrEn
            PIN BusW(15:0) RegBusW(15:0)
            PIN Clock clk
            PIN Ra(2:0) RegA(2:0)
            PIN Rb(2:0) RegB(2:0)
            PIN Rw(2:0) RegW(2:0)
            PIN BusA(15:0) A(15:0)
            PIN BusB(15:0) B(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_9 obuf
            PIN I ovf
            PIN O Overflow
        END BLOCK
        BEGIN BLOCK XLXI_10 obuf
            PIN I zr
            PIN O Zero
        END BLOCK
        BEGIN BLOCK XLXI_11 obuf
            PIN I lc
            PIN O lcen
        END BLOCK
        BEGIN BLOCK XLXI_12 obuf
            PIN I lo
            PIN O loen
        END BLOCK
        BEGIN BLOCK XLXI_13 obuf
            PIN I lw
            PIN O lwen
        END BLOCK
        BEGIN BLOCK XLXI_16 ibuf
            PIN I clock
            PIN O XLXN_1
        END BLOCK
        BEGIN BLOCK XLXI_17 bufg
            PIN I XLXN_1
            PIN O clk
        END BLOCK
        BEGIN BLOCK XLXI_18 obuf4
            PIN I0 ppstatus(6)
            PIN I1 ppstatus(5)
            PIN I2 ppstatus(4)
            PIN I3 ppstatus(3)
            PIN O0 ppstatus6
            PIN O1 ppstatus5
            PIN O2 ppstatus4
            PIN O3 ppstatus3
        END BLOCK
        BEGIN BLOCK XLXI_19 obuf16
            PIN I(15:0) la(15:0)
            PIN O(15:0) laddr(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_20 obuf
            PIN I la(16)
            PIN O laddr16
        END BLOCK
        BEGIN BLOCK XLXI_21 obuf
            PIN I la(17)
            PIN O laddr17
        END BLOCK
        BEGIN BLOCK XLXI_22 obuf
            PIN I la(18)
            PIN O laddr18
        END BLOCK
        BEGIN BLOCK XLXI_27 ibuf
            PIN I Reset
            PIN O rst
        END BLOCK
        BEGIN BLOCK XLXI_28 ibuf8
            PIN I(7:0) ppdata(7:0)
            PIN O(7:0) pp(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_30 memorymodule
            PIN MemRd MemRd
            PIN MemWr MemWr
            PIN ResetL ResetL
            PIN clk clk
            PIN RdAddr(17:0) RdAddr(17:0)
            PIN WrAddr(17:0) WrAddr(17:0)
            PIN Din(15:0) Din(15:0)
            PIN ppdata(7:0) pp(7:0)
            PIN RdDone RdDone
            PIN WrDone WrDone
            PIN lcen lc
            PIN loen lo
            PIN lwen lw
            PIN Dout(15:0) Dout(15:0)
            PIN ppstatus(6:3) ppstatus(6:3)
            PIN laddr(18:0) la(18:0)
            PIN ldata(15:0) ldata(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_31 ctrlunit
            PIN CLK clk
            PIN Reset rst
            PIN RdDone RdDone
            PIN WrDone WrDone
            PIN Start st
            PIN PC(15:0) PC(15:0)
            PIN Dout(15:0) Dout(15:0)
            PIN A(15:0) A(15:0)
            PIN B(15:0) B(15:0)
            PIN S(15:0) S(15:0)
            PIN zfin fin
            PIN PCwrEN PCwrEn
            PIN MemRd MemRd
            PIN RegWrEn RegWrEn
            PIN MemWr MemWr
            PIN ResetL ResetL
            PIN PCwr(15:0) PCwr(15:0)
            PIN RdAddr(17:0) RdAddr(17:0)
            PIN AluA(15:0) AluA(15:0)
            PIN AluB(15:0) AluB(15:0)
            PIN ctrl(3:0) control(3:0)
            PIN RegA(2:0) RegA(2:0)
            PIN RegB(2:0) RegB(2:0)
            PIN RegW(2:0) RegW(2:0)
            PIN RegBusW(15:0) RegBusW(15:0)
            PIN Din(15:0) Din(15:0)
            PIN WrAddr(17:0) WrAddr(17:0)
        END BLOCK
        BEGIN BLOCK XLXI_33 fd16ce
            PIN C clk
            PIN CE PCwrEn
            PIN CLR invResetL
            PIN D(15:0) PCwr(15:0)
            PIN Q(15:0) PC(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_34 inv
            PIN I ResetL
            PIN O invResetL
        END BLOCK
        BEGIN BLOCK XLXI_35 obuf
            PIN I fin
            PIN O finish
        END BLOCK
        BEGIN BLOCK XLXI_36 inv
            PIN I XLXN_10
            PIN O st
        END BLOCK
        BEGIN BLOCK XLXI_37 ibuf
            PIN I Start
            PIN O XLXN_10
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH A(15:0)
            WIRE 1376 320 1472 320
            WIRE 1472 320 1488 320
            BEGIN DISPLAY 1472 320 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(15:0)
            WIRE 1376 512 1472 512
            WIRE 1472 512 1488 512
            DISPLAY 1488 512 ATTR Name
        END BRANCH
        BEGIN BRANCH S(15:0)
            WIRE 1360 944 1424 944
            WIRE 1424 944 1456 944
            WIRE 1456 944 1488 944
            WIRE 1488 944 1504 944
            BEGIN DISPLAY 1424 944 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH AluA(15:0)
            WIRE 800 880 816 880
            WIRE 816 880 832 880
            WIRE 832 880 976 880
            BEGIN DISPLAY 832 880 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH control(3:0)
            WIRE 832 1008 896 1008
            WIRE 896 1008 976 1008
            BEGIN DISPLAY 896 1008 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH AluB(15:0)
            WIRE 800 944 816 944
            WIRE 816 944 976 944
            BEGIN DISPLAY 816 944 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBusW(15:0)
            WIRE 848 384 896 384
            WIRE 896 384 992 384
            BEGIN DISPLAY 896 384 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWrEn
            WIRE 848 320 896 320
            WIRE 896 320 992 320
            BEGIN DISPLAY 896 320 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clk
            WIRE 848 448 864 448
            WIRE 864 448 992 448
            BEGIN DISPLAY 848 448 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegA(2:0)
            WIRE 848 512 912 512
            WIRE 912 512 992 512
            BEGIN DISPLAY 912 512 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegB(2:0)
            WIRE 848 576 912 576
            WIRE 912 576 992 576
            BEGIN DISPLAY 912 576 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegW(2:0)
            WIRE 848 640 912 640
            WIRE 912 640 992 640
            BEGIN DISPLAY 912 640 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ovf
            WIRE 1360 880 1488 880
            WIRE 1488 880 1504 880
            DISPLAY 1504 880 ATTR Name
        END BRANCH
        BEGIN BRANCH zr
            WIRE 1360 1008 1488 1008
            WIRE 1488 1008 1504 1008
            DISPLAY 1504 1008 ATTR Name
        END BRANCH
        BEGIN BRANCH MemRd
            WIRE 1952 304 1984 304
            WIRE 1984 304 2048 304
            BEGIN DISPLAY 1984 304 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 1952 368 2000 368
            WIRE 2000 368 2048 368
            BEGIN DISPLAY 2000 368 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ResetL
            WIRE 1952 432 1984 432
            WIRE 1984 432 2048 432
            BEGIN DISPLAY 1984 432 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clk
            WIRE 1952 496 1968 496
            WIRE 1968 496 2048 496
            BEGIN DISPLAY 1952 496 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RdAddr(17:0)
            WIRE 1952 560 1984 560
            WIRE 1984 560 2048 560
            BEGIN DISPLAY 1984 560 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrAddr(17:0)
            WIRE 1952 624 1984 624
            WIRE 1984 624 2048 624
            BEGIN DISPLAY 1984 624 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Din(15:0)
            WIRE 1952 688 1968 688
            WIRE 1968 688 2048 688
            BEGIN DISPLAY 1968 688 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH pp(7:0)
            WIRE 1952 752 1984 752
            WIRE 1984 752 2048 752
            BEGIN DISPLAY 1984 752 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ldata(15:0)
            WIRE 2432 816 2464 816
            WIRE 2464 816 2528 816
            BEGIN DISPLAY 2464 816 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH la(18:0)
            WIRE 2432 752 2464 752
            WIRE 2464 752 2480 752
            WIRE 2480 752 2528 752
            BEGIN DISPLAY 2464 752 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ppstatus(6:3)
            WIRE 2432 688 2464 688
            WIRE 2464 688 2480 688
            WIRE 2480 688 2528 688
            BEGIN DISPLAY 2464 688 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Dout(15:0)
            WIRE 2432 624 2464 624
            WIRE 2464 624 2528 624
            BEGIN DISPLAY 2464 624 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lw
            WIRE 2432 560 2448 560
            WIRE 2448 560 2464 560
            WIRE 2464 560 2528 560
            BEGIN DISPLAY 2464 560 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lo
            WIRE 2432 496 2448 496
            WIRE 2448 496 2528 496
            BEGIN DISPLAY 2448 496 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lc
            WIRE 2432 432 2448 432
            WIRE 2448 432 2464 432
            WIRE 2464 432 2528 432
            BEGIN DISPLAY 2448 432 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrDone
            WIRE 2432 368 2448 368
            WIRE 2448 368 2464 368
            WIRE 2464 368 2528 368
            BEGIN DISPLAY 2464 368 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RdDone
            WIRE 2432 304 2448 304
            WIRE 2448 304 2528 304
            BEGIN DISPLAY 2448 304 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clock
            WIRE 208 752 432 752
        END BRANCH
        BEGIN INSTANCE XLXI_3 992 672 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_1 976 1040 R0
        END INSTANCE
        BEGIN BRANCH Overflow
            WIRE 2080 1040 2128 1040
            WIRE 2128 1040 2224 1040
            WIRE 2224 1040 2240 1040
            BEGIN DISPLAY 2128 1040 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Zero
            WIRE 2080 1120 2112 1120
            WIRE 2112 1120 2224 1120
            WIRE 2224 1120 2240 1120
            BEGIN DISPLAY 2112 1120 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lcen
            WIRE 2080 1184 2112 1184
            WIRE 2112 1184 2240 1184
            BEGIN DISPLAY 2112 1184 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH loen
            WIRE 2080 1264 2112 1264
            WIRE 2112 1264 2240 1264
            BEGIN DISPLAY 2112 1264 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 2240 1040 Overflow
        IOMARKER 2240 1120 Zero
        BEGIN BRANCH lwen
            WIRE 2080 1344 2112 1344
            WIRE 2112 1344 2240 1344
            BEGIN DISPLAY 2112 1344 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_9 1856 1072 R0
        INSTANCE XLXI_10 1856 1152 R0
        BEGIN BRANCH XLXN_1
            WIRE 656 752 704 752
        END BRANCH
        BEGIN BRANCH clk
            WIRE 928 752 944 752
            WIRE 944 752 976 752
            BEGIN DISPLAY 944 752 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ovf
            WIRE 1808 1040 1824 1040
            WIRE 1824 1040 1856 1040
            BEGIN DISPLAY 1824 1040 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH zr
            WIRE 1808 1120 1824 1120
            WIRE 1824 1120 1856 1120
            BEGIN DISPLAY 1824 1120 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lc
            WIRE 1808 1184 1824 1184
            WIRE 1824 1184 1856 1184
            BEGIN DISPLAY 1824 1184 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lo
            WIRE 1808 1264 1824 1264
            WIRE 1824 1264 1856 1264
            BEGIN DISPLAY 1824 1264 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lw
            WIRE 1808 1344 1824 1344
            WIRE 1824 1344 1856 1344
            BEGIN DISPLAY 1824 1344 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 2240 1184 lcen
        IOMARKER 2240 1264 loen
        IOMARKER 2240 1344 lwen
        INSTANCE XLXI_11 1856 1216 R0
        INSTANCE XLXI_12 1856 1296 R0
        INSTANCE XLXI_13 1856 1376 R0
        INSTANCE XLXI_18 1984 1792 R0
        BEGIN BRANCH ppstatus(6)
            WIRE 1872 1568 1888 1568
            WIRE 1888 1568 1984 1568
            BEGIN DISPLAY 1888 1568 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ppstatus(5)
            WIRE 1872 1632 1888 1632
            WIRE 1888 1632 1984 1632
            BEGIN DISPLAY 1888 1632 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ppstatus(4)
            WIRE 1872 1696 1888 1696
            WIRE 1888 1696 1984 1696
            BEGIN DISPLAY 1888 1696 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ppstatus(3)
            WIRE 1872 1760 1888 1760
            WIRE 1888 1760 1984 1760
            BEGIN DISPLAY 1888 1760 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ppstatus6
            WIRE 2208 1568 2256 1568
            WIRE 2256 1568 2352 1568
        END BRANCH
        BEGIN BRANCH ppstatus5
            WIRE 2208 1632 2256 1632
            WIRE 2256 1632 2352 1632
        END BRANCH
        BEGIN BRANCH ppstatus4
            WIRE 2208 1696 2256 1696
            WIRE 2256 1696 2352 1696
        END BRANCH
        BEGIN BRANCH ppstatus3
            WIRE 2208 1760 2256 1760
            WIRE 2256 1760 2352 1760
        END BRANCH
        IOMARKER 2352 1568 ppstatus6
        IOMARKER 2352 1632 ppstatus5
        IOMARKER 2352 1696 ppstatus4
        IOMARKER 2352 1760 ppstatus3
        INSTANCE XLXI_19 1920 1920 R0
        INSTANCE XLXI_20 1920 1984 R0
        INSTANCE XLXI_21 1920 2048 R0
        INSTANCE XLXI_22 1920 2112 R0
        BEGIN BRANCH laddr16
            WIRE 2144 1952 2256 1952
        END BRANCH
        BEGIN BRANCH laddr17
            WIRE 2144 2016 2256 2016
        END BRANCH
        BEGIN BRANCH laddr18
            WIRE 2144 2080 2256 2080
        END BRANCH
        BEGIN BRANCH laddr(15:0)
            WIRE 2144 1888 2256 1888
        END BRANCH
        BEGIN BRANCH la(15:0)
            WIRE 1856 1888 1920 1888
            BEGIN DISPLAY 1856 1888 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH la(16)
            WIRE 1856 1952 1920 1952
            BEGIN DISPLAY 1856 1952 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH la(17)
            WIRE 1856 2016 1920 2016
            BEGIN DISPLAY 1856 2016 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH la(18)
            WIRE 1856 2080 1920 2080
            BEGIN DISPLAY 1856 2080 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 2256 1888 laddr(15:0)
        IOMARKER 2256 1952 laddr16
        IOMARKER 2256 2016 laddr17
        IOMARKER 2256 2080 laddr18
        BEGIN BRANCH ldata(15:0)
            WIRE 2032 2256 2192 2256
            WIRE 2192 2256 2208 2256
            WIRE 2208 2256 2240 2256
            WIRE 2240 2256 2256 2256
        END BRANCH
        IOMARKER 2256 2256 ldata(15:0)
        BEGIN BRANCH ppdata(7:0)
            WIRE 2192 2416 2256 2416
            WIRE 2256 2416 2272 2416
        END BRANCH
        BEGIN BRANCH pp(7:0)
            WIRE 1872 2416 1888 2416
            WIRE 1888 2416 1968 2416
            BEGIN DISPLAY 1888 2416 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 2272 2416 ppdata(7:0)
        BEGIN BRANCH Reset
            WIRE 176 1392 192 1392
            WIRE 192 1392 224 1392
            WIRE 224 1392 240 1392
        END BRANCH
        INSTANCE XLXI_28 2192 2448 M0
        BEGIN INSTANCE XLXI_30 2048 848 R0
        END INSTANCE
        IOMARKER 208 752 clock
        INSTANCE XLXI_16 432 784 R0
        INSTANCE XLXI_17 704 784 R0
        BEGIN INSTANCE XLXI_31 656 2352 R0
        END INSTANCE
        BEGIN BRANCH PCwrEn
            WIRE 1040 1360 1136 1360
            WIRE 1136 1360 1216 1360
            BEGIN DISPLAY 1136 1360 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemRd
            WIRE 1040 1424 1120 1424
            WIRE 1120 1424 1216 1424
            BEGIN DISPLAY 1120 1424 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWrEn
            WIRE 1040 1488 1104 1488
            WIRE 1104 1488 1216 1488
            BEGIN DISPLAY 1104 1488 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 1040 1552 1136 1552
            WIRE 1136 1552 1216 1552
            BEGIN DISPLAY 1136 1552 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ResetL
            WIRE 1040 1616 1104 1616
            WIRE 1104 1616 1216 1616
            BEGIN DISPLAY 1104 1616 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PCwr(15:0)
            WIRE 1040 1680 1168 1680
            WIRE 1168 1680 1216 1680
            BEGIN DISPLAY 1168 1680 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RdAddr(17:0)
            WIRE 1040 1744 1152 1744
            WIRE 1152 1744 1216 1744
            BEGIN DISPLAY 1152 1744 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH AluA(15:0)
            WIRE 1040 1808 1088 1808
            WIRE 1088 1808 1216 1808
            BEGIN DISPLAY 1088 1808 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH AluB(15:0)
            WIRE 1040 1872 1104 1872
            WIRE 1104 1872 1216 1872
            BEGIN DISPLAY 1104 1872 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH control(3:0)
            WIRE 1040 1936 1136 1936
            WIRE 1136 1936 1216 1936
            BEGIN DISPLAY 1136 1936 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegA(2:0)
            WIRE 1040 2000 1120 2000
            WIRE 1120 2000 1216 2000
            BEGIN DISPLAY 1120 2000 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegB(2:0)
            WIRE 1040 2064 1136 2064
            WIRE 1136 2064 1216 2064
            BEGIN DISPLAY 1136 2064 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegW(2:0)
            WIRE 1040 2128 1136 2128
            WIRE 1136 2128 1216 2128
            BEGIN DISPLAY 1136 2128 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBusW(15:0)
            WIRE 1040 2192 1136 2192
            WIRE 1136 2192 1216 2192
            BEGIN DISPLAY 1136 2192 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Din(15:0)
            WIRE 1040 2256 1152 2256
            WIRE 1152 2256 1216 2256
            BEGIN DISPLAY 1152 2256 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrAddr(17:0)
            WIRE 1040 2320 1152 2320
            WIRE 1152 2320 1216 2320
            BEGIN DISPLAY 1152 2320 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(15:0)
            WIRE 560 2160 576 2160
            WIRE 576 2160 656 2160
            BEGIN DISPLAY 576 2160 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(15:0)
            WIRE 560 2064 576 2064
            WIRE 576 2064 656 2064
            BEGIN DISPLAY 576 2064 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(15:0)
            WIRE 560 1968 576 1968
            WIRE 576 1968 656 1968
            BEGIN DISPLAY 576 1968 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Dout(15:0)
            WIRE 560 1872 576 1872
            WIRE 576 1872 656 1872
            BEGIN DISPLAY 576 1872 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PC(15:0)
            WIRE 560 1776 592 1776
            WIRE 592 1776 656 1776
            BEGIN DISPLAY 592 1776 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH st
            WIRE 496 1680 592 1680
            WIRE 592 1680 656 1680
            BEGIN DISPLAY 592 1680 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrDone
            WIRE 560 1584 592 1584
            WIRE 592 1584 656 1584
            BEGIN DISPLAY 592 1584 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RdDone
            WIRE 560 1488 592 1488
            WIRE 592 1488 656 1488
            BEGIN DISPLAY 592 1488 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH rst
            WIRE 464 1392 592 1392
            WIRE 592 1392 656 1392
            BEGIN DISPLAY 592 1392 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clk
            WIRE 560 1296 576 1296
            WIRE 576 1296 656 1296
            BEGIN DISPLAY 576 1296 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PC(15:0)
            WIRE 576 1056 672 1056
            WIRE 672 1056 704 1056
            BEGIN DISPLAY 672 1056 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PCwr(15:0)
            WIRE 80 1056 96 1056
            WIRE 96 1056 192 1056
            BEGIN DISPLAY 96 1056 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH PCwrEn
            WIRE 80 1120 96 1120
            WIRE 96 1120 192 1120
            BEGIN DISPLAY 96 1120 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clk
            WIRE 80 1184 96 1184
            WIRE 96 1184 192 1184
            BEGIN DISPLAY 96 1184 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH invResetL
            WIRE 96 1280 112 1280
            WIRE 112 1280 176 1280
            WIRE 176 1280 192 1280
            BEGIN DISPLAY 112 1280 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_34 944 1216 R0
        BEGIN BRANCH ResetL
            WIRE 816 1184 832 1184
            WIRE 832 1184 944 1184
            BEGIN DISPLAY 832 1184 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH invResetL
            WIRE 1168 1184 1200 1184
            WIRE 1200 1184 1232 1184
            BEGIN DISPLAY 1200 1184 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH fin
            WIRE 1040 1296 1168 1296
            WIRE 1168 1296 1216 1296
            BEGIN DISPLAY 1168 1296 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH fin
            WIRE 1808 928 1856 928
            WIRE 1856 928 1920 928
            BEGIN DISPLAY 1856 928 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_35 1920 960 R0
        BEGIN BRANCH finish
            WIRE 2144 928 2224 928
        END BRANCH
        IOMARKER 2224 928 finish
        INSTANCE XLXI_33 192 1312 R0
        IOMARKER 176 1392 Reset
        INSTANCE XLXI_27 240 1424 R0
        BEGIN BRANCH Start
            WIRE 96 1904 112 1904
            WIRE 96 1904 96 1968
            WIRE 96 1968 224 1968
            WIRE 224 1968 224 2000
            WIRE 224 2000 224 2016
        END BRANCH
        IOMARKER 224 2016 Start
        INSTANCE XLXI_37 112 1936 R0
        INSTANCE XLXI_36 272 1712 R0
        BEGIN BRANCH XLXN_10
            WIRE 208 1680 272 1680
            WIRE 208 1680 208 1792
            WIRE 208 1792 352 1792
            WIRE 352 1792 352 1904
            WIRE 336 1904 352 1904
        END BRANCH
    END SHEET
END SCHEMATIC
