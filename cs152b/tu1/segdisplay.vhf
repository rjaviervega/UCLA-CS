-- Vhdl model created from schematic segdisplay.sch - Thu Jul 01 11:20:44 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY segdisplay IS
   PORT ( clk	:	IN	STD_LOGIC; 
          load	:	IN	STD_LOGIC; 
          resetn	:	IN	STD_LOGIC; 
          lhex0	:	OUT	STD_LOGIC; 
          lhex1	:	OUT	STD_LOGIC; 
          lhex2	:	OUT	STD_LOGIC; 
          lhex3	:	OUT	STD_LOGIC; 
          lhex4	:	OUT	STD_LOGIC; 
          lhex5	:	OUT	STD_LOGIC; 
          lhex6	:	OUT	STD_LOGIC; 
          outq0	:	OUT	STD_LOGIC; 
          outq1	:	OUT	STD_LOGIC; 
          outq2	:	OUT	STD_LOGIC; 
          outq3	:	OUT	STD_LOGIC);

end segdisplay;

ARCHITECTURE SCHEMATIC OF segdisplay IS
   SIGNAL XLXN_34	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL XLXN_37	:	STD_LOGIC;
   SIGNAL XLXN_38	:	STD_LOGIC;
   SIGNAL XLXN_4	:	STD_LOGIC;
   SIGNAL XLXN_40	:	STD_LOGIC;
   SIGNAL XLXN_41	:	STD_LOGIC;
   SIGNAL XLXN_43	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
   SIGNAL XLXN_5	:	STD_LOGIC;
   SIGNAL lhex	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
   SIGNAL qout	:	STD_LOGIC_VECTOR (3 DOWNTO 0);

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF XLXI_8 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_5 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_6 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_7 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_9 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_20 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_19 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_18 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_17 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_16 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_15 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_14 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_13 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_12 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_11 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_10 : LABEL IS "true";

   COMPONENT const_32
      PORT ( const_out	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0));
   END COMPONENT;

   COMPONENT counter_32
      PORT ( L	:	IN	STD_LOGIC_VECTOR (31 DOWNTO 0); 
             LOAD	:	IN	STD_LOGIC; 
             CLK	:	IN	STD_LOGIC; 
             THRESH0	:	OUT	STD_LOGIC; 
             Q	:	OUT	STD_LOGIC_VECTOR (31 DOWNTO 0); 
             ACLR	:	IN	STD_LOGIC);
   END COMPONENT;

   COMPONENT counter_4
      PORT ( CE	:	IN	STD_LOGIC; 
             CLK	:	IN	STD_LOGIC; 
             Q	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             ACLR	:	IN	STD_LOGIC);
   END COMPONENT;

   COMPONENT maptoseg
      PORT ( Q	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             Lhex	:	OUT	STD_LOGIC_VECTOR (6 DOWNTO 0));
   END COMPONENT;

BEGIN

   XLXI_8 : BUFG
      PORT MAP (I=>XLXN_4, O=>XLXN_37);

   XLXI_3 : const_32
      PORT MAP (const_out(31)=>XLXN_34(31), const_out(30)=>XLXN_34(30),
      const_out(29)=>XLXN_34(29), const_out(28)=>XLXN_34(28),
      const_out(27)=>XLXN_34(27), const_out(26)=>XLXN_34(26),
      const_out(25)=>XLXN_34(25), const_out(24)=>XLXN_34(24),
      const_out(23)=>XLXN_34(23), const_out(22)=>XLXN_34(22),
      const_out(21)=>XLXN_34(21), const_out(20)=>XLXN_34(20),
      const_out(19)=>XLXN_34(19), const_out(18)=>XLXN_34(18),
      const_out(17)=>XLXN_34(17), const_out(16)=>XLXN_34(16),
      const_out(15)=>XLXN_34(15), const_out(14)=>XLXN_34(14),
      const_out(13)=>XLXN_34(13), const_out(12)=>XLXN_34(12),
      const_out(11)=>XLXN_34(11), const_out(10)=>XLXN_34(10),
      const_out(9)=>XLXN_34(9), const_out(8)=>XLXN_34(8),
      const_out(7)=>XLXN_34(7), const_out(6)=>XLXN_34(6),
      const_out(5)=>XLXN_34(5), const_out(4)=>XLXN_34(4),
      const_out(3)=>XLXN_34(3), const_out(2)=>XLXN_34(2),
      const_out(1)=>XLXN_34(1), const_out(0)=>XLXN_34(0));

   XLXI_1 : counter_32
      PORT MAP (L(31)=>XLXN_34(31), L(30)=>XLXN_34(30), L(29)=>XLXN_34(29),
      L(28)=>XLXN_34(28), L(27)=>XLXN_34(27), L(26)=>XLXN_34(26),
      L(25)=>XLXN_34(25), L(24)=>XLXN_34(24), L(23)=>XLXN_34(23),
      L(22)=>XLXN_34(22), L(21)=>XLXN_34(21), L(20)=>XLXN_34(20),
      L(19)=>XLXN_34(19), L(18)=>XLXN_34(18), L(17)=>XLXN_34(17),
      L(16)=>XLXN_34(16), L(15)=>XLXN_34(15), L(14)=>XLXN_34(14),
      L(13)=>XLXN_34(13), L(12)=>XLXN_34(12), L(11)=>XLXN_34(11),
      L(10)=>XLXN_34(10), L(9)=>XLXN_34(9), L(8)=>XLXN_34(8), L(7)=>XLXN_34(7),
      L(6)=>XLXN_34(6), L(5)=>XLXN_34(5), L(4)=>XLXN_34(4), L(3)=>XLXN_34(3),
      L(2)=>XLXN_34(2), L(1)=>XLXN_34(1), L(0)=>XLXN_34(0), LOAD=>XLXN_38,
      CLK=>XLXN_37, THRESH0=>XLXN_41, Q(31)=>XLXN_43(31), Q(30)=>XLXN_43(30),
      Q(29)=>XLXN_43(29), Q(28)=>XLXN_43(28), Q(27)=>XLXN_43(27),
      Q(26)=>XLXN_43(26), Q(25)=>XLXN_43(25), Q(24)=>XLXN_43(24),
      Q(23)=>XLXN_43(23), Q(22)=>XLXN_43(22), Q(21)=>XLXN_43(21),
      Q(20)=>XLXN_43(20), Q(19)=>XLXN_43(19), Q(18)=>XLXN_43(18),
      Q(17)=>XLXN_43(17), Q(16)=>XLXN_43(16), Q(15)=>XLXN_43(15),
      Q(14)=>XLXN_43(14), Q(13)=>XLXN_43(13), Q(12)=>XLXN_43(12),
      Q(11)=>XLXN_43(11), Q(10)=>XLXN_43(10), Q(9)=>XLXN_43(9),
      Q(8)=>XLXN_43(8), Q(7)=>XLXN_43(7), Q(6)=>XLXN_43(6), Q(5)=>XLXN_43(5),
      Q(4)=>XLXN_43(4), Q(3)=>XLXN_43(3), Q(2)=>XLXN_43(2), Q(1)=>XLXN_43(1),
      Q(0)=>XLXN_43(0), ACLR=>XLXN_40);

   XLXI_2 : counter_4
      PORT MAP (CE=>XLXN_41, CLK=>XLXN_37, Q(3)=>qout(3), Q(2)=>qout(2),
      Q(1)=>qout(1), Q(0)=>qout(0), ACLR=>XLXN_40);

   XLXI_5 : IBUF
      PORT MAP (I=>load, O=>XLXN_38);

   XLXI_6 : IBUF
      PORT MAP (I=>resetn, O=>XLXN_5);

   XLXI_7 : IBUF
      PORT MAP (I=>clk, O=>XLXN_4);

   XLXI_9 : INV
      PORT MAP (I=>XLXN_5, O=>XLXN_40);

   XLXI_4 : maptoseg
      PORT MAP (Q(3)=>qout(3), Q(2)=>qout(2), Q(1)=>qout(1), Q(0)=>qout(0),
      Lhex(6)=>lhex(6), Lhex(5)=>lhex(5), Lhex(4)=>lhex(4), Lhex(3)=>lhex(3),
      Lhex(2)=>lhex(2), Lhex(1)=>lhex(1), Lhex(0)=>lhex(0));

   XLXI_20 : OBUF
      PORT MAP (I=>qout(2), O=>outq2);

   XLXI_19 : OBUF
      PORT MAP (I=>qout(3), O=>outq3);

   XLXI_18 : OBUF
      PORT MAP (I=>qout(0), O=>outq0);

   XLXI_17 : OBUF
      PORT MAP (I=>qout(1), O=>outq1);

   XLXI_16 : OBUF
      PORT MAP (I=>lhex(6), O=>lhex6);

   XLXI_15 : OBUF
      PORT MAP (I=>lhex(5), O=>lhex5);

   XLXI_14 : OBUF
      PORT MAP (I=>lhex(4), O=>lhex4);

   XLXI_13 : OBUF
      PORT MAP (I=>lhex(3), O=>lhex3);

   XLXI_12 : OBUF
      PORT MAP (I=>lhex(2), O=>lhex2);

   XLXI_11 : OBUF
      PORT MAP (I=>lhex(1), O=>lhex1);

   XLXI_10 : OBUF
      PORT MAP (I=>lhex(0), O=>lhex0);

END SCHEMATIC;



