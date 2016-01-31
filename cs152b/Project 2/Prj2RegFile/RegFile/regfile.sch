VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName Virtex
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL Ra(2:0)
        SIGNAL Rb(2:0)
        SIGNAL Rw(2:0)
        SIGNAL WrEn
        SIGNAL BusW(15:0)
        SIGNAL Clock
        SIGNAL Reg2(15:0)
        SIGNAL Reg3(15:0)
        SIGNAL Reg4(15:0)
        SIGNAL Reg5(15:0)
        SIGNAL Reg6(15:0)
        SIGNAL Reg7(15:0)
        SIGNAL BusA(15:0)
        SIGNAL BusB(15:0)
        SIGNAL Rw(0)
        SIGNAL Rw(1)
        SIGNAL Rw(2)
        SIGNAL Wr1
        SIGNAL Wr2
        SIGNAL Wr3
        SIGNAL Wr4
        SIGNAL Wr5
        SIGNAL Wr6
        SIGNAL Wr7
        SIGNAL Reg0(0)
        SIGNAL Reg0(2)
        SIGNAL Reg0(3)
        SIGNAL Reg0(4)
        SIGNAL Reg0(5)
        SIGNAL Reg0(6)
        SIGNAL Reg0(7)
        SIGNAL Reg0(8)
        SIGNAL Reg0(9)
        SIGNAL Reg0(10)
        SIGNAL Reg0(11)
        SIGNAL Reg0(12)
        SIGNAL Reg0(13)
        SIGNAL Reg0(14)
        SIGNAL Reg0(1)
        SIGNAL Reg0(15)
        SIGNAL Reg0(15:0)
        SIGNAL Reg1(15:0)
        SIGNAL Clear
        SIGNAL WrEn1
        SIGNAL WrEn2
        SIGNAL WrEn3
        SIGNAL WrEn4
        SIGNAL WrEn5
        SIGNAL WrEn6
        SIGNAL WrEn7
        PORT Input WrEn
        PORT Input BusW(15:0)
        PORT Input Clock
        PORT Output BusA(15:0)
        PORT Output BusB(15:0)
        PORT Input Ra(2:0)
        PORT Input Rb(2:0)
        PORT Input Rw(2:0)
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
        BEGIN BLOCKDEF buxmux16
            TIMESTAMP 2004 7 13 12 14 43
            RECTANGLE N 32 0 448 1184 
            BEGIN LINE W 0 48 32 48 
            END LINE
            BEGIN LINE W 0 80 32 80 
            END LINE
            BEGIN LINE W 0 112 32 112 
            END LINE
            BEGIN LINE W 0 144 32 144 
            END LINE
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 2 2 12 24 11
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF d3_8e
            TIMESTAMP 2001 2 2 12 23 28
            LINE N 0 -576 64 -576 
            LINE N 0 -512 64 -512 
            LINE N 0 -448 64 -448 
            LINE N 384 -576 320 -576 
            LINE N 384 -512 320 -512 
            LINE N 384 -448 320 -448 
            LINE N 384 -384 320 -384 
            LINE N 384 -320 320 -320 
            LINE N 384 -256 320 -256 
            LINE N 384 -192 320 -192 
            LINE N 384 -128 320 -128 
            RECTANGLE N 64 -640 320 -64 
            LINE N 0 -128 64 -128 
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
        BEGIN BLOCK XLXI_67 fd16ce
            PIN C Clock
            PIN CE WrEn7
            PIN CLR Clear
            PIN D(15:0) BusW(15:0)
            PIN Q(15:0) Reg7(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_70 fd16ce
            PIN C Clock
            PIN CE WrEn1
            PIN CLR Clear
            PIN D(15:0) BusW(15:0)
            PIN Q(15:0) Reg1(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_68 fd16ce
            PIN C Clock
            PIN CE WrEn2
            PIN CLR Clear
            PIN D(15:0) BusW(15:0)
            PIN Q(15:0) Reg2(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_66 fd16ce
            PIN C Clock
            PIN CE WrEn3
            PIN CLR Clear
            PIN D(15:0) BusW(15:0)
            PIN Q(15:0) Reg3(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_72 fd16ce
            PIN C Clock
            PIN CE WrEn4
            PIN CLR Clear
            PIN D(15:0) BusW(15:0)
            PIN Q(15:0) Reg4(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_71 fd16ce
            PIN C Clock
            PIN CE WrEn5
            PIN CLR Clear
            PIN D(15:0) BusW(15:0)
            PIN Q(15:0) Reg5(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_69 fd16ce
            PIN C Clock
            PIN CE WrEn6
            PIN CLR Clear
            PIN D(15:0) BusW(15:0)
            PIN Q(15:0) Reg6(15:0)
        END BLOCK
        BEGIN BLOCK BusAMux buxmux16
            PIN MH(15:0) Reg7(15:0)
            PIN MG(15:0) Reg6(15:0)
            PIN MF(15:0) Reg5(15:0)
            PIN ME(15:0) Reg4(15:0)
            PIN MD(15:0) Reg3(15:0)
            PIN MC(15:0) Reg2(15:0)
            PIN MB(15:0) Reg1(15:0)
            PIN MA(15:0) Reg0(15:0)
            PIN S(2:0) Ra(2:0)
            PIN O(15:0) BusA(15:0)
        END BLOCK
        BEGIN BLOCK BusBMux buxmux16
            PIN MH(15:0) Reg7(15:0)
            PIN MG(15:0) Reg6(15:0)
            PIN MF(15:0) Reg5(15:0)
            PIN ME(15:0) Reg4(15:0)
            PIN MD(15:0) Reg3(15:0)
            PIN MC(15:0) Reg2(15:0)
            PIN MB(15:0) Reg1(15:0)
            PIN MA(15:0) Reg0(15:0)
            PIN S(2:0) Rb(2:0)
            PIN O(15:0) BusB(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_7 d3_8e
            PIN A0 Rw(0)
            PIN A1 Rw(1)
            PIN A2 Rw(2)
            PIN E WrEn
            PIN D0
            PIN D1 Wr1
            PIN D2 Wr2
            PIN D3 Wr3
            PIN D4 Wr4
            PIN D5 Wr5
            PIN D6 Wr6
            PIN D7 Wr7
        END BLOCK
        BEGIN BLOCK XLXI_48 gnd
            PIN G Reg0(0)
        END BLOCK
        BEGIN BLOCK XLXI_49 gnd
            PIN G Reg0(1)
        END BLOCK
        BEGIN BLOCK XLXI_50 gnd
            PIN G Reg0(2)
        END BLOCK
        BEGIN BLOCK XLXI_51 gnd
            PIN G Reg0(3)
        END BLOCK
        BEGIN BLOCK XLXI_52 gnd
            PIN G Reg0(4)
        END BLOCK
        BEGIN BLOCK XLXI_53 gnd
            PIN G Reg0(5)
        END BLOCK
        BEGIN BLOCK XLXI_54 gnd
            PIN G Reg0(6)
        END BLOCK
        BEGIN BLOCK XLXI_55 gnd
            PIN G Reg0(7)
        END BLOCK
        BEGIN BLOCK XLXI_56 gnd
            PIN G Reg0(8)
        END BLOCK
        BEGIN BLOCK XLXI_57 gnd
            PIN G Reg0(9)
        END BLOCK
        BEGIN BLOCK XLXI_58 gnd
            PIN G Reg0(10)
        END BLOCK
        BEGIN BLOCK XLXI_59 gnd
            PIN G Reg0(11)
        END BLOCK
        BEGIN BLOCK XLXI_60 gnd
            PIN G Reg0(12)
        END BLOCK
        BEGIN BLOCK XLXI_61 gnd
            PIN G Reg0(13)
        END BLOCK
        BEGIN BLOCK XLXI_62 gnd
            PIN G Reg0(14)
        END BLOCK
        BEGIN BLOCK XLXI_63 gnd
            PIN G Reg0(15)
        END BLOCK
        BEGIN BLOCK XLXI_73 gnd
            PIN G Clear
        END BLOCK
        BEGIN BLOCK XLXI_74 and2
            PIN I0 Wr2
            PIN I1 WrEn
            PIN O WrEn2
        END BLOCK
        BEGIN BLOCK XLXI_81 and2
            PIN I0 Wr3
            PIN I1 WrEn
            PIN O WrEn3
        END BLOCK
        BEGIN BLOCK XLXI_82 and2
            PIN I0 Wr4
            PIN I1 WrEn
            PIN O WrEn4
        END BLOCK
        BEGIN BLOCK XLXI_83 and2
            PIN I0 Wr5
            PIN I1 WrEn
            PIN O WrEn5
        END BLOCK
        BEGIN BLOCK XLXI_84 and2
            PIN I0 Wr6
            PIN I1 WrEn
            PIN O WrEn6
        END BLOCK
        BEGIN BLOCK XLXI_85 and2
            PIN I0 Wr7
            PIN I1 WrEn
            PIN O WrEn7
        END BLOCK
        BEGIN BLOCK XLXI_86 and2
            PIN I0 Wr1
            PIN I1 WrEn
            PIN O WrEn1
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 5440 3520
        BEGIN BRANCH Ra(2:0)
            WIRE 352 256 544 256
        END BRANCH
        BEGIN BRANCH Rw(2:0)
            WIRE 368 432 544 432
        END BRANCH
        BEGIN BRANCH Rb(2:0)
            WIRE 352 352 544 352
        END BRANCH
        BEGIN BRANCH BusW(15:0)
            WIRE 416 640 544 640
        END BRANCH
        BEGIN BRANCH WrEn
            WIRE 336 528 544 528
        END BRANCH
        BEGIN BRANCH Clock
            WIRE 336 752 544 752
        END BRANCH
        BEGIN BRANCH Ra(2:0)
            WIRE 3488 2576 3504 2576
            WIRE 3504 2576 3568 2576
            BEGIN DISPLAY 3504 2576 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Rb(2:0)
            WIRE 3424 1264 3472 1264
            WIRE 3472 1264 3568 1264
            BEGIN DISPLAY 3472 1264 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg6(15:0)
            WIRE 3440 1584 3472 1584
            WIRE 3472 1584 3568 1584
            BEGIN DISPLAY 3472 1584 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg5(15:0)
            WIRE 3440 1616 3472 1616
            WIRE 3472 1616 3568 1616
            BEGIN DISPLAY 3472 1616 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg4(15:0)
            WIRE 3440 1648 3472 1648
            WIRE 3472 1648 3504 1648
            WIRE 3504 1648 3568 1648
            BEGIN DISPLAY 3472 1648 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg3(15:0)
            WIRE 3440 1680 3472 1680
            WIRE 3472 1680 3568 1680
            BEGIN DISPLAY 3472 1680 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg2(15:0)
            WIRE 3440 1712 3472 1712
            WIRE 3472 1712 3568 1712
            BEGIN DISPLAY 3472 1712 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg1(15:0)
            WIRE 3440 1744 3472 1744
            WIRE 3472 1744 3568 1744
            BEGIN DISPLAY 3472 1744 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(15:0)
            WIRE 3440 1776 3472 1776
            WIRE 3472 1776 3504 1776
            WIRE 3504 1776 3568 1776
            BEGIN DISPLAY 3472 1776 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg2(15:0)
            WIRE 784 2080 816 2080
            WIRE 816 2080 896 2080
            BEGIN DISPLAY 816 2080 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg3(15:0)
            WIRE 784 2560 832 2560
            WIRE 832 2560 896 2560
            BEGIN DISPLAY 832 2560 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg4(15:0)
            WIRE 1664 1040 1728 1040
            WIRE 1728 1040 1792 1040
            BEGIN DISPLAY 1728 1040 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg5(15:0)
            WIRE 1680 1600 1712 1600
            WIRE 1712 1600 1792 1600
            BEGIN DISPLAY 1712 1600 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg6(15:0)
            WIRE 1680 2080 1712 2080
            WIRE 1712 2080 1792 2080
            BEGIN DISPLAY 1712 2080 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg7(15:0)
            WIRE 1680 2560 1712 2560
            WIRE 1712 2560 1792 2560
            BEGIN DISPLAY 1712 2560 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg5(15:0)
            WIRE 3424 304 3440 304
            WIRE 3440 304 3472 304
            WIRE 3472 304 3568 304
            BEGIN DISPLAY 3472 304 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg4(15:0)
            WIRE 3424 336 3440 336
            WIRE 3440 336 3472 336
            WIRE 3472 336 3568 336
            BEGIN DISPLAY 3472 336 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg3(15:0)
            WIRE 3424 368 3440 368
            WIRE 3440 368 3472 368
            WIRE 3472 368 3568 368
            BEGIN DISPLAY 3472 368 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg1(15:0)
            WIRE 3424 432 3440 432
            WIRE 3440 432 3472 432
            WIRE 3472 432 3568 432
            BEGIN DISPLAY 3472 432 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(15:0)
            WIRE 3424 464 3440 464
            WIRE 3440 464 3472 464
            WIRE 3472 464 3568 464
            BEGIN DISPLAY 3472 464 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusA(15:0)
            WIRE 4560 304 4704 304
            WIRE 4704 304 4864 304
        END BRANCH
        BEGIN BRANCH BusB(15:0)
            WIRE 4560 384 4688 384
            WIRE 4688 384 4864 384
        END BRANCH
        BEGIN BRANCH BusA(15:0)
            WIRE 4048 1552 4160 1552
            WIRE 4160 1552 4176 1552
            WIRE 4176 1552 4192 1552
            BEGIN DISPLAY 4160 1552 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusW(15:0)
            WIRE 288 1600 336 1600
            WIRE 336 1600 400 1600
            BEGIN DISPLAY 336 1600 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusW(15:0)
            WIRE 288 2080 320 2080
            WIRE 320 2080 400 2080
            BEGIN DISPLAY 320 2080 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusW(15:0)
            WIRE 288 2560 320 2560
            WIRE 320 2560 400 2560
            BEGIN DISPLAY 320 2560 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusW(15:0)
            WIRE 1168 1040 1216 1040
            WIRE 1216 1040 1280 1040
            WIRE 1280 1040 1296 1040
            WIRE 1216 1040 1296 1040
            BEGIN DISPLAY 1216 1040 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusW(15:0)
            WIRE 1168 1600 1216 1600
            WIRE 1216 1600 1296 1600
            BEGIN DISPLAY 1216 1600 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusW(15:0)
            WIRE 1168 2080 1216 2080
            WIRE 1216 2080 1296 2080
            BEGIN DISPLAY 1216 2080 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusW(15:0)
            WIRE 1168 2560 1216 2560
            WIRE 1216 2560 1296 2560
            BEGIN DISPLAY 1216 2560 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Rw(0)
            WIRE 2192 912 2240 912
            WIRE 2240 912 2384 912
            BEGIN DISPLAY 2240 912 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Rw(1)
            WIRE 2192 976 2208 976
            WIRE 2208 976 2240 976
            WIRE 2240 976 2384 976
            BEGIN DISPLAY 2240 976 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Rw(2)
            WIRE 2192 1040 2240 1040
            WIRE 2240 1040 2384 1040
            BEGIN DISPLAY 2240 1040 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr1
            WIRE 2768 976 2880 976
            WIRE 2880 976 2992 976
            BEGIN DISPLAY 2880 976 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr3
            WIRE 2768 1104 2864 1104
            WIRE 2864 1104 2880 1104
            WIRE 2880 1104 2992 1104
            BEGIN DISPLAY 2880 1104 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr4
            WIRE 2768 1168 2864 1168
            WIRE 2864 1168 2880 1168
            WIRE 2880 1168 2992 1168
            BEGIN DISPLAY 2880 1168 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr5
            WIRE 2768 1232 2864 1232
            WIRE 2864 1232 2880 1232
            WIRE 2880 1232 2992 1232
            BEGIN DISPLAY 2880 1232 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr6
            WIRE 2768 1296 2864 1296
            WIRE 2864 1296 2880 1296
            WIRE 2880 1296 2992 1296
            BEGIN DISPLAY 2880 1296 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr7
            WIRE 2768 1360 2864 1360
            WIRE 2864 1360 2880 1360
            WIRE 2880 1360 2992 1360
            BEGIN DISPLAY 2880 1360 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn4
            WIRE 1168 1104 1200 1104
            WIRE 1200 1104 1216 1104
            WIRE 1216 1104 1232 1104
            WIRE 1232 1104 1264 1104
            WIRE 1264 1104 1280 1104
            WIRE 1280 1104 1296 1104
            WIRE 1264 1104 1296 1104
            BEGIN DISPLAY 1200 1104 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn1
            WIRE 288 1664 320 1664
            WIRE 320 1664 400 1664
            BEGIN DISPLAY 320 1664 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn5
            WIRE 1168 1664 1184 1664
            WIRE 1184 1664 1200 1664
            WIRE 1200 1664 1232 1664
            WIRE 1232 1664 1296 1664
            BEGIN DISPLAY 1184 1664 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn2
            WIRE 288 2144 320 2144
            WIRE 320 2144 336 2144
            WIRE 336 2144 400 2144
            BEGIN DISPLAY 336 2144 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn6
            WIRE 1168 2144 1200 2144
            WIRE 1200 2144 1216 2144
            WIRE 1216 2144 1232 2144
            WIRE 1232 2144 1296 2144
            BEGIN DISPLAY 1200 2144 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn3
            WIRE 288 2624 304 2624
            WIRE 304 2624 320 2624
            WIRE 320 2624 400 2624
            BEGIN DISPLAY 304 2624 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn7
            WIRE 1168 2624 1200 2624
            WIRE 1200 2624 1232 2624
            WIRE 1232 2624 1296 2624
            BEGIN DISPLAY 1200 2624 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clock
            WIRE 1168 1168 1200 1168
            WIRE 1200 1168 1248 1168
            WIRE 1248 1168 1280 1168
            WIRE 1280 1168 1296 1168
            WIRE 1248 1168 1296 1168
            BEGIN DISPLAY 1200 1168 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clock
            WIRE 288 1728 320 1728
            WIRE 320 1728 400 1728
            BEGIN DISPLAY 320 1728 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clock
            WIRE 1152 1728 1200 1728
            WIRE 1200 1728 1296 1728
            BEGIN DISPLAY 1200 1728 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clock
            WIRE 272 2208 304 2208
            WIRE 304 2208 400 2208
            BEGIN DISPLAY 304 2208 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clock
            WIRE 1168 2208 1216 2208
            WIRE 1216 2208 1296 2208
            BEGIN DISPLAY 1216 2208 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clock
            WIRE 288 2688 320 2688
            WIRE 320 2688 400 2688
            BEGIN DISPLAY 320 2688 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clock
            WIRE 1168 2688 1216 2688
            WIRE 1216 2688 1296 2688
            BEGIN DISPLAY 1216 2688 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn
            WIRE 2192 1360 2224 1360
            WIRE 2224 1360 2384 1360
            BEGIN DISPLAY 2224 1360 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr2
            WIRE 2768 1040 2864 1040
            WIRE 2864 1040 2880 1040
            WIRE 2880 1040 2992 1040
            BEGIN DISPLAY 2880 1040 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(0)
            WIRE 1776 256 1776 272
            WIRE 1776 272 1776 288
            WIRE 1776 288 1776 304
            WIRE 1776 304 1776 320
            BEGIN DISPLAY 1776 272 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(1)
            WIRE 1856 256 1856 272
            WIRE 1856 272 1856 288
            WIRE 1856 288 1856 304
            WIRE 1856 304 1856 320
            BEGIN DISPLAY 1856 272 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(2)
            WIRE 1920 256 1920 272
            WIRE 1920 272 1920 304
            WIRE 1920 304 1920 320
            BEGIN DISPLAY 1920 272 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(3)
            WIRE 1984 256 1984 272
            WIRE 1984 272 1984 288
            WIRE 1984 288 1984 304
            WIRE 1984 304 1984 320
            BEGIN DISPLAY 1984 288 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(4)
            WIRE 2048 256 2048 272
            WIRE 2048 272 2048 288
            WIRE 2048 288 2048 304
            WIRE 2048 304 2048 320
            BEGIN DISPLAY 2048 288 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(5)
            WIRE 2112 256 2112 272
            WIRE 2112 272 2112 304
            WIRE 2112 304 2112 320
            BEGIN DISPLAY 2112 272 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(6)
            WIRE 2176 256 2176 272
            WIRE 2176 272 2176 304
            WIRE 2176 304 2176 320
            BEGIN DISPLAY 2176 272 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(7)
            WIRE 2240 256 2240 272
            WIRE 2240 272 2240 304
            WIRE 2240 304 2240 320
            BEGIN DISPLAY 2240 272 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(8)
            WIRE 2304 256 2304 272
            WIRE 2304 272 2304 304
            WIRE 2304 304 2304 320
            BEGIN DISPLAY 2304 272 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(9)
            WIRE 2368 256 2368 272
            WIRE 2368 272 2368 288
            WIRE 2368 288 2368 304
            WIRE 2368 304 2368 320
            BEGIN DISPLAY 2368 288 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(10)
            WIRE 2432 256 2432 272
            WIRE 2432 272 2432 288
            WIRE 2432 288 2432 304
            WIRE 2432 304 2432 320
            BEGIN DISPLAY 2432 288 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(11)
            WIRE 2496 256 2496 272
            WIRE 2496 272 2496 304
            WIRE 2496 304 2496 320
            BEGIN DISPLAY 2496 272 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(12)
            WIRE 2560 256 2560 272
            WIRE 2560 272 2560 304
            WIRE 2560 304 2560 320
            BEGIN DISPLAY 2560 272 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(13)
            WIRE 2624 256 2624 272
            WIRE 2624 272 2624 288
            WIRE 2624 288 2624 304
            WIRE 2624 304 2624 320
            BEGIN DISPLAY 2624 288 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(14)
            WIRE 2688 256 2688 272
            WIRE 2688 272 2688 288
            WIRE 2688 288 2688 304
            WIRE 2688 304 2688 320
            BEGIN DISPLAY 2688 288 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(15)
            WIRE 2752 256 2752 272
            WIRE 2752 272 2752 288
            WIRE 2752 288 2752 304
            WIRE 2752 304 2752 320
            BEGIN DISPLAY 2752 288 ATTR Name
                ALIGNMENT TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BusB(15:0)
            WIRE 4048 240 4128 240
            WIRE 4128 240 4224 240
            BEGIN DISPLAY 4128 240 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg7(15:0)
            WIRE 3440 1552 3472 1552
            WIRE 3472 1552 3568 1552
            BEGIN DISPLAY 3472 1552 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE BusBMux 3568 192 R0
        END INSTANCE
        BEGIN INSTANCE BusAMux 3568 1504 R0
        END INSTANCE
        IOMARKER 416 640 BusW(15:0)
        IOMARKER 336 528 WrEn
        IOMARKER 336 752 Clock
        IOMARKER 352 256 Ra(2:0)
        IOMARKER 352 352 Rb(2:0)
        IOMARKER 368 432 Rw(2:0)
        BEGIN BRANCH Clear
            WIRE 272 2304 288 2304
            WIRE 288 2304 400 2304
            BEGIN DISPLAY 288 2304 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clear
            WIRE 272 2784 304 2784
            WIRE 304 2784 400 2784
            BEGIN DISPLAY 304 2784 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clear
            WIRE 1184 2784 1216 2784
            WIRE 1216 2784 1296 2784
            BEGIN DISPLAY 1216 2784 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clear
            WIRE 1168 2304 1200 2304
            WIRE 1200 2304 1296 2304
            BEGIN DISPLAY 1200 2304 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clear
            WIRE 1152 1824 1184 1824
            WIRE 1184 1824 1296 1824
            BEGIN DISPLAY 1184 1824 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clear
            WIRE 288 1824 304 1824
            WIRE 304 1824 400 1824
            BEGIN DISPLAY 304 1824 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clear
            WIRE 1168 1264 1200 1264
            WIRE 1200 1264 1280 1264
            BEGIN DISPLAY 1200 1264 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clear
            WIRE 304 1136 432 1136
            WIRE 432 1136 544 1136
            WIRE 544 1136 544 1184
            BEGIN DISPLAY 432 1136 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg1(15:0)
            WIRE 784 1600 816 1600
            WIRE 816 1600 880 1600
            BEGIN DISPLAY 816 1600 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn2
            WIRE 2720 1840 2736 1840
            WIRE 2736 1840 2880 1840
            BEGIN DISPLAY 2736 1840 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn
            WIRE 2288 1808 2320 1808
            WIRE 2320 1808 2464 1808
            BEGIN DISPLAY 2320 1808 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr2
            WIRE 2288 1872 2320 1872
            WIRE 2320 1872 2464 1872
            BEGIN DISPLAY 2320 1872 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn3
            WIRE 2720 2048 2736 2048
            WIRE 2736 2048 2880 2048
            BEGIN DISPLAY 2736 2048 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn
            WIRE 2288 2016 2320 2016
            WIRE 2320 2016 2464 2016
            BEGIN DISPLAY 2320 2016 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr3
            WIRE 2288 2080 2320 2080
            WIRE 2320 2080 2464 2080
            BEGIN DISPLAY 2320 2080 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn4
            WIRE 2720 2240 2752 2240
            WIRE 2752 2240 2880 2240
            BEGIN DISPLAY 2752 2240 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn
            WIRE 2288 2208 2320 2208
            WIRE 2320 2208 2336 2208
            WIRE 2336 2208 2464 2208
            BEGIN DISPLAY 2336 2208 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr4
            WIRE 2288 2272 2320 2272
            WIRE 2320 2272 2464 2272
            BEGIN DISPLAY 2320 2272 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn5
            WIRE 2720 2416 2752 2416
            WIRE 2752 2416 2880 2416
            BEGIN DISPLAY 2752 2416 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn
            WIRE 2288 2384 2304 2384
            WIRE 2304 2384 2320 2384
            WIRE 2320 2384 2464 2384
            BEGIN DISPLAY 2304 2384 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr5
            WIRE 2288 2448 2320 2448
            WIRE 2320 2448 2464 2448
            BEGIN DISPLAY 2320 2448 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn6
            WIRE 2720 2576 2752 2576
            WIRE 2752 2576 2880 2576
            BEGIN DISPLAY 2752 2576 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn
            WIRE 2288 2544 2304 2544
            WIRE 2304 2544 2320 2544
            WIRE 2320 2544 2464 2544
            BEGIN DISPLAY 2304 2544 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr6
            WIRE 2288 2608 2320 2608
            WIRE 2320 2608 2464 2608
            BEGIN DISPLAY 2320 2608 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn7
            WIRE 2720 2736 2768 2736
            WIRE 2768 2736 2880 2736
            BEGIN DISPLAY 2768 2736 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn
            WIRE 2288 2704 2304 2704
            WIRE 2304 2704 2320 2704
            WIRE 2320 2704 2464 2704
            BEGIN DISPLAY 2304 2704 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr7
            WIRE 2288 2768 2320 2768
            WIRE 2320 2768 2464 2768
            BEGIN DISPLAY 2320 2768 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn1
            WIRE 2720 1664 2752 1664
            WIRE 2752 1664 2880 1664
            BEGIN DISPLAY 2752 1664 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrEn
            WIRE 2288 1632 2304 1632
            WIRE 2304 1632 2320 1632
            WIRE 2320 1632 2464 1632
            BEGIN DISPLAY 2304 1632 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Wr1
            WIRE 2288 1696 2320 1696
            WIRE 2320 1696 2464 1696
            BEGIN DISPLAY 2320 1696 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 4864 304 BusA(15:0)
        IOMARKER 4864 384 BusB(15:0)
        INSTANCE XLXI_66 400 2816 R0
        INSTANCE XLXI_68 400 2336 R0
        INSTANCE XLXI_67 1296 2816 R0
        INSTANCE XLXI_69 1296 2336 R0
        INSTANCE XLXI_71 1296 1856 R0
        INSTANCE XLXI_72 1280 1296 R0
        INSTANCE XLXI_70 400 1856 R0
        INSTANCE XLXI_73 480 1312 R0
        INSTANCE XLXI_74 2464 1936 R0
        INSTANCE XLXI_81 2464 2144 R0
        INSTANCE XLXI_82 2464 2336 R0
        INSTANCE XLXI_83 2464 2512 R0
        INSTANCE XLXI_84 2464 2672 R0
        INSTANCE XLXI_85 2464 2832 R0
        INSTANCE XLXI_86 2464 1760 R0
        INSTANCE XLXI_7 2384 1488 R0
        BEGIN BRANCH Reg2(15:0)
            WIRE 3424 400 3440 400
            WIRE 3440 400 3472 400
            WIRE 3472 400 3568 400
            BEGIN DISPLAY 3472 400 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg6(15:0)
            WIRE 3424 272 3456 272
            WIRE 3456 272 3472 272
            WIRE 3472 272 3568 272
            BEGIN DISPLAY 3472 272 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Reg0(15:0)
            WIRE 1728 160 1776 160
            WIRE 1776 160 1856 160
            WIRE 1856 160 1920 160
            WIRE 1920 160 1984 160
            WIRE 1984 160 2048 160
            WIRE 2048 160 2112 160
            WIRE 2112 160 2176 160
            WIRE 2176 160 2240 160
            WIRE 2240 160 2304 160
            WIRE 2304 160 2368 160
            WIRE 2368 160 2432 160
            WIRE 2432 160 2496 160
            WIRE 2496 160 2560 160
            WIRE 2560 160 2624 160
            WIRE 2624 160 2688 160
            WIRE 2688 160 2752 160
            WIRE 2752 160 2768 160
            WIRE 2768 160 2832 160
            WIRE 2832 160 2928 160
            BEGIN DISPLAY 2832 160 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1776 160 1776 256
        BUSTAP 1856 160 1856 256
        BUSTAP 1920 160 1920 256
        BUSTAP 1984 160 1984 256
        BUSTAP 2048 160 2048 256
        BUSTAP 2112 160 2112 256
        BUSTAP 2176 160 2176 256
        BUSTAP 2240 160 2240 256
        BUSTAP 2304 160 2304 256
        BUSTAP 2368 160 2368 256
        BUSTAP 2432 160 2432 256
        BUSTAP 2496 160 2496 256
        BUSTAP 2560 160 2560 256
        BUSTAP 2624 160 2624 256
        BUSTAP 2688 160 2688 256
        BUSTAP 2752 160 2752 256
        INSTANCE XLXI_48 1712 448 R0
        INSTANCE XLXI_49 1792 448 R0
        INSTANCE XLXI_50 1856 448 R0
        INSTANCE XLXI_51 1920 448 R0
        INSTANCE XLXI_52 1984 448 R0
        INSTANCE XLXI_53 2048 448 R0
        INSTANCE XLXI_54 2112 448 R0
        INSTANCE XLXI_55 2176 448 R0
        INSTANCE XLXI_56 2240 448 R0
        INSTANCE XLXI_57 2304 448 R0
        INSTANCE XLXI_58 2368 448 R0
        INSTANCE XLXI_59 2432 448 R0
        INSTANCE XLXI_60 2496 448 R0
        INSTANCE XLXI_61 2560 448 R0
        INSTANCE XLXI_62 2624 448 R0
        INSTANCE XLXI_63 2688 448 R0
        BEGIN BRANCH Reg7(15:0)
            WIRE 3424 240 3472 240
            WIRE 3472 240 3568 240
            BEGIN DISPLAY 3472 240 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
