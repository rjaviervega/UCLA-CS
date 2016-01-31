-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\obuf16.sch - Sat Jul 24 14:12:54 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY OBUF16_MXILINX IS
   PORT ( I	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          O	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));

end OBUF16_MXILINX;

ARCHITECTURE SCHEMATIC OF OBUF16_MXILINX IS

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_36_45 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_44 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_43 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_42 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_41 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_40 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_39 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_38 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_37 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_36 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_35 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_34 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_33 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_32 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_31 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_30 : LABEL IS "true";

BEGIN

   I_36_45 : OBUF
      PORT MAP (I=>I(5), O=>O(5));

   I_36_44 : OBUF
      PORT MAP (I=>I(4), O=>O(4));

   I_36_43 : OBUF
      PORT MAP (I=>I(3), O=>O(3));

   I_36_42 : OBUF
      PORT MAP (I=>I(2), O=>O(2));

   I_36_41 : OBUF
      PORT MAP (I=>I(1), O=>O(1));

   I_36_40 : OBUF
      PORT MAP (I=>I(0), O=>O(0));

   I_36_39 : OBUF
      PORT MAP (I=>I(7), O=>O(7));

   I_36_38 : OBUF
      PORT MAP (I=>I(6), O=>O(6));

   I_36_37 : OBUF
      PORT MAP (I=>I(12), O=>O(12));

   I_36_36 : OBUF
      PORT MAP (I=>I(13), O=>O(13));

   I_36_35 : OBUF
      PORT MAP (I=>I(14), O=>O(14));

   I_36_34 : OBUF
      PORT MAP (I=>I(15), O=>O(15));

   I_36_33 : OBUF
      PORT MAP (I=>I(11), O=>O(11));

   I_36_32 : OBUF
      PORT MAP (I=>I(10), O=>O(10));

   I_36_31 : OBUF
      PORT MAP (I=>I(9), O=>O(9));

   I_36_30 : OBUF
      PORT MAP (I=>I(8), O=>O(8));

END SCHEMATIC;



-- Vhdl model created from schematic test.sch - Sat Jul 24 14:12:54 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY test IS
   PORT ( clk	:	IN	STD_LOGIC; 
          ppdata	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          reset	:	IN	STD_LOGIC; 
          finish	:	OUT	STD_LOGIC; 
          laddr	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          laddr16	:	OUT	STD_LOGIC; 
          laddr17	:	OUT	STD_LOGIC; 
          laddr18	:	OUT	STD_LOGIC; 
          lcen	:	OUT	STD_LOGIC; 
          loen	:	OUT	STD_LOGIC; 
          lwen	:	OUT	STD_LOGIC; 
          ppstatus	:	OUT	STD_LOGIC_VECTOR (6 DOWNTO 3); 
          state1	:	OUT	STD_LOGIC; 
          state2	:	OUT	STD_LOGIC; 
          state3	:	OUT	STD_LOGIC; 
          state4	:	OUT	STD_LOGIC; 
          ldata	:	INOUT	STD_LOGIC_VECTOR (15 DOWNTO 0));

end test;

ARCHITECTURE SCHEMATIC OF test IS
   SIGNAL XLXN_52	:	STD_LOGIC;
   SIGNAL XLXN_53	:	STD_LOGIC;
   SIGNAL XLXN_54	:	STD_LOGIC;
   SIGNAL XLXN_6	:	STD_LOGIC_VECTOR (17 DOWNTO 0);
   SIGNAL XLXN_60	:	STD_LOGIC;
   SIGNAL XLXN_61	:	STD_LOGIC;
   SIGNAL XLXN_62	:	STD_LOGIC;
   SIGNAL XLXN_63	:	STD_LOGIC;
   SIGNAL XLXN_70	:	STD_LOGIC;
   SIGNAL XLXN_72	:	STD_LOGIC;
   SIGNAL XLXN_74	:	STD_LOGIC;
   SIGNAL XLXN_75	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL XLXN_8	:	STD_LOGIC_VECTOR (17 DOWNTO 0);
   SIGNAL XLXN_9	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL damnclk	:	STD_LOGIC;
   SIGNAL dum	:	STD_LOGIC_VECTOR (18 DOWNTO 0);
   SIGNAL fin	:	STD_LOGIC;
   SIGNAL st1	:	STD_LOGIC;
   SIGNAL st2	:	STD_LOGIC;
   SIGNAL st3	:	STD_LOGIC;
   SIGNAL st4	:	STD_LOGIC;

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF XLXI_30 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_3 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_4 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_35 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_34 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_33 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_32 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_25 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_24 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_23 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_20 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_19 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_18 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_17 : LABEL IS "true";
   ATTRIBUTE KEEP_HIERARCHY : STRING ;
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_22 : LABEL IS "TRUE";

   COMPONENT memorymodule
      PORT ( MemRd	:	IN	STD_LOGIC; 
             MemWr	:	IN	STD_LOGIC; 
             ResetL	:	IN	STD_LOGIC; 
             clk	:	IN	STD_LOGIC; 
             RdAddr	:	IN	STD_LOGIC_VECTOR (17 DOWNTO 0); 
             WrAddr	:	IN	STD_LOGIC_VECTOR (17 DOWNTO 0); 
             Din	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             ppdata	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
             RdDone	:	OUT	STD_LOGIC; 
             WrDone	:	OUT	STD_LOGIC; 
             lcen	:	OUT	STD_LOGIC; 
             loen	:	OUT	STD_LOGIC; 
             lwen	:	OUT	STD_LOGIC; 
             Dout	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             ppstatus	:	OUT	STD_LOGIC_VECTOR (6 DOWNTO 3); 
             laddr	:	OUT	STD_LOGIC_VECTOR (18 DOWNTO 0); 
             ldata	:	INOUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT OBUF16_MXILINX
      PORT ( I	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             O	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT simtest
      PORT ( WrDone	:	IN	STD_LOGIC; 
             CLK	:	IN	STD_LOGIC; 
             Reset	:	IN	STD_LOGIC; 
             RdDone	:	IN	STD_LOGIC; 
             Dout	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MemRd	:	OUT	STD_LOGIC; 
             MemWr	:	OUT	STD_LOGIC; 
             ResetL	:	OUT	STD_LOGIC; 
             finish	:	OUT	STD_LOGIC; 
             state1	:	OUT	STD_LOGIC; 
             state2	:	OUT	STD_LOGIC; 
             state3	:	OUT	STD_LOGIC; 
             state4	:	OUT	STD_LOGIC; 
             RdAddr	:	OUT	STD_LOGIC_VECTOR (17 DOWNTO 0); 
             WrAddr	:	OUT	STD_LOGIC_VECTOR (17 DOWNTO 0); 
             Din	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

BEGIN

   XLXI_30 : BUFG
      PORT MAP (I=>XLXN_70, O=>damnclk);

   XLXI_3 : IBUF
      PORT MAP (I=>clk, O=>XLXN_70);

   XLXI_4 : IBUF
      PORT MAP (I=>reset, O=>XLXN_72);

   XLXI_1 : memorymodule
      PORT MAP (MemRd=>XLXN_62, MemWr=>XLXN_61, ResetL=>XLXN_60, clk=>damnclk,
      RdAddr(17)=>XLXN_6(17), RdAddr(16)=>XLXN_6(16), RdAddr(15)=>XLXN_6(15),
      RdAddr(14)=>XLXN_6(14), RdAddr(13)=>XLXN_6(13), RdAddr(12)=>XLXN_6(12),
      RdAddr(11)=>XLXN_6(11), RdAddr(10)=>XLXN_6(10), RdAddr(9)=>XLXN_6(9),
      RdAddr(8)=>XLXN_6(8), RdAddr(7)=>XLXN_6(7), RdAddr(6)=>XLXN_6(6),
      RdAddr(5)=>XLXN_6(5), RdAddr(4)=>XLXN_6(4), RdAddr(3)=>XLXN_6(3),
      RdAddr(2)=>XLXN_6(2), RdAddr(1)=>XLXN_6(1), RdAddr(0)=>XLXN_6(0),
      WrAddr(17)=>XLXN_8(17), WrAddr(16)=>XLXN_8(16), WrAddr(15)=>XLXN_8(15),
      WrAddr(14)=>XLXN_8(14), WrAddr(13)=>XLXN_8(13), WrAddr(12)=>XLXN_8(12),
      WrAddr(11)=>XLXN_8(11), WrAddr(10)=>XLXN_8(10), WrAddr(9)=>XLXN_8(9),
      WrAddr(8)=>XLXN_8(8), WrAddr(7)=>XLXN_8(7), WrAddr(6)=>XLXN_8(6),
      WrAddr(5)=>XLXN_8(5), WrAddr(4)=>XLXN_8(4), WrAddr(3)=>XLXN_8(3),
      WrAddr(2)=>XLXN_8(2), WrAddr(1)=>XLXN_8(1), WrAddr(0)=>XLXN_8(0),
      Din(15)=>XLXN_9(15), Din(14)=>XLXN_9(14), Din(13)=>XLXN_9(13),
      Din(12)=>XLXN_9(12), Din(11)=>XLXN_9(11), Din(10)=>XLXN_9(10),
      Din(9)=>XLXN_9(9), Din(8)=>XLXN_9(8), Din(7)=>XLXN_9(7),
      Din(6)=>XLXN_9(6), Din(5)=>XLXN_9(5), Din(4)=>XLXN_9(4),
      Din(3)=>XLXN_9(3), Din(2)=>XLXN_9(2), Din(1)=>XLXN_9(1),
      Din(0)=>XLXN_9(0), ppdata(7)=>ppdata(7), ppdata(6)=>ppdata(6),
      ppdata(5)=>ppdata(5), ppdata(4)=>ppdata(4), ppdata(3)=>ppdata(3),
      ppdata(2)=>ppdata(2), ppdata(1)=>ppdata(1), ppdata(0)=>ppdata(0),
      RdDone=>XLXN_74, WrDone=>XLXN_63, lcen=>XLXN_52, loen=>XLXN_53,
      lwen=>XLXN_54, Dout(15)=>XLXN_75(15), Dout(14)=>XLXN_75(14),
      Dout(13)=>XLXN_75(13), Dout(12)=>XLXN_75(12), Dout(11)=>XLXN_75(11),
      Dout(10)=>XLXN_75(10), Dout(9)=>XLXN_75(9), Dout(8)=>XLXN_75(8),
      Dout(7)=>XLXN_75(7), Dout(6)=>XLXN_75(6), Dout(5)=>XLXN_75(5),
      Dout(4)=>XLXN_75(4), Dout(3)=>XLXN_75(3), Dout(2)=>XLXN_75(2),
      Dout(1)=>XLXN_75(1), Dout(0)=>XLXN_75(0), ppstatus(6)=>ppstatus(6),
      ppstatus(5)=>ppstatus(5), ppstatus(4)=>ppstatus(4),
      ppstatus(3)=>ppstatus(3), laddr(18)=>dum(18), laddr(17)=>dum(17),
      laddr(16)=>dum(16), laddr(15)=>dum(15), laddr(14)=>dum(14),
      laddr(13)=>dum(13), laddr(12)=>dum(12), laddr(11)=>dum(11),
      laddr(10)=>dum(10), laddr(9)=>dum(9), laddr(8)=>dum(8), laddr(7)=>dum(7),
      laddr(6)=>dum(6), laddr(5)=>dum(5), laddr(4)=>dum(4), laddr(3)=>dum(3),
      laddr(2)=>dum(2), laddr(1)=>dum(1), laddr(0)=>dum(0),
      ldata(15)=>ldata(15), ldata(14)=>ldata(14), ldata(13)=>ldata(13),
      ldata(12)=>ldata(12), ldata(11)=>ldata(11), ldata(10)=>ldata(10),
      ldata(9)=>ldata(9), ldata(8)=>ldata(8), ldata(7)=>ldata(7),
      ldata(6)=>ldata(6), ldata(5)=>ldata(5), ldata(4)=>ldata(4),
      ldata(3)=>ldata(3), ldata(2)=>ldata(2), ldata(1)=>ldata(1),
      ldata(0)=>ldata(0));

   XLXI_35 : OBUF
      PORT MAP (I=>st4, O=>state4);

   XLXI_34 : OBUF
      PORT MAP (I=>st3, O=>state3);

   XLXI_33 : OBUF
      PORT MAP (I=>st2, O=>state2);

   XLXI_32 : OBUF
      PORT MAP (I=>st1, O=>state1);

   XLXI_25 : OBUF
      PORT MAP (I=>dum(18), O=>laddr18);

   XLXI_24 : OBUF
      PORT MAP (I=>dum(17), O=>laddr17);

   XLXI_23 : OBUF
      PORT MAP (I=>dum(16), O=>laddr16);

   XLXI_20 : OBUF
      PORT MAP (I=>XLXN_54, O=>lwen);

   XLXI_19 : OBUF
      PORT MAP (I=>XLXN_53, O=>loen);

   XLXI_18 : OBUF
      PORT MAP (I=>XLXN_52, O=>lcen);

   XLXI_17 : OBUF
      PORT MAP (I=>fin, O=>finish);

   XLXI_22 : OBUF16_MXILINX
      PORT MAP (I(15)=>dum(15), I(14)=>dum(14), I(13)=>dum(13), I(12)=>dum(12),
      I(11)=>dum(11), I(10)=>dum(10), I(9)=>dum(9), I(8)=>dum(8), I(7)=>dum(7),
      I(6)=>dum(6), I(5)=>dum(5), I(4)=>dum(4), I(3)=>dum(3), I(2)=>dum(2),
      I(1)=>dum(1), I(0)=>dum(0), O(15)=>laddr(15), O(14)=>laddr(14),
      O(13)=>laddr(13), O(12)=>laddr(12), O(11)=>laddr(11), O(10)=>laddr(10),
      O(9)=>laddr(9), O(8)=>laddr(8), O(7)=>laddr(7), O(6)=>laddr(6),
      O(5)=>laddr(5), O(4)=>laddr(4), O(3)=>laddr(3), O(2)=>laddr(2),
      O(1)=>laddr(1), O(0)=>laddr(0));

   XLXI_31 : simtest
      PORT MAP (WrDone=>XLXN_63, CLK=>damnclk, Reset=>XLXN_72, RdDone=>XLXN_74,
      Dout(15)=>XLXN_75(15), Dout(14)=>XLXN_75(14), Dout(13)=>XLXN_75(13),
      Dout(12)=>XLXN_75(12), Dout(11)=>XLXN_75(11), Dout(10)=>XLXN_75(10),
      Dout(9)=>XLXN_75(9), Dout(8)=>XLXN_75(8), Dout(7)=>XLXN_75(7),
      Dout(6)=>XLXN_75(6), Dout(5)=>XLXN_75(5), Dout(4)=>XLXN_75(4),
      Dout(3)=>XLXN_75(3), Dout(2)=>XLXN_75(2), Dout(1)=>XLXN_75(1),
      Dout(0)=>XLXN_75(0), MemRd=>XLXN_62, MemWr=>XLXN_61, ResetL=>XLXN_60,
      finish=>fin, state1=>st1, state2=>st2, state3=>st3, state4=>st4,
      RdAddr(17)=>XLXN_6(17), RdAddr(16)=>XLXN_6(16), RdAddr(15)=>XLXN_6(15),
      RdAddr(14)=>XLXN_6(14), RdAddr(13)=>XLXN_6(13), RdAddr(12)=>XLXN_6(12),
      RdAddr(11)=>XLXN_6(11), RdAddr(10)=>XLXN_6(10), RdAddr(9)=>XLXN_6(9),
      RdAddr(8)=>XLXN_6(8), RdAddr(7)=>XLXN_6(7), RdAddr(6)=>XLXN_6(6),
      RdAddr(5)=>XLXN_6(5), RdAddr(4)=>XLXN_6(4), RdAddr(3)=>XLXN_6(3),
      RdAddr(2)=>XLXN_6(2), RdAddr(1)=>XLXN_6(1), RdAddr(0)=>XLXN_6(0),
      WrAddr(17)=>XLXN_8(17), WrAddr(16)=>XLXN_8(16), WrAddr(15)=>XLXN_8(15),
      WrAddr(14)=>XLXN_8(14), WrAddr(13)=>XLXN_8(13), WrAddr(12)=>XLXN_8(12),
      WrAddr(11)=>XLXN_8(11), WrAddr(10)=>XLXN_8(10), WrAddr(9)=>XLXN_8(9),
      WrAddr(8)=>XLXN_8(8), WrAddr(7)=>XLXN_8(7), WrAddr(6)=>XLXN_8(6),
      WrAddr(5)=>XLXN_8(5), WrAddr(4)=>XLXN_8(4), WrAddr(3)=>XLXN_8(3),
      WrAddr(2)=>XLXN_8(2), WrAddr(1)=>XLXN_8(1), WrAddr(0)=>XLXN_8(0),
      Din(15)=>XLXN_9(15), Din(14)=>XLXN_9(14), Din(13)=>XLXN_9(13),
      Din(12)=>XLXN_9(12), Din(11)=>XLXN_9(11), Din(10)=>XLXN_9(10),
      Din(9)=>XLXN_9(9), Din(8)=>XLXN_9(8), Din(7)=>XLXN_9(7),
      Din(6)=>XLXN_9(6), Din(5)=>XLXN_9(5), Din(4)=>XLXN_9(4),
      Din(3)=>XLXN_9(3), Din(2)=>XLXN_9(2), Din(1)=>XLXN_9(1),
      Din(0)=>XLXN_9(0));

END SCHEMATIC;



