VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName Virtex
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL S(15:0)
        SIGNAL XLXN_2(1:0)
        SIGNAL XLXN_3(15:0)
        SIGNAL XLXN_5(15:0)
        SIGNAL A(15:0)
        SIGNAL B(15:0)
        SIGNAL control(3:0)
        SIGNAL add_overflow
        SIGNAL shift_overflow
        SIGNAL B(3:0)
        SIGNAL XLXN_17
        SIGNAL XLXN_18
        SIGNAL Overflow
        SIGNAL XLXN_21(15:0)
        SIGNAL XLXN_23(15:0)
        SIGNAL Zero
        PORT Input A(15:0)
        PORT Input B(15:0)
        PORT Output Overflow
        PORT Output S(15:0)
        PORT Input control(3:0)
        PORT Output Zero
        BEGIN BLOCKDEF mux_four
            TIMESTAMP 2004 7 15 10 57 14
            RECTANGLE N 32 0 448 1184 
            BEGIN LINE W 0 176 32 176 
            END LINE
            BEGIN LINE W 0 208 32 208 
            END LINE
            BEGIN LINE W 0 240 32 240 
            END LINE
            BEGIN LINE W 0 272 32 272 
            END LINE
            BEGIN LINE W 0 1072 32 1072 
            END LINE
            BEGIN LINE W 448 48 480 48 
            END LINE
        END BLOCKDEF
        BEGIN BLOCKDEF add
            TIMESTAMP 2004 7 20 12 2 3
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -64 384 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF logical
            TIMESTAMP 2004 7 16 11 22 21
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF shift
            TIMESTAMP 2004 7 16 13 4 36
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            LINE N 320 -64 384 -64 
            RECTANGLE N 320 -76 384 -52 
        END BLOCKDEF
        BEGIN BLOCKDEF or2
            TIMESTAMP 2001 2 2 12 25 36
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 28 -224 204 -48 112 -48 192 -96 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            LINE N 112 -144 48 -144 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -48 48 -48 
        END BLOCKDEF
        BEGIN BLOCKDEF control_unit
            TIMESTAMP 2004 7 16 11 24 51
            RECTANGLE N 64 -64 320 0 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF of_enable
            TIMESTAMP 2004 7 16 11 25 27
            RECTANGLE N 64 -64 320 0 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF and2
            TIMESTAMP 2001 2 2 12 25 36
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
            LINE N 64 -48 64 -144 
        END BLOCKDEF
        BEGIN BLOCKDEF zero_detect
            TIMESTAMP 2004 7 16 12 43 30
            RECTANGLE N 64 -64 320 0 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 mux_four
            PIN MD(15:0) XLXN_21(15:0)
            PIN MC(15:0) XLXN_5(15:0)
            PIN MB(15:0) XLXN_23(15:0)
            PIN MA(15:0) XLXN_3(15:0)
            PIN S(1:0) XLXN_2(1:0)
            PIN O(15:0) S(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 logical
            PIN A(15:0) A(15:0)
            PIN B(15:0) B(15:0)
            PIN control(3:0) control(3:0)
            PIN logicalout(15:0) XLXN_5(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_7 or2
            PIN I0 shift_overflow
            PIN I1 add_overflow
            PIN O XLXN_17
        END BLOCK
        BEGIN BLOCK XLXI_10 control_unit
            PIN control(3:0) control(3:0)
            PIN sel(1:0) XLXN_2(1:0)
        END BLOCK
        BEGIN BLOCK XLXI_13 of_enable
            PIN control(3:0) control(3:0)
            PIN enable XLXN_18
        END BLOCK
        BEGIN BLOCK XLXI_14 and2
            PIN I0 XLXN_18
            PIN I1 XLXN_17
            PIN O Overflow
        END BLOCK
        BEGIN BLOCK XLXI_15 add
            PIN B(15:0) B(15:0)
            PIN control(3:0) control(3:0)
            PIN A(15:0) A(15:0)
            PIN S(15:0) XLXN_21(15:0)
            PIN add_overflow add_overflow
        END BLOCK
        BEGIN BLOCK XLXI_16 zero_detect
            PIN bit_string(15:0) S(15:0)
            PIN isZero Zero
        END BLOCK
        BEGIN BLOCK XLXI_17 shift
            PIN A(15:0) A(15:0)
            PIN B(3:0) B(3:0)
            PIN control(3:0) control(3:0)
            PIN shifted_out shift_overflow
            PIN shift_result(15:0) XLXN_23(15:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_2 2288 1120 R0
        END INSTANCE
        BEGIN BRANCH S(15:0)
            WIRE 2768 1168 2784 1168
            WIRE 2784 1168 2848 1168
            WIRE 2848 1168 2864 1168
        END BRANCH
        BEGIN BRANCH XLXN_2(1:0)
            WIRE 2064 2080 2208 2080
            WIRE 2208 2080 2208 2192
            WIRE 2208 2192 2288 2192
        END BRANCH
        BEGIN BRANCH XLXN_3(15:0)
            WIRE 2176 1392 2288 1392
        END BRANCH
        BEGIN BRANCH XLXN_5(15:0)
            WIRE 1840 1136 2176 1136
            WIRE 2176 1136 2176 1312
            WIRE 2176 1312 2176 1328
            WIRE 2176 1328 2272 1328
            WIRE 2272 1328 2288 1328
        END BRANCH
        BEGIN BRANCH B(15:0)
            WIRE 1312 784 1328 784
            WIRE 1328 784 1440 784
            BEGIN DISPLAY 1312 784 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH control(3:0)
            WIRE 1312 848 1328 848
            WIRE 1328 848 1440 848
            BEGIN DISPLAY 1312 848 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(15:0)
            WIRE 1312 912 1328 912
            WIRE 1328 912 1440 912
            BEGIN DISPLAY 1312 912 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(15:0)
            WIRE 496 240 672 240
        END BRANCH
        BEGIN BRANCH B(15:0)
            WIRE 496 304 672 304
        END BRANCH
        BEGIN BRANCH control(3:0)
            WIRE 496 384 672 384
        END BRANCH
        IOMARKER 496 240 A(15:0)
        IOMARKER 496 304 B(15:0)
        IOMARKER 496 384 control(3:0)
        BEGIN INSTANCE XLXI_5 1456 1296 R0
        END INSTANCE
        BEGIN BRANCH A(15:0)
            WIRE 1328 1136 1344 1136
            WIRE 1344 1136 1456 1136
            BEGIN DISPLAY 1328 1136 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(15:0)
            WIRE 1328 1200 1344 1200
            WIRE 1344 1200 1456 1200
            BEGIN DISPLAY 1328 1200 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH control(3:0)
            WIRE 1328 1264 1344 1264
            WIRE 1344 1264 1456 1264
            BEGIN DISPLAY 1328 1264 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(15:0)
            WIRE 1344 1424 1360 1424
            WIRE 1360 1424 1456 1424
            BEGIN DISPLAY 1344 1424 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(3:0)
            WIRE 1344 1488 1360 1488
            WIRE 1360 1488 1456 1488
            BEGIN DISPLAY 1344 1488 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH control(3:0)
            WIRE 1344 1552 1360 1552
            WIRE 1360 1552 1456 1552
            BEGIN DISPLAY 1344 1552 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH add_overflow
            WIRE 2048 352 2064 352
            WIRE 2064 352 2128 352
            BEGIN DISPLAY 2048 352 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH shift_overflow
            WIRE 2048 416 2064 416
            WIRE 2064 416 2128 416
            BEGIN DISPLAY 2048 416 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_10 1680 2112 R0
        END INSTANCE
        BEGIN BRANCH control(3:0)
            WIRE 1552 2080 1680 2080
            BEGIN DISPLAY 1552 2080 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_7 2128 480 R0
        BEGIN INSTANCE XLXI_13 2016 624 R0
        END INSTANCE
        INSTANCE XLXI_14 2496 560 R0
        BEGIN BRANCH XLXN_17
            WIRE 2384 384 2400 384
            WIRE 2400 384 2432 384
            WIRE 2432 384 2432 432
            WIRE 2432 432 2496 432
        END BRANCH
        BEGIN BRANCH XLXN_18
            WIRE 2400 592 2416 592
            WIRE 2416 592 2448 592
            WIRE 2448 496 2448 592
            WIRE 2448 496 2496 496
        END BRANCH
        BEGIN BRANCH Overflow
            WIRE 2752 464 2768 464
            WIRE 2768 464 2800 464
            WIRE 2800 464 2816 464
        END BRANCH
        BEGIN BRANCH control(3:0)
            WIRE 1904 592 2016 592
            BEGIN DISPLAY 1904 592 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 2816 464 Overflow
        IOMARKER 2864 1168 S(15:0)
        BEGIN INSTANCE XLXI_15 1440 944 R0
        END INSTANCE
        BEGIN BRANCH XLXN_21(15:0)
            WIRE 1824 784 2272 784
            WIRE 2272 784 2272 1296
            WIRE 2272 1296 2288 1296
        END BRANCH
        BEGIN BRANCH add_overflow
            WIRE 1824 880 1904 880
            WIRE 1904 880 1920 880
            DISPLAY 1920 880 ATTR Name
        END BRANCH
        BEGIN BRANCH XLXN_23(15:0)
            WIRE 1840 1520 2064 1520
            WIRE 2064 1360 2064 1520
            WIRE 2064 1360 2272 1360
            WIRE 2272 1360 2288 1360
        END BRANCH
        BEGIN BRANCH shift_overflow
            WIRE 1840 1424 1856 1424
            WIRE 1856 1424 1872 1424
            DISPLAY 1872 1424 ATTR Name
        END BRANCH
        BEGIN INSTANCE XLXI_16 2720 768 R0
        END INSTANCE
        BEGIN BRANCH Zero
            WIRE 3104 736 3120 736
            WIRE 3120 736 3136 736
            WIRE 3136 736 3152 736
        END BRANCH
        BEGIN BRANCH S(15:0)
            WIRE 2576 736 2592 736
            WIRE 2592 736 2720 736
            BEGIN DISPLAY 2576 736 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 3152 736 Zero
        BEGIN INSTANCE XLXI_17 1456 1584 R0
        END INSTANCE
    END SHEET
END SCHEMATIC
