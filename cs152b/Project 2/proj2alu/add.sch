VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName Virtex
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL control(1)
        SIGNAL B(15:0)
        SIGNAL control(3:0)
        SIGNAL A(15:0)
        SIGNAL zero(15:0)
        SIGNAL ALU_out(15:0)
        SIGNAL control(0)
        SIGNAL XLXN_64(15:0)
        SIGNAL XLXN_60(15:0)
        SIGNAL selectB(1:0)
        SIGNAL selectB(0)
        SIGNAL selectB(1)
        SIGNAL control(2)
        SIGNAL XLXN_74(15:0)
        SIGNAL XLXN_78
        SIGNAL XLXN_95
        SIGNAL XLXN_96
        SIGNAL control(3)
        SIGNAL XLXN_101
        SIGNAL S(15:0)
        SIGNAL add_overflow
        SIGNAL XLXN_116(15:0)
        SIGNAL XLXN_120
        SIGNAL one(15:0)
        SIGNAL B(15)
        SIGNAL A(15)
        PORT Input B(15:0)
        PORT Input control(3:0)
        PORT Input A(15:0)
        PORT Output S(15:0)
        PORT Output add_overflow
        BEGIN BLOCKDEF mux2_16bits
            TIMESTAMP 2004 7 15 18 27 4
            RECTANGLE N 32 0 448 1184 
            BEGIN LINE W 0 240 32 240 
            END LINE
            BEGIN LINE W 0 272 32 272 
            END LINE
            BEGIN LINE W 0 1072 32 1072 
            END LINE
            BEGIN LINE W 448 48 480 48 
            END LINE
        END BLOCKDEF
        BEGIN BLOCKDEF adsu16
            TIMESTAMP 2001 2 2 12 21 59
            LINE N 240 -64 384 -64 
            LINE N 240 -124 240 -64 
            RECTANGLE N 0 -204 64 -180 
            RECTANGLE N 0 -332 64 -308 
            RECTANGLE N 384 -268 448 -244 
            LINE N 128 -448 64 -448 
            LINE N 128 -416 128 -448 
            LINE N 128 -64 48 -64 
            LINE N 128 -96 128 -64 
            LINE N 64 -288 64 -432 
            LINE N 128 -256 64 -288 
            LINE N 64 -224 128 -256 
            LINE N 64 -80 64 -224 
            LINE N 384 -160 64 -80 
            LINE N 384 -336 384 -160 
            LINE N 384 -352 384 -336 
            LINE N 64 -432 384 -352 
            LINE N 336 -128 336 -148 
            LINE N 384 -128 336 -128 
            LINE N 448 -256 384 -256 
            LINE N 448 -128 384 -128 
            LINE N 448 -64 384 -64 
            LINE N 0 -448 64 -448 
            LINE N 0 -192 64 -192 
            LINE N 0 -320 64 -320 
            LINE N 0 -64 64 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF mux4_16bits_new
            TIMESTAMP 2004 7 15 18 58 13
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
        BEGIN BLOCKDEF inv16
            TIMESTAMP 2001 2 2 12 25 36
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            RECTANGLE N 0 -44 64 -20 
            RECTANGLE N 160 -44 224 -20 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCKDEF xor2
            TIMESTAMP 2001 2 2 12 25 37
            LINE N 0 -64 64 -64 
            LINE N 0 -128 60 -128 
            LINE N 256 -96 208 -96 
            ARC N -40 -152 72 -40 48 -48 44 -144 
            ARC N -24 -152 88 -40 64 -48 64 -144 
            LINE N 128 -144 64 -144 
            LINE N 128 -48 64 -48 
            ARC N 44 -144 220 32 208 -96 128 -144 
            ARC N 44 -224 220 -48 128 -48 208 -96 
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
        BEGIN BLOCKDEF and4
            TIMESTAMP 2001 2 2 12 25 36
            LINE N 144 -112 64 -112 
            ARC N 96 -208 192 -112 144 -112 144 -208 
            LINE N 64 -208 144 -208 
            LINE N 64 -64 64 -256 
            LINE N 256 -160 192 -160 
            LINE N 0 -256 64 -256 
            LINE N 0 -192 64 -192 
            LINE N 0 -128 64 -128 
            LINE N 0 -64 64 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF zerobus
            TIMESTAMP 2004 7 16 11 15 34
            RECTANGLE N 64 -64 320 0 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF of_detect
            TIMESTAMP 2004 7 16 12 29 32
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -224 384 -224 
        END BLOCKDEF
        BEGIN BLOCKDEF negative_detect
            TIMESTAMP 2004 7 20 11 47 45
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -224 0 -224 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF one_bus
            TIMESTAMP 2004 7 16 12 15 49
            RECTANGLE N 64 -64 320 0 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 mux2_16bits
            PIN MB(15:0) zero(15:0)
            PIN MA(15:0) A(15:0)
            PIN S(0:0) control(1)
            PIN O(15:0) XLXN_74(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_9 mux4_16bits_new
            PIN MD(15:0) XLXN_60(15:0)
            PIN MC(15:0) one(15:0)
            PIN MB(15:0) B(15:0)
            PIN MA(15:0) XLXN_116(15:0)
            PIN S(1:0) selectB(1:0)
            PIN O(15:0) XLXN_64(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_10 inv16
            PIN I(15:0) A(15:0)
            PIN O(15:0) XLXN_116(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_12 xor2
            PIN I0 control(2)
            PIN I1 control(1)
            PIN O selectB(1)
        END BLOCK
        BEGIN BLOCK XLXI_13 inv
            PIN I control(2)
            PIN O selectB(0)
        END BLOCK
        BEGIN BLOCK XLXI_14 or2
            PIN I0 control(0)
            PIN I1 XLXN_101
            PIN O XLXN_78
        END BLOCK
        BEGIN BLOCK XLXI_15 and4
            PIN I0 XLXN_95
            PIN I1 control(1)
            PIN I2 control(2)
            PIN I3 XLXN_96
            PIN O XLXN_101
        END BLOCK
        BEGIN BLOCK XLXI_16 inv
            PIN I control(3)
            PIN O XLXN_96
        END BLOCK
        BEGIN BLOCK XLXI_17 inv
            PIN I control(0)
            PIN O XLXN_95
        END BLOCK
        BEGIN BLOCK XLXI_22 zerobus
            PIN zero(15:0) zero(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_23 adsu16
            PIN A(15:0) XLXN_74(15:0)
            PIN ADD XLXN_120
            PIN B(15:0) XLXN_64(15:0)
            PIN CI XLXN_78
            PIN CO
            PIN OFL
            PIN S(15:0) ALU_out(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_24 of_detect
            PIN A(15:0) A(15:0)
            PIN B(15:0) B(15:0)
            PIN result(15:0) ALU_out(15:0)
            PIN control(3:0) control(3:0)
            PIN overflow add_overflow
        END BLOCK
        BEGIN BLOCK XLXI_25 negative_detect
            PIN A_msb A(15)
            PIN B_msb B(15)
            PIN answer(15:0) ALU_out(15:0)
            PIN control(3:0) control(3:0)
            PIN S(15:0) S(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_26 inv
            PIN I control(0)
            PIN O XLXN_120
        END BLOCK
        BEGIN BLOCK XLXI_28 one_bus
            PIN one(15:0) one(15:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH control(1)
            WIRE 1040 1088 1056 1088
            WIRE 1056 1088 1136 1088
            WIRE 1136 1088 1168 1088
            BEGIN DISPLAY 1040 1088 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH control(3:0)
            WIRE 320 320 416 320
        END BRANCH
        BEGIN BRANCH B(15:0)
            WIRE 272 240 416 240
        END BRANCH
        BEGIN BRANCH A(15:0)
            WIRE 272 160 416 160
        END BRANCH
        BEGIN BRANCH ALU_out(15:0)
            WIRE 2640 864 2784 864
            WIRE 2784 864 2800 864
            DISPLAY 2800 864 ATTR Name
        END BRANCH
        BEGIN BRANCH S(15:0)
            WIRE 3024 112 3296 112
            BEGIN DISPLAY 3024 112 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 3296 112 S(15:0)
        BEGIN INSTANCE XLXI_2 1168 16 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_9 1168 1296 R0
        END INSTANCE
        BEGIN BRANCH XLXN_60(15:0)
            WIRE 1088 1472 1168 1472
        END BRANCH
        BEGIN BRANCH B(15:0)
            WIRE 656 1440 672 1440
            WIRE 672 1440 1008 1440
            WIRE 1008 1440 1008 1536
            WIRE 1008 1536 1088 1536
            WIRE 1088 1536 1104 1536
            WIRE 1104 1536 1168 1536
            BEGIN DISPLAY 656 1440 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_64(15:0)
            WIRE 1648 1344 1664 1344
            WIRE 1664 1344 1680 1344
            WIRE 1680 928 1680 1344
            WIRE 1680 928 2176 928
            WIRE 2176 928 2192 928
        END BRANCH
        BEGIN BRANCH A(15:0)
            WIRE 672 1568 688 1568
            WIRE 688 1568 752 1568
            BEGIN DISPLAY 672 1568 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH selectB(1:0)
            WIRE 1120 2368 1136 2368
            WIRE 1136 2368 1168 2368
            BEGIN DISPLAY 1120 2368 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_74(15:0)
            WIRE 1648 64 1664 64
            WIRE 1664 64 1680 64
            WIRE 1680 64 1680 800
            WIRE 1680 800 2176 800
            WIRE 2176 800 2192 800
        END BRANCH
        INSTANCE XLXI_14 1872 768 R0
        BEGIN BRANCH XLXN_78
            WIRE 2128 672 2144 672
            WIRE 2144 672 2192 672
        END BRANCH
        BEGIN BRANCH control(0)
            WIRE 1856 704 1872 704
            BEGIN DISPLAY 1856 704 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_95
            WIRE 2112 464 2176 464
            WIRE 2176 464 2192 464
        END BRANCH
        BEGIN BRANCH XLXN_96
            WIRE 2112 272 2192 272
        END BRANCH
        BEGIN BRANCH control(2)
            WIRE 1824 336 1888 336
            WIRE 1888 336 2192 336
            BEGIN DISPLAY 1824 336 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH control(1)
            WIRE 1824 400 2192 400
            BEGIN DISPLAY 1824 400 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH control(3)
            WIRE 1824 272 1888 272
            BEGIN DISPLAY 1824 272 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH control(0)
            WIRE 1824 464 1888 464
            BEGIN DISPLAY 1824 464 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_15 2192 528 R0
        INSTANCE XLXI_16 1888 304 R0
        INSTANCE XLXI_17 1888 496 R0
        BEGIN BRANCH XLXN_101
            WIRE 1808 544 1808 640
            WIRE 1808 640 1872 640
            WIRE 1808 544 2512 544
            WIRE 2448 368 2512 368
            WIRE 2512 368 2512 544
        END BRANCH
        BEGIN BRANCH selectB(0)
            WIRE 896 2176 912 2176
            WIRE 912 2176 992 2176
            DISPLAY 992 2176 ATTR Name
        END BRANCH
        BEGIN BRANCH control(1)
            WIRE 432 1904 592 1904
            BEGIN DISPLAY 432 1904 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH control(2)
            WIRE 432 1968 576 1968
            WIRE 576 1968 592 1968
            BEGIN DISPLAY 432 1968 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH selectB(1)
            WIRE 848 1936 864 1936
            WIRE 864 1936 992 1936
            DISPLAY 992 1936 ATTR Name
        END BRANCH
        BEGIN BRANCH control(2)
            WIRE 608 2176 672 2176
            BEGIN DISPLAY 608 2176 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_12 592 2032 R0
        INSTANCE XLXI_13 672 2208 R0
        IOMARKER 320 320 control(3:0)
        IOMARKER 272 240 B(15:0)
        IOMARKER 272 160 A(15:0)
        BEGIN INSTANCE XLXI_22 96 496 R0
        END INSTANCE
        BEGIN BRANCH zero(15:0)
            WIRE 480 464 576 464
            WIRE 576 464 592 464
            BEGIN DISPLAY 576 464 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_23 2192 1120 R0
        BEGIN INSTANCE XLXI_24 2208 1728 R0
        END INSTANCE
        BEGIN BRANCH A(15:0)
            WIRE 2064 1504 2080 1504
            WIRE 2080 1504 2208 1504
            BEGIN DISPLAY 2064 1504 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(15:0)
            WIRE 2064 1568 2080 1568
            WIRE 2080 1568 2208 1568
            BEGIN DISPLAY 2064 1568 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALU_out(15:0)
            WIRE 2048 1632 2064 1632
            WIRE 2064 1632 2208 1632
            BEGIN DISPLAY 2048 1632 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH control(3:0)
            WIRE 2048 1696 2064 1696
            WIRE 2064 1696 2208 1696
            BEGIN DISPLAY 2048 1696 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S(15:0)
            WIRE 2608 1904 2624 1904
            WIRE 2624 1904 2656 1904
            WIRE 2656 1904 2672 1904
            DISPLAY 2672 1904 ATTR Name
        END BRANCH
        BEGIN BRANCH add_overflow
            WIRE 2592 1504 2608 1504
            WIRE 2608 1504 2640 1504
            WIRE 2640 1504 2800 1504
            WIRE 2800 1504 2816 1504
        END BRANCH
        IOMARKER 2816 1504 add_overflow
        INSTANCE XLXI_10 752 1600 R0
        BEGIN BRANCH XLXN_116(15:0)
            WIRE 976 1568 992 1568
            WIRE 992 1568 1168 1568
        END BRANCH
        INSTANCE XLXI_26 1920 1088 R0
        BEGIN BRANCH control(0)
            WIRE 1872 1056 1888 1056
            WIRE 1888 1056 1920 1056
            BEGIN DISPLAY 1872 1056 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_120
            WIRE 2144 1056 2176 1056
            WIRE 2176 1056 2192 1056
        END BRANCH
        BEGIN BRANCH zero(15:0)
            WIRE 1088 256 1168 256
            BEGIN DISPLAY 1088 256 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(15:0)
            WIRE 1088 288 1168 288
            BEGIN DISPLAY 1088 288 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_28 96 720 R0
        END INSTANCE
        BEGIN BRANCH one(15:0)
            WIRE 480 688 576 688
            DISPLAY 576 688 ATTR Name
        END BRANCH
        BEGIN BRANCH one(15:0)
            WIRE 656 1344 1040 1344
            WIRE 1040 1344 1040 1504
            WIRE 1040 1504 1168 1504
            BEGIN DISPLAY 656 1344 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_25 2240 2128 R0
        END INSTANCE
        BEGIN BRANCH control(3:0)
            WIRE 2128 2096 2240 2096
            BEGIN DISPLAY 2128 2096 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALU_out(15:0)
            WIRE 2128 2032 2240 2032
            BEGIN DISPLAY 2128 2032 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(15)
            WIRE 2128 1968 2240 1968
            BEGIN DISPLAY 2128 1968 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(15)
            WIRE 2112 1904 2240 1904
            BEGIN DISPLAY 2112 1904 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
