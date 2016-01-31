VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName Virtex
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL finish
        SIGNAL clk
        SIGNAL XLXN_6(17:0)
        SIGNAL XLXN_8(17:0)
        SIGNAL XLXN_9(15:0)
        SIGNAL dum(18:0)
        SIGNAL lwen
        SIGNAL loen
        SIGNAL lcen
        SIGNAL reset
        SIGNAL dum(16)
        SIGNAL dum(17)
        SIGNAL dum(18)
        SIGNAL laddr16
        SIGNAL laddr17
        SIGNAL laddr18
        SIGNAL laddr(15:0)
        SIGNAL dum(15:0)
        SIGNAL XLXN_52
        SIGNAL XLXN_53
        SIGNAL XLXN_54
        SIGNAL state4
        SIGNAL state3
        SIGNAL state2
        SIGNAL state1
        SIGNAL XLXN_60
        SIGNAL XLXN_61
        SIGNAL XLXN_62
        SIGNAL XLXN_63
        SIGNAL fin
        SIGNAL st1
        SIGNAL st2
        SIGNAL st3
        SIGNAL st4
        SIGNAL ldata(15:0)
        SIGNAL XLXN_70
        SIGNAL damnclk
        SIGNAL ppdata(7:0)
        SIGNAL ppstatus(6:3)
        SIGNAL XLXN_72
        SIGNAL XLXN_74
        SIGNAL XLXN_75(15:0)
        PORT Input reset
        PORT Output finish
        PORT Output laddr(15:0)
        PORT Output laddr16
        PORT Output laddr17
        PORT Output laddr18
        PORT Output lcen
        PORT Output loen
        PORT Output lwen
        PORT Output state1
        PORT Output state2
        PORT Output state3
        PORT Output state4
        PORT BiDirectional ldata(15:0)
        PORT Input clk
        PORT Input ppdata(7:0)
        PORT Output ppstatus(6:3)
        BEGIN BLOCKDEF memorymodule
            TIMESTAMP 2004 7 21 14 45 24
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
        BEGIN BLOCKDEF simtest
            TIMESTAMP 2004 7 24 14 12 45
            RECTANGLE N 64 -704 320 0 
            LINE N 64 -672 0 -672 
            LINE N 64 -544 0 -544 
            LINE N 64 -416 0 -416 
            LINE N 64 -288 0 -288 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 320 -672 384 -672 
            LINE N 320 -608 384 -608 
            LINE N 320 -544 384 -544 
            LINE N 320 -480 384 -480 
            LINE N 320 -416 384 -416 
            LINE N 320 -352 384 -352 
            LINE N 320 -288 384 -288 
            LINE N 320 -224 384 -224 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
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
        BEGIN BLOCKDEF obuf
            TIMESTAMP 2001 2 2 12 24 32
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
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
        BEGIN BLOCKDEF bufg
            TIMESTAMP 2001 2 2 12 22 16
            LINE N 64 -64 64 0 
            LINE N 128 -32 64 -64 
            LINE N 64 0 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 memorymodule
            PIN MemRd XLXN_62
            PIN MemWr XLXN_61
            PIN ResetL XLXN_60
            PIN clk damnclk
            PIN RdAddr(17:0) XLXN_6(17:0)
            PIN WrAddr(17:0) XLXN_8(17:0)
            PIN Din(15:0) XLXN_9(15:0)
            PIN ppdata(7:0) ppdata(7:0)
            PIN RdDone XLXN_74
            PIN WrDone XLXN_63
            PIN lcen XLXN_52
            PIN loen XLXN_53
            PIN lwen XLXN_54
            PIN Dout(15:0) XLXN_75(15:0)
            PIN ppstatus(6:3) ppstatus(6:3)
            PIN laddr(18:0) dum(18:0)
            PIN ldata(15:0) ldata(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_3 ibuf
            PIN I clk
            PIN O XLXN_70
        END BLOCK
        BEGIN BLOCK XLXI_4 ibuf
            PIN I reset
            PIN O XLXN_72
        END BLOCK
        BEGIN BLOCK XLXI_17 obuf
            PIN I fin
            PIN O finish
        END BLOCK
        BEGIN BLOCK XLXI_18 obuf
            PIN I XLXN_52
            PIN O lcen
        END BLOCK
        BEGIN BLOCK XLXI_19 obuf
            PIN I XLXN_53
            PIN O loen
        END BLOCK
        BEGIN BLOCK XLXI_20 obuf
            PIN I XLXN_54
            PIN O lwen
        END BLOCK
        BEGIN BLOCK XLXI_22 obuf16
            PIN I(15:0) dum(15:0)
            PIN O(15:0) laddr(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_23 obuf
            PIN I dum(16)
            PIN O laddr16
        END BLOCK
        BEGIN BLOCK XLXI_24 obuf
            PIN I dum(17)
            PIN O laddr17
        END BLOCK
        BEGIN BLOCK XLXI_25 obuf
            PIN I dum(18)
            PIN O laddr18
        END BLOCK
        BEGIN BLOCK XLXI_30 bufg
            PIN I XLXN_70
            PIN O damnclk
        END BLOCK
        BEGIN BLOCK XLXI_31 simtest
            PIN WrDone XLXN_63
            PIN CLK damnclk
            PIN Reset XLXN_72
            PIN RdDone XLXN_74
            PIN Dout(15:0) XLXN_75(15:0)
            PIN MemRd XLXN_62
            PIN MemWr XLXN_61
            PIN ResetL XLXN_60
            PIN finish fin
            PIN state1 st1
            PIN state2 st2
            PIN state3 st3
            PIN state4 st4
            PIN RdAddr(17:0) XLXN_6(17:0)
            PIN WrAddr(17:0) XLXN_8(17:0)
            PIN Din(15:0) XLXN_9(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_32 obuf
            PIN I st1
            PIN O state1
        END BLOCK
        BEGIN BLOCK XLXI_33 obuf
            PIN I st2
            PIN O state2
        END BLOCK
        BEGIN BLOCK XLXI_34 obuf
            PIN I st3
            PIN O state3
        END BLOCK
        BEGIN BLOCK XLXI_35 obuf
            PIN I st4
            PIN O state4
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 1632 1312 R0
        END INSTANCE
        BEGIN BRANCH XLXN_6(17:0)
            WIRE 1408 1024 1424 1024
            WIRE 1424 1024 1616 1024
            WIRE 1616 1024 1632 1024
        END BRANCH
        BEGIN BRANCH XLXN_8(17:0)
            WIRE 1408 1088 1424 1088
            WIRE 1424 1088 1616 1088
            WIRE 1616 1088 1632 1088
        END BRANCH
        BEGIN BRANCH XLXN_9(15:0)
            WIRE 1408 1152 1424 1152
            WIRE 1424 1152 1616 1152
            WIRE 1616 1152 1632 1152
        END BRANCH
        BEGIN BRANCH dum(18:0)
            WIRE 2016 1216 2032 1216
            WIRE 2032 1216 2096 1216
            WIRE 2096 1216 2352 1216
            WIRE 2352 1216 2560 1216
            WIRE 2560 1216 2624 1216
            WIRE 2624 1216 2624 1232
            WIRE 2624 1232 2624 1296
            WIRE 2624 1296 2624 1344
            WIRE 2624 1344 2624 1392
            WIRE 2624 1392 2624 1504
            WIRE 2624 1504 2624 1552
            BEGIN DISPLAY 2352 1216 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH reset
            WIRE 608 960 624 960
            WIRE 624 960 672 960
        END BRANCH
        INSTANCE XLXI_17 1552 1488 R90
        BEGIN BRANCH finish
            WIRE 1584 1712 1584 1744
        END BRANCH
        IOMARKER 1584 1744 finish
        INSTANCE XLXI_18 2080 928 R0
        INSTANCE XLXI_19 2080 992 R0
        INSTANCE XLXI_20 2080 1056 R0
        BEGIN BRANCH lwen
            WIRE 2304 1024 2320 1024
            WIRE 2320 1024 2496 1024
        END BRANCH
        BEGIN BRANCH loen
            WIRE 2304 960 2368 960
            WIRE 2368 960 2496 960
        END BRANCH
        BEGIN BRANCH lcen
            WIRE 2304 896 2368 896
            WIRE 2368 896 2480 896
        END BRANCH
        INSTANCE XLXI_22 2832 1264 R0
        BUSTAP 2624 1232 2720 1232
        BUSTAP 2624 1296 2720 1296
        BUSTAP 2624 1392 2720 1392
        BEGIN BRANCH dum(16)
            WIRE 2720 1296 2816 1296
        END BRANCH
        BEGIN BRANCH dum(17)
            WIRE 2720 1392 2816 1392
        END BRANCH
        INSTANCE XLXI_23 2816 1328 R0
        INSTANCE XLXI_24 2816 1424 R0
        BUSTAP 2624 1504 2720 1504
        BEGIN BRANCH dum(18)
            WIRE 2720 1504 2752 1504
            WIRE 2752 1504 2864 1504
            BEGIN DISPLAY 2752 1504 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_25 2864 1536 R0
        BEGIN BRANCH laddr16
            WIRE 3040 1296 3136 1296
        END BRANCH
        BEGIN BRANCH laddr17
            WIRE 3040 1392 3168 1392
        END BRANCH
        BEGIN BRANCH laddr18
            WIRE 3088 1504 3168 1504
        END BRANCH
        BEGIN BRANCH laddr(15:0)
            WIRE 3056 1232 3136 1232
        END BRANCH
        IOMARKER 3136 1232 laddr(15:0)
        IOMARKER 3136 1296 laddr16
        IOMARKER 3168 1392 laddr17
        IOMARKER 3168 1504 laddr18
        IOMARKER 2496 960 loen
        IOMARKER 2480 896 lcen
        IOMARKER 2496 1024 lwen
        BEGIN BRANCH dum(15:0)
            WIRE 2720 1232 2736 1232
            WIRE 2736 1232 2832 1232
            BEGIN DISPLAY 2736 1232 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_52
            WIRE 2016 896 2064 896
            WIRE 2064 896 2080 896
        END BRANCH
        BEGIN BRANCH XLXN_53
            WIRE 2016 960 2064 960
            WIRE 2064 960 2080 960
        END BRANCH
        BEGIN BRANCH XLXN_54
            WIRE 2016 1024 2064 1024
            WIRE 2064 1024 2080 1024
        END BRANCH
        BEGIN INSTANCE XLXI_31 1024 1184 R0
        END INSTANCE
        BEGIN BRANCH st4
            WIRE 1408 960 1456 960
            WIRE 1456 960 1488 960
            BEGIN DISPLAY 1456 960 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH st3
            WIRE 1408 896 1456 896
            WIRE 1456 896 1488 896
            BEGIN DISPLAY 1456 896 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH st2
            WIRE 1408 832 1456 832
            WIRE 1456 832 1488 832
            BEGIN DISPLAY 1456 832 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH st1
            WIRE 1408 768 1440 768
            WIRE 1440 768 1488 768
            BEGIN DISPLAY 1440 768 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH fin
            WIRE 1408 704 1456 704
            WIRE 1456 704 1488 704
            BEGIN DISPLAY 1456 704 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_60
            WIRE 1408 640 1424 640
            WIRE 1424 640 1520 640
            WIRE 1520 640 1520 896
            WIRE 1520 896 1616 896
            WIRE 1616 896 1632 896
        END BRANCH
        BEGIN BRANCH XLXN_61
            WIRE 1408 576 1424 576
            WIRE 1424 576 1536 576
            WIRE 1536 576 1536 832
            WIRE 1536 832 1616 832
            WIRE 1616 832 1632 832
        END BRANCH
        BEGIN BRANCH XLXN_62
            WIRE 1408 512 1424 512
            WIRE 1424 512 1552 512
            WIRE 1552 512 1552 768
            WIRE 1552 768 1616 768
            WIRE 1616 768 1632 768
        END BRANCH
        BEGIN BRANCH XLXN_63
            WIRE 944 320 944 512
            WIRE 944 512 1008 512
            WIRE 1008 512 1024 512
            WIRE 944 320 2080 320
            WIRE 2080 320 2080 832
            WIRE 2016 832 2032 832
            WIRE 2032 832 2080 832
        END BRANCH
        BEGIN BRANCH fin
            WIRE 1584 1376 1584 1440
            WIRE 1584 1440 1584 1488
            BEGIN DISPLAY 1584 1440 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_3 432 768 R0
        INSTANCE XLXI_30 704 768 R0
        IOMARKER 608 960 reset
        INSTANCE XLXI_4 672 992 R0
        BEGIN BRANCH st1
            WIRE 2112 1840 2144 1840
            WIRE 2144 1840 2368 1840
            BEGIN DISPLAY 2144 1840 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH st2
            WIRE 2112 1952 2144 1952
            WIRE 2144 1952 2368 1952
            BEGIN DISPLAY 2144 1952 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH st3
            WIRE 2096 2064 2128 2064
            WIRE 2128 2064 2352 2064
            BEGIN DISPLAY 2128 2064 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH st4
            WIRE 2112 2160 2144 2160
            WIRE 2144 2160 2368 2160
            BEGIN DISPLAY 2144 2160 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_32 2368 1872 R0
        INSTANCE XLXI_33 2368 1984 R0
        INSTANCE XLXI_34 2352 2096 R0
        INSTANCE XLXI_35 2368 2192 R0
        BEGIN BRANCH state1
            WIRE 2592 1840 2688 1840
        END BRANCH
        BEGIN BRANCH state2
            WIRE 2592 1952 2688 1952
        END BRANCH
        BEGIN BRANCH state3
            WIRE 2576 2064 2688 2064
        END BRANCH
        BEGIN BRANCH state4
            WIRE 2592 2160 2688 2160
        END BRANCH
        IOMARKER 2688 1840 state1
        IOMARKER 2688 1952 state2
        IOMARKER 2688 2064 state3
        IOMARKER 2688 2160 state4
        BEGIN BRANCH ldata(15:0)
            WIRE 2016 1280 2032 1280
            WIRE 2032 1280 2048 1280
            WIRE 2048 1280 2048 1504
            WIRE 2048 1504 2080 1504
            WIRE 2080 1504 2096 1504
            WIRE 2096 1504 2320 1504
            WIRE 2320 1504 2480 1504
            WIRE 2480 1504 2480 1696
            WIRE 2480 1696 2496 1696
            WIRE 2496 1696 2512 1696
        END BRANCH
        IOMARKER 2512 1696 ldata(15:0)
        BEGIN BRANCH clk
            WIRE 352 736 416 736
            WIRE 416 736 432 736
        END BRANCH
        IOMARKER 352 736 clk
        BEGIN BRANCH XLXN_70
            WIRE 656 736 704 736
        END BRANCH
        BEGIN BRANCH damnclk
            WIRE 928 736 976 736
            WIRE 976 736 976 976
            WIRE 928 976 928 1232
            WIRE 928 1232 1536 1232
            WIRE 928 976 976 976
            WIRE 976 640 976 736
            WIRE 976 640 1024 640
            WIRE 1536 960 1536 1232
            WIRE 1536 960 1632 960
        END BRANCH
        BEGIN BRANCH ppdata(7:0)
            WIRE 1408 1216 1408 1424
            WIRE 1408 1424 1408 1648
            WIRE 1408 1648 1408 1712
            WIRE 1408 1712 1408 1728
            WIRE 1408 1216 1616 1216
            WIRE 1616 1216 1632 1216
        END BRANCH
        IOMARKER 1408 1728 ppdata(7:0)
        BEGIN BRANCH ppstatus(6:3)
            WIRE 2016 1152 2384 1152
            WIRE 2384 1152 2400 1152
        END BRANCH
        IOMARKER 2400 1152 ppstatus(6:3)
        BEGIN BRANCH XLXN_72
            WIRE 896 960 960 960
            WIRE 960 768 960 960
            WIRE 960 768 1024 768
        END BRANCH
        BEGIN BRANCH XLXN_74
            WIRE 688 224 720 224
            WIRE 720 224 2064 224
            WIRE 2064 224 2064 768
            WIRE 688 224 688 832
            WIRE 688 832 720 832
            WIRE 720 832 720 896
            WIRE 720 896 1024 896
            WIRE 2016 768 2064 768
        END BRANCH
        BEGIN BRANCH XLXN_75(15:0)
            WIRE 944 1024 1024 1024
            WIRE 944 1024 944 1360
            WIRE 944 1360 2112 1360
            WIRE 2016 1088 2112 1088
            WIRE 2112 1088 2112 1360
        END BRANCH
    END SHEET
END SCHEMATIC
