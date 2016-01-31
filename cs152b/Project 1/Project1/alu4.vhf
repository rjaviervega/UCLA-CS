-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\inv4.sch - Thu Jul 08 12:09:43 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY INV4_MXILINX IS
   PORT ( I0	:	IN	STD_LOGIC; 
          I1	:	IN	STD_LOGIC; 
          I2	:	IN	STD_LOGIC; 
          I3	:	IN	STD_LOGIC; 
          O0	:	OUT	STD_LOGIC; 
          O1	:	OUT	STD_LOGIC; 
          O2	:	OUT	STD_LOGIC; 
          O3	:	OUT	STD_LOGIC);

end INV4_MXILINX;

ARCHITECTURE SCHEMATIC OF INV4_MXILINX IS

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_36_37 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_38 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_39 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_40 : LABEL IS "true";

BEGIN

   I_36_37 : INV
      PORT MAP (I=>I3, O=>O3);

   I_36_38 : INV
      PORT MAP (I=>I2, O=>O2);

   I_36_39 : INV
      PORT MAP (I=>I1, O=>O1);

   I_36_40 : INV
      PORT MAP (I=>I0, O=>O0);

END SCHEMATIC;



-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\m2_1.sch - Thu Jul 08 12:09:43 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY M2_1_MXILINX IS
   PORT ( D0	:	IN	STD_LOGIC; 
          D1	:	IN	STD_LOGIC; 
          S0	:	IN	STD_LOGIC; 
          O	:	OUT	STD_LOGIC);

end M2_1_MXILINX;

ARCHITECTURE SCHEMATIC OF M2_1_MXILINX IS
   SIGNAL M0	:	STD_LOGIC;
   SIGNAL M1	:	STD_LOGIC;

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_36_9 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_7 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_8 : LABEL IS "true";

BEGIN

   I_36_9 : AND2
      PORT MAP (I0=>D1, I1=>S0, O=>M1);

   I_36_7 : AND2B1
      PORT MAP (I0=>S0, I1=>D0, O=>M0);

   I_36_8 : OR2
      PORT MAP (I0=>M1, I1=>M0, O=>O);

END SCHEMATIC;



-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\compm4.sch - Thu Jul 08 12:09:43 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY COMPM4_MXILINX IS
   PORT ( A0	:	IN	STD_LOGIC; 
          A1	:	IN	STD_LOGIC; 
          A2	:	IN	STD_LOGIC; 
          A3	:	IN	STD_LOGIC; 
          B0	:	IN	STD_LOGIC; 
          B1	:	IN	STD_LOGIC; 
          B2	:	IN	STD_LOGIC; 
          B3	:	IN	STD_LOGIC; 
          GT	:	OUT	STD_LOGIC; 
          LT	:	OUT	STD_LOGIC);

end COMPM4_MXILINX;

ARCHITECTURE SCHEMATIC OF COMPM4_MXILINX IS
   SIGNAL EQ2_3	:	STD_LOGIC;
   SIGNAL EQ_1	:	STD_LOGIC;
   SIGNAL EQ_3	:	STD_LOGIC;
   SIGNAL GE0_1	:	STD_LOGIC;
   SIGNAL GE2_3	:	STD_LOGIC;
   SIGNAL GT0_1	:	STD_LOGIC;
   SIGNAL GTA	:	STD_LOGIC;
   SIGNAL GTB	:	STD_LOGIC;
   SIGNAL GT_1	:	STD_LOGIC;
   SIGNAL GT_3	:	STD_LOGIC;
   SIGNAL LE0_1	:	STD_LOGIC;
   SIGNAL LE2_3	:	STD_LOGIC;
   SIGNAL LT0_1	:	STD_LOGIC;
   SIGNAL LTA	:	STD_LOGIC;
   SIGNAL LTB	:	STD_LOGIC;
   SIGNAL LT_1	:	STD_LOGIC;
   SIGNAL LT_3	:	STD_LOGIC;

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_36_1 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_2 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_4 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_6 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_7 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_9 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_14 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_15 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_16 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_17 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_3 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_20 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_19 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_18 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_12 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_11 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_5 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_8 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_13 : LABEL IS "true";

BEGIN

   I_36_1 : AND2
      PORT MAP (I0=>GT0_1, I1=>EQ2_3, O=>GTA);

   I_36_2 : AND2
      PORT MAP (I0=>EQ2_3, I1=>LT0_1, O=>LTA);

   I_36_4 : AND2B1
      PORT MAP (I0=>A3, I1=>B3, O=>LT_3);

   I_36_6 : AND2B1
      PORT MAP (I0=>B3, I1=>A3, O=>GT_3);

   I_36_7 : AND2B1
      PORT MAP (I0=>A1, I1=>B1, O=>LT_1);

   I_36_9 : AND2B1
      PORT MAP (I0=>B1, I1=>A1, O=>GT_1);

   I_36_14 : AND3B1
      PORT MAP (I0=>B2, I1=>EQ_3, I2=>A2, O=>GE2_3);

   I_36_15 : AND3B1
      PORT MAP (I0=>A2, I1=>EQ_3, I2=>B2, O=>LE2_3);

   I_36_16 : AND3B1
      PORT MAP (I0=>B0, I1=>EQ_1, I2=>A0, O=>GE0_1);

   I_36_17 : AND3B1
      PORT MAP (I0=>A0, I1=>EQ_1, I2=>B0, O=>LE0_1);

   I_36_3 : NOR2
      PORT MAP (I0=>GTB, I1=>LTB, O=>EQ2_3);

   I_36_20 : OR2
      PORT MAP (I0=>LT_3, I1=>LE2_3, O=>LTB);

   I_36_19 : OR2
      PORT MAP (I0=>GT_3, I1=>GE2_3, O=>GTB);

   I_36_18 : OR2
      PORT MAP (I0=>GT_1, I1=>GE0_1, O=>GT0_1);

   I_36_12 : OR2
      PORT MAP (I0=>GTB, I1=>GTA, O=>GT);

   I_36_11 : OR2
      PORT MAP (I0=>LTB, I1=>LTA, O=>LT);

   I_36_5 : OR2
      PORT MAP (I0=>LT_1, I1=>LE0_1, O=>LT0_1);

   I_36_8 : XNOR2
      PORT MAP (I0=>A3, I1=>B3, O=>EQ_3);

   I_36_13 : XNOR2
      PORT MAP (I0=>A1, I1=>B1, O=>EQ_1);

END SCHEMATIC;



-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\ibuf4.sch - Thu Jul 08 12:09:43 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY IBUF4_MXILINX IS
   PORT ( I0	:	IN	STD_LOGIC; 
          I1	:	IN	STD_LOGIC; 
          I2	:	IN	STD_LOGIC; 
          I3	:	IN	STD_LOGIC; 
          O0	:	OUT	STD_LOGIC; 
          O1	:	OUT	STD_LOGIC; 
          O2	:	OUT	STD_LOGIC; 
          O3	:	OUT	STD_LOGIC);

end IBUF4_MXILINX;

ARCHITECTURE SCHEMATIC OF IBUF4_MXILINX IS

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_36_37 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_38 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_39 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_40 : LABEL IS "true";

BEGIN

   I_36_37 : IBUF
      PORT MAP (I=>I3, O=>O3);

   I_36_38 : IBUF
      PORT MAP (I=>I2, O=>O2);

   I_36_39 : IBUF
      PORT MAP (I=>I1, O=>O1);

   I_36_40 : IBUF
      PORT MAP (I=>I0, O=>O0);

END SCHEMATIC;



-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\add4.sch - Thu Jul 08 12:09:43 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY ADD4_MXILINX IS
   PORT ( A0	:	IN	STD_LOGIC; 
          A1	:	IN	STD_LOGIC; 
          A2	:	IN	STD_LOGIC; 
          A3	:	IN	STD_LOGIC; 
          B0	:	IN	STD_LOGIC; 
          B1	:	IN	STD_LOGIC; 
          B2	:	IN	STD_LOGIC; 
          B3	:	IN	STD_LOGIC; 
          CI	:	IN	STD_LOGIC; 
          CO	:	OUT	STD_LOGIC; 
          OFL	:	OUT	STD_LOGIC; 
          S0	:	OUT	STD_LOGIC; 
          S1	:	OUT	STD_LOGIC; 
          S2	:	OUT	STD_LOGIC; 
          S3	:	OUT	STD_LOGIC);

end ADD4_MXILINX;

ARCHITECTURE SCHEMATIC OF ADD4_MXILINX IS
   SIGNAL C0	:	STD_LOGIC;
   SIGNAL C1	:	STD_LOGIC;
   SIGNAL C2	:	STD_LOGIC;
   SIGNAL C2O	:	STD_LOGIC;
   SIGNAL CO_DUMMY	:	STD_LOGIC;
   SIGNAL I0	:	STD_LOGIC;
   SIGNAL I1	:	STD_LOGIC;
   SIGNAL I2	:	STD_LOGIC;
   SIGNAL I3	:	STD_LOGIC;
   SIGNAL dummy	:	STD_LOGIC;

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE RLOC : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_36_206 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_206 : LABEL IS "R0C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_182 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_182 : LABEL IS "R0C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_175 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_175 : LABEL IS "R1C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_178 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_178 : LABEL IS "R1C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_58 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_58 : LABEL IS "R0C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_62 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_62 : LABEL IS "R0C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_55 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_55 : LABEL IS "R1C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_111 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_111 : LABEL IS "R1C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_239 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_240 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_241 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_242 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_259 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_74 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_76 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_75 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_73 : LABEL IS "true";

BEGIN
   CO <= CO_DUMMY;

   I_36_206 : FMAP
      PORT MAP (I1=>A3, I2=>B3, I3=>dummy, I4=>dummy, O=>I3);

   I_36_182 : FMAP
      PORT MAP (I1=>A2, I2=>B2, I3=>dummy, I4=>dummy, O=>I2);

   I_36_175 : FMAP
      PORT MAP (I1=>A1, I2=>B1, I3=>dummy, I4=>dummy, O=>I1);

   I_36_178 : FMAP
      PORT MAP (I1=>A0, I2=>B0, I3=>dummy, I4=>dummy, O=>I0);

   I_36_58 : MUXCY
      PORT MAP (CI=>C2, DI=>A3, S=>I3, O=>CO_DUMMY);

   I_36_62 : MUXCY_D
      PORT MAP (CI=>C1, DI=>A2, S=>I2, LO=>C2, O=>C2O);

   I_36_55 : MUXCY_L
      PORT MAP (CI=>C0, DI=>A1, S=>I1, LO=>C1);

   I_36_111 : MUXCY_L
      PORT MAP (CI=>CI, DI=>A0, S=>I0, LO=>C0);

   I_36_239 : XOR2
      PORT MAP (I0=>A0, I1=>B0, O=>I0);

   I_36_240 : XOR2
      PORT MAP (I0=>A1, I1=>B1, O=>I1);

   I_36_241 : XOR2
      PORT MAP (I0=>A2, I1=>B2, O=>I2);

   I_36_242 : XOR2
      PORT MAP (I0=>A3, I1=>B3, O=>I3);

   I_36_259 : XOR2
      PORT MAP (I0=>C2O, I1=>CO_DUMMY, O=>OFL);

   I_36_74 : XORCY
      PORT MAP (CI=>C0, LI=>I1, O=>S1);

   I_36_76 : XORCY
      PORT MAP (CI=>C1, LI=>I2, O=>S2);

   I_36_75 : XORCY
      PORT MAP (CI=>C2, LI=>I3, O=>S3);

   I_36_73 : XORCY
      PORT MAP (CI=>CI, LI=>I0, O=>S0);

END SCHEMATIC;



-- Vhdl model created from schematic alu4.sch - Thu Jul 08 12:09:43 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY alu4 IS
   PORT ( A0_in	:	IN	STD_LOGIC; 
          A1_in	:	IN	STD_LOGIC; 
          A2_in	:	IN	STD_LOGIC; 
          A3_in	:	IN	STD_LOGIC; 
          ALUctrl0	:	IN	STD_LOGIC; 
          ALUctrl1	:	IN	STD_LOGIC; 
          ALUctrl2	:	IN	STD_LOGIC; 
          B0_in	:	IN	STD_LOGIC; 
          B1_in	:	IN	STD_LOGIC; 
          B2_in	:	IN	STD_LOGIC; 
          B3_in	:	IN	STD_LOGIC; 
          Cin	:	IN	STD_LOGIC; 
          Cout	:	OUT	STD_LOGIC; 
          OVF	:	OUT	STD_LOGIC; 
          S0	:	OUT	STD_LOGIC; 
          S1	:	OUT	STD_LOGIC; 
          S2	:	OUT	STD_LOGIC; 
          S3	:	OUT	STD_LOGIC; 
          zero	:	OUT	STD_LOGIC);

end alu4;

ARCHITECTURE SCHEMATIC OF alu4 IS
   SIGNAL A0	:	STD_LOGIC;
   SIGNAL A1	:	STD_LOGIC;
   SIGNAL A2	:	STD_LOGIC;
   SIGNAL A3	:	STD_LOGIC;
   SIGNAL B	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL B_or_one	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL BorOne	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL Complement	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL LS	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL LT	:	STD_LOGIC;
   SIGNAL RS	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL XLXN_102	:	STD_LOGIC;
   SIGNAL XLXN_103	:	STD_LOGIC;
   SIGNAL XLXN_124	:	STD_LOGIC;
   SIGNAL XLXN_125	:	STD_LOGIC;
   SIGNAL XLXN_135	:	STD_LOGIC;
   SIGNAL XLXN_136	:	STD_LOGIC;
   SIGNAL XLXN_152	:	STD_LOGIC;
   SIGNAL XLXN_153	:	STD_LOGIC;
   SIGNAL XLXN_154	:	STD_LOGIC;
   SIGNAL XLXN_165	:	STD_LOGIC;
   SIGNAL XLXN_166	:	STD_LOGIC;
   SIGNAL XLXN_167	:	STD_LOGIC;
   SIGNAL XLXN_177	:	STD_LOGIC;
   SIGNAL XLXN_178	:	STD_LOGIC;
   SIGNAL XLXN_179	:	STD_LOGIC;
   SIGNAL XLXN_188	:	STD_LOGIC;
   SIGNAL XLXN_189	:	STD_LOGIC;
   SIGNAL XLXN_190	:	STD_LOGIC;
   SIGNAL XLXN_199	:	STD_LOGIC;
   SIGNAL XLXN_200	:	STD_LOGIC;
   SIGNAL XLXN_201	:	STD_LOGIC;
   SIGNAL XLXN_210	:	STD_LOGIC;
   SIGNAL XLXN_211	:	STD_LOGIC;
   SIGNAL XLXN_212	:	STD_LOGIC;
   SIGNAL XLXN_277	:	STD_LOGIC;
   SIGNAL XLXN_278	:	STD_LOGIC;
   SIGNAL XLXN_280	:	STD_LOGIC;
   SIGNAL XLXN_281	:	STD_LOGIC;
   SIGNAL XLXN_282	:	STD_LOGIC;
   SIGNAL XLXN_283	:	STD_LOGIC;
   SIGNAL XLXN_284	:	STD_LOGIC;
   SIGNAL XLXN_285	:	STD_LOGIC;
   SIGNAL XLXN_286	:	STD_LOGIC;
   SIGNAL XLXN_287	:	STD_LOGIC;
   SIGNAL XLXN_289	:	STD_LOGIC;
   SIGNAL XLXN_290	:	STD_LOGIC;
   SIGNAL XLXN_296	:	STD_LOGIC;
   SIGNAL XLXN_299	:	STD_LOGIC;
   SIGNAL XLXN_55	:	STD_LOGIC;
   SIGNAL XLXN_56	:	STD_LOGIC;
   SIGNAL XLXN_60	:	STD_LOGIC;
   SIGNAL XLXN_62	:	STD_LOGIC;
   SIGNAL XLXN_74	:	STD_LOGIC;
   SIGNAL XLXN_77	:	STD_LOGIC;
   SIGNAL XLXN_99	:	STD_LOGIC;
   SIGNAL add	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL bitand	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL bitor	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL carry	:	STD_LOGIC;
   SIGNAL carry_in	:	STD_LOGIC;
   SIGNAL carryout	:	STD_LOGIC;
   SIGNAL ctrl	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL one	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL output	:	STD_LOGIC_VECTOR (3 DOWNTO 0);

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE KEEP_HIERARCHY : STRING ;
   ATTRIBUTE KEEP_HIERARCHY OF adder : LABEL IS "TRUE";
   ATTRIBUTE fpga_dont_touch OF XLXI_123 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_22 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_21 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_20 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_19 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_116 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_115 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_30 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_31 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_114 : LABEL IS "true";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_28 : LABEL IS "TRUE";
   ATTRIBUTE fpga_dont_touch OF XLXI_68 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_72 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_76 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_80 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_84 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_88 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_94 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_95 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_96 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_37 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_43 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_46 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_47 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_48 : LABEL IS "true";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_6 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_7 : LABEL IS "TRUE";
   ATTRIBUTE fpga_dont_touch OF XLXI_122 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_121 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_120 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_119 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_118 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_33 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_34 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_35 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_38 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_39 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_40 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_41 : LABEL IS "true";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_112 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_44 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_29 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_91 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_90 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_89 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_87 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_86 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_85 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_83 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_82 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_81 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_69 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_70 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_63 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_71 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_67 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_73 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_66 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_74 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_75 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_62 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_65 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_77 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_78 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_79 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_64 : LABEL IS "TRUE";
   ATTRIBUTE fpga_dont_touch OF XLXI_49 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_103 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_102 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_97 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_36 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_50 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_51 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_25 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_24 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_23 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_26 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_117 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_32 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_45 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_92 : LABEL IS "true";

   COMPONENT ADD4_MXILINX
      PORT ( A0	:	IN	STD_LOGIC; 
             A1	:	IN	STD_LOGIC; 
             A2	:	IN	STD_LOGIC; 
             A3	:	IN	STD_LOGIC; 
             B0	:	IN	STD_LOGIC; 
             B1	:	IN	STD_LOGIC; 
             B2	:	IN	STD_LOGIC; 
             B3	:	IN	STD_LOGIC; 
             CI	:	IN	STD_LOGIC; 
             CO	:	OUT	STD_LOGIC; 
             OFL	:	OUT	STD_LOGIC; 
             S0	:	OUT	STD_LOGIC; 
             S1	:	OUT	STD_LOGIC; 
             S2	:	OUT	STD_LOGIC; 
             S3	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT COMPM4_MXILINX
      PORT ( A0	:	IN	STD_LOGIC; 
             A1	:	IN	STD_LOGIC; 
             A2	:	IN	STD_LOGIC; 
             A3	:	IN	STD_LOGIC; 
             B0	:	IN	STD_LOGIC; 
             B1	:	IN	STD_LOGIC; 
             B2	:	IN	STD_LOGIC; 
             B3	:	IN	STD_LOGIC; 
             GT	:	OUT	STD_LOGIC; 
             LT	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT IBUF4_MXILINX
      PORT ( I0	:	IN	STD_LOGIC; 
             I1	:	IN	STD_LOGIC; 
             I2	:	IN	STD_LOGIC; 
             I3	:	IN	STD_LOGIC; 
             O0	:	OUT	STD_LOGIC; 
             O1	:	OUT	STD_LOGIC; 
             O2	:	OUT	STD_LOGIC; 
             O3	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT INV4_MXILINX
      PORT ( I0	:	IN	STD_LOGIC; 
             I1	:	IN	STD_LOGIC; 
             I2	:	IN	STD_LOGIC; 
             I3	:	IN	STD_LOGIC; 
             O0	:	OUT	STD_LOGIC; 
             O1	:	OUT	STD_LOGIC; 
             O2	:	OUT	STD_LOGIC; 
             O3	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT M2_1_MXILINX
      PORT ( D0	:	IN	STD_LOGIC; 
             D1	:	IN	STD_LOGIC; 
             S0	:	IN	STD_LOGIC; 
             O	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT mux2to1
      PORT ( MB	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             MA	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             S	:	IN	STD_LOGIC_VECTOR (0 DOWNTO 0); 
             O	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0));
   END COMPONENT;

   COMPONENT mux8to1
      PORT ( MH	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             MG	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             MF	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             ME	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             MD	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             MC	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             MB	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             MA	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             S	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0); 
             O	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0));
   END COMPONENT;

BEGIN

   adder : ADD4_MXILINX
      PORT MAP (A0=>A0, A1=>A1, A2=>A2, A3=>A3, B0=>B_or_one(0),
      B1=>B_or_one(1), B2=>B_or_one(2), B3=>B_or_one(3), CI=>carry,
      CO=>carryout, OFL=>open, S0=>add(0), S1=>add(1), S2=>add(2), S3=>add(3));

   XLXI_123 : AND2
      PORT MAP (I0=>carryout, I1=>XLXN_296, O=>XLXN_299);

   XLXI_22 : AND2
      PORT MAP (I0=>B(0), I1=>A0, O=>bitand(0));

   XLXI_21 : AND2
      PORT MAP (I0=>B(1), I1=>A1, O=>bitand(1));

   XLXI_20 : AND2
      PORT MAP (I0=>B(2), I1=>A2, O=>bitand(2));

   XLXI_19 : AND2
      PORT MAP (I0=>B(3), I1=>A3, O=>bitand(3));

   XLXI_116 : AND3
      PORT MAP (I0=>XLXN_290, I1=>XLXN_289, I2=>ctrl(2), O=>XLXN_284);

   XLXI_115 : AND3
      PORT MAP (I0=>XLXN_287, I1=>XLXN_286, I2=>XLXN_285, O=>XLXN_283);

   XLXI_30 : AND3
      PORT MAP (I0=>ctrl(0), I1=>XLXN_56, I2=>XLXN_55, O=>XLXN_62);

   XLXI_31 : AND3
      PORT MAP (I0=>ctrl(0), I1=>XLXN_60, I2=>ctrl(2), O=>XLXN_102);

   XLXI_114 : AND4
      PORT MAP (I0=>XLXN_281, I1=>XLXN_280, I2=>XLXN_277, I3=>XLXN_278,
      O=>XLXN_282);

   XLXI_28 : COMPM4_MXILINX
      PORT MAP (A0=>A0, A1=>A1, A2=>A2, A3=>A3, B0=>B(0), B1=>B(1), B2=>B(2),
      B3=>B(3), GT=>open, LT=>LT);

   XLXI_68 : GND
      PORT MAP (G=>XLXN_152);

   XLXI_72 : GND
      PORT MAP (G=>XLXN_165);

   XLXI_76 : GND
      PORT MAP (G=>XLXN_177);

   XLXI_80 : GND
      PORT MAP (G=>XLXN_188);

   XLXI_84 : GND
      PORT MAP (G=>XLXN_199);

   XLXI_88 : GND
      PORT MAP (G=>XLXN_210);

   XLXI_94 : GND
      PORT MAP (G=>one(3));

   XLXI_95 : GND
      PORT MAP (G=>one(2));

   XLXI_96 : GND
      PORT MAP (G=>one(1));

   XLXI_37 : GND
      PORT MAP (G=>XLXN_77);

   XLXI_43 : IBUF
      PORT MAP (I=>Cin, O=>carry_in);

   XLXI_46 : IBUF
      PORT MAP (I=>ALUctrl0, O=>ctrl(0));

   XLXI_47 : IBUF
      PORT MAP (I=>ALUctrl1, O=>ctrl(1));

   XLXI_48 : IBUF
      PORT MAP (I=>ALUctrl2, O=>ctrl(2));

   XLXI_6 : IBUF4_MXILINX
      PORT MAP (I0=>A3_in, I1=>A2_in, I2=>A1_in, I3=>A0_in, O0=>A3, O1=>A2,
      O2=>A1, O3=>A0);

   XLXI_7 : IBUF4_MXILINX
      PORT MAP (I0=>B3_in, I1=>B2_in, I2=>B1_in, I3=>B0_in, O0=>B(3), O1=>B(2),
      O2=>B(1), O3=>B(0));

   XLXI_122 : INV
      PORT MAP (I=>ctrl(0), O=>XLXN_290);

   XLXI_121 : INV
      PORT MAP (I=>ctrl(1), O=>XLXN_289);

   XLXI_120 : INV
      PORT MAP (I=>ctrl(0), O=>XLXN_287);

   XLXI_119 : INV
      PORT MAP (I=>ctrl(1), O=>XLXN_286);

   XLXI_118 : INV
      PORT MAP (I=>ctrl(2), O=>XLXN_285);

   XLXI_33 : INV
      PORT MAP (I=>ctrl(2), O=>XLXN_55);

   XLXI_34 : INV
      PORT MAP (I=>ctrl(1), O=>XLXN_56);

   XLXI_35 : INV
      PORT MAP (I=>ctrl(1), O=>XLXN_60);

   XLXI_38 : INV
      PORT MAP (I=>BorOne(3), O=>Complement(3));

   XLXI_39 : INV
      PORT MAP (I=>BorOne(2), O=>Complement(2));

   XLXI_40 : INV
      PORT MAP (I=>BorOne(1), O=>Complement(1));

   XLXI_41 : INV
      PORT MAP (I=>BorOne(0), O=>Complement(0));

   XLXI_112 : INV4_MXILINX
      PORT MAP (I0=>output(0), I1=>output(1), I2=>output(2), I3=>output(3),
      O0=>XLXN_281, O1=>XLXN_280, O2=>XLXN_277, O3=>XLXN_278);

   XLXI_44 : M2_1_MXILINX
      PORT MAP (D0=>carry_in, D1=>XLXN_99, S0=>ctrl(0), O=>carry);

   XLXI_29 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_77, D1=>LT, S0=>XLXN_103, O=>XLXN_74);

   XLXI_91 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_211, D1=>XLXN_212, S0=>B(1), O=>RS(0));

   XLXI_90 : M2_1_MXILINX
      PORT MAP (D0=>A2, D1=>A3, S0=>B(0), O=>XLXN_212);

   XLXI_89 : M2_1_MXILINX
      PORT MAP (D0=>A0, D1=>A1, S0=>B(0), O=>XLXN_211);

   XLXI_87 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_200, D1=>XLXN_201, S0=>B(1), O=>RS(1));

   XLXI_86 : M2_1_MXILINX
      PORT MAP (D0=>A3, D1=>XLXN_210, S0=>B(0), O=>XLXN_201);

   XLXI_85 : M2_1_MXILINX
      PORT MAP (D0=>A1, D1=>A2, S0=>B(0), O=>XLXN_200);

   XLXI_83 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_189, D1=>XLXN_190, S0=>B(1), O=>RS(2));

   XLXI_82 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_199, D1=>XLXN_199, S0=>B(0), O=>XLXN_190);

   XLXI_81 : M2_1_MXILINX
      PORT MAP (D0=>A2, D1=>A3, S0=>B(0), O=>XLXN_189);

   XLXI_69 : M2_1_MXILINX
      PORT MAP (D0=>A1, D1=>A0, S0=>B(0), O=>XLXN_153);

   XLXI_70 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_165, D1=>XLXN_165, S0=>B(0), O=>XLXN_154);

   XLXI_63 : M2_1_MXILINX
      PORT MAP (D0=>A1, D1=>A0, S0=>B(0), O=>XLXN_125);

   XLXI_71 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_153, D1=>XLXN_154, S0=>B(1), O=>LS(1));

   XLXI_67 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_135, D1=>XLXN_136, S0=>B(1), O=>LS(2));

   XLXI_73 : M2_1_MXILINX
      PORT MAP (D0=>A0, D1=>XLXN_177, S0=>B(0), O=>XLXN_166);

   XLXI_66 : M2_1_MXILINX
      PORT MAP (D0=>A0, D1=>XLXN_152, S0=>B(0), O=>XLXN_136);

   XLXI_74 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_177, D1=>XLXN_177, S0=>B(0), O=>XLXN_167);

   XLXI_75 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_166, D1=>XLXN_167, S0=>B(1), O=>LS(0));

   XLXI_62 : M2_1_MXILINX
      PORT MAP (D0=>A3, D1=>A2, S0=>B(0), O=>XLXN_124);

   XLXI_65 : M2_1_MXILINX
      PORT MAP (D0=>A2, D1=>A1, S0=>B(0), O=>XLXN_135);

   XLXI_77 : M2_1_MXILINX
      PORT MAP (D0=>A3, D1=>XLXN_188, S0=>B(0), O=>XLXN_178);

   XLXI_78 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_188, D1=>XLXN_188, S0=>B(0), O=>XLXN_179);

   XLXI_79 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_178, D1=>XLXN_179, S0=>B(1), O=>RS(3));

   XLXI_64 : M2_1_MXILINX
      PORT MAP (D0=>XLXN_124, D1=>XLXN_125, S0=>B(1), O=>LS(3));

   XLXI_107 : mux2to1
      PORT MAP (MB(3)=>one(3), MB(2)=>one(2), MB(1)=>one(1), MB(0)=>one(0),
      MA(3)=>B(3), MA(2)=>B(2), MA(1)=>B(1), MA(0)=>B(0), S(0)=>ctrl(2),
      O(3)=>BorOne(3), O(2)=>BorOne(2), O(1)=>BorOne(1), O(0)=>BorOne(0));

   XLXI_106 : mux2to1
      PORT MAP (MB(3)=>Complement(3), MB(2)=>Complement(2),
      MB(1)=>Complement(1), MB(0)=>Complement(0), MA(3)=>BorOne(3),
      MA(2)=>BorOne(2), MA(1)=>BorOne(1), MA(0)=>BorOne(0), S(0)=>ctrl(0),
      O(3)=>B_or_one(3), O(2)=>B_or_one(2), O(1)=>B_or_one(1),
      O(0)=>B_or_one(0));

   XLXI_108 : mux8to1
      PORT MAP (MH(3)=>RS(3), MH(2)=>RS(2), MH(1)=>RS(1), MH(0)=>RS(0),
      MG(3)=>LS(3), MG(2)=>LS(2), MG(1)=>LS(1), MG(0)=>LS(0), MF(3)=>add(3),
      MF(2)=>add(2), MF(1)=>add(1), MF(0)=>add(0), ME(3)=>add(3),
      ME(2)=>add(2), ME(1)=>add(1), ME(0)=>add(0), MD(3)=>bitor(3),
      MD(2)=>bitor(2), MD(1)=>bitor(1), MD(0)=>bitor(0), MC(3)=>bitand(3),
      MC(2)=>bitand(2), MC(1)=>bitand(1), MC(0)=>bitand(0), MB(3)=>add(3),
      MB(2)=>add(2), MB(1)=>add(1), MB(0)=>add(0), MA(3)=>add(3),
      MA(2)=>add(2), MA(1)=>add(1), MA(0)=>add(0), S(2)=>ctrl(2),
      S(1)=>ctrl(1), S(0)=>ctrl(0), O(3)=>output(3), O(2)=>output(2),
      O(1)=>output(1), O(0)=>output(0));

   XLXI_49 : OBUF
      PORT MAP (I=>output(3), O=>S3);

   XLXI_103 : OBUF
      PORT MAP (I=>output(0), O=>S0);

   XLXI_102 : OBUF
      PORT MAP (I=>XLXN_299, O=>Cout);

   XLXI_97 : OBUF
      PORT MAP (I=>XLXN_282, O=>zero);

   XLXI_36 : OBUF
      PORT MAP (I=>XLXN_74, O=>OVF);

   XLXI_50 : OBUF
      PORT MAP (I=>output(2), O=>S2);

   XLXI_51 : OBUF
      PORT MAP (I=>output(1), O=>S1);

   XLXI_25 : OR2
      PORT MAP (I0=>B(1), I1=>A1, O=>bitor(1));

   XLXI_24 : OR2
      PORT MAP (I0=>B(2), I1=>A2, O=>bitor(2));

   XLXI_23 : OR2
      PORT MAP (I0=>B(3), I1=>A3, O=>bitor(3));

   XLXI_26 : OR2
      PORT MAP (I0=>B(0), I1=>A0, O=>bitor(0));

   XLXI_117 : OR2
      PORT MAP (I0=>XLXN_284, I1=>XLXN_283, O=>XLXN_296);

   XLXI_32 : OR2
      PORT MAP (I0=>XLXN_102, I1=>XLXN_62, O=>XLXN_103);

   XLXI_45 : VCC
      PORT MAP (P=>XLXN_99);

   XLXI_92 : VCC
      PORT MAP (P=>one(0));

END SCHEMATIC;



