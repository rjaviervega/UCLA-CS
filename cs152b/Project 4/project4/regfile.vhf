-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\d3_8e.sch - Thu Aug 12 11:37:57 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY D3_8E_MXILINX IS
   PORT ( A0	:	IN	STD_LOGIC; 
          A1	:	IN	STD_LOGIC; 
          A2	:	IN	STD_LOGIC; 
          E	:	IN	STD_LOGIC; 
          D0	:	OUT	STD_LOGIC; 
          D1	:	OUT	STD_LOGIC; 
          D2	:	OUT	STD_LOGIC; 
          D3	:	OUT	STD_LOGIC; 
          D4	:	OUT	STD_LOGIC; 
          D5	:	OUT	STD_LOGIC; 
          D6	:	OUT	STD_LOGIC; 
          D7	:	OUT	STD_LOGIC);

end D3_8E_MXILINX;

ARCHITECTURE SCHEMATIC OF D3_8E_MXILINX IS

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_36_30 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_31 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_32 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_34 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_33 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_35 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_36 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_37 : LABEL IS "true";

BEGIN

   I_36_30 : AND4
      PORT MAP (I0=>A2, I1=>A1, I2=>A0, I3=>E, O=>D7);

   I_36_31 : AND4B1
      PORT MAP (I0=>A0, I1=>A2, I2=>A1, I3=>E, O=>D6);

   I_36_32 : AND4B1
      PORT MAP (I0=>A1, I1=>A2, I2=>A0, I3=>E, O=>D5);

   I_36_34 : AND4B1
      PORT MAP (I0=>A2, I1=>A0, I2=>A1, I3=>E, O=>D3);

   I_36_33 : AND4B2
      PORT MAP (I0=>A1, I1=>A0, I2=>A2, I3=>E, O=>D4);

   I_36_35 : AND4B2
      PORT MAP (I0=>A2, I1=>A0, I2=>A1, I3=>E, O=>D2);

   I_36_36 : AND4B2
      PORT MAP (I0=>A2, I1=>A1, I2=>A0, I3=>E, O=>D1);

   I_36_37 : AND4B3
      PORT MAP (I0=>A2, I1=>A1, I2=>A0, I3=>E, O=>D0);

END SCHEMATIC;



-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\fd16ce.sch - Thu Aug 12 11:37:57 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY FD16CE_MXILINX IS
   PORT ( C	:	IN	STD_LOGIC; 
          CE	:	IN	STD_LOGIC; 
          CLR	:	IN	STD_LOGIC; 
          D	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          Q	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));

end FD16CE_MXILINX;

ARCHITECTURE SCHEMATIC OF FD16CE_MXILINX IS

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE INIT : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_Q0 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q0 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q5 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q5 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q1 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q1 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q2 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q2 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q3 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q3 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q4 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q4 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q6 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q6 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q7 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q7 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q8 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q8 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q9 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q9 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q10 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q10 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q11 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q11 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q12 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q12 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q13 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q13 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q14 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q14 : LABEL IS "0";
   ATTRIBUTE fpga_dont_touch OF I_Q15 : LABEL IS "true";
   ATTRIBUTE INIT OF I_Q15 : LABEL IS "0";

BEGIN

   I_Q0 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(0), Q=>Q(0));

   I_Q5 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(5), Q=>Q(5));

   I_Q1 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(1), Q=>Q(1));

   I_Q2 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(2), Q=>Q(2));

   I_Q3 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(3), Q=>Q(3));

   I_Q4 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(4), Q=>Q(4));

   I_Q6 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(6), Q=>Q(6));

   I_Q7 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(7), Q=>Q(7));

   I_Q8 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(8), Q=>Q(8));

   I_Q9 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(9), Q=>Q(9));

   I_Q10 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(10), Q=>Q(10));

   I_Q11 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(11), Q=>Q(11));

   I_Q12 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(12), Q=>Q(12));

   I_Q13 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(13), Q=>Q(13));

   I_Q14 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(14), Q=>Q(14));

   I_Q15 : FDCE
   -- synopsys translate_off
   GENERIC MAP (       INIT => '0'   )
   -- synopsys translate_on
      PORT MAP (C=>C, CE=>CE, CLR=>CLR, D=>D(15), Q=>Q(15));

END SCHEMATIC;



-- Vhdl model created from schematic regfile.sch - Thu Aug 12 11:37:57 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY regfile IS
   PORT ( BusW	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          Clock	:	IN	STD_LOGIC; 
          Ra	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          Rb	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          Rw	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          WrEn	:	IN	STD_LOGIC; 
          BusA	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          BusB	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));

end regfile;

ARCHITECTURE SCHEMATIC OF regfile IS
   SIGNAL Clear	:	STD_LOGIC;
   SIGNAL Reg0	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Reg1	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Reg2	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Reg3	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Reg4	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Reg5	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Reg6	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Reg7	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Wr1	:	STD_LOGIC;
   SIGNAL Wr2	:	STD_LOGIC;
   SIGNAL Wr3	:	STD_LOGIC;
   SIGNAL Wr4	:	STD_LOGIC;
   SIGNAL Wr5	:	STD_LOGIC;
   SIGNAL Wr6	:	STD_LOGIC;
   SIGNAL Wr7	:	STD_LOGIC;
   SIGNAL WrEn1	:	STD_LOGIC;
   SIGNAL WrEn2	:	STD_LOGIC;
   SIGNAL WrEn3	:	STD_LOGIC;
   SIGNAL WrEn4	:	STD_LOGIC;
   SIGNAL WrEn5	:	STD_LOGIC;
   SIGNAL WrEn6	:	STD_LOGIC;
   SIGNAL WrEn7	:	STD_LOGIC;

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF XLXI_86 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_85 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_84 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_83 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_82 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_81 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_74 : LABEL IS "true";
   ATTRIBUTE KEEP_HIERARCHY : STRING ;
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_7 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_67 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_70 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_68 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_66 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_72 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_71 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_69 : LABEL IS "TRUE";
   ATTRIBUTE fpga_dont_touch OF XLXI_73 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_63 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_62 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_61 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_60 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_59 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_58 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_57 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_56 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_55 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_54 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_53 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_52 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_51 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_50 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_49 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_48 : LABEL IS "true";

   COMPONENT buxmux16
      PORT ( MH	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MG	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MF	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             ME	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MD	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MC	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MB	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MA	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             S	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0); 
             O	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT D3_8E_MXILINX
      PORT ( A0	:	IN	STD_LOGIC; 
             A1	:	IN	STD_LOGIC; 
             A2	:	IN	STD_LOGIC; 
             E	:	IN	STD_LOGIC; 
             D0	:	OUT	STD_LOGIC; 
             D1	:	OUT	STD_LOGIC; 
             D2	:	OUT	STD_LOGIC; 
             D3	:	OUT	STD_LOGIC; 
             D4	:	OUT	STD_LOGIC; 
             D5	:	OUT	STD_LOGIC; 
             D6	:	OUT	STD_LOGIC; 
             D7	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT FD16CE_MXILINX
      PORT ( C	:	IN	STD_LOGIC; 
             CE	:	IN	STD_LOGIC; 
             CLR	:	IN	STD_LOGIC; 
             D	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             Q	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

BEGIN

   XLXI_86 : AND2
      PORT MAP (I0=>Wr1, I1=>WrEn, O=>WrEn1);

   XLXI_85 : AND2
      PORT MAP (I0=>Wr7, I1=>WrEn, O=>WrEn7);

   XLXI_84 : AND2
      PORT MAP (I0=>Wr6, I1=>WrEn, O=>WrEn6);

   XLXI_83 : AND2
      PORT MAP (I0=>Wr5, I1=>WrEn, O=>WrEn5);

   XLXI_82 : AND2
      PORT MAP (I0=>Wr4, I1=>WrEn, O=>WrEn4);

   XLXI_81 : AND2
      PORT MAP (I0=>Wr3, I1=>WrEn, O=>WrEn3);

   XLXI_74 : AND2
      PORT MAP (I0=>Wr2, I1=>WrEn, O=>WrEn2);

   BusAMux : buxmux16
      PORT MAP (MH(15)=>Reg7(15), MH(14)=>Reg7(14), MH(13)=>Reg7(13),
      MH(12)=>Reg7(12), MH(11)=>Reg7(11), MH(10)=>Reg7(10), MH(9)=>Reg7(9),
      MH(8)=>Reg7(8), MH(7)=>Reg7(7), MH(6)=>Reg7(6), MH(5)=>Reg7(5),
      MH(4)=>Reg7(4), MH(3)=>Reg7(3), MH(2)=>Reg7(2), MH(1)=>Reg7(1),
      MH(0)=>Reg7(0), MG(15)=>Reg6(15), MG(14)=>Reg6(14), MG(13)=>Reg6(13),
      MG(12)=>Reg6(12), MG(11)=>Reg6(11), MG(10)=>Reg6(10), MG(9)=>Reg6(9),
      MG(8)=>Reg6(8), MG(7)=>Reg6(7), MG(6)=>Reg6(6), MG(5)=>Reg6(5),
      MG(4)=>Reg6(4), MG(3)=>Reg6(3), MG(2)=>Reg6(2), MG(1)=>Reg6(1),
      MG(0)=>Reg6(0), MF(15)=>Reg5(15), MF(14)=>Reg5(14), MF(13)=>Reg5(13),
      MF(12)=>Reg5(12), MF(11)=>Reg5(11), MF(10)=>Reg5(10), MF(9)=>Reg5(9),
      MF(8)=>Reg5(8), MF(7)=>Reg5(7), MF(6)=>Reg5(6), MF(5)=>Reg5(5),
      MF(4)=>Reg5(4), MF(3)=>Reg5(3), MF(2)=>Reg5(2), MF(1)=>Reg5(1),
      MF(0)=>Reg5(0), ME(15)=>Reg4(15), ME(14)=>Reg4(14), ME(13)=>Reg4(13),
      ME(12)=>Reg4(12), ME(11)=>Reg4(11), ME(10)=>Reg4(10), ME(9)=>Reg4(9),
      ME(8)=>Reg4(8), ME(7)=>Reg4(7), ME(6)=>Reg4(6), ME(5)=>Reg4(5),
      ME(4)=>Reg4(4), ME(3)=>Reg4(3), ME(2)=>Reg4(2), ME(1)=>Reg4(1),
      ME(0)=>Reg4(0), MD(15)=>Reg3(15), MD(14)=>Reg3(14), MD(13)=>Reg3(13),
      MD(12)=>Reg3(12), MD(11)=>Reg3(11), MD(10)=>Reg3(10), MD(9)=>Reg3(9),
      MD(8)=>Reg3(8), MD(7)=>Reg3(7), MD(6)=>Reg3(6), MD(5)=>Reg3(5),
      MD(4)=>Reg3(4), MD(3)=>Reg3(3), MD(2)=>Reg3(2), MD(1)=>Reg3(1),
      MD(0)=>Reg3(0), MC(15)=>Reg2(15), MC(14)=>Reg2(14), MC(13)=>Reg2(13),
      MC(12)=>Reg2(12), MC(11)=>Reg2(11), MC(10)=>Reg2(10), MC(9)=>Reg2(9),
      MC(8)=>Reg2(8), MC(7)=>Reg2(7), MC(6)=>Reg2(6), MC(5)=>Reg2(5),
      MC(4)=>Reg2(4), MC(3)=>Reg2(3), MC(2)=>Reg2(2), MC(1)=>Reg2(1),
      MC(0)=>Reg2(0), MB(15)=>Reg1(15), MB(14)=>Reg1(14), MB(13)=>Reg1(13),
      MB(12)=>Reg1(12), MB(11)=>Reg1(11), MB(10)=>Reg1(10), MB(9)=>Reg1(9),
      MB(8)=>Reg1(8), MB(7)=>Reg1(7), MB(6)=>Reg1(6), MB(5)=>Reg1(5),
      MB(4)=>Reg1(4), MB(3)=>Reg1(3), MB(2)=>Reg1(2), MB(1)=>Reg1(1),
      MB(0)=>Reg1(0), MA(15)=>Reg0(15), MA(14)=>Reg0(14), MA(13)=>Reg0(13),
      MA(12)=>Reg0(12), MA(11)=>Reg0(11), MA(10)=>Reg0(10), MA(9)=>Reg0(9),
      MA(8)=>Reg0(8), MA(7)=>Reg0(7), MA(6)=>Reg0(6), MA(5)=>Reg0(5),
      MA(4)=>Reg0(4), MA(3)=>Reg0(3), MA(2)=>Reg0(2), MA(1)=>Reg0(1),
      MA(0)=>Reg0(0), S(2)=>Ra(2), S(1)=>Ra(1), S(0)=>Ra(0), O(15)=>BusA(15),
      O(14)=>BusA(14), O(13)=>BusA(13), O(12)=>BusA(12), O(11)=>BusA(11),
      O(10)=>BusA(10), O(9)=>BusA(9), O(8)=>BusA(8), O(7)=>BusA(7),
      O(6)=>BusA(6), O(5)=>BusA(5), O(4)=>BusA(4), O(3)=>BusA(3),
      O(2)=>BusA(2), O(1)=>BusA(1), O(0)=>BusA(0));

   BusBMux : buxmux16
      PORT MAP (MH(15)=>Reg7(15), MH(14)=>Reg7(14), MH(13)=>Reg7(13),
      MH(12)=>Reg7(12), MH(11)=>Reg7(11), MH(10)=>Reg7(10), MH(9)=>Reg7(9),
      MH(8)=>Reg7(8), MH(7)=>Reg7(7), MH(6)=>Reg7(6), MH(5)=>Reg7(5),
      MH(4)=>Reg7(4), MH(3)=>Reg7(3), MH(2)=>Reg7(2), MH(1)=>Reg7(1),
      MH(0)=>Reg7(0), MG(15)=>Reg6(15), MG(14)=>Reg6(14), MG(13)=>Reg6(13),
      MG(12)=>Reg6(12), MG(11)=>Reg6(11), MG(10)=>Reg6(10), MG(9)=>Reg6(9),
      MG(8)=>Reg6(8), MG(7)=>Reg6(7), MG(6)=>Reg6(6), MG(5)=>Reg6(5),
      MG(4)=>Reg6(4), MG(3)=>Reg6(3), MG(2)=>Reg6(2), MG(1)=>Reg6(1),
      MG(0)=>Reg6(0), MF(15)=>Reg5(15), MF(14)=>Reg5(14), MF(13)=>Reg5(13),
      MF(12)=>Reg5(12), MF(11)=>Reg5(11), MF(10)=>Reg5(10), MF(9)=>Reg5(9),
      MF(8)=>Reg5(8), MF(7)=>Reg5(7), MF(6)=>Reg5(6), MF(5)=>Reg5(5),
      MF(4)=>Reg5(4), MF(3)=>Reg5(3), MF(2)=>Reg5(2), MF(1)=>Reg5(1),
      MF(0)=>Reg5(0), ME(15)=>Reg4(15), ME(14)=>Reg4(14), ME(13)=>Reg4(13),
      ME(12)=>Reg4(12), ME(11)=>Reg4(11), ME(10)=>Reg4(10), ME(9)=>Reg4(9),
      ME(8)=>Reg4(8), ME(7)=>Reg4(7), ME(6)=>Reg4(6), ME(5)=>Reg4(5),
      ME(4)=>Reg4(4), ME(3)=>Reg4(3), ME(2)=>Reg4(2), ME(1)=>Reg4(1),
      ME(0)=>Reg4(0), MD(15)=>Reg3(15), MD(14)=>Reg3(14), MD(13)=>Reg3(13),
      MD(12)=>Reg3(12), MD(11)=>Reg3(11), MD(10)=>Reg3(10), MD(9)=>Reg3(9),
      MD(8)=>Reg3(8), MD(7)=>Reg3(7), MD(6)=>Reg3(6), MD(5)=>Reg3(5),
      MD(4)=>Reg3(4), MD(3)=>Reg3(3), MD(2)=>Reg3(2), MD(1)=>Reg3(1),
      MD(0)=>Reg3(0), MC(15)=>Reg2(15), MC(14)=>Reg2(14), MC(13)=>Reg2(13),
      MC(12)=>Reg2(12), MC(11)=>Reg2(11), MC(10)=>Reg2(10), MC(9)=>Reg2(9),
      MC(8)=>Reg2(8), MC(7)=>Reg2(7), MC(6)=>Reg2(6), MC(5)=>Reg2(5),
      MC(4)=>Reg2(4), MC(3)=>Reg2(3), MC(2)=>Reg2(2), MC(1)=>Reg2(1),
      MC(0)=>Reg2(0), MB(15)=>Reg1(15), MB(14)=>Reg1(14), MB(13)=>Reg1(13),
      MB(12)=>Reg1(12), MB(11)=>Reg1(11), MB(10)=>Reg1(10), MB(9)=>Reg1(9),
      MB(8)=>Reg1(8), MB(7)=>Reg1(7), MB(6)=>Reg1(6), MB(5)=>Reg1(5),
      MB(4)=>Reg1(4), MB(3)=>Reg1(3), MB(2)=>Reg1(2), MB(1)=>Reg1(1),
      MB(0)=>Reg1(0), MA(15)=>Reg0(15), MA(14)=>Reg0(14), MA(13)=>Reg0(13),
      MA(12)=>Reg0(12), MA(11)=>Reg0(11), MA(10)=>Reg0(10), MA(9)=>Reg0(9),
      MA(8)=>Reg0(8), MA(7)=>Reg0(7), MA(6)=>Reg0(6), MA(5)=>Reg0(5),
      MA(4)=>Reg0(4), MA(3)=>Reg0(3), MA(2)=>Reg0(2), MA(1)=>Reg0(1),
      MA(0)=>Reg0(0), S(2)=>Rb(2), S(1)=>Rb(1), S(0)=>Rb(0), O(15)=>BusB(15),
      O(14)=>BusB(14), O(13)=>BusB(13), O(12)=>BusB(12), O(11)=>BusB(11),
      O(10)=>BusB(10), O(9)=>BusB(9), O(8)=>BusB(8), O(7)=>BusB(7),
      O(6)=>BusB(6), O(5)=>BusB(5), O(4)=>BusB(4), O(3)=>BusB(3),
      O(2)=>BusB(2), O(1)=>BusB(1), O(0)=>BusB(0));

   XLXI_7 : D3_8E_MXILINX
      PORT MAP (A0=>Rw(0), A1=>Rw(1), A2=>Rw(2), E=>WrEn, D0=>open, D1=>Wr1,
      D2=>Wr2, D3=>Wr3, D4=>Wr4, D5=>Wr5, D6=>Wr6, D7=>Wr7);

   XLXI_67 : FD16CE_MXILINX
      PORT MAP (C=>Clock, CE=>WrEn7, CLR=>Clear, D(15)=>BusW(15),
      D(14)=>BusW(14), D(13)=>BusW(13), D(12)=>BusW(12), D(11)=>BusW(11),
      D(10)=>BusW(10), D(9)=>BusW(9), D(8)=>BusW(8), D(7)=>BusW(7),
      D(6)=>BusW(6), D(5)=>BusW(5), D(4)=>BusW(4), D(3)=>BusW(3),
      D(2)=>BusW(2), D(1)=>BusW(1), D(0)=>BusW(0), Q(15)=>Reg7(15),
      Q(14)=>Reg7(14), Q(13)=>Reg7(13), Q(12)=>Reg7(12), Q(11)=>Reg7(11),
      Q(10)=>Reg7(10), Q(9)=>Reg7(9), Q(8)=>Reg7(8), Q(7)=>Reg7(7),
      Q(6)=>Reg7(6), Q(5)=>Reg7(5), Q(4)=>Reg7(4), Q(3)=>Reg7(3),
      Q(2)=>Reg7(2), Q(1)=>Reg7(1), Q(0)=>Reg7(0));

   XLXI_70 : FD16CE_MXILINX
      PORT MAP (C=>Clock, CE=>WrEn1, CLR=>Clear, D(15)=>BusW(15),
      D(14)=>BusW(14), D(13)=>BusW(13), D(12)=>BusW(12), D(11)=>BusW(11),
      D(10)=>BusW(10), D(9)=>BusW(9), D(8)=>BusW(8), D(7)=>BusW(7),
      D(6)=>BusW(6), D(5)=>BusW(5), D(4)=>BusW(4), D(3)=>BusW(3),
      D(2)=>BusW(2), D(1)=>BusW(1), D(0)=>BusW(0), Q(15)=>Reg1(15),
      Q(14)=>Reg1(14), Q(13)=>Reg1(13), Q(12)=>Reg1(12), Q(11)=>Reg1(11),
      Q(10)=>Reg1(10), Q(9)=>Reg1(9), Q(8)=>Reg1(8), Q(7)=>Reg1(7),
      Q(6)=>Reg1(6), Q(5)=>Reg1(5), Q(4)=>Reg1(4), Q(3)=>Reg1(3),
      Q(2)=>Reg1(2), Q(1)=>Reg1(1), Q(0)=>Reg1(0));

   XLXI_68 : FD16CE_MXILINX
      PORT MAP (C=>Clock, CE=>WrEn2, CLR=>Clear, D(15)=>BusW(15),
      D(14)=>BusW(14), D(13)=>BusW(13), D(12)=>BusW(12), D(11)=>BusW(11),
      D(10)=>BusW(10), D(9)=>BusW(9), D(8)=>BusW(8), D(7)=>BusW(7),
      D(6)=>BusW(6), D(5)=>BusW(5), D(4)=>BusW(4), D(3)=>BusW(3),
      D(2)=>BusW(2), D(1)=>BusW(1), D(0)=>BusW(0), Q(15)=>Reg2(15),
      Q(14)=>Reg2(14), Q(13)=>Reg2(13), Q(12)=>Reg2(12), Q(11)=>Reg2(11),
      Q(10)=>Reg2(10), Q(9)=>Reg2(9), Q(8)=>Reg2(8), Q(7)=>Reg2(7),
      Q(6)=>Reg2(6), Q(5)=>Reg2(5), Q(4)=>Reg2(4), Q(3)=>Reg2(3),
      Q(2)=>Reg2(2), Q(1)=>Reg2(1), Q(0)=>Reg2(0));

   XLXI_66 : FD16CE_MXILINX
      PORT MAP (C=>Clock, CE=>WrEn3, CLR=>Clear, D(15)=>BusW(15),
      D(14)=>BusW(14), D(13)=>BusW(13), D(12)=>BusW(12), D(11)=>BusW(11),
      D(10)=>BusW(10), D(9)=>BusW(9), D(8)=>BusW(8), D(7)=>BusW(7),
      D(6)=>BusW(6), D(5)=>BusW(5), D(4)=>BusW(4), D(3)=>BusW(3),
      D(2)=>BusW(2), D(1)=>BusW(1), D(0)=>BusW(0), Q(15)=>Reg3(15),
      Q(14)=>Reg3(14), Q(13)=>Reg3(13), Q(12)=>Reg3(12), Q(11)=>Reg3(11),
      Q(10)=>Reg3(10), Q(9)=>Reg3(9), Q(8)=>Reg3(8), Q(7)=>Reg3(7),
      Q(6)=>Reg3(6), Q(5)=>Reg3(5), Q(4)=>Reg3(4), Q(3)=>Reg3(3),
      Q(2)=>Reg3(2), Q(1)=>Reg3(1), Q(0)=>Reg3(0));

   XLXI_72 : FD16CE_MXILINX
      PORT MAP (C=>Clock, CE=>WrEn4, CLR=>Clear, D(15)=>BusW(15),
      D(14)=>BusW(14), D(13)=>BusW(13), D(12)=>BusW(12), D(11)=>BusW(11),
      D(10)=>BusW(10), D(9)=>BusW(9), D(8)=>BusW(8), D(7)=>BusW(7),
      D(6)=>BusW(6), D(5)=>BusW(5), D(4)=>BusW(4), D(3)=>BusW(3),
      D(2)=>BusW(2), D(1)=>BusW(1), D(0)=>BusW(0), Q(15)=>Reg4(15),
      Q(14)=>Reg4(14), Q(13)=>Reg4(13), Q(12)=>Reg4(12), Q(11)=>Reg4(11),
      Q(10)=>Reg4(10), Q(9)=>Reg4(9), Q(8)=>Reg4(8), Q(7)=>Reg4(7),
      Q(6)=>Reg4(6), Q(5)=>Reg4(5), Q(4)=>Reg4(4), Q(3)=>Reg4(3),
      Q(2)=>Reg4(2), Q(1)=>Reg4(1), Q(0)=>Reg4(0));

   XLXI_71 : FD16CE_MXILINX
      PORT MAP (C=>Clock, CE=>WrEn5, CLR=>Clear, D(15)=>BusW(15),
      D(14)=>BusW(14), D(13)=>BusW(13), D(12)=>BusW(12), D(11)=>BusW(11),
      D(10)=>BusW(10), D(9)=>BusW(9), D(8)=>BusW(8), D(7)=>BusW(7),
      D(6)=>BusW(6), D(5)=>BusW(5), D(4)=>BusW(4), D(3)=>BusW(3),
      D(2)=>BusW(2), D(1)=>BusW(1), D(0)=>BusW(0), Q(15)=>Reg5(15),
      Q(14)=>Reg5(14), Q(13)=>Reg5(13), Q(12)=>Reg5(12), Q(11)=>Reg5(11),
      Q(10)=>Reg5(10), Q(9)=>Reg5(9), Q(8)=>Reg5(8), Q(7)=>Reg5(7),
      Q(6)=>Reg5(6), Q(5)=>Reg5(5), Q(4)=>Reg5(4), Q(3)=>Reg5(3),
      Q(2)=>Reg5(2), Q(1)=>Reg5(1), Q(0)=>Reg5(0));

   XLXI_69 : FD16CE_MXILINX
      PORT MAP (C=>Clock, CE=>WrEn6, CLR=>Clear, D(15)=>BusW(15),
      D(14)=>BusW(14), D(13)=>BusW(13), D(12)=>BusW(12), D(11)=>BusW(11),
      D(10)=>BusW(10), D(9)=>BusW(9), D(8)=>BusW(8), D(7)=>BusW(7),
      D(6)=>BusW(6), D(5)=>BusW(5), D(4)=>BusW(4), D(3)=>BusW(3),
      D(2)=>BusW(2), D(1)=>BusW(1), D(0)=>BusW(0), Q(15)=>Reg6(15),
      Q(14)=>Reg6(14), Q(13)=>Reg6(13), Q(12)=>Reg6(12), Q(11)=>Reg6(11),
      Q(10)=>Reg6(10), Q(9)=>Reg6(9), Q(8)=>Reg6(8), Q(7)=>Reg6(7),
      Q(6)=>Reg6(6), Q(5)=>Reg6(5), Q(4)=>Reg6(4), Q(3)=>Reg6(3),
      Q(2)=>Reg6(2), Q(1)=>Reg6(1), Q(0)=>Reg6(0));

   XLXI_73 : GND
      PORT MAP (G=>Clear);

   XLXI_63 : GND
      PORT MAP (G=>Reg0(15));

   XLXI_62 : GND
      PORT MAP (G=>Reg0(14));

   XLXI_61 : GND
      PORT MAP (G=>Reg0(13));

   XLXI_60 : GND
      PORT MAP (G=>Reg0(12));

   XLXI_59 : GND
      PORT MAP (G=>Reg0(11));

   XLXI_58 : GND
      PORT MAP (G=>Reg0(10));

   XLXI_57 : GND
      PORT MAP (G=>Reg0(9));

   XLXI_56 : GND
      PORT MAP (G=>Reg0(8));

   XLXI_55 : GND
      PORT MAP (G=>Reg0(7));

   XLXI_54 : GND
      PORT MAP (G=>Reg0(6));

   XLXI_53 : GND
      PORT MAP (G=>Reg0(5));

   XLXI_52 : GND
      PORT MAP (G=>Reg0(4));

   XLXI_51 : GND
      PORT MAP (G=>Reg0(3));

   XLXI_50 : GND
      PORT MAP (G=>Reg0(2));

   XLXI_49 : GND
      PORT MAP (G=>Reg0(1));

   XLXI_48 : GND
      PORT MAP (G=>Reg0(0));

END SCHEMATIC;



