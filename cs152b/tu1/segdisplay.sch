VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName Virtex
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL load
        SIGNAL resetn
        SIGNAL clk
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL lhex(6:0)
        SIGNAL lhex(0)
        SIGNAL lhex(1)
        SIGNAL lhex(2)
        SIGNAL lhex(3)
        SIGNAL lhex(4)
        SIGNAL lhex(5)
        SIGNAL lhex(6)
        SIGNAL lhex0
        SIGNAL lhex1
        SIGNAL lhex2
        SIGNAL lhex3
        SIGNAL lhex4
        SIGNAL lhex5
        SIGNAL lhex6
        SIGNAL qout(3:0)
        SIGNAL qout(3)
        SIGNAL qout(2)
        SIGNAL qout(1)
        SIGNAL qout(0)
        SIGNAL outq3
        SIGNAL outq2
        SIGNAL outq1
        SIGNAL outq0
        SIGNAL XLXN_34(31:0)
        SIGNAL XLXN_37
        SIGNAL XLXN_38
        SIGNAL XLXN_40
        SIGNAL XLXN_41
        SIGNAL XLXN_43(31:0)
        PORT Input load
        PORT Input resetn
        PORT Input clk
        PORT Output lhex0
        PORT Output lhex1
        PORT Output lhex2
        PORT Output lhex3
        PORT Output lhex5
        PORT Output lhex6
        PORT Output outq3
        PORT Output outq2
        PORT Output outq1
        PORT Output outq0
        PORT Output lhex4
        BEGIN BLOCKDEF counter_32
            TIMESTAMP 2004 6 29 10 59 28
            RECTANGLE N 32 0 448 272 
            BEGIN LINE W 0 48 32 48 
            END LINE
            LINE N 0 80 32 80 
            LINE N 0 208 32 208 
            LINE N 448 48 480 48 
            BEGIN LINE W 448 176 480 176 
            END LINE
            LINE N 96 272 96 304 
        END BLOCKDEF
        BEGIN BLOCKDEF counter_4
            TIMESTAMP 2004 6 29 11 5 12
            RECTANGLE N 32 0 448 272 
            LINE N 0 176 32 176 
            LINE N 0 208 32 208 
            BEGIN LINE W 448 176 480 176 
            END LINE
            LINE N 96 272 96 304 
        END BLOCKDEF
        BEGIN BLOCKDEF const_32
            TIMESTAMP 2004 6 29 11 10 32
            RECTANGLE N 64 -64 320 0 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF maptoseg
            TIMESTAMP 2004 6 29 11 16 22
            RECTANGLE N 64 -64 320 0 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 320 -44 384 -20 
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
        BEGIN BLOCKDEF inv
            TIMESTAMP 2001 2 2 12 25 36
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2001 2 2 12 24 32
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 counter_32
            PIN L(31:0) XLXN_34(31:0)
            PIN LOAD XLXN_38
            PIN CLK XLXN_37
            PIN THRESH0 XLXN_41
            PIN Q(31:0) XLXN_43(31:0)
            PIN ACLR XLXN_40
        END BLOCK
        BEGIN BLOCK XLXI_2 counter_4
            PIN CE XLXN_41
            PIN CLK XLXN_37
            PIN Q(3:0) qout(3:0)
            PIN ACLR XLXN_40
        END BLOCK
        BEGIN BLOCK XLXI_3 const_32
            PIN const_out(31:0) XLXN_34(31:0)
        END BLOCK
        BEGIN BLOCK XLXI_4 maptoseg
            PIN Q(3:0) qout(3:0)
            PIN Lhex(6:0) lhex(6:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 ibuf
            PIN I load
            PIN O XLXN_38
        END BLOCK
        BEGIN BLOCK XLXI_6 ibuf
            PIN I resetn
            PIN O XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_7 ibuf
            PIN I clk
            PIN O XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_8 bufg
            PIN I XLXN_4
            PIN O XLXN_37
        END BLOCK
        BEGIN BLOCK XLXI_9 inv
            PIN I XLXN_5
            PIN O XLXN_40
        END BLOCK
        BEGIN BLOCK XLXI_10 obuf
            PIN I lhex(0)
            PIN O lhex0
        END BLOCK
        BEGIN BLOCK XLXI_11 obuf
            PIN I lhex(1)
            PIN O lhex1
        END BLOCK
        BEGIN BLOCK XLXI_12 obuf
            PIN I lhex(2)
            PIN O lhex2
        END BLOCK
        BEGIN BLOCK XLXI_13 obuf
            PIN I lhex(3)
            PIN O lhex3
        END BLOCK
        BEGIN BLOCK XLXI_14 obuf
            PIN I lhex(4)
            PIN O lhex4
        END BLOCK
        BEGIN BLOCK XLXI_15 obuf
            PIN I lhex(5)
            PIN O lhex5
        END BLOCK
        BEGIN BLOCK XLXI_16 obuf
            PIN I lhex(6)
            PIN O lhex6
        END BLOCK
        BEGIN BLOCK XLXI_17 obuf
            PIN I qout(1)
            PIN O outq1
        END BLOCK
        BEGIN BLOCK XLXI_18 obuf
            PIN I qout(0)
            PIN O outq0
        END BLOCK
        BEGIN BLOCK XLXI_19 obuf
            PIN I qout(3)
            PIN O outq3
        END BLOCK
        BEGIN BLOCK XLXI_20 obuf
            PIN I qout(2)
            PIN O outq2
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH load
            WIRE 112 1152 256 1152
            WIRE 256 1152 272 1152
        END BRANCH
        BEGIN BRANCH resetn
            WIRE 160 624 304 624
            WIRE 304 624 320 624
        END BRANCH
        BEGIN BRANCH clk
            WIRE 96 1280 112 1280
            WIRE 112 1280 240 1280
            WIRE 240 1280 256 1280
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 480 1280 496 1280
            WIRE 496 1280 640 1280
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 544 624 656 624
        END BRANCH
        BEGIN BRANCH lhex(6:0)
            WIRE 2304 288 2528 288
            WIRE 2528 288 2528 304
            WIRE 2528 304 2528 320
            WIRE 2528 320 2528 416
            WIRE 2528 416 2528 512
            WIRE 2528 512 2528 608
            WIRE 2528 608 2528 704
            WIRE 2528 704 2528 800
            WIRE 2528 800 2528 896
            WIRE 2528 896 2528 976
        END BRANCH
        BEGIN BRANCH lhex(0)
            WIRE 2624 320 2640 320
            WIRE 2640 320 2752 320
            BEGIN DISPLAY 2640 320 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lhex(1)
            WIRE 2624 416 2656 416
            WIRE 2656 416 2752 416
            BEGIN DISPLAY 2656 416 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lhex(2)
            WIRE 2624 512 2656 512
            WIRE 2656 512 2752 512
            BEGIN DISPLAY 2656 512 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lhex(3)
            WIRE 2624 608 2656 608
            WIRE 2656 608 2752 608
            BEGIN DISPLAY 2656 608 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lhex(4)
            WIRE 2624 704 2640 704
            WIRE 2640 704 2752 704
            BEGIN DISPLAY 2640 704 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lhex(5)
            WIRE 2624 800 2640 800
            WIRE 2640 800 2752 800
            BEGIN DISPLAY 2640 800 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lhex(6)
            WIRE 2624 896 2656 896
            WIRE 2656 896 2752 896
            BEGIN DISPLAY 2656 896 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH lhex0
            WIRE 2976 320 2992 320
            WIRE 2992 320 3200 320
        END BRANCH
        BEGIN BRANCH lhex1
            WIRE 2976 416 2992 416
            WIRE 2992 416 3200 416
        END BRANCH
        BEGIN BRANCH lhex2
            WIRE 2976 512 2992 512
            WIRE 2992 512 3184 512
            WIRE 3184 512 3200 512
        END BRANCH
        BEGIN BRANCH lhex3
            WIRE 2976 608 2992 608
            WIRE 2992 608 3200 608
        END BRANCH
        BEGIN BRANCH lhex4
            WIRE 2976 704 2992 704
            WIRE 2992 704 3216 704
        END BRANCH
        BEGIN BRANCH lhex5
            WIRE 2976 800 2992 800
            WIRE 2992 800 3200 800
        END BRANCH
        BEGIN BRANCH lhex6
            WIRE 2976 896 2992 896
            WIRE 2992 896 3200 896
        END BRANCH
        BEGIN BRANCH qout(3:0)
            WIRE 1776 288 1920 288
            WIRE 1776 288 1776 512
            WIRE 1776 512 2224 512
            WIRE 2224 512 2224 1232
            WIRE 2224 1232 2384 1232
            WIRE 2384 1232 2384 1264
            WIRE 2384 1264 2384 1328
            WIRE 2384 1328 2384 1392
            WIRE 2384 1392 2384 1456
            WIRE 2384 1456 2384 1520
            WIRE 2192 1232 2224 1232
        END BRANCH
        BEGIN BRANCH qout(3)
            WIRE 2480 1264 2512 1264
            WIRE 2512 1264 2656 1264
            BEGIN DISPLAY 2512 1264 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH qout(2)
            WIRE 2480 1328 2512 1328
            WIRE 2512 1328 2656 1328
            BEGIN DISPLAY 2512 1328 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH qout(1)
            WIRE 2480 1392 2512 1392
            WIRE 2512 1392 2656 1392
            BEGIN DISPLAY 2512 1392 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH qout(0)
            WIRE 2480 1456 2528 1456
            WIRE 2528 1456 2656 1456
            BEGIN DISPLAY 2528 1456 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH outq3
            WIRE 2880 1264 2896 1264
            WIRE 2896 1264 2944 1264
        END BRANCH
        BEGIN BRANCH outq2
            WIRE 2880 1328 2896 1328
            WIRE 2896 1328 2944 1328
        END BRANCH
        BEGIN BRANCH outq1
            WIRE 2880 1392 2896 1392
            WIRE 2896 1392 2944 1392
        END BRANCH
        BEGIN BRANCH outq0
            WIRE 2880 1456 2896 1456
            WIRE 2896 1456 2944 1456
        END BRANCH
        BEGIN INSTANCE XLXI_1 992 1072 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 -32 1088 R0
        END INSTANCE
        BEGIN BRANCH XLXN_34(31:0)
            WIRE 352 1056 368 1056
            WIRE 368 1056 976 1056
            WIRE 976 1056 976 1120
            WIRE 976 1120 992 1120
        END BRANCH
        IOMARKER 96 1280 clk
        INSTANCE XLXI_7 256 1312 R0
        INSTANCE XLXI_8 640 1312 R0
        BEGIN BRANCH XLXN_37
            WIRE 864 1280 880 1280
            WIRE 880 1280 992 1280
            WIRE 880 1280 880 1504
            WIRE 880 1504 1632 1504
            WIRE 1632 1264 1712 1264
            WIRE 1632 1264 1632 1504
        END BRANCH
        IOMARKER 112 1152 load
        INSTANCE XLXI_5 272 1184 R0
        BEGIN BRANCH XLXN_38
            WIRE 496 1152 512 1152
            WIRE 512 1152 992 1152
        END BRANCH
        IOMARKER 160 624 resetn
        INSTANCE XLXI_6 320 656 R0
        INSTANCE XLXI_9 656 656 R0
        BEGIN BRANCH XLXN_40
            WIRE 880 624 896 624
            WIRE 896 624 1680 624
            WIRE 1680 624 1680 1408
            WIRE 1680 1408 1680 1552
            WIRE 1680 1408 1808 1408
            WIRE 1088 1376 1088 1552
            WIRE 1088 1552 1680 1552
            WIRE 1808 1360 1808 1408
        END BRANCH
        BUSTAP 2384 1264 2480 1264
        BUSTAP 2384 1328 2480 1328
        BUSTAP 2384 1392 2480 1392
        BUSTAP 2384 1456 2480 1456
        IOMARKER 2944 1264 outq3
        IOMARKER 2944 1328 outq2
        IOMARKER 2944 1392 outq1
        IOMARKER 2944 1456 outq0
        BEGIN INSTANCE XLXI_2 1712 1056 R0
        END INSTANCE
        INSTANCE XLXI_19 2656 1296 R0
        INSTANCE XLXI_20 2656 1360 R0
        INSTANCE XLXI_17 2656 1424 R0
        INSTANCE XLXI_18 2656 1488 R0
        BEGIN BRANCH XLXN_41
            WIRE 1472 1120 1632 1120
            WIRE 1632 1120 1632 1232
            WIRE 1632 1232 1696 1232
            WIRE 1696 1232 1712 1232
        END BRANCH
        BEGIN BRANCH XLXN_43(31:0)
            WIRE 1472 1248 1568 1248
            WIRE 1568 1248 1568 1312
        END BRANCH
        BUSTAP 2528 416 2624 416
        BUSTAP 2528 512 2624 512
        BUSTAP 2528 608 2624 608
        BUSTAP 2528 704 2624 704
        BUSTAP 2528 800 2624 800
        BUSTAP 2528 896 2624 896
        BUSTAP 2528 320 2624 320
        IOMARKER 3200 320 lhex0
        IOMARKER 3200 416 lhex1
        IOMARKER 3200 608 lhex3
        IOMARKER 3200 800 lhex5
        IOMARKER 3200 896 lhex6
        IOMARKER 3200 512 lhex2
        INSTANCE XLXI_10 2752 352 R0
        INSTANCE XLXI_11 2752 448 R0
        INSTANCE XLXI_12 2752 544 R0
        INSTANCE XLXI_13 2752 640 R0
        INSTANCE XLXI_14 2752 736 R0
        INSTANCE XLXI_15 2752 832 R0
        INSTANCE XLXI_16 2752 928 R0
        BEGIN INSTANCE XLXI_4 1920 320 R0
        END INSTANCE
        IOMARKER 3216 704 lhex4
    END SHEET
END SCHEMATIC
