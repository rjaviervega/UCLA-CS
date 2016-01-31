VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName Virtex
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL A3_in
        SIGNAL A2_in
        SIGNAL A1_in
        SIGNAL A0_in
        SIGNAL B3_in
        SIGNAL B2_in
        SIGNAL B1_in
        SIGNAL B0_in
        SIGNAL B_or_one(1)
        SIGNAL B_or_one(0)
        SIGNAL add(0)
        SIGNAL add(1)
        SIGNAL add(3)
        SIGNAL B_or_one(2)
        SIGNAL B_or_one(3)
        SIGNAL bitand(3)
        SIGNAL bitand(2)
        SIGNAL bitand(1)
        SIGNAL bitand(0)
        SIGNAL bitor(3)
        SIGNAL bitor(2)
        SIGNAL bitor(1)
        SIGNAL bitor(0)
        SIGNAL XLXN_55
        SIGNAL XLXN_56
        SIGNAL XLXN_60
        SIGNAL XLXN_62
        SIGNAL LT
        SIGNAL XLXN_74
        SIGNAL OVF
        SIGNAL XLXN_77
        SIGNAL B(3:0)
        SIGNAL BorOne(0)
        SIGNAL BorOne(1)
        SIGNAL BorOne(2)
        SIGNAL BorOne(3)
        SIGNAL B_or_one(3:0)
        SIGNAL carry_in
        SIGNAL Cin
        SIGNAL XLXN_99
        SIGNAL carry
        SIGNAL XLXN_102
        SIGNAL XLXN_103
        SIGNAL add(2)
        SIGNAL ALUctrl0
        SIGNAL ALUctrl1
        SIGNAL ALUctrl2
        SIGNAL S3
        SIGNAL S2
        SIGNAL S1
        SIGNAL output(3)
        SIGNAL output(3:0)
        SIGNAL XLXN_124
        SIGNAL XLXN_125
        SIGNAL LS(3)
        SIGNAL XLXN_135
        SIGNAL XLXN_136
        SIGNAL LS(2)
        SIGNAL XLXN_152
        SIGNAL XLXN_153
        SIGNAL XLXN_154
        SIGNAL LS(1)
        SIGNAL XLXN_165
        SIGNAL XLXN_166
        SIGNAL XLXN_167
        SIGNAL LS(0)
        SIGNAL XLXN_177
        SIGNAL XLXN_178
        SIGNAL XLXN_179
        SIGNAL RS(3)
        SIGNAL XLXN_188
        SIGNAL XLXN_189
        SIGNAL XLXN_190
        SIGNAL RS(2)
        SIGNAL XLXN_199
        SIGNAL XLXN_200
        SIGNAL XLXN_201
        SIGNAL RS(1)
        SIGNAL XLXN_210
        SIGNAL XLXN_211
        SIGNAL XLXN_212
        SIGNAL RS(0)
        SIGNAL RS(3:0)
        SIGNAL LS(3:0)
        SIGNAL bitor(3:0)
        SIGNAL bitand(3:0)
        SIGNAL add(3:0)
        SIGNAL one(3)
        SIGNAL one(2)
        SIGNAL one(1)
        SIGNAL one(0)
        SIGNAL zero
        SIGNAL output(2)
        SIGNAL output(1)
        SIGNAL carryout
        SIGNAL Cout
        SIGNAL ctrl(0)
        SIGNAL ctrl(1)
        SIGNAL ctrl(2)
        SIGNAL ctrl(2:0)
        SIGNAL output(0)
        SIGNAL S0
        SIGNAL B(0)
        SIGNAL B(1)
        SIGNAL B(2)
        SIGNAL B(3)
        SIGNAL A3
        SIGNAL A2
        SIGNAL A1
        SIGNAL A0
        SIGNAL one(3:0)
        SIGNAL BorOne(3:0)
        SIGNAL Complement(3:0)
        SIGNAL Complement(3)
        SIGNAL Complement(2)
        SIGNAL Complement(1)
        SIGNAL Complement(0)
        SIGNAL XLXN_277
        SIGNAL XLXN_278
        SIGNAL XLXN_280
        SIGNAL XLXN_281
        SIGNAL XLXN_282
        SIGNAL XLXN_283
        SIGNAL XLXN_284
        SIGNAL XLXN_285
        SIGNAL XLXN_286
        SIGNAL XLXN_287
        SIGNAL XLXN_289
        SIGNAL XLXN_290
        SIGNAL XLXN_296
        SIGNAL XLXN_299
        PORT Input A3_in
        PORT Input A2_in
        PORT Input A1_in
        PORT Input A0_in
        PORT Input B3_in
        PORT Input B2_in
        PORT Input B1_in
        PORT Input B0_in
        PORT Output OVF
        PORT Input Cin
        PORT Input ALUctrl0
        PORT Input ALUctrl1
        PORT Input ALUctrl2
        PORT Output S3
        PORT Output S2
        PORT Output S1
        PORT Output zero
        PORT Output Cout
        PORT Output S0
        BEGIN BLOCKDEF add4
            TIMESTAMP 2001 2 2 12 21 59
            LINE N 112 -832 112 -804 
            LINE N 64 -832 112 -832 
            LINE N 0 -832 64 -832 
            LINE N 0 -192 64 -192 
            LINE N 448 -352 384 -352 
            LINE N 448 -416 384 -416 
            LINE N 448 -480 384 -480 
            LINE N 448 -544 384 -544 
            LINE N 0 -256 64 -256 
            LINE N 0 -320 64 -320 
            LINE N 0 -384 64 -384 
            LINE N 0 -512 64 -512 
            LINE N 0 -576 64 -576 
            LINE N 0 -640 64 -640 
            LINE N 0 -704 64 -704 
            LINE N 240 -64 384 -64 
            LINE N 240 -124 240 -64 
            LINE N 336 -128 336 -148 
            LINE N 384 -128 336 -128 
            LINE N 384 -736 64 -816 
            LINE N 384 -160 384 -736 
            LINE N 64 -80 384 -160 
            LINE N 64 -416 64 -80 
            LINE N 144 -448 64 -416 
            LINE N 64 -480 144 -448 
            LINE N 64 -816 64 -480 
            LINE N 448 -64 384 -64 
            LINE N 448 -128 384 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF ibuf4
            TIMESTAMP 2001 2 2 12 24 32
            LINE N 0 -224 64 -224 
            LINE N 224 -160 128 -160 
            LINE N 0 -32 64 -32 
            LINE N 64 -192 64 -256 
            LINE N 128 -224 64 -192 
            LINE N 64 -256 128 -224 
            LINE N 64 -128 64 -192 
            LINE N 128 -160 64 -128 
            LINE N 64 -192 128 -160 
            LINE N 64 -64 64 -128 
            LINE N 128 -96 64 -64 
            LINE N 64 -128 128 -96 
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -96 64 -96 
            LINE N 0 -160 64 -160 
            LINE N 224 -224 128 -224 
            LINE N 224 -96 128 -96 
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
        BEGIN BLOCKDEF compm4
            TIMESTAMP 2001 2 2 12 22 48
            LINE N 0 -256 64 -256 
            LINE N 0 -320 64 -320 
            LINE N 0 -512 64 -512 
            LINE N 0 -576 64 -576 
            LINE N 0 -448 64 -448 
            LINE N 0 -384 64 -384 
            LINE N 0 -192 64 -192 
            LINE N 0 -128 64 -128 
            RECTANGLE N 64 -640 320 -64 
            LINE N 384 -320 320 -320 
            LINE N 384 -384 320 -384 
        END BLOCKDEF
        BEGIN BLOCKDEF m2_1
            TIMESTAMP 2001 2 2 12 26 32
            LINE N 96 -64 96 -192 
            LINE N 256 -96 96 -64 
            LINE N 256 -160 256 -96 
            LINE N 96 -192 256 -160 
            LINE N 176 -32 96 -32 
            LINE N 176 -80 176 -32 
            LINE N 0 -32 96 -32 
            LINE N 320 -128 256 -128 
            LINE N 0 -96 96 -96 
            LINE N 0 -160 96 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF and3
            TIMESTAMP 2001 2 2 12 25 36
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 256 -128 192 -128 
            LINE N 64 -176 144 -176 
            LINE N 144 -80 64 -80 
            ARC N 96 -176 192 -80 144 -80 144 -176 
            LINE N 64 -64 64 -192 
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2001 2 2 12 24 11
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF ibuf
            TIMESTAMP 2001 2 2 12 24 32
            LINE N 64 0 64 -64 
            LINE N 128 -32 64 0 
            LINE N 64 -64 128 -32 
            LINE N 224 -32 128 -32 
            LINE N 0 -32 64 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2001 2 2 12 24 11
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF mux2to1
            TIMESTAMP 2004 7 8 10 28 47
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
        BEGIN BLOCKDEF mux8to1
            TIMESTAMP 2004 7 8 10 30 0
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
        BEGIN BLOCKDEF inv4
            TIMESTAMP 2001 2 2 12 25 36
            LINE N 224 -32 160 -32 
            LINE N 224 -96 160 -96 
            LINE N 224 -160 160 -160 
            LINE N 224 -224 160 -224 
            LINE N 0 -32 64 -32 
            LINE N 0 -96 64 -96 
            LINE N 0 -160 64 -160 
            LINE N 0 -224 64 -224 
            LINE N 64 -256 128 -224 
            LINE N 128 -224 64 -192 
            LINE N 64 -192 64 -256 
            CIRCLE N 128 -48 160 -16 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            LINE N 64 -128 128 -96 
            LINE N 128 -96 64 -64 
            LINE N 64 -64 64 -128 
            CIRCLE N 128 -112 160 -80 
            LINE N 64 -192 128 -160 
            LINE N 128 -160 64 -128 
            LINE N 64 -128 64 -192 
            CIRCLE N 128 -176 160 -144 
            CIRCLE N 128 -240 160 -208 
        END BLOCKDEF
        BEGIN BLOCK adder add4
            PIN A0 A0
            PIN A1 A1
            PIN A2 A2
            PIN A3 A3
            PIN B0 B_or_one(0)
            PIN B1 B_or_one(1)
            PIN B2 B_or_one(2)
            PIN B3 B_or_one(3)
            PIN CI carry
            PIN CO carryout
            PIN OFL
            PIN S0 add(0)
            PIN S1 add(1)
            PIN S2 add(2)
            PIN S3 add(3)
        END BLOCK
        BEGIN BLOCK XLXI_6 ibuf4
            PIN I0 A3_in
            PIN I1 A2_in
            PIN I2 A1_in
            PIN I3 A0_in
            PIN O0 A3
            PIN O1 A2
            PIN O2 A1
            PIN O3 A0
        END BLOCK
        BEGIN BLOCK XLXI_7 ibuf4
            PIN I0 B3_in
            PIN I1 B2_in
            PIN I2 B1_in
            PIN I3 B0_in
            PIN O0 B(3)
            PIN O1 B(2)
            PIN O2 B(1)
            PIN O3 B(0)
        END BLOCK
        BEGIN BLOCK XLXI_19 and2
            PIN I0 B(3)
            PIN I1 A3
            PIN O bitand(3)
        END BLOCK
        BEGIN BLOCK XLXI_20 and2
            PIN I0 B(2)
            PIN I1 A2
            PIN O bitand(2)
        END BLOCK
        BEGIN BLOCK XLXI_21 and2
            PIN I0 B(1)
            PIN I1 A1
            PIN O bitand(1)
        END BLOCK
        BEGIN BLOCK XLXI_22 and2
            PIN I0 B(0)
            PIN I1 A0
            PIN O bitand(0)
        END BLOCK
        BEGIN BLOCK XLXI_23 or2
            PIN I0 B(3)
            PIN I1 A3
            PIN O bitor(3)
        END BLOCK
        BEGIN BLOCK XLXI_24 or2
            PIN I0 B(2)
            PIN I1 A2
            PIN O bitor(2)
        END BLOCK
        BEGIN BLOCK XLXI_25 or2
            PIN I0 B(1)
            PIN I1 A1
            PIN O bitor(1)
        END BLOCK
        BEGIN BLOCK XLXI_26 or2
            PIN I0 B(0)
            PIN I1 A0
            PIN O bitor(0)
        END BLOCK
        BEGIN BLOCK XLXI_28 compm4
            PIN A0 A0
            PIN A1 A1
            PIN A2 A2
            PIN A3 A3
            PIN B0 B(0)
            PIN B1 B(1)
            PIN B2 B(2)
            PIN B3 B(3)
            PIN GT
            PIN LT LT
        END BLOCK
        BEGIN BLOCK XLXI_29 m2_1
            PIN D0 XLXN_77
            PIN D1 LT
            PIN S0 XLXN_103
            PIN O XLXN_74
        END BLOCK
        BEGIN BLOCK XLXI_30 and3
            PIN I0 ctrl(0)
            PIN I1 XLXN_56
            PIN I2 XLXN_55
            PIN O XLXN_62
        END BLOCK
        BEGIN BLOCK XLXI_31 and3
            PIN I0 ctrl(0)
            PIN I1 XLXN_60
            PIN I2 ctrl(2)
            PIN O XLXN_102
        END BLOCK
        BEGIN BLOCK XLXI_32 or2
            PIN I0 XLXN_102
            PIN I1 XLXN_62
            PIN O XLXN_103
        END BLOCK
        BEGIN BLOCK XLXI_33 inv
            PIN I ctrl(2)
            PIN O XLXN_55
        END BLOCK
        BEGIN BLOCK XLXI_34 inv
            PIN I ctrl(1)
            PIN O XLXN_56
        END BLOCK
        BEGIN BLOCK XLXI_35 inv
            PIN I ctrl(1)
            PIN O XLXN_60
        END BLOCK
        BEGIN BLOCK XLXI_36 obuf
            PIN I XLXN_74
            PIN O OVF
        END BLOCK
        BEGIN BLOCK XLXI_37 gnd
            PIN G XLXN_77
        END BLOCK
        BEGIN BLOCK XLXI_38 inv
            PIN I BorOne(3)
            PIN O Complement(3)
        END BLOCK
        BEGIN BLOCK XLXI_39 inv
            PIN I BorOne(2)
            PIN O Complement(2)
        END BLOCK
        BEGIN BLOCK XLXI_40 inv
            PIN I BorOne(1)
            PIN O Complement(1)
        END BLOCK
        BEGIN BLOCK XLXI_41 inv
            PIN I BorOne(0)
            PIN O Complement(0)
        END BLOCK
        BEGIN BLOCK XLXI_43 ibuf
            PIN I Cin
            PIN O carry_in
        END BLOCK
        BEGIN BLOCK XLXI_44 m2_1
            PIN D0 carry_in
            PIN D1 XLXN_99
            PIN S0 ctrl(0)
            PIN O carry
        END BLOCK
        BEGIN BLOCK XLXI_45 vcc
            PIN P XLXN_99
        END BLOCK
        BEGIN BLOCK XLXI_46 ibuf
            PIN I ALUctrl0
            PIN O ctrl(0)
        END BLOCK
        BEGIN BLOCK XLXI_47 ibuf
            PIN I ALUctrl1
            PIN O ctrl(1)
        END BLOCK
        BEGIN BLOCK XLXI_48 ibuf
            PIN I ALUctrl2
            PIN O ctrl(2)
        END BLOCK
        BEGIN BLOCK XLXI_49 obuf
            PIN I output(3)
            PIN O S3
        END BLOCK
        BEGIN BLOCK XLXI_50 obuf
            PIN I output(2)
            PIN O S2
        END BLOCK
        BEGIN BLOCK XLXI_51 obuf
            PIN I output(1)
            PIN O S1
        END BLOCK
        BEGIN BLOCK XLXI_62 m2_1
            PIN D0 A3
            PIN D1 A2
            PIN S0 B(0)
            PIN O XLXN_124
        END BLOCK
        BEGIN BLOCK XLXI_63 m2_1
            PIN D0 A1
            PIN D1 A0
            PIN S0 B(0)
            PIN O XLXN_125
        END BLOCK
        BEGIN BLOCK XLXI_64 m2_1
            PIN D0 XLXN_124
            PIN D1 XLXN_125
            PIN S0 B(1)
            PIN O LS(3)
        END BLOCK
        BEGIN BLOCK XLXI_65 m2_1
            PIN D0 A2
            PIN D1 A1
            PIN S0 B(0)
            PIN O XLXN_135
        END BLOCK
        BEGIN BLOCK XLXI_66 m2_1
            PIN D0 A0
            PIN D1 XLXN_152
            PIN S0 B(0)
            PIN O XLXN_136
        END BLOCK
        BEGIN BLOCK XLXI_67 m2_1
            PIN D0 XLXN_135
            PIN D1 XLXN_136
            PIN S0 B(1)
            PIN O LS(2)
        END BLOCK
        BEGIN BLOCK XLXI_68 gnd
            PIN G XLXN_152
        END BLOCK
        BEGIN BLOCK XLXI_69 m2_1
            PIN D0 A1
            PIN D1 A0
            PIN S0 B(0)
            PIN O XLXN_153
        END BLOCK
        BEGIN BLOCK XLXI_70 m2_1
            PIN D0 XLXN_165
            PIN D1 XLXN_165
            PIN S0 B(0)
            PIN O XLXN_154
        END BLOCK
        BEGIN BLOCK XLXI_71 m2_1
            PIN D0 XLXN_153
            PIN D1 XLXN_154
            PIN S0 B(1)
            PIN O LS(1)
        END BLOCK
        BEGIN BLOCK XLXI_72 gnd
            PIN G XLXN_165
        END BLOCK
        BEGIN BLOCK XLXI_73 m2_1
            PIN D0 A0
            PIN D1 XLXN_177
            PIN S0 B(0)
            PIN O XLXN_166
        END BLOCK
        BEGIN BLOCK XLXI_74 m2_1
            PIN D0 XLXN_177
            PIN D1 XLXN_177
            PIN S0 B(0)
            PIN O XLXN_167
        END BLOCK
        BEGIN BLOCK XLXI_75 m2_1
            PIN D0 XLXN_166
            PIN D1 XLXN_167
            PIN S0 B(1)
            PIN O LS(0)
        END BLOCK
        BEGIN BLOCK XLXI_76 gnd
            PIN G XLXN_177
        END BLOCK
        BEGIN BLOCK XLXI_77 m2_1
            PIN D0 A3
            PIN D1 XLXN_188
            PIN S0 B(0)
            PIN O XLXN_178
        END BLOCK
        BEGIN BLOCK XLXI_78 m2_1
            PIN D0 XLXN_188
            PIN D1 XLXN_188
            PIN S0 B(0)
            PIN O XLXN_179
        END BLOCK
        BEGIN BLOCK XLXI_79 m2_1
            PIN D0 XLXN_178
            PIN D1 XLXN_179
            PIN S0 B(1)
            PIN O RS(3)
        END BLOCK
        BEGIN BLOCK XLXI_80 gnd
            PIN G XLXN_188
        END BLOCK
        BEGIN BLOCK XLXI_81 m2_1
            PIN D0 A2
            PIN D1 A3
            PIN S0 B(0)
            PIN O XLXN_189
        END BLOCK
        BEGIN BLOCK XLXI_82 m2_1
            PIN D0 XLXN_199
            PIN D1 XLXN_199
            PIN S0 B(0)
            PIN O XLXN_190
        END BLOCK
        BEGIN BLOCK XLXI_83 m2_1
            PIN D0 XLXN_189
            PIN D1 XLXN_190
            PIN S0 B(1)
            PIN O RS(2)
        END BLOCK
        BEGIN BLOCK XLXI_84 gnd
            PIN G XLXN_199
        END BLOCK
        BEGIN BLOCK XLXI_85 m2_1
            PIN D0 A1
            PIN D1 A2
            PIN S0 B(0)
            PIN O XLXN_200
        END BLOCK
        BEGIN BLOCK XLXI_86 m2_1
            PIN D0 A3
            PIN D1 XLXN_210
            PIN S0 B(0)
            PIN O XLXN_201
        END BLOCK
        BEGIN BLOCK XLXI_87 m2_1
            PIN D0 XLXN_200
            PIN D1 XLXN_201
            PIN S0 B(1)
            PIN O RS(1)
        END BLOCK
        BEGIN BLOCK XLXI_88 gnd
            PIN G XLXN_210
        END BLOCK
        BEGIN BLOCK XLXI_89 m2_1
            PIN D0 A0
            PIN D1 A1
            PIN S0 B(0)
            PIN O XLXN_211
        END BLOCK
        BEGIN BLOCK XLXI_90 m2_1
            PIN D0 A2
            PIN D1 A3
            PIN S0 B(0)
            PIN O XLXN_212
        END BLOCK
        BEGIN BLOCK XLXI_91 m2_1
            PIN D0 XLXN_211
            PIN D1 XLXN_212
            PIN S0 B(1)
            PIN O RS(0)
        END BLOCK
        BEGIN BLOCK XLXI_92 vcc
            PIN P one(0)
        END BLOCK
        BEGIN BLOCK XLXI_94 gnd
            PIN G one(3)
        END BLOCK
        BEGIN BLOCK XLXI_95 gnd
            PIN G one(2)
        END BLOCK
        BEGIN BLOCK XLXI_96 gnd
            PIN G one(1)
        END BLOCK
        BEGIN BLOCK XLXI_97 obuf
            PIN I XLXN_282
            PIN O zero
        END BLOCK
        BEGIN BLOCK XLXI_102 obuf
            PIN I XLXN_299
            PIN O Cout
        END BLOCK
        BEGIN BLOCK XLXI_103 obuf
            PIN I output(0)
            PIN O S0
        END BLOCK
        BEGIN BLOCK XLXI_106 mux2to1
            PIN MB(3:0) Complement(3:0)
            PIN MA(3:0) BorOne(3:0)
            PIN S(0:0) ctrl(0)
            PIN O(3:0) B_or_one(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_107 mux2to1
            PIN MB(3:0) one(3:0)
            PIN MA(3:0) B(3:0)
            PIN S(0:0) ctrl(2)
            PIN O(3:0) BorOne(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_108 mux8to1
            PIN MH(3:0) RS(3:0)
            PIN MG(3:0) LS(3:0)
            PIN MF(3:0) add(3:0)
            PIN ME(3:0) add(3:0)
            PIN MD(3:0) bitor(3:0)
            PIN MC(3:0) bitand(3:0)
            PIN MB(3:0) add(3:0)
            PIN MA(3:0) add(3:0)
            PIN S(2:0) ctrl(2:0)
            PIN O(3:0) output(3:0)
        END BLOCK
        BEGIN BLOCK XLXI_112 inv4
            PIN I0 output(0)
            PIN I1 output(1)
            PIN I2 output(2)
            PIN I3 output(3)
            PIN O0 XLXN_281
            PIN O1 XLXN_280
            PIN O2 XLXN_277
            PIN O3 XLXN_278
        END BLOCK
        BEGIN BLOCK XLXI_114 and4
            PIN I0 XLXN_281
            PIN I1 XLXN_280
            PIN I2 XLXN_277
            PIN I3 XLXN_278
            PIN O XLXN_282
        END BLOCK
        BEGIN BLOCK XLXI_115 and3
            PIN I0 XLXN_287
            PIN I1 XLXN_286
            PIN I2 XLXN_285
            PIN O XLXN_283
        END BLOCK
        BEGIN BLOCK XLXI_116 and3
            PIN I0 XLXN_290
            PIN I1 XLXN_289
            PIN I2 ctrl(2)
            PIN O XLXN_284
        END BLOCK
        BEGIN BLOCK XLXI_117 or2
            PIN I0 XLXN_284
            PIN I1 XLXN_283
            PIN O XLXN_296
        END BLOCK
        BEGIN BLOCK XLXI_118 inv
            PIN I ctrl(2)
            PIN O XLXN_285
        END BLOCK
        BEGIN BLOCK XLXI_119 inv
            PIN I ctrl(1)
            PIN O XLXN_286
        END BLOCK
        BEGIN BLOCK XLXI_120 inv
            PIN I ctrl(0)
            PIN O XLXN_287
        END BLOCK
        BEGIN BLOCK XLXI_121 inv
            PIN I ctrl(1)
            PIN O XLXN_289
        END BLOCK
        BEGIN BLOCK XLXI_122 inv
            PIN I ctrl(0)
            PIN O XLXN_290
        END BLOCK
        BEGIN BLOCK XLXI_123 and2
            PIN I0 carryout
            PIN I1 XLXN_296
            PIN O XLXN_299
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 5440 3520
        BEGIN BRANCH A3_in
            WIRE 256 528 304 528
            WIRE 304 528 320 528
        END BRANCH
        BEGIN BRANCH A2_in
            WIRE 256 592 304 592
            WIRE 304 592 320 592
        END BRANCH
        BEGIN BRANCH A1_in
            WIRE 256 656 304 656
            WIRE 304 656 320 656
        END BRANCH
        BEGIN BRANCH A0_in
            WIRE 256 720 304 720
            WIRE 304 720 320 720
        END BRANCH
        BEGIN BRANCH B3_in
            WIRE 256 864 304 864
            WIRE 304 864 320 864
        END BRANCH
        BEGIN BRANCH B2_in
            WIRE 256 928 304 928
            WIRE 304 928 320 928
        END BRANCH
        BEGIN BRANCH B1_in
            WIRE 256 992 304 992
            WIRE 304 992 320 992
        END BRANCH
        BEGIN BRANCH B0_in
            WIRE 256 1056 304 1056
            WIRE 304 1056 320 1056
        END BRANCH
        BEGIN BRANCH A3
            WIRE 544 528 576 528
            WIRE 576 528 592 528
            DISPLAY 592 528 ATTR Name
        END BRANCH
        BEGIN BRANCH A2
            WIRE 544 592 592 592
            DISPLAY 592 592 ATTR Name
        END BRANCH
        BEGIN BRANCH A1
            WIRE 544 656 592 656
            DISPLAY 592 656 ATTR Name
        END BRANCH
        BEGIN BRANCH A0
            WIRE 544 720 592 720
            DISPLAY 592 720 ATTR Name
        END BRANCH
        BEGIN BRANCH B(3)
            WIRE 544 864 592 864
            DISPLAY 592 864 ATTR Name
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 544 928 592 928
            DISPLAY 592 928 ATTR Name
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 544 992 592 992
            DISPLAY 592 992 ATTR Name
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 544 1056 592 1056
            DISPLAY 592 1056 ATTR Name
        END BRANCH
        IOMARKER 256 528 A3_in
        IOMARKER 256 592 A2_in
        IOMARKER 256 656 A1_in
        IOMARKER 256 720 A0_in
        IOMARKER 256 864 B3_in
        IOMARKER 256 928 B2_in
        IOMARKER 256 992 B1_in
        IOMARKER 256 1056 B0_in
        INSTANCE XLXI_6 320 752 R0
        INSTANCE XLXI_7 320 1088 R0
        BEGIN BRANCH B_or_one(0)
            WIRE 880 1328 896 1328
            WIRE 896 1328 928 1328
            BEGIN DISPLAY 880 1328 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B_or_one(1)
            WIRE 880 1392 896 1392
            WIRE 896 1392 928 1392
            BEGIN DISPLAY 880 1392 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B_or_one(2)
            WIRE 880 1456 896 1456
            WIRE 896 1456 928 1456
            BEGIN DISPLAY 880 1456 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B_or_one(3)
            WIRE 880 1520 896 1520
            WIRE 896 1520 928 1520
            BEGIN DISPLAY 880 1520 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A3
            WIRE 880 1200 896 1200
            WIRE 896 1200 928 1200
            BEGIN DISPLAY 880 1200 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A2
            WIRE 880 1136 896 1136
            WIRE 896 1136 928 1136
            BEGIN DISPLAY 880 1136 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A1
            WIRE 880 1072 896 1072
            WIRE 896 1072 928 1072
            BEGIN DISPLAY 880 1072 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A0
            WIRE 880 1008 896 1008
            WIRE 896 1008 928 1008
            BEGIN DISPLAY 880 1008 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH add(0)
            WIRE 1376 1168 1408 1168
            WIRE 1408 1168 1472 1168
            WIRE 1472 1168 1488 1168
            DISPLAY 1488 1168 ATTR Name
        END BRANCH
        BEGIN BRANCH add(1)
            WIRE 1376 1232 1392 1232
            WIRE 1392 1232 1408 1232
            WIRE 1408 1232 1472 1232
            WIRE 1472 1232 1488 1232
            DISPLAY 1488 1232 ATTR Name
        END BRANCH
        BEGIN BRANCH add(3)
            WIRE 1376 1360 1408 1360
            WIRE 1408 1360 1456 1360
            WIRE 1456 1360 1472 1360
            DISPLAY 1472 1360 ATTR Name
        END BRANCH
        BEGIN BRANCH A3
            WIRE 144 1584 192 1584
            BEGIN DISPLAY 144 1584 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A2
            WIRE 128 1744 192 1744
            BEGIN DISPLAY 128 1744 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 128 1808 192 1808
            BEGIN DISPLAY 128 1808 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(3)
            WIRE 112 1648 192 1648
            BEGIN DISPLAY 112 1648 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A1
            WIRE 128 1904 192 1904
            BEGIN DISPLAY 128 1904 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 128 1968 192 1968
            BEGIN DISPLAY 128 1968 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A0
            WIRE 128 2048 192 2048
            BEGIN DISPLAY 128 2048 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 128 2112 192 2112
            BEGIN DISPLAY 128 2112 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A3
            WIRE 128 2192 192 2192
            BEGIN DISPLAY 128 2192 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(3)
            WIRE 128 2256 192 2256
            BEGIN DISPLAY 128 2256 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A2
            WIRE 128 2336 192 2336
            BEGIN DISPLAY 128 2336 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 128 2400 192 2400
            BEGIN DISPLAY 128 2400 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A1
            WIRE 112 2496 176 2496
            BEGIN DISPLAY 112 2496 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 112 2560 176 2560
            BEGIN DISPLAY 112 2560 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A0
            WIRE 112 2672 176 2672
            BEGIN DISPLAY 112 2672 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 112 2736 176 2736
            BEGIN DISPLAY 112 2736 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH bitand(3)
            WIRE 448 1616 496 1616
            DISPLAY 496 1616 ATTR Name
        END BRANCH
        BEGIN BRANCH bitand(2)
            WIRE 448 1776 512 1776
            DISPLAY 512 1776 ATTR Name
        END BRANCH
        BEGIN BRANCH bitand(1)
            WIRE 448 1936 512 1936
            DISPLAY 512 1936 ATTR Name
        END BRANCH
        BEGIN BRANCH bitand(0)
            WIRE 448 2080 512 2080
            DISPLAY 512 2080 ATTR Name
        END BRANCH
        BEGIN BRANCH bitor(3)
            WIRE 448 2224 496 2224
            DISPLAY 496 2224 ATTR Name
        END BRANCH
        BEGIN BRANCH bitor(2)
            WIRE 448 2368 496 2368
            DISPLAY 496 2368 ATTR Name
        END BRANCH
        BEGIN BRANCH bitor(1)
            WIRE 432 2528 512 2528
            DISPLAY 512 2528 ATTR Name
        END BRANCH
        BEGIN BRANCH bitor(0)
            WIRE 432 2704 496 2704
            DISPLAY 496 2704 ATTR Name
        END BRANCH
        BEGIN BRANCH A0
            WIRE 80 2944 96 2944
            WIRE 96 2944 144 2944
            BEGIN DISPLAY 80 2944 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A1
            WIRE 80 3008 96 3008
            WIRE 96 3008 144 3008
            BEGIN DISPLAY 80 3008 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A2
            WIRE 80 3072 96 3072
            WIRE 96 3072 144 3072
            BEGIN DISPLAY 80 3072 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A3
            WIRE 80 3136 96 3136
            WIRE 96 3136 144 3136
            BEGIN DISPLAY 80 3136 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 80 3200 96 3200
            WIRE 96 3200 144 3200
            BEGIN DISPLAY 80 3200 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 80 3264 96 3264
            WIRE 96 3264 144 3264
            BEGIN DISPLAY 80 3264 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 80 3328 96 3328
            WIRE 96 3328 144 3328
            BEGIN DISPLAY 80 3328 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(3)
            WIRE 80 3392 96 3392
            WIRE 96 3392 144 3392
            BEGIN DISPLAY 80 3392 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_55
            WIRE 960 3104 976 3104
            WIRE 976 3104 1008 3104
        END BRANCH
        BEGIN BRANCH XLXN_56
            WIRE 960 3168 976 3168
            WIRE 976 3168 1008 3168
        END BRANCH
        BEGIN BRANCH ctrl(0)
            WIRE 688 3232 976 3232
            WIRE 976 3232 1008 3232
            BEGIN DISPLAY 688 3232 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ctrl(2)
            WIRE 688 3296 704 3296
            WIRE 704 3296 976 3296
            WIRE 976 3296 1008 3296
            BEGIN DISPLAY 688 3296 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_60
            WIRE 960 3360 976 3360
            WIRE 976 3360 1008 3360
        END BRANCH
        BEGIN BRANCH ctrl(0)
            WIRE 688 3424 976 3424
            WIRE 976 3424 1008 3424
            BEGIN DISPLAY 688 3424 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_62
            WIRE 1264 3168 1280 3168
            WIRE 1280 3168 1280 3232
            WIRE 1280 3232 1312 3232
        END BRANCH
        BEGIN BRANCH ctrl(1)
            WIRE 688 3360 736 3360
            BEGIN DISPLAY 688 3360 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ctrl(2)
            WIRE 688 3104 736 3104
            BEGIN DISPLAY 688 3104 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ctrl(1)
            WIRE 688 3168 736 3168
            BEGIN DISPLAY 688 3168 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH LT
            WIRE 528 3200 560 3200
            WIRE 560 3200 576 3200
            DISPLAY 576 3200 ATTR Name
        END BRANCH
        BEGIN BRANCH XLXN_74
            WIRE 1968 3168 2080 3168
            WIRE 2080 3168 2096 3168
        END BRANCH
        BEGIN BRANCH LT
            WIRE 1504 3200 1520 3200
            WIRE 1520 3200 1648 3200
            BEGIN DISPLAY 1520 3200 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OVF
            WIRE 2320 3168 2336 3168
            WIRE 2336 3168 2416 3168
        END BRANCH
        BEGIN BRANCH XLXN_77
            WIRE 1392 3056 1392 3072
            WIRE 1392 3056 1520 3056
            WIRE 1520 3056 1520 3136
            WIRE 1520 3136 1648 3136
        END BRANCH
        BEGIN BRANCH one(3:0)
            WIRE 672 2032 688 2032
            WIRE 688 2032 784 2032
            BEGIN DISPLAY 672 2032 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BorOne(0)
            WIRE 1440 2112 1456 2112
            WIRE 1456 2112 1488 2112
            BEGIN DISPLAY 1456 2112 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BorOne(1)
            WIRE 1440 2048 1456 2048
            WIRE 1456 2048 1488 2048
            BEGIN DISPLAY 1456 2048 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BorOne(2)
            WIRE 1440 1984 1456 1984
            WIRE 1456 1984 1488 1984
            BEGIN DISPLAY 1456 1984 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BorOne(3)
            WIRE 1440 1920 1456 1920
            WIRE 1456 1920 1488 1920
            BEGIN DISPLAY 1456 1920 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B_or_one(3:0)
            WIRE 2832 1744 2880 1744
            WIRE 2880 1744 2880 1840
            WIRE 2880 1840 2896 1840
            DISPLAY 2896 1840 ATTR Name
        END BRANCH
        BEGIN BRANCH carry_in
            WIRE 528 1184 560 1184
            WIRE 560 1184 576 1184
            DISPLAY 576 1184 ATTR Name
        END BRANCH
        BEGIN BRANCH Cin
            WIRE 256 1184 272 1184
            WIRE 272 1184 288 1184
            WIRE 288 1184 304 1184
        END BRANCH
        BEGIN BRANCH carry_in
            WIRE 1536 2528 1632 2528
            BEGIN DISPLAY 1536 2528 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ctrl(0)
            WIRE 1536 2656 1632 2656
            BEGIN DISPLAY 1536 2656 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH carry
            WIRE 1952 2560 2032 2560
            DISPLAY 2032 2560 ATTR Name
        END BRANCH
        BEGIN BRANCH XLXN_99
            WIRE 1360 2512 1360 2528
            WIRE 1360 2528 1360 2592
            WIRE 1360 2592 1632 2592
        END BRANCH
        BEGIN BRANCH carry
            WIRE 848 880 864 880
            WIRE 864 880 928 880
            BEGIN DISPLAY 848 880 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_102
            WIRE 1264 3360 1280 3360
            WIRE 1280 3296 1280 3360
            WIRE 1280 3296 1312 3296
        END BRANCH
        BEGIN BRANCH XLXN_103
            WIRE 1568 3264 1584 3264
            WIRE 1584 3264 1648 3264
        END BRANCH
        BEGIN BRANCH add(2)
            WIRE 1376 1296 1472 1296
            WIRE 1472 1296 1488 1296
            DISPLAY 1488 1296 ATTR Name
        END BRANCH
        BEGIN BRANCH ctrl(2)
            WIRE 704 2864 720 2864
            WIRE 720 2864 784 2864
            BEGIN DISPLAY 704 2864 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ctrl(0)
            WIRE 2240 2864 2256 2864
            WIRE 2256 2768 2256 2864
            WIRE 2256 2768 2352 2768
            BEGIN DISPLAY 2240 2864 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_46 304 1312 R0
        INSTANCE XLXI_47 304 1392 R0
        INSTANCE XLXI_48 304 1472 R0
        BEGIN BRANCH ctrl(0)
            WIRE 528 1280 576 1280
            DISPLAY 576 1280 ATTR Name
        END BRANCH
        BEGIN BRANCH ctrl(1)
            WIRE 528 1360 576 1360
            DISPLAY 576 1360 ATTR Name
        END BRANCH
        BEGIN BRANCH ctrl(2)
            WIRE 528 1440 576 1440
            DISPLAY 576 1440 ATTR Name
        END BRANCH
        BEGIN BRANCH ALUctrl0
            WIRE 272 1280 288 1280
            WIRE 288 1280 304 1280
        END BRANCH
        BEGIN BRANCH ALUctrl1
            WIRE 272 1360 288 1360
            WIRE 288 1360 304 1360
        END BRANCH
        BEGIN BRANCH ALUctrl2
            WIRE 272 1440 288 1440
            WIRE 288 1440 304 1440
        END BRANCH
        IOMARKER 272 1280 ALUctrl0
        IOMARKER 272 1360 ALUctrl1
        IOMARKER 272 1440 ALUctrl2
        INSTANCE XLXI_20 192 1872 R0
        INSTANCE XLXI_21 192 2032 R0
        INSTANCE XLXI_22 192 2176 R0
        INSTANCE XLXI_19 192 1712 R0
        INSTANCE XLXI_23 192 2320 R0
        INSTANCE XLXI_24 192 2464 R0
        INSTANCE XLXI_25 176 2624 R0
        INSTANCE XLXI_26 176 2800 R0
        IOMARKER 256 1184 Cin
        INSTANCE XLXI_43 304 1216 R0
        BEGIN BRANCH S3
            WIRE 2928 752 2944 752
            WIRE 2944 752 2960 752
        END BRANCH
        BEGIN BRANCH S2
            WIRE 2928 832 2944 832
            WIRE 2944 832 2960 832
        END BRANCH
        BEGIN BRANCH S1
            WIRE 2928 912 2944 912
            WIRE 2944 912 2960 912
        END BRANCH
        BEGIN BRANCH output(3)
            WIRE 2304 752 2320 752
            WIRE 2320 752 2528 752
            WIRE 2528 752 2704 752
            WIRE 2528 752 2528 1040
            BEGIN DISPLAY 2304 752 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH output(3:0)
            WIRE 2144 528 2192 528
            WIRE 2192 528 2192 560
            WIRE 2192 560 2208 560
            DISPLAY 2208 560 ATTR Name
        END BRANCH
        IOMARKER 2416 3168 OVF
        INSTANCE XLXI_30 1008 3296 R0
        INSTANCE XLXI_31 1008 3488 R0
        INSTANCE XLXI_32 1312 3360 R0
        INSTANCE XLXI_33 736 3136 R0
        INSTANCE XLXI_34 736 3200 R0
        INSTANCE XLXI_35 736 3392 R0
        INSTANCE XLXI_36 2096 3200 R0
        INSTANCE XLXI_28 144 3520 R0
        INSTANCE XLXI_37 1328 3200 R0
        INSTANCE XLXI_29 1648 3296 R0
        INSTANCE XLXI_44 1632 2688 R0
        INSTANCE XLXI_45 1296 2512 R0
        INSTANCE XLXI_41 1488 2144 R0
        INSTANCE XLXI_40 1488 2080 R0
        INSTANCE XLXI_39 1488 2016 R0
        INSTANCE XLXI_38 1488 1952 R0
        INSTANCE adder 928 1712 R0
        INSTANCE XLXI_62 3440 288 R0
        INSTANCE XLXI_63 3440 480 R0
        INSTANCE XLXI_64 3824 368 R0
        BEGIN BRANCH XLXN_124
            WIRE 3760 160 3792 160
            WIRE 3792 160 3792 208
            WIRE 3792 208 3824 208
        END BRANCH
        BEGIN BRANCH XLXN_125
            WIRE 3760 352 3792 352
            WIRE 3792 272 3792 352
            WIRE 3792 272 3824 272
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 3408 496 3824 496
            WIRE 3824 336 3824 496
            BEGIN DISPLAY 3408 496 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 3408 448 3440 448
            BEGIN DISPLAY 3408 448 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A1
            WIRE 3408 320 3440 320
            BEGIN DISPLAY 3408 320 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 3408 256 3440 256
            BEGIN DISPLAY 3408 256 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A2
            WIRE 3408 192 3440 192
            BEGIN DISPLAY 3408 192 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A3
            WIRE 3408 128 3440 128
            BEGIN DISPLAY 3408 128 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A0
            WIRE 3408 384 3440 384
            BEGIN DISPLAY 3408 384 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH LS(3)
            WIRE 4144 240 4176 240
            DISPLAY 4176 240 ATTR Name
        END BRANCH
        INSTANCE XLXI_65 3392 768 R0
        INSTANCE XLXI_66 3392 960 R0
        INSTANCE XLXI_67 3776 848 R0
        BEGIN BRANCH XLXN_135
            WIRE 3712 640 3728 640
            WIRE 3728 640 3744 640
            WIRE 3744 640 3744 688
            WIRE 3744 688 3776 688
        END BRANCH
        BEGIN BRANCH XLXN_136
            WIRE 3712 832 3728 832
            WIRE 3728 832 3744 832
            WIRE 3744 752 3744 832
            WIRE 3744 752 3776 752
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 3360 976 3376 976
            WIRE 3376 976 3392 976
            WIRE 3392 976 3776 976
            WIRE 3776 816 3776 976
            BEGIN DISPLAY 3360 976 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 3360 928 3392 928
            BEGIN DISPLAY 3360 928 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A0
            WIRE 3360 800 3392 800
            BEGIN DISPLAY 3360 800 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 3360 736 3392 736
            BEGIN DISPLAY 3360 736 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A1
            WIRE 3360 672 3392 672
            BEGIN DISPLAY 3360 672 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A2
            WIRE 3360 608 3376 608
            WIRE 3376 608 3392 608
            BEGIN DISPLAY 3360 608 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH LS(2)
            WIRE 4096 720 4128 720
            DISPLAY 4128 720 ATTR Name
        END BRANCH
        INSTANCE XLXI_68 3216 1008 R0
        BEGIN BRANCH XLXN_152
            WIRE 3280 864 3280 880
            WIRE 3280 864 3376 864
            WIRE 3376 864 3392 864
        END BRANCH
        INSTANCE XLXI_69 3376 1264 R0
        INSTANCE XLXI_70 3376 1456 R0
        INSTANCE XLXI_71 3760 1344 R0
        BEGIN BRANCH XLXN_153
            WIRE 3696 1136 3728 1136
            WIRE 3728 1136 3728 1184
            WIRE 3728 1184 3760 1184
        END BRANCH
        BEGIN BRANCH XLXN_154
            WIRE 3696 1328 3728 1328
            WIRE 3728 1248 3728 1328
            WIRE 3728 1248 3760 1248
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 3344 1472 3360 1472
            WIRE 3360 1472 3760 1472
            WIRE 3760 1312 3760 1472
            BEGIN DISPLAY 3360 1472 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 3344 1424 3360 1424
            WIRE 3360 1424 3376 1424
            BEGIN DISPLAY 3360 1424 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 3344 1232 3360 1232
            WIRE 3360 1232 3376 1232
            BEGIN DISPLAY 3360 1232 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A0
            WIRE 3344 1168 3376 1168
            BEGIN DISPLAY 3344 1168 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A1
            WIRE 3344 1104 3376 1104
            BEGIN DISPLAY 3344 1104 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH LS(1)
            WIRE 4080 1216 4112 1216
            DISPLAY 4112 1216 ATTR Name
        END BRANCH
        INSTANCE XLXI_72 3216 1440 R0
        BEGIN BRANCH XLXN_165
            WIRE 3280 1296 3280 1312
            WIRE 3280 1296 3344 1296
            WIRE 3344 1296 3360 1296
            WIRE 3360 1296 3376 1296
            WIRE 3344 1296 3344 1360
            WIRE 3344 1360 3376 1360
        END BRANCH
        INSTANCE XLXI_73 3344 1744 R0
        INSTANCE XLXI_74 3344 1936 R0
        INSTANCE XLXI_75 3728 1824 R0
        BEGIN BRANCH XLXN_166
            WIRE 3664 1616 3696 1616
            WIRE 3696 1616 3696 1664
            WIRE 3696 1664 3728 1664
        END BRANCH
        BEGIN BRANCH XLXN_167
            WIRE 3664 1808 3696 1808
            WIRE 3696 1728 3696 1808
            WIRE 3696 1728 3728 1728
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 3312 1952 3728 1952
            WIRE 3728 1792 3728 1952
            BEGIN DISPLAY 3312 1952 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 3312 1904 3328 1904
            WIRE 3328 1904 3344 1904
            BEGIN DISPLAY 3328 1904 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 3312 1712 3344 1712
            BEGIN DISPLAY 3312 1712 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A0
            WIRE 3312 1584 3344 1584
            BEGIN DISPLAY 3312 1584 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH LS(0)
            WIRE 4048 1696 4080 1696
            DISPLAY 4080 1696 ATTR Name
        END BRANCH
        INSTANCE XLXI_76 3152 1792 R0
        BEGIN BRANCH XLXN_177
            WIRE 3216 1648 3216 1664
            WIRE 3216 1648 3264 1648
            WIRE 3264 1648 3312 1648
            WIRE 3312 1648 3344 1648
            WIRE 3264 1648 3264 1776
            WIRE 3264 1776 3312 1776
            WIRE 3312 1776 3344 1776
            WIRE 3264 1776 3264 1840
            WIRE 3264 1840 3312 1840
            WIRE 3312 1840 3344 1840
        END BRANCH
        INSTANCE XLXI_77 4512 256 R0
        INSTANCE XLXI_78 4512 448 R0
        INSTANCE XLXI_79 4896 336 R0
        BEGIN BRANCH XLXN_178
            WIRE 4832 128 4864 128
            WIRE 4864 128 4864 176
            WIRE 4864 176 4896 176
        END BRANCH
        BEGIN BRANCH XLXN_179
            WIRE 4832 320 4864 320
            WIRE 4864 240 4864 320
            WIRE 4864 240 4896 240
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 4480 464 4896 464
            WIRE 4896 304 4896 464
            BEGIN DISPLAY 4480 464 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 4480 416 4512 416
            BEGIN DISPLAY 4480 416 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 4480 224 4512 224
            BEGIN DISPLAY 4480 224 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A3
            WIRE 4480 96 4512 96
            BEGIN DISPLAY 4480 96 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RS(3)
            WIRE 5216 208 5248 208
            DISPLAY 5248 208 ATTR Name
        END BRANCH
        INSTANCE XLXI_80 4320 304 R0
        BEGIN BRANCH XLXN_188
            WIRE 4384 160 4384 176
            WIRE 4384 160 4432 160
            WIRE 4432 160 4480 160
            WIRE 4480 160 4512 160
            WIRE 4432 160 4432 288
            WIRE 4432 288 4480 288
            WIRE 4480 288 4512 288
            WIRE 4432 288 4432 352
            WIRE 4432 352 4480 352
            WIRE 4480 352 4512 352
        END BRANCH
        INSTANCE XLXI_81 4480 752 R0
        INSTANCE XLXI_82 4480 944 R0
        INSTANCE XLXI_83 4864 832 R0
        BEGIN BRANCH XLXN_189
            WIRE 4800 624 4832 624
            WIRE 4832 624 4832 672
            WIRE 4832 672 4864 672
        END BRANCH
        BEGIN BRANCH XLXN_190
            WIRE 4800 816 4832 816
            WIRE 4832 736 4832 816
            WIRE 4832 736 4864 736
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 4448 960 4864 960
            WIRE 4864 800 4864 960
            BEGIN DISPLAY 4448 960 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 4448 912 4480 912
            BEGIN DISPLAY 4448 912 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 4448 720 4480 720
            BEGIN DISPLAY 4448 720 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A3
            WIRE 4448 656 4480 656
            BEGIN DISPLAY 4448 656 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A2
            WIRE 4448 592 4480 592
            BEGIN DISPLAY 4448 592 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RS(2)
            WIRE 5184 704 5216 704
            DISPLAY 5216 704 ATTR Name
        END BRANCH
        INSTANCE XLXI_84 4288 928 R0
        BEGIN BRANCH XLXN_199
            WIRE 4352 784 4352 800
            WIRE 4352 784 4400 784
            WIRE 4400 784 4448 784
            WIRE 4448 784 4480 784
            WIRE 4400 784 4400 848
            WIRE 4400 848 4448 848
            WIRE 4448 848 4480 848
        END BRANCH
        INSTANCE XLXI_85 4480 1280 R0
        INSTANCE XLXI_86 4480 1472 R0
        INSTANCE XLXI_87 4864 1360 R0
        BEGIN BRANCH XLXN_200
            WIRE 4800 1152 4832 1152
            WIRE 4832 1152 4832 1200
            WIRE 4832 1200 4864 1200
        END BRANCH
        BEGIN BRANCH XLXN_201
            WIRE 4800 1344 4832 1344
            WIRE 4832 1264 4832 1344
            WIRE 4832 1264 4864 1264
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 4448 1488 4864 1488
            WIRE 4864 1328 4864 1488
            BEGIN DISPLAY 4448 1488 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 4448 1440 4480 1440
            BEGIN DISPLAY 4448 1440 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A3
            WIRE 4448 1312 4480 1312
            BEGIN DISPLAY 4448 1312 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 4448 1248 4480 1248
            BEGIN DISPLAY 4448 1248 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A2
            WIRE 4448 1184 4480 1184
            BEGIN DISPLAY 4448 1184 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A1
            WIRE 4448 1120 4480 1120
            BEGIN DISPLAY 4448 1120 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RS(1)
            WIRE 5184 1232 5216 1232
            DISPLAY 5216 1232 ATTR Name
        END BRANCH
        INSTANCE XLXI_88 4304 1520 R0
        BEGIN BRANCH XLXN_210
            WIRE 4368 1376 4368 1392
            WIRE 4368 1376 4448 1376
            WIRE 4448 1376 4464 1376
            WIRE 4464 1376 4480 1376
        END BRANCH
        INSTANCE XLXI_89 4464 1776 R0
        INSTANCE XLXI_90 4464 1968 R0
        INSTANCE XLXI_91 4848 1856 R0
        BEGIN BRANCH XLXN_211
            WIRE 4784 1648 4816 1648
            WIRE 4816 1648 4816 1696
            WIRE 4816 1696 4848 1696
        END BRANCH
        BEGIN BRANCH XLXN_212
            WIRE 4784 1840 4816 1840
            WIRE 4816 1760 4816 1840
            WIRE 4816 1760 4848 1760
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 4432 1984 4848 1984
            WIRE 4848 1824 4848 1984
            BEGIN DISPLAY 4432 1984 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 4432 1936 4464 1936
            BEGIN DISPLAY 4432 1936 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A2
            WIRE 4432 1808 4464 1808
            BEGIN DISPLAY 4432 1808 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 4432 1744 4464 1744
            BEGIN DISPLAY 4432 1744 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A1
            WIRE 4432 1680 4448 1680
            WIRE 4448 1680 4464 1680
            BEGIN DISPLAY 4448 1680 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A0
            WIRE 4432 1616 4464 1616
            BEGIN DISPLAY 4432 1616 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A3
            WIRE 4432 1872 4464 1872
            BEGIN DISPLAY 4432 1872 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RS(0)
            WIRE 5168 1728 5200 1728
            DISPLAY 5200 1728 ATTR Name
        END BRANCH
        BEGIN BRANCH RS(3:0)
            WIRE 1600 528 1616 528
            WIRE 1616 528 1664 528
            BEGIN DISPLAY 1600 528 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH LS(3:0)
            WIRE 1600 560 1616 560
            WIRE 1616 560 1664 560
            BEGIN DISPLAY 1600 560 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH add(3:0)
            WIRE 1600 592 1616 592
            WIRE 1616 592 1664 592
            BEGIN DISPLAY 1616 592 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH add(3:0)
            WIRE 1600 624 1616 624
            WIRE 1616 624 1664 624
            BEGIN DISPLAY 1616 624 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH bitor(3:0)
            WIRE 1600 656 1616 656
            WIRE 1616 656 1664 656
            BEGIN DISPLAY 1616 656 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH bitand(3:0)
            WIRE 1600 688 1616 688
            WIRE 1616 688 1664 688
            BEGIN DISPLAY 1616 688 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH add(3:0)
            WIRE 1600 720 1616 720
            WIRE 1616 720 1664 720
            BEGIN DISPLAY 1600 720 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH add(3:0)
            WIRE 1600 752 1616 752
            WIRE 1616 752 1664 752
            BEGIN DISPLAY 1600 752 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one(3)
            WIRE 976 320 1024 320
            DISPLAY 1024 320 ATTR Name
        END BRANCH
        BEGIN BRANCH one(2)
            WIRE 976 400 1024 400
            DISPLAY 1024 400 ATTR Name
        END BRANCH
        BEGIN BRANCH one(1)
            WIRE 976 480 1024 480
            DISPLAY 1024 480 ATTR Name
        END BRANCH
        INSTANCE XLXI_94 848 256 R90
        INSTANCE XLXI_95 848 336 R90
        INSTANCE XLXI_96 848 416 R90
        INSTANCE XLXI_92 976 624 R270
        BEGIN BRANCH one(0)
            WIRE 976 560 1008 560
            WIRE 1008 560 1024 560
            DISPLAY 1024 560 ATTR Name
        END BRANCH
        BEGIN BRANCH B(3:0)
            WIRE 736 2064 784 2064
            BEGIN DISPLAY 736 2064 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH zero
            WIRE 3008 1536 3088 1536
            WIRE 3088 1536 3104 1536
        END BRANCH
        IOMARKER 2960 752 S3
        IOMARKER 2960 832 S2
        INSTANCE XLXI_49 2704 784 R0
        INSTANCE XLXI_50 2704 864 R0
        INSTANCE XLXI_51 2704 944 R0
        BEGIN BRANCH output(2)
            WIRE 2304 832 2464 832
            WIRE 2464 832 2704 832
            WIRE 2464 832 2464 1040
            BEGIN DISPLAY 2304 832 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH output(1)
            WIRE 2304 912 2400 912
            WIRE 2400 912 2704 912
            WIRE 2400 912 2400 1040
            BEGIN DISPLAY 2304 912 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH carryout
            WIRE 1376 1648 1456 1648
            DISPLAY 1456 1648 ATTR Name
        END BRANCH
        BEGIN BRANCH Cout
            WIRE 4896 2752 4912 2752
            WIRE 4912 2752 4928 2752
        END BRANCH
        BEGIN BRANCH ctrl(2:0)
            WIRE 1552 1552 1568 1552
            WIRE 1568 1552 1664 1552
            BEGIN DISPLAY 1552 1552 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 2960 912 S1
        INSTANCE XLXI_103 2704 1056 R0
        BEGIN BRANCH output(0)
            WIRE 2304 1024 2336 1024
            WIRE 2336 1024 2704 1024
            WIRE 2336 1024 2336 1040
            BEGIN DISPLAY 2304 1024 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S0
            WIRE 2928 1024 2944 1024
            WIRE 2944 1024 2960 1024
        END BRANCH
        IOMARKER 2960 1024 S0
        BEGIN INSTANCE XLXI_107 784 1792 R0
        END INSTANCE
        BEGIN BRANCH BorOne(3:0)
            WIRE 1264 1840 1296 1840
            WIRE 1296 1840 1344 1840
            WIRE 1344 1840 1344 1920
            WIRE 1344 1920 1344 1984
            WIRE 1344 1984 1344 2048
            WIRE 1344 2048 1344 2112
            WIRE 1344 2112 1344 2256
            BEGIN DISPLAY 1296 1840 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1344 1920 1440 1920
        BUSTAP 1344 1984 1440 1984
        BUSTAP 1344 2048 1440 2048
        BUSTAP 1344 2112 1440 2112
        BEGIN INSTANCE XLXI_106 2352 1696 R0
        END INSTANCE
        BEGIN BRANCH BorOne(3:0)
            WIRE 2176 1968 2208 1968
            WIRE 2208 1968 2352 1968
            BEGIN DISPLAY 2208 1968 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Complement(3:0)
            WIRE 2112 1936 2112 1984
            WIRE 2112 1984 2112 2048
            WIRE 2112 2048 2112 2112
            WIRE 2112 2112 2112 2160
            WIRE 2112 2160 2112 2224
            WIRE 2112 1936 2160 1936
            WIRE 2160 1936 2352 1936
            BEGIN DISPLAY 2160 1936 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 2112 1984 2016 1984
        BUSTAP 2112 2048 2016 2048
        BUSTAP 2112 2112 2016 2112
        BUSTAP 2112 2160 2016 2160
        BEGIN BRANCH Complement(3)
            WIRE 1712 1920 1776 1920
            WIRE 1776 1920 1856 1920
            WIRE 1856 1920 1856 1984
            WIRE 1856 1984 2016 1984
            BEGIN DISPLAY 1776 1920 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Complement(2)
            WIRE 1712 1984 1760 1984
            WIRE 1760 1984 1840 1984
            WIRE 1840 1984 1840 2048
            WIRE 1840 2048 2016 2048
            BEGIN DISPLAY 1760 1984 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Complement(1)
            WIRE 1712 2048 1776 2048
            WIRE 1776 2048 1824 2048
            WIRE 1824 2048 1824 2112
            WIRE 1824 2112 2016 2112
            BEGIN DISPLAY 1776 2048 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Complement(0)
            WIRE 1712 2112 1776 2112
            WIRE 1776 2112 1808 2112
            WIRE 1808 2112 1808 2160
            WIRE 1808 2160 2016 2160
            BEGIN DISPLAY 1776 2112 ATTR Name
                ALIGNMENT BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_108 1664 480 R0
        END INSTANCE
        IOMARKER 3104 1536 zero
        INSTANCE XLXI_97 2784 1568 R0
        BEGIN BRANCH XLXN_277
            WIRE 2464 1264 2464 1376
        END BRANCH
        BEGIN BRANCH XLXN_278
            WIRE 2528 1264 2528 1376
        END BRANCH
        INSTANCE XLXI_112 2304 1040 R90
        INSTANCE XLXI_114 2272 1376 R90
        BEGIN BRANCH XLXN_280
            WIRE 2400 1264 2400 1376
        END BRANCH
        BEGIN BRANCH XLXN_281
            WIRE 2336 1264 2336 1360
            WIRE 2336 1360 2336 1376
        END BRANCH
        BEGIN BRANCH XLXN_282
            WIRE 2432 1632 2432 1648
            WIRE 2432 1648 2720 1648
            WIRE 2720 1536 2784 1536
            WIRE 2720 1536 2720 1648
        END BRANCH
        BEGIN BRANCH XLXN_283
            WIRE 3904 2592 3936 2592
            WIRE 3936 2592 3936 2640
            WIRE 3936 2640 3984 2640
        END BRANCH
        BEGIN BRANCH XLXN_284
            WIRE 3904 2784 3936 2784
            WIRE 3936 2704 3936 2784
            WIRE 3936 2704 3984 2704
        END BRANCH
        BEGIN BRANCH XLXN_285
            WIRE 3584 2528 3648 2528
        END BRANCH
        BEGIN BRANCH XLXN_286
            WIRE 3584 2592 3648 2592
        END BRANCH
        BEGIN BRANCH XLXN_287
            WIRE 3584 2656 3648 2656
        END BRANCH
        BEGIN BRANCH ctrl(2)
            WIRE 3264 2720 3584 2720
            WIRE 3584 2720 3648 2720
            BEGIN DISPLAY 3264 2720 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_289
            WIRE 3584 2784 3648 2784
        END BRANCH
        BEGIN BRANCH XLXN_290
            WIRE 3584 2848 3648 2848
        END BRANCH
        BEGIN BRANCH ctrl(1)
            WIRE 3264 2784 3360 2784
            BEGIN DISPLAY 3264 2784 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ctrl(0)
            WIRE 3264 2848 3360 2848
            BEGIN DISPLAY 3264 2848 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ctrl(0)
            WIRE 3264 2656 3360 2656
            BEGIN DISPLAY 3264 2656 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ctrl(1)
            WIRE 3264 2592 3360 2592
            BEGIN DISPLAY 3264 2592 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ctrl(2)
            WIRE 3264 2528 3360 2528
            BEGIN DISPLAY 3264 2528 ATTR Name
                ALIGNMENT RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_115 3648 2720 R0
        INSTANCE XLXI_116 3648 2912 R0
        INSTANCE XLXI_117 3984 2768 R0
        INSTANCE XLXI_118 3360 2560 R0
        INSTANCE XLXI_119 3360 2624 R0
        INSTANCE XLXI_120 3360 2688 R0
        INSTANCE XLXI_121 3360 2816 R0
        INSTANCE XLXI_122 3360 2880 R0
        INSTANCE XLXI_123 4368 2848 R0
        BEGIN BRANCH XLXN_296
            WIRE 4240 2672 4256 2672
            WIRE 4256 2672 4304 2672
            WIRE 4304 2672 4304 2720
            WIRE 4304 2720 4368 2720
        END BRANCH
        BEGIN BRANCH carryout
            WIRE 4272 2784 4368 2784
            WIRE 4272 2784 4272 2848
            WIRE 4272 2848 4272 2864
            BEGIN DISPLAY 4272 2864 ATTR Name
                ALIGNMENT VRIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 4928 2752 Cout
        INSTANCE XLXI_102 4672 2784 R0
        BEGIN BRANCH XLXN_299
            WIRE 4624 2752 4672 2752
        END BRANCH
    END SHEET
END SCHEMATIC
