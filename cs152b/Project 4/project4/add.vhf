-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\adsu16.sch - Sat Aug 14 17:43:37 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY ADSU16_MXILINX IS
   PORT ( A	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          ADD	:	IN	STD_LOGIC; 
          B	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          CI	:	IN	STD_LOGIC; 
          CO	:	OUT	STD_LOGIC; 
          OFL	:	OUT	STD_LOGIC; 
          S	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));

end ADSU16_MXILINX;

ARCHITECTURE SCHEMATIC OF ADSU16_MXILINX IS
   SIGNAL C0	:	STD_LOGIC;
   SIGNAL C1	:	STD_LOGIC;
   SIGNAL C10	:	STD_LOGIC;
   SIGNAL C11	:	STD_LOGIC;
   SIGNAL C12	:	STD_LOGIC;
   SIGNAL C13	:	STD_LOGIC;
   SIGNAL C14	:	STD_LOGIC;
   SIGNAL C14O	:	STD_LOGIC;
   SIGNAL C2	:	STD_LOGIC;
   SIGNAL C3	:	STD_LOGIC;
   SIGNAL C4	:	STD_LOGIC;
   SIGNAL C5	:	STD_LOGIC;
   SIGNAL C6	:	STD_LOGIC;
   SIGNAL C7	:	STD_LOGIC;
   SIGNAL C8	:	STD_LOGIC;
   SIGNAL C9	:	STD_LOGIC;
   SIGNAL CO_DUMMY	:	STD_LOGIC;
   SIGNAL I0	:	STD_LOGIC;
   SIGNAL I1	:	STD_LOGIC;
   SIGNAL I10	:	STD_LOGIC;
   SIGNAL I11	:	STD_LOGIC;
   SIGNAL I12	:	STD_LOGIC;
   SIGNAL I13	:	STD_LOGIC;
   SIGNAL I14	:	STD_LOGIC;
   SIGNAL I15	:	STD_LOGIC;
   SIGNAL I2	:	STD_LOGIC;
   SIGNAL I3	:	STD_LOGIC;
   SIGNAL I4	:	STD_LOGIC;
   SIGNAL I5	:	STD_LOGIC;
   SIGNAL I6	:	STD_LOGIC;
   SIGNAL I7	:	STD_LOGIC;
   SIGNAL I8	:	STD_LOGIC;
   SIGNAL I9	:	STD_LOGIC;
   SIGNAL SUB0	:	STD_LOGIC;
   SIGNAL SUB1	:	STD_LOGIC;
   SIGNAL SUB10	:	STD_LOGIC;
   SIGNAL SUB11	:	STD_LOGIC;
   SIGNAL SUB12	:	STD_LOGIC;
   SIGNAL SUB13	:	STD_LOGIC;
   SIGNAL SUB14	:	STD_LOGIC;
   SIGNAL SUB15	:	STD_LOGIC;
   SIGNAL SUB2	:	STD_LOGIC;
   SIGNAL SUB3	:	STD_LOGIC;
   SIGNAL SUB4	:	STD_LOGIC;
   SIGNAL SUB5	:	STD_LOGIC;
   SIGNAL SUB6	:	STD_LOGIC;
   SIGNAL SUB7	:	STD_LOGIC;
   SIGNAL SUB8	:	STD_LOGIC;
   SIGNAL SUB9	:	STD_LOGIC;
   SIGNAL dummy	:	STD_LOGIC;

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE RLOC : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_36_23 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_23 : LABEL IS "R0C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_22 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_22 : LABEL IS "R0C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_21 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_21 : LABEL IS "R1C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_20 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_20 : LABEL IS "R1C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_19 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_19 : LABEL IS "R2C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_18 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_18 : LABEL IS "R2C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_17 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_17 : LABEL IS "R3C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_16 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_16 : LABEL IS "R3C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_299 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_299 : LABEL IS "R4C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_295 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_295 : LABEL IS "R4C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_291 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_291 : LABEL IS "R5C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_287 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_287 : LABEL IS "R5C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_283 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_283 : LABEL IS "R6C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_279 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_279 : LABEL IS "R6C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_272 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_272 : LABEL IS "R7C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_275 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_275 : LABEL IS "R7C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_366 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_367 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_355 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_356 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_357 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_358 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_359 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_360 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_361 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_362 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_365 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_368 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_369 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_370 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_364 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_363 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_64 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_64 : LABEL IS "R0C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_107 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_107 : LABEL IS "R0C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_255 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_255 : LABEL IS "R7C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_110 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_110 : LABEL IS "R1C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_63 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_63 : LABEL IS "R1C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_58 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_58 : LABEL IS "R2C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_62 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_62 : LABEL IS "R2C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_55 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_55 : LABEL IS "R3C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_111 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_111 : LABEL IS "R3C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_248 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_248 : LABEL IS "R4C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_249 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_249 : LABEL IS "R4C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_250 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_250 : LABEL IS "R5C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_251 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_251 : LABEL IS "R5C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_252 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_252 : LABEL IS "R6C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_253 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_253 : LABEL IS "R6C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_254 : LABEL IS "true";
   ATTRIBUTE RLOC OF I_36_254 : LABEL IS "R7C0.S1";
   ATTRIBUTE fpga_dont_touch OF I_36_353 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_220 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_222 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_223 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_224 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_225 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_232 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_243 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_245 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_109 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_100 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_79 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_60 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_59 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_57 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_56 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_50 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_233 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_234 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_73 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_74 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_76 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_75 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_78 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_77 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_81 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_80 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_226 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_227 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_229 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_228 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_231 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_230 : LABEL IS "true";

BEGIN
   CO <= CO_DUMMY;

   I_36_23 : FMAP
      PORT MAP (I1=>A(15), I2=>B(15), I3=>ADD, I4=>dummy, O=>I15);

   I_36_22 : FMAP
      PORT MAP (I1=>A(14), I2=>B(14), I3=>ADD, I4=>dummy, O=>I14);

   I_36_21 : FMAP
      PORT MAP (I1=>A(13), I2=>B(13), I3=>ADD, I4=>dummy, O=>I13);

   I_36_20 : FMAP
      PORT MAP (I1=>A(12), I2=>B(12), I3=>ADD, I4=>dummy, O=>I12);

   I_36_19 : FMAP
      PORT MAP (I1=>A(11), I2=>B(11), I3=>ADD, I4=>dummy, O=>I11);

   I_36_18 : FMAP
      PORT MAP (I1=>A(10), I2=>B(10), I3=>ADD, I4=>dummy, O=>I10);

   I_36_17 : FMAP
      PORT MAP (I1=>A(9), I2=>B(9), I3=>ADD, I4=>dummy, O=>I9);

   I_36_16 : FMAP
      PORT MAP (I1=>A(8), I2=>B(8), I3=>ADD, I4=>dummy, O=>I8);

   I_36_299 : FMAP
      PORT MAP (I1=>A(7), I2=>B(7), I3=>ADD, I4=>dummy, O=>I7);

   I_36_295 : FMAP
      PORT MAP (I1=>A(6), I2=>B(6), I3=>ADD, I4=>dummy, O=>I6);

   I_36_291 : FMAP
      PORT MAP (I1=>A(5), I2=>B(5), I3=>ADD, I4=>dummy, O=>I5);

   I_36_287 : FMAP
      PORT MAP (I1=>A(4), I2=>B(4), I3=>ADD, I4=>dummy, O=>I4);

   I_36_283 : FMAP
      PORT MAP (I1=>A(3), I2=>B(3), I3=>ADD, I4=>dummy, O=>I3);

   I_36_279 : FMAP
      PORT MAP (I1=>A(2), I2=>B(2), I3=>ADD, I4=>dummy, O=>I2);

   I_36_272 : FMAP
      PORT MAP (I1=>A(1), I2=>B(1), I3=>ADD, I4=>dummy, O=>I1);

   I_36_275 : FMAP
      PORT MAP (I1=>A(0), I2=>B(0), I3=>ADD, I4=>dummy, O=>I0);

   I_36_366 : INV
      PORT MAP (I=>ADD, O=>SUB11);

   I_36_367 : INV
      PORT MAP (I=>ADD, O=>SUB12);

   I_36_355 : INV
      PORT MAP (I=>ADD, O=>SUB0);

   I_36_356 : INV
      PORT MAP (I=>ADD, O=>SUB1);

   I_36_357 : INV
      PORT MAP (I=>ADD, O=>SUB2);

   I_36_358 : INV
      PORT MAP (I=>ADD, O=>SUB3);

   I_36_359 : INV
      PORT MAP (I=>ADD, O=>SUB4);

   I_36_360 : INV
      PORT MAP (I=>ADD, O=>SUB5);

   I_36_361 : INV
      PORT MAP (I=>ADD, O=>SUB6);

   I_36_362 : INV
      PORT MAP (I=>ADD, O=>SUB7);

   I_36_365 : INV
      PORT MAP (I=>ADD, O=>SUB10);

   I_36_368 : INV
      PORT MAP (I=>ADD, O=>SUB13);

   I_36_369 : INV
      PORT MAP (I=>ADD, O=>SUB14);

   I_36_370 : INV
      PORT MAP (I=>ADD, O=>SUB15);

   I_36_364 : INV
      PORT MAP (I=>ADD, O=>SUB9);

   I_36_363 : INV
      PORT MAP (I=>ADD, O=>SUB8);

   I_36_64 : MUXCY
      PORT MAP (CI=>C14, DI=>A(15), S=>I15, O=>CO_DUMMY);

   I_36_107 : MUXCY_D
      PORT MAP (CI=>C13, DI=>A(14), S=>I14, LO=>C14, O=>C14O);

   I_36_255 : MUXCY_L
      PORT MAP (CI=>CI, DI=>A(0), S=>I0, LO=>C0);

   I_36_110 : MUXCY_L
      PORT MAP (CI=>C12, DI=>A(13), S=>I13, LO=>C13);

   I_36_63 : MUXCY_L
      PORT MAP (CI=>C11, DI=>A(12), S=>I12, LO=>C12);

   I_36_58 : MUXCY_L
      PORT MAP (CI=>C10, DI=>A(11), S=>I11, LO=>C11);

   I_36_62 : MUXCY_L
      PORT MAP (CI=>C9, DI=>A(10), S=>I10, LO=>C10);

   I_36_55 : MUXCY_L
      PORT MAP (CI=>C8, DI=>A(9), S=>I9, LO=>C9);

   I_36_111 : MUXCY_L
      PORT MAP (CI=>C7, DI=>A(8), S=>I8, LO=>C8);

   I_36_248 : MUXCY_L
      PORT MAP (CI=>C6, DI=>A(7), S=>I7, LO=>C7);

   I_36_249 : MUXCY_L
      PORT MAP (CI=>C5, DI=>A(6), S=>I6, LO=>C6);

   I_36_250 : MUXCY_L
      PORT MAP (CI=>C4, DI=>A(5), S=>I5, LO=>C5);

   I_36_251 : MUXCY_L
      PORT MAP (CI=>C3, DI=>A(4), S=>I4, LO=>C4);

   I_36_252 : MUXCY_L
      PORT MAP (CI=>C2, DI=>A(3), S=>I3, LO=>C3);

   I_36_253 : MUXCY_L
      PORT MAP (CI=>C1, DI=>A(2), S=>I2, LO=>C2);

   I_36_254 : MUXCY_L
      PORT MAP (CI=>C0, DI=>A(1), S=>I1, LO=>C1);

   I_36_353 : XOR2
      PORT MAP (I0=>C14O, I1=>CO_DUMMY, O=>OFL);

   I_36_220 : XOR3
      PORT MAP (I0=>A(0), I1=>B(0), I2=>SUB0, O=>I0);

   I_36_222 : XOR3
      PORT MAP (I0=>A(2), I1=>B(2), I2=>SUB2, O=>I2);

   I_36_223 : XOR3
      PORT MAP (I0=>A(3), I1=>B(3), I2=>SUB3, O=>I3);

   I_36_224 : XOR3
      PORT MAP (I0=>A(6), I1=>B(6), I2=>SUB6, O=>I6);

   I_36_225 : XOR3
      PORT MAP (I0=>A(4), I1=>B(4), I2=>SUB4, O=>I4);

   I_36_232 : XOR3
      PORT MAP (I0=>A(7), I1=>B(7), I2=>SUB7, O=>I7);

   I_36_243 : XOR3
      PORT MAP (I0=>A(1), I1=>B(1), I2=>SUB1, O=>I1);

   I_36_245 : XOR3
      PORT MAP (I0=>A(5), I1=>B(5), I2=>SUB5, O=>I5);

   I_36_109 : XOR3
      PORT MAP (I0=>A(13), I1=>B(13), I2=>SUB13, O=>I13);

   I_36_100 : XOR3
      PORT MAP (I0=>A(9), I1=>B(9), I2=>SUB9, O=>I9);

   I_36_79 : XOR3
      PORT MAP (I0=>A(15), I1=>B(15), I2=>SUB15, O=>I15);

   I_36_60 : XOR3
      PORT MAP (I0=>A(12), I1=>B(12), I2=>SUB12, O=>I12);

   I_36_59 : XOR3
      PORT MAP (I0=>A(14), I1=>B(14), I2=>SUB14, O=>I14);

   I_36_57 : XOR3
      PORT MAP (I0=>A(11), I1=>B(11), I2=>SUB11, O=>I11);

   I_36_56 : XOR3
      PORT MAP (I0=>A(10), I1=>B(10), I2=>SUB10, O=>I10);

   I_36_50 : XOR3
      PORT MAP (I0=>A(8), I1=>B(8), I2=>SUB8, O=>I8);

   I_36_233 : XORCY
      PORT MAP (CI=>C6, LI=>I7, O=>S(7));

   I_36_234 : XORCY
      PORT MAP (CI=>C5, LI=>I6, O=>S(6));

   I_36_73 : XORCY
      PORT MAP (CI=>C7, LI=>I8, O=>S(8));

   I_36_74 : XORCY
      PORT MAP (CI=>C8, LI=>I9, O=>S(9));

   I_36_76 : XORCY
      PORT MAP (CI=>C9, LI=>I10, O=>S(10));

   I_36_75 : XORCY
      PORT MAP (CI=>C10, LI=>I11, O=>S(11));

   I_36_78 : XORCY
      PORT MAP (CI=>C11, LI=>I12, O=>S(12));

   I_36_77 : XORCY
      PORT MAP (CI=>C12, LI=>I13, O=>S(13));

   I_36_81 : XORCY
      PORT MAP (CI=>C13, LI=>I14, O=>S(14));

   I_36_80 : XORCY
      PORT MAP (CI=>C14, LI=>I15, O=>S(15));

   I_36_226 : XORCY
      PORT MAP (CI=>CI, LI=>I0, O=>S(0));

   I_36_227 : XORCY
      PORT MAP (CI=>C0, LI=>I1, O=>S(1));

   I_36_229 : XORCY
      PORT MAP (CI=>C1, LI=>I2, O=>S(2));

   I_36_228 : XORCY
      PORT MAP (CI=>C2, LI=>I3, O=>S(3));

   I_36_231 : XORCY
      PORT MAP (CI=>C3, LI=>I4, O=>S(4));

   I_36_230 : XORCY
      PORT MAP (CI=>C4, LI=>I5, O=>S(5));

END SCHEMATIC;



-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\inv16.sch - Sat Aug 14 17:43:37 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY INV16_MXILINX IS
   PORT ( I	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          O	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));

end INV16_MXILINX;

ARCHITECTURE SCHEMATIC OF INV16_MXILINX IS

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_36_30 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_31 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_32 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_33 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_34 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_35 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_36 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_37 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_38 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_39 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_40 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_41 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_42 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_43 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_44 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_45 : LABEL IS "true";

BEGIN

   I_36_30 : INV
      PORT MAP (I=>I(8), O=>O(8));

   I_36_31 : INV
      PORT MAP (I=>I(9), O=>O(9));

   I_36_32 : INV
      PORT MAP (I=>I(10), O=>O(10));

   I_36_33 : INV
      PORT MAP (I=>I(11), O=>O(11));

   I_36_34 : INV
      PORT MAP (I=>I(15), O=>O(15));

   I_36_35 : INV
      PORT MAP (I=>I(14), O=>O(14));

   I_36_36 : INV
      PORT MAP (I=>I(13), O=>O(13));

   I_36_37 : INV
      PORT MAP (I=>I(12), O=>O(12));

   I_36_38 : INV
      PORT MAP (I=>I(4), O=>O(4));

   I_36_39 : INV
      PORT MAP (I=>I(5), O=>O(5));

   I_36_40 : INV
      PORT MAP (I=>I(6), O=>O(6));

   I_36_41 : INV
      PORT MAP (I=>I(7), O=>O(7));

   I_36_42 : INV
      PORT MAP (I=>I(3), O=>O(3));

   I_36_43 : INV
      PORT MAP (I=>I(2), O=>O(2));

   I_36_44 : INV
      PORT MAP (I=>I(1), O=>O(1));

   I_36_45 : INV
      PORT MAP (I=>I(0), O=>O(0));

END SCHEMATIC;



-- Vhdl model created from schematic add.sch - Sat Aug 14 17:43:37 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY add IS
   PORT ( A	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          B	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          control	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          S	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          add_overflow	:	OUT	STD_LOGIC);

end add;

ARCHITECTURE SCHEMATIC OF add IS
   SIGNAL ALU_out	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL XLXN_101	:	STD_LOGIC;
   SIGNAL XLXN_116	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL XLXN_120	:	STD_LOGIC;
   SIGNAL XLXN_60	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL XLXN_64	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL XLXN_74	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL XLXN_78	:	STD_LOGIC;
   SIGNAL XLXN_95	:	STD_LOGIC;
   SIGNAL XLXN_96	:	STD_LOGIC;
   SIGNAL one	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL selectB	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
   SIGNAL zero	:	STD_LOGIC_VECTOR (15 DOWNTO 0);

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE KEEP_HIERARCHY : STRING ;
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_23 : LABEL IS "TRUE";
   ATTRIBUTE fpga_dont_touch OF XLXI_15 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_13 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_16 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_17 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_26 : LABEL IS "true";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_10 : LABEL IS "TRUE";
   ATTRIBUTE fpga_dont_touch OF XLXI_14 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_12 : LABEL IS "true";

   COMPONENT addfloat
      PORT ( A	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             B	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             func	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             S	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT ADSU16_MXILINX
      PORT ( A	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             ADD	:	IN	STD_LOGIC; 
             B	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             CI	:	IN	STD_LOGIC; 
             CO	:	OUT	STD_LOGIC; 
             OFL	:	OUT	STD_LOGIC; 
             S	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT INV16_MXILINX
      PORT ( I	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             O	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT mux2_16bits
      PORT ( MB	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MA	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             S	:	IN	STD_LOGIC_VECTOR (0 DOWNTO 0); 
             O	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT mux4_16bits_new
      PORT ( MD	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MC	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MB	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MA	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             S	:	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 
             O	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT negative_detect
      PORT ( A_msb	:	IN	STD_LOGIC; 
             B_msb	:	IN	STD_LOGIC; 
             answer	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             control	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             S	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT of_detect
      PORT ( A	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             B	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             result	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             control	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             overflow	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT one_bus
      PORT ( one	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT zerobus
      PORT ( zero	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

BEGIN

   XLXI_29 : addfloat
      PORT MAP (A(15)=>A(15), A(14)=>A(14), A(13)=>A(13), A(12)=>A(12),
      A(11)=>A(11), A(10)=>A(10), A(9)=>A(9), A(8)=>A(8), A(7)=>A(7),
      A(6)=>A(6), A(5)=>A(5), A(4)=>A(4), A(3)=>A(3), A(2)=>A(2), A(1)=>A(1),
      A(0)=>A(0), B(15)=>B(15), B(14)=>B(14), B(13)=>B(13), B(12)=>B(12),
      B(11)=>B(11), B(10)=>B(10), B(9)=>B(9), B(8)=>B(8), B(7)=>B(7),
      B(6)=>B(6), B(5)=>B(5), B(4)=>B(4), B(3)=>B(3), B(2)=>B(2), B(1)=>B(1),
      B(0)=>B(0), func(3)=>control(3), func(2)=>control(2),
      func(1)=>control(1), func(0)=>control(0), S=>open);

   XLXI_23 : ADSU16_MXILINX
      PORT MAP (A(15)=>XLXN_74(15), A(14)=>XLXN_74(14), A(13)=>XLXN_74(13),
      A(12)=>XLXN_74(12), A(11)=>XLXN_74(11), A(10)=>XLXN_74(10),
      A(9)=>XLXN_74(9), A(8)=>XLXN_74(8), A(7)=>XLXN_74(7), A(6)=>XLXN_74(6),
      A(5)=>XLXN_74(5), A(4)=>XLXN_74(4), A(3)=>XLXN_74(3), A(2)=>XLXN_74(2),
      A(1)=>XLXN_74(1), A(0)=>XLXN_74(0), ADD=>XLXN_120, B(15)=>XLXN_64(15),
      B(14)=>XLXN_64(14), B(13)=>XLXN_64(13), B(12)=>XLXN_64(12),
      B(11)=>XLXN_64(11), B(10)=>XLXN_64(10), B(9)=>XLXN_64(9),
      B(8)=>XLXN_64(8), B(7)=>XLXN_64(7), B(6)=>XLXN_64(6), B(5)=>XLXN_64(5),
      B(4)=>XLXN_64(4), B(3)=>XLXN_64(3), B(2)=>XLXN_64(2), B(1)=>XLXN_64(1),
      B(0)=>XLXN_64(0), CI=>XLXN_78, CO=>open, OFL=>open, S(15)=>ALU_out(15),
      S(14)=>ALU_out(14), S(13)=>ALU_out(13), S(12)=>ALU_out(12),
      S(11)=>ALU_out(11), S(10)=>ALU_out(10), S(9)=>ALU_out(9),
      S(8)=>ALU_out(8), S(7)=>ALU_out(7), S(6)=>ALU_out(6), S(5)=>ALU_out(5),
      S(4)=>ALU_out(4), S(3)=>ALU_out(3), S(2)=>ALU_out(2), S(1)=>ALU_out(1),
      S(0)=>ALU_out(0));

   XLXI_15 : AND4
      PORT MAP (I0=>XLXN_95, I1=>control(1), I2=>control(2), I3=>XLXN_96,
      O=>XLXN_101);

   XLXI_13 : INV
      PORT MAP (I=>control(2), O=>selectB(0));

   XLXI_16 : INV
      PORT MAP (I=>control(3), O=>XLXN_96);

   XLXI_17 : INV
      PORT MAP (I=>control(0), O=>XLXN_95);

   XLXI_26 : INV
      PORT MAP (I=>control(0), O=>XLXN_120);

   XLXI_10 : INV16_MXILINX
      PORT MAP (I(15)=>A(15), I(14)=>A(14), I(13)=>A(13), I(12)=>A(12),
      I(11)=>A(11), I(10)=>A(10), I(9)=>A(9), I(8)=>A(8), I(7)=>A(7),
      I(6)=>A(6), I(5)=>A(5), I(4)=>A(4), I(3)=>A(3), I(2)=>A(2), I(1)=>A(1),
      I(0)=>A(0), O(15)=>XLXN_116(15), O(14)=>XLXN_116(14),
      O(13)=>XLXN_116(13), O(12)=>XLXN_116(12), O(11)=>XLXN_116(11),
      O(10)=>XLXN_116(10), O(9)=>XLXN_116(9), O(8)=>XLXN_116(8),
      O(7)=>XLXN_116(7), O(6)=>XLXN_116(6), O(5)=>XLXN_116(5),
      O(4)=>XLXN_116(4), O(3)=>XLXN_116(3), O(2)=>XLXN_116(2),
      O(1)=>XLXN_116(1), O(0)=>XLXN_116(0));

   XLXI_2 : mux2_16bits
      PORT MAP (MB(15)=>zero(15), MB(14)=>zero(14), MB(13)=>zero(13),
      MB(12)=>zero(12), MB(11)=>zero(11), MB(10)=>zero(10), MB(9)=>zero(9),
      MB(8)=>zero(8), MB(7)=>zero(7), MB(6)=>zero(6), MB(5)=>zero(5),
      MB(4)=>zero(4), MB(3)=>zero(3), MB(2)=>zero(2), MB(1)=>zero(1),
      MB(0)=>zero(0), MA(15)=>A(15), MA(14)=>A(14), MA(13)=>A(13),
      MA(12)=>A(12), MA(11)=>A(11), MA(10)=>A(10), MA(9)=>A(9), MA(8)=>A(8),
      MA(7)=>A(7), MA(6)=>A(6), MA(5)=>A(5), MA(4)=>A(4), MA(3)=>A(3),
      MA(2)=>A(2), MA(1)=>A(1), MA(0)=>A(0), S(0)=>control(1),
      O(15)=>XLXN_74(15), O(14)=>XLXN_74(14), O(13)=>XLXN_74(13),
      O(12)=>XLXN_74(12), O(11)=>XLXN_74(11), O(10)=>XLXN_74(10),
      O(9)=>XLXN_74(9), O(8)=>XLXN_74(8), O(7)=>XLXN_74(7), O(6)=>XLXN_74(6),
      O(5)=>XLXN_74(5), O(4)=>XLXN_74(4), O(3)=>XLXN_74(3), O(2)=>XLXN_74(2),
      O(1)=>XLXN_74(1), O(0)=>XLXN_74(0));

   XLXI_9 : mux4_16bits_new
      PORT MAP (MD(15)=>XLXN_60(15), MD(14)=>XLXN_60(14), MD(13)=>XLXN_60(13),
      MD(12)=>XLXN_60(12), MD(11)=>XLXN_60(11), MD(10)=>XLXN_60(10),
      MD(9)=>XLXN_60(9), MD(8)=>XLXN_60(8), MD(7)=>XLXN_60(7),
      MD(6)=>XLXN_60(6), MD(5)=>XLXN_60(5), MD(4)=>XLXN_60(4),
      MD(3)=>XLXN_60(3), MD(2)=>XLXN_60(2), MD(1)=>XLXN_60(1),
      MD(0)=>XLXN_60(0), MC(15)=>one(15), MC(14)=>one(14), MC(13)=>one(13),
      MC(12)=>one(12), MC(11)=>one(11), MC(10)=>one(10), MC(9)=>one(9),
      MC(8)=>one(8), MC(7)=>one(7), MC(6)=>one(6), MC(5)=>one(5),
      MC(4)=>one(4), MC(3)=>one(3), MC(2)=>one(2), MC(1)=>one(1),
      MC(0)=>one(0), MB(15)=>B(15), MB(14)=>B(14), MB(13)=>B(13),
      MB(12)=>B(12), MB(11)=>B(11), MB(10)=>B(10), MB(9)=>B(9), MB(8)=>B(8),
      MB(7)=>B(7), MB(6)=>B(6), MB(5)=>B(5), MB(4)=>B(4), MB(3)=>B(3),
      MB(2)=>B(2), MB(1)=>B(1), MB(0)=>B(0), MA(15)=>XLXN_116(15),
      MA(14)=>XLXN_116(14), MA(13)=>XLXN_116(13), MA(12)=>XLXN_116(12),
      MA(11)=>XLXN_116(11), MA(10)=>XLXN_116(10), MA(9)=>XLXN_116(9),
      MA(8)=>XLXN_116(8), MA(7)=>XLXN_116(7), MA(6)=>XLXN_116(6),
      MA(5)=>XLXN_116(5), MA(4)=>XLXN_116(4), MA(3)=>XLXN_116(3),
      MA(2)=>XLXN_116(2), MA(1)=>XLXN_116(1), MA(0)=>XLXN_116(0),
      S(1)=>selectB(1), S(0)=>selectB(0), O(15)=>XLXN_64(15),
      O(14)=>XLXN_64(14), O(13)=>XLXN_64(13), O(12)=>XLXN_64(12),
      O(11)=>XLXN_64(11), O(10)=>XLXN_64(10), O(9)=>XLXN_64(9),
      O(8)=>XLXN_64(8), O(7)=>XLXN_64(7), O(6)=>XLXN_64(6), O(5)=>XLXN_64(5),
      O(4)=>XLXN_64(4), O(3)=>XLXN_64(3), O(2)=>XLXN_64(2), O(1)=>XLXN_64(1),
      O(0)=>XLXN_64(0));

   XLXI_25 : negative_detect
      PORT MAP (A_msb=>A(15), B_msb=>B(15), answer(15)=>ALU_out(15),
      answer(14)=>ALU_out(14), answer(13)=>ALU_out(13),
      answer(12)=>ALU_out(12), answer(11)=>ALU_out(11),
      answer(10)=>ALU_out(10), answer(9)=>ALU_out(9), answer(8)=>ALU_out(8),
      answer(7)=>ALU_out(7), answer(6)=>ALU_out(6), answer(5)=>ALU_out(5),
      answer(4)=>ALU_out(4), answer(3)=>ALU_out(3), answer(2)=>ALU_out(2),
      answer(1)=>ALU_out(1), answer(0)=>ALU_out(0), control(3)=>control(3),
      control(2)=>control(2), control(1)=>control(1), control(0)=>control(0),
      S(15)=>S(15), S(14)=>S(14), S(13)=>S(13), S(12)=>S(12), S(11)=>S(11),
      S(10)=>S(10), S(9)=>S(9), S(8)=>S(8), S(7)=>S(7), S(6)=>S(6), S(5)=>S(5),
      S(4)=>S(4), S(3)=>S(3), S(2)=>S(2), S(1)=>S(1), S(0)=>S(0));

   XLXI_24 : of_detect
      PORT MAP (A(15)=>A(15), A(14)=>A(14), A(13)=>A(13), A(12)=>A(12),
      A(11)=>A(11), A(10)=>A(10), A(9)=>A(9), A(8)=>A(8), A(7)=>A(7),
      A(6)=>A(6), A(5)=>A(5), A(4)=>A(4), A(3)=>A(3), A(2)=>A(2), A(1)=>A(1),
      A(0)=>A(0), B(15)=>B(15), B(14)=>B(14), B(13)=>B(13), B(12)=>B(12),
      B(11)=>B(11), B(10)=>B(10), B(9)=>B(9), B(8)=>B(8), B(7)=>B(7),
      B(6)=>B(6), B(5)=>B(5), B(4)=>B(4), B(3)=>B(3), B(2)=>B(2), B(1)=>B(1),
      B(0)=>B(0), result(15)=>ALU_out(15), result(14)=>ALU_out(14),
      result(13)=>ALU_out(13), result(12)=>ALU_out(12),
      result(11)=>ALU_out(11), result(10)=>ALU_out(10), result(9)=>ALU_out(9),
      result(8)=>ALU_out(8), result(7)=>ALU_out(7), result(6)=>ALU_out(6),
      result(5)=>ALU_out(5), result(4)=>ALU_out(4), result(3)=>ALU_out(3),
      result(2)=>ALU_out(2), result(1)=>ALU_out(1), result(0)=>ALU_out(0),
      control(3)=>control(3), control(2)=>control(2), control(1)=>control(1),
      control(0)=>control(0), overflow=>add_overflow);

   XLXI_28 : one_bus
      PORT MAP (one(15)=>one(15), one(14)=>one(14), one(13)=>one(13),
      one(12)=>one(12), one(11)=>one(11), one(10)=>one(10), one(9)=>one(9),
      one(8)=>one(8), one(7)=>one(7), one(6)=>one(6), one(5)=>one(5),
      one(4)=>one(4), one(3)=>one(3), one(2)=>one(2), one(1)=>one(1),
      one(0)=>one(0));

   XLXI_14 : OR2
      PORT MAP (I0=>control(0), I1=>XLXN_101, O=>XLXN_78);

   XLXI_12 : XOR2
      PORT MAP (I0=>control(2), I1=>control(1), O=>selectB(1));

   XLXI_22 : zerobus
      PORT MAP (zero(15)=>zero(15), zero(14)=>zero(14), zero(13)=>zero(13),
      zero(12)=>zero(12), zero(11)=>zero(11), zero(10)=>zero(10),
      zero(9)=>zero(9), zero(8)=>zero(8), zero(7)=>zero(7), zero(6)=>zero(6),
      zero(5)=>zero(5), zero(4)=>zero(4), zero(3)=>zero(3), zero(2)=>zero(2),
      zero(1)=>zero(1), zero(0)=>zero(0));

END SCHEMATIC;



