-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\ibuf8.sch - Thu Jul 29 10:17:39 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY IBUF8_MXILINX IS
   PORT ( I	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          O	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0));

end IBUF8_MXILINX;

ARCHITECTURE SCHEMATIC OF IBUF8_MXILINX IS

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_36_37 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_36 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_35 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_34 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_33 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_32 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_31 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_30 : LABEL IS "true";

BEGIN

   I_36_37 : IBUF
      PORT MAP (I=>I(0), O=>O(0));

   I_36_36 : IBUF
      PORT MAP (I=>I(1), O=>O(1));

   I_36_35 : IBUF
      PORT MAP (I=>I(2), O=>O(2));

   I_36_34 : IBUF
      PORT MAP (I=>I(3), O=>O(3));

   I_36_33 : IBUF
      PORT MAP (I=>I(7), O=>O(7));

   I_36_32 : IBUF
      PORT MAP (I=>I(6), O=>O(6));

   I_36_31 : IBUF
      PORT MAP (I=>I(5), O=>O(5));

   I_36_30 : IBUF
      PORT MAP (I=>I(4), O=>O(4));

END SCHEMATIC;



-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\obuf16.sch - Thu Jul 29 10:17:39 2004

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



-- Vhdl model created from schematic C:\Xilinx\virtex\data\drawing\obuf4.sch - Thu Jul 29 10:17:39 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY OBUF4_MXILINX IS
   PORT ( I0	:	IN	STD_LOGIC; 
          I1	:	IN	STD_LOGIC; 
          I2	:	IN	STD_LOGIC; 
          I3	:	IN	STD_LOGIC; 
          O0	:	OUT	STD_LOGIC; 
          O1	:	OUT	STD_LOGIC; 
          O2	:	OUT	STD_LOGIC; 
          O3	:	OUT	STD_LOGIC);

end OBUF4_MXILINX;

ARCHITECTURE SCHEMATIC OF OBUF4_MXILINX IS

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF I_36_33 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_32 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_31 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF I_36_30 : LABEL IS "true";

BEGIN

   I_36_33 : OBUF
      PORT MAP (I=>I3, O=>O3);

   I_36_32 : OBUF
      PORT MAP (I=>I2, O=>O2);

   I_36_31 : OBUF
      PORT MAP (I=>I1, O=>O1);

   I_36_30 : OBUF
      PORT MAP (I=>I0, O=>O0);

END SCHEMATIC;



-- Vhdl model created from schematic project2.sch - Thu Jul 29 10:17:39 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY project2 IS
   PORT ( Reset	:	IN	STD_LOGIC; 
          clock	:	IN	STD_LOGIC; 
          ppdata	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          finish	:	OUT	STD_LOGIC; 
          laddr	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          laddr16	:	OUT	STD_LOGIC; 
          laddr17	:	OUT	STD_LOGIC; 
          laddr18	:	OUT	STD_LOGIC; 
          lcen	:	OUT	STD_LOGIC; 
          loen	:	OUT	STD_LOGIC; 
          lwen	:	OUT	STD_LOGIC; 
          ppstatus3	:	OUT	STD_LOGIC; 
          ppstatus4	:	OUT	STD_LOGIC; 
          ppstatus5	:	OUT	STD_LOGIC; 
          ppstatus6	:	OUT	STD_LOGIC; 
          ldata	:	INOUT	STD_LOGIC_VECTOR (15 DOWNTO 0));

end project2;

ARCHITECTURE SCHEMATIC OF project2 IS
   SIGNAL A	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Din	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Dout	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL MemRd	:	STD_LOGIC;
   SIGNAL MemWr	:	STD_LOGIC;
   SIGNAL RdAddr	:	STD_LOGIC_VECTOR (17 DOWNTO 0);
   SIGNAL RdDone	:	STD_LOGIC;
   SIGNAL RegA	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL RegBusW	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL RegW	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL RegWrEn	:	STD_LOGIC;
   SIGNAL ResetL	:	STD_LOGIC;
   SIGNAL WrAddr	:	STD_LOGIC_VECTOR (17 DOWNTO 0);
   SIGNAL WrDone	:	STD_LOGIC;
   SIGNAL XLXN_1	:	STD_LOGIC;
   SIGNAL XLXN_9	:	STD_LOGIC;
   SIGNAL clk	:	STD_LOGIC;
   SIGNAL dum	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL fn	:	STD_LOGIC;
   SIGNAL la	:	STD_LOGIC_VECTOR (18 DOWNTO 0);
   SIGNAL lc	:	STD_LOGIC;
   SIGNAL lo	:	STD_LOGIC;
   SIGNAL lw	:	STD_LOGIC;
   SIGNAL pp	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL ppstatus	:	STD_LOGIC_VECTOR (6 DOWNTO 3);

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF XLXI_17 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_34 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_33 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_32 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_16 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_27 : LABEL IS "true";
   ATTRIBUTE KEEP_HIERARCHY : STRING ;
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_28 : LABEL IS "TRUE";
   ATTRIBUTE fpga_dont_touch OF XLXI_22 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_21 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_20 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_14 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_13 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_12 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_11 : LABEL IS "true";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_19 : LABEL IS "TRUE";
   ATTRIBUTE KEEP_HIERARCHY OF XLXI_18 : LABEL IS "TRUE";

   COMPONENT ctrlunit
      PORT ( CLK	:	IN	STD_LOGIC; 
             Reset	:	IN	STD_LOGIC; 
             WrDone	:	IN	STD_LOGIC; 
             RdDone	:	IN	STD_LOGIC; 
             A	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             Dout	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             RegWrEn	:	OUT	STD_LOGIC; 
             MemRd	:	OUT	STD_LOGIC; 
             MemWr	:	OUT	STD_LOGIC; 
             ResetL	:	OUT	STD_LOGIC; 
             finish	:	OUT	STD_LOGIC; 
             RdAddr	:	OUT	STD_LOGIC_VECTOR (17 DOWNTO 0); 
             WrAddr	:	OUT	STD_LOGIC_VECTOR (17 DOWNTO 0); 
             RegBusW	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             Din	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             RegA	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
             RegW	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0));
   END COMPONENT;

   COMPONENT IBUF8_MXILINX
      PORT ( I	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
             O	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0));
   END COMPONENT;

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

   COMPONENT OBUF4_MXILINX
      PORT ( I0	:	IN	STD_LOGIC; 
             I1	:	IN	STD_LOGIC; 
             I2	:	IN	STD_LOGIC; 
             I3	:	IN	STD_LOGIC; 
             O0	:	OUT	STD_LOGIC; 
             O1	:	OUT	STD_LOGIC; 
             O2	:	OUT	STD_LOGIC; 
             O3	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT regfile
      PORT ( WrEn	:	IN	STD_LOGIC; 
             BusW	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             Clock	:	IN	STD_LOGIC; 
             Ra	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0); 
             Rb	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0); 
             Rw	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0); 
             BusA	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             BusB	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

BEGIN

   XLXI_17 : BUFG
      PORT MAP (I=>XLXN_1, O=>clk);

   XLXI_31 : ctrlunit
      PORT MAP (CLK=>clk, Reset=>XLXN_9, WrDone=>WrDone, RdDone=>RdDone,
      A(15)=>A(15), A(14)=>A(14), A(13)=>A(13), A(12)=>A(12), A(11)=>A(11),
      A(10)=>A(10), A(9)=>A(9), A(8)=>A(8), A(7)=>A(7), A(6)=>A(6), A(5)=>A(5),
      A(4)=>A(4), A(3)=>A(3), A(2)=>A(2), A(1)=>A(1), A(0)=>A(0),
      Dout(15)=>Dout(15), Dout(14)=>Dout(14), Dout(13)=>Dout(13),
      Dout(12)=>Dout(12), Dout(11)=>Dout(11), Dout(10)=>Dout(10),
      Dout(9)=>Dout(9), Dout(8)=>Dout(8), Dout(7)=>Dout(7), Dout(6)=>Dout(6),
      Dout(5)=>Dout(5), Dout(4)=>Dout(4), Dout(3)=>Dout(3), Dout(2)=>Dout(2),
      Dout(1)=>Dout(1), Dout(0)=>Dout(0), RegWrEn=>RegWrEn, MemRd=>MemRd,
      MemWr=>MemWr, ResetL=>ResetL, finish=>fn, RdAddr(17)=>RdAddr(17),
      RdAddr(16)=>RdAddr(16), RdAddr(15)=>RdAddr(15), RdAddr(14)=>RdAddr(14),
      RdAddr(13)=>RdAddr(13), RdAddr(12)=>RdAddr(12), RdAddr(11)=>RdAddr(11),
      RdAddr(10)=>RdAddr(10), RdAddr(9)=>RdAddr(9), RdAddr(8)=>RdAddr(8),
      RdAddr(7)=>RdAddr(7), RdAddr(6)=>RdAddr(6), RdAddr(5)=>RdAddr(5),
      RdAddr(4)=>RdAddr(4), RdAddr(3)=>RdAddr(3), RdAddr(2)=>RdAddr(2),
      RdAddr(1)=>RdAddr(1), RdAddr(0)=>RdAddr(0), WrAddr(17)=>WrAddr(17),
      WrAddr(16)=>WrAddr(16), WrAddr(15)=>WrAddr(15), WrAddr(14)=>WrAddr(14),
      WrAddr(13)=>WrAddr(13), WrAddr(12)=>WrAddr(12), WrAddr(11)=>WrAddr(11),
      WrAddr(10)=>WrAddr(10), WrAddr(9)=>WrAddr(9), WrAddr(8)=>WrAddr(8),
      WrAddr(7)=>WrAddr(7), WrAddr(6)=>WrAddr(6), WrAddr(5)=>WrAddr(5),
      WrAddr(4)=>WrAddr(4), WrAddr(3)=>WrAddr(3), WrAddr(2)=>WrAddr(2),
      WrAddr(1)=>WrAddr(1), WrAddr(0)=>WrAddr(0), RegBusW(15)=>RegBusW(15),
      RegBusW(14)=>RegBusW(14), RegBusW(13)=>RegBusW(13),
      RegBusW(12)=>RegBusW(12), RegBusW(11)=>RegBusW(11),
      RegBusW(10)=>RegBusW(10), RegBusW(9)=>RegBusW(9), RegBusW(8)=>RegBusW(8),
      RegBusW(7)=>RegBusW(7), RegBusW(6)=>RegBusW(6), RegBusW(5)=>RegBusW(5),
      RegBusW(4)=>RegBusW(4), RegBusW(3)=>RegBusW(3), RegBusW(2)=>RegBusW(2),
      RegBusW(1)=>RegBusW(1), RegBusW(0)=>RegBusW(0), Din(15)=>Din(15),
      Din(14)=>Din(14), Din(13)=>Din(13), Din(12)=>Din(12), Din(11)=>Din(11),
      Din(10)=>Din(10), Din(9)=>Din(9), Din(8)=>Din(8), Din(7)=>Din(7),
      Din(6)=>Din(6), Din(5)=>Din(5), Din(4)=>Din(4), Din(3)=>Din(3),
      Din(2)=>Din(2), Din(1)=>Din(1), Din(0)=>Din(0), RegA(2)=>RegA(2),
      RegA(1)=>RegA(1), RegA(0)=>RegA(0), RegW(2)=>RegW(2), RegW(1)=>RegW(1),
      RegW(0)=>RegW(0));

   XLXI_34 : GND
      PORT MAP (G=>dum(0));

   XLXI_33 : GND
      PORT MAP (G=>dum(1));

   XLXI_32 : GND
      PORT MAP (G=>dum(2));

   XLXI_16 : IBUF
      PORT MAP (I=>clock, O=>XLXN_1);

   XLXI_27 : IBUF
      PORT MAP (I=>Reset, O=>XLXN_9);

   XLXI_28 : IBUF8_MXILINX
      PORT MAP (I(7)=>ppdata(7), I(6)=>ppdata(6), I(5)=>ppdata(5),
      I(4)=>ppdata(4), I(3)=>ppdata(3), I(2)=>ppdata(2), I(1)=>ppdata(1),
      I(0)=>ppdata(0), O(7)=>pp(7), O(6)=>pp(6), O(5)=>pp(5), O(4)=>pp(4),
      O(3)=>pp(3), O(2)=>pp(2), O(1)=>pp(1), O(0)=>pp(0));

   XLXI_30 : memorymodule
      PORT MAP (MemRd=>MemRd, MemWr=>MemWr, ResetL=>ResetL, clk=>clk,
      RdAddr(17)=>RdAddr(17), RdAddr(16)=>RdAddr(16), RdAddr(15)=>RdAddr(15),
      RdAddr(14)=>RdAddr(14), RdAddr(13)=>RdAddr(13), RdAddr(12)=>RdAddr(12),
      RdAddr(11)=>RdAddr(11), RdAddr(10)=>RdAddr(10), RdAddr(9)=>RdAddr(9),
      RdAddr(8)=>RdAddr(8), RdAddr(7)=>RdAddr(7), RdAddr(6)=>RdAddr(6),
      RdAddr(5)=>RdAddr(5), RdAddr(4)=>RdAddr(4), RdAddr(3)=>RdAddr(3),
      RdAddr(2)=>RdAddr(2), RdAddr(1)=>RdAddr(1), RdAddr(0)=>RdAddr(0),
      WrAddr(17)=>WrAddr(17), WrAddr(16)=>WrAddr(16), WrAddr(15)=>WrAddr(15),
      WrAddr(14)=>WrAddr(14), WrAddr(13)=>WrAddr(13), WrAddr(12)=>WrAddr(12),
      WrAddr(11)=>WrAddr(11), WrAddr(10)=>WrAddr(10), WrAddr(9)=>WrAddr(9),
      WrAddr(8)=>WrAddr(8), WrAddr(7)=>WrAddr(7), WrAddr(6)=>WrAddr(6),
      WrAddr(5)=>WrAddr(5), WrAddr(4)=>WrAddr(4), WrAddr(3)=>WrAddr(3),
      WrAddr(2)=>WrAddr(2), WrAddr(1)=>WrAddr(1), WrAddr(0)=>WrAddr(0),
      Din(15)=>Din(15), Din(14)=>Din(14), Din(13)=>Din(13), Din(12)=>Din(12),
      Din(11)=>Din(11), Din(10)=>Din(10), Din(9)=>Din(9), Din(8)=>Din(8),
      Din(7)=>Din(7), Din(6)=>Din(6), Din(5)=>Din(5), Din(4)=>Din(4),
      Din(3)=>Din(3), Din(2)=>Din(2), Din(1)=>Din(1), Din(0)=>Din(0),
      ppdata(7)=>pp(7), ppdata(6)=>pp(6), ppdata(5)=>pp(5), ppdata(4)=>pp(4),
      ppdata(3)=>pp(3), ppdata(2)=>pp(2), ppdata(1)=>pp(1), ppdata(0)=>pp(0),
      RdDone=>RdDone, WrDone=>WrDone, lcen=>lc, loen=>lo, lwen=>lw,
      Dout(15)=>Dout(15), Dout(14)=>Dout(14), Dout(13)=>Dout(13),
      Dout(12)=>Dout(12), Dout(11)=>Dout(11), Dout(10)=>Dout(10),
      Dout(9)=>Dout(9), Dout(8)=>Dout(8), Dout(7)=>Dout(7), Dout(6)=>Dout(6),
      Dout(5)=>Dout(5), Dout(4)=>Dout(4), Dout(3)=>Dout(3), Dout(2)=>Dout(2),
      Dout(1)=>Dout(1), Dout(0)=>Dout(0), ppstatus(6)=>ppstatus(6),
      ppstatus(5)=>ppstatus(5), ppstatus(4)=>ppstatus(4),
      ppstatus(3)=>ppstatus(3), laddr(18)=>la(18), laddr(17)=>la(17),
      laddr(16)=>la(16), laddr(15)=>la(15), laddr(14)=>la(14),
      laddr(13)=>la(13), laddr(12)=>la(12), laddr(11)=>la(11),
      laddr(10)=>la(10), laddr(9)=>la(9), laddr(8)=>la(8), laddr(7)=>la(7),
      laddr(6)=>la(6), laddr(5)=>la(5), laddr(4)=>la(4), laddr(3)=>la(3),
      laddr(2)=>la(2), laddr(1)=>la(1), laddr(0)=>la(0), ldata(15)=>ldata(15),
      ldata(14)=>ldata(14), ldata(13)=>ldata(13), ldata(12)=>ldata(12),
      ldata(11)=>ldata(11), ldata(10)=>ldata(10), ldata(9)=>ldata(9),
      ldata(8)=>ldata(8), ldata(7)=>ldata(7), ldata(6)=>ldata(6),
      ldata(5)=>ldata(5), ldata(4)=>ldata(4), ldata(3)=>ldata(3),
      ldata(2)=>ldata(2), ldata(1)=>ldata(1), ldata(0)=>ldata(0));

   XLXI_22 : OBUF
      PORT MAP (I=>la(18), O=>laddr18);

   XLXI_21 : OBUF
      PORT MAP (I=>la(17), O=>laddr17);

   XLXI_20 : OBUF
      PORT MAP (I=>la(16), O=>laddr16);

   XLXI_14 : OBUF
      PORT MAP (I=>fn, O=>finish);

   XLXI_13 : OBUF
      PORT MAP (I=>lw, O=>lwen);

   XLXI_12 : OBUF
      PORT MAP (I=>lo, O=>loen);

   XLXI_11 : OBUF
      PORT MAP (I=>lc, O=>lcen);

   XLXI_19 : OBUF16_MXILINX
      PORT MAP (I(15)=>la(15), I(14)=>la(14), I(13)=>la(13), I(12)=>la(12),
      I(11)=>la(11), I(10)=>la(10), I(9)=>la(9), I(8)=>la(8), I(7)=>la(7),
      I(6)=>la(6), I(5)=>la(5), I(4)=>la(4), I(3)=>la(3), I(2)=>la(2),
      I(1)=>la(1), I(0)=>la(0), O(15)=>laddr(15), O(14)=>laddr(14),
      O(13)=>laddr(13), O(12)=>laddr(12), O(11)=>laddr(11), O(10)=>laddr(10),
      O(9)=>laddr(9), O(8)=>laddr(8), O(7)=>laddr(7), O(6)=>laddr(6),
      O(5)=>laddr(5), O(4)=>laddr(4), O(3)=>laddr(3), O(2)=>laddr(2),
      O(1)=>laddr(1), O(0)=>laddr(0));

   XLXI_18 : OBUF4_MXILINX
      PORT MAP (I0=>ppstatus(6), I1=>ppstatus(5), I2=>ppstatus(4),
      I3=>ppstatus(3), O0=>ppstatus6, O1=>ppstatus5, O2=>ppstatus4,
      O3=>ppstatus3);

   XLXI_3 : regfile
      PORT MAP (WrEn=>RegWrEn, BusW(15)=>RegBusW(15), BusW(14)=>RegBusW(14),
      BusW(13)=>RegBusW(13), BusW(12)=>RegBusW(12), BusW(11)=>RegBusW(11),
      BusW(10)=>RegBusW(10), BusW(9)=>RegBusW(9), BusW(8)=>RegBusW(8),
      BusW(7)=>RegBusW(7), BusW(6)=>RegBusW(6), BusW(5)=>RegBusW(5),
      BusW(4)=>RegBusW(4), BusW(3)=>RegBusW(3), BusW(2)=>RegBusW(2),
      BusW(1)=>RegBusW(1), BusW(0)=>RegBusW(0), Clock=>clk, Ra(2)=>RegA(2),
      Ra(1)=>RegA(1), Ra(0)=>RegA(0), Rb(2)=>dum(2), Rb(1)=>dum(1),
      Rb(0)=>dum(0), Rw(2)=>RegW(2), Rw(1)=>RegW(1), Rw(0)=>RegW(0),
      BusA(15)=>A(15), BusA(14)=>A(14), BusA(13)=>A(13), BusA(12)=>A(12),
      BusA(11)=>A(11), BusA(10)=>A(10), BusA(9)=>A(9), BusA(8)=>A(8),
      BusA(7)=>A(7), BusA(6)=>A(6), BusA(5)=>A(5), BusA(4)=>A(4),
      BusA(3)=>A(3), BusA(2)=>A(2), BusA(1)=>A(1), BusA(0)=>A(0), BusB=>open);

END SCHEMATIC;



