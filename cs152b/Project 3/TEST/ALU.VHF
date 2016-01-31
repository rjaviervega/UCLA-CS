-- Vhdl model created from schematic alu.sch - Wed Jul 28 15:01:59 2004

LIBRARY ieee;
LIBRARY UNISIM;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE UNISIM.Vcomponents.ALL;

ENTITY alu IS
   PORT ( A	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          B	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          control	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          Overflow	:	OUT	STD_LOGIC; 
          S	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          Zero	:	OUT	STD_LOGIC);

end alu;

ARCHITECTURE SCHEMATIC OF alu IS
   SIGNAL S_DUMMY	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL XLXN_17	:	STD_LOGIC;
   SIGNAL XLXN_18	:	STD_LOGIC;
   SIGNAL XLXN_2	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
   SIGNAL XLXN_21	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL XLXN_23	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL XLXN_3	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL XLXN_5	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL add_overflow	:	STD_LOGIC;
   SIGNAL shift_overflow	:	STD_LOGIC;

   ATTRIBUTE fpga_dont_touch : STRING ;
   ATTRIBUTE fpga_dont_touch OF XLXI_14 : LABEL IS "true";
   ATTRIBUTE fpga_dont_touch OF XLXI_7 : LABEL IS "true";

   COMPONENT add
      PORT ( B	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             control	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             A	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             S	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             add_overflow	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT control_unit
      PORT ( control	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             sel	:	OUT	STD_LOGIC_VECTOR (1 DOWNTO 0));
   END COMPONENT;

   COMPONENT logical
      PORT ( A	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             B	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             control	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             logicalout	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT mux_four
      PORT ( MD	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MC	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MB	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             MA	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             S	:	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 
             O	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT of_enable
      PORT ( control	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             enable	:	OUT	STD_LOGIC);
   END COMPONENT;

   COMPONENT shift
      PORT ( A	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             B	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             control	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
             shifted_out	:	OUT	STD_LOGIC; 
             shift_result	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0));
   END COMPONENT;

   COMPONENT zero_detect
      PORT ( bit_string	:	IN	STD_LOGIC_VECTOR (15 DOWNTO 0); 
             isZero	:	OUT	STD_LOGIC);
   END COMPONENT;

BEGIN
   S <= S_DUMMY;

   XLXI_15 : add
      PORT MAP (B(15)=>B(15), B(14)=>B(14), B(13)=>B(13), B(12)=>B(12),
      B(11)=>B(11), B(10)=>B(10), B(9)=>B(9), B(8)=>B(8), B(7)=>B(7),
      B(6)=>B(6), B(5)=>B(5), B(4)=>B(4), B(3)=>B(3), B(2)=>B(2), B(1)=>B(1),
      B(0)=>B(0), control(3)=>control(3), control(2)=>control(2),
      control(1)=>control(1), control(0)=>control(0), A(15)=>A(15),
      A(14)=>A(14), A(13)=>A(13), A(12)=>A(12), A(11)=>A(11), A(10)=>A(10),
      A(9)=>A(9), A(8)=>A(8), A(7)=>A(7), A(6)=>A(6), A(5)=>A(5), A(4)=>A(4),
      A(3)=>A(3), A(2)=>A(2), A(1)=>A(1), A(0)=>A(0), S(15)=>XLXN_21(15),
      S(14)=>XLXN_21(14), S(13)=>XLXN_21(13), S(12)=>XLXN_21(12),
      S(11)=>XLXN_21(11), S(10)=>XLXN_21(10), S(9)=>XLXN_21(9),
      S(8)=>XLXN_21(8), S(7)=>XLXN_21(7), S(6)=>XLXN_21(6), S(5)=>XLXN_21(5),
      S(4)=>XLXN_21(4), S(3)=>XLXN_21(3), S(2)=>XLXN_21(2), S(1)=>XLXN_21(1),
      S(0)=>XLXN_21(0), add_overflow=>add_overflow);

   XLXI_14 : AND2
      PORT MAP (I0=>XLXN_18, I1=>XLXN_17, O=>Overflow);

   XLXI_10 : control_unit
      PORT MAP (control(3)=>control(3), control(2)=>control(2),
      control(1)=>control(1), control(0)=>control(0), sel(1)=>XLXN_2(1),
      sel(0)=>XLXN_2(0));

   XLXI_5 : logical
      PORT MAP (A(15)=>A(15), A(14)=>A(14), A(13)=>A(13), A(12)=>A(12),
      A(11)=>A(11), A(10)=>A(10), A(9)=>A(9), A(8)=>A(8), A(7)=>A(7),
      A(6)=>A(6), A(5)=>A(5), A(4)=>A(4), A(3)=>A(3), A(2)=>A(2), A(1)=>A(1),
      A(0)=>A(0), B(15)=>B(15), B(14)=>B(14), B(13)=>B(13), B(12)=>B(12),
      B(11)=>B(11), B(10)=>B(10), B(9)=>B(9), B(8)=>B(8), B(7)=>B(7),
      B(6)=>B(6), B(5)=>B(5), B(4)=>B(4), B(3)=>B(3), B(2)=>B(2), B(1)=>B(1),
      B(0)=>B(0), control(3)=>control(3), control(2)=>control(2),
      control(1)=>control(1), control(0)=>control(0),
      logicalout(15)=>XLXN_5(15), logicalout(14)=>XLXN_5(14),
      logicalout(13)=>XLXN_5(13), logicalout(12)=>XLXN_5(12),
      logicalout(11)=>XLXN_5(11), logicalout(10)=>XLXN_5(10),
      logicalout(9)=>XLXN_5(9), logicalout(8)=>XLXN_5(8),
      logicalout(7)=>XLXN_5(7), logicalout(6)=>XLXN_5(6),
      logicalout(5)=>XLXN_5(5), logicalout(4)=>XLXN_5(4),
      logicalout(3)=>XLXN_5(3), logicalout(2)=>XLXN_5(2),
      logicalout(1)=>XLXN_5(1), logicalout(0)=>XLXN_5(0));

   XLXI_2 : mux_four
      PORT MAP (MD(15)=>XLXN_21(15), MD(14)=>XLXN_21(14), MD(13)=>XLXN_21(13),
      MD(12)=>XLXN_21(12), MD(11)=>XLXN_21(11), MD(10)=>XLXN_21(10),
      MD(9)=>XLXN_21(9), MD(8)=>XLXN_21(8), MD(7)=>XLXN_21(7),
      MD(6)=>XLXN_21(6), MD(5)=>XLXN_21(5), MD(4)=>XLXN_21(4),
      MD(3)=>XLXN_21(3), MD(2)=>XLXN_21(2), MD(1)=>XLXN_21(1),
      MD(0)=>XLXN_21(0), MC(15)=>XLXN_5(15), MC(14)=>XLXN_5(14),
      MC(13)=>XLXN_5(13), MC(12)=>XLXN_5(12), MC(11)=>XLXN_5(11),
      MC(10)=>XLXN_5(10), MC(9)=>XLXN_5(9), MC(8)=>XLXN_5(8), MC(7)=>XLXN_5(7),
      MC(6)=>XLXN_5(6), MC(5)=>XLXN_5(5), MC(4)=>XLXN_5(4), MC(3)=>XLXN_5(3),
      MC(2)=>XLXN_5(2), MC(1)=>XLXN_5(1), MC(0)=>XLXN_5(0),
      MB(15)=>XLXN_23(15), MB(14)=>XLXN_23(14), MB(13)=>XLXN_23(13),
      MB(12)=>XLXN_23(12), MB(11)=>XLXN_23(11), MB(10)=>XLXN_23(10),
      MB(9)=>XLXN_23(9), MB(8)=>XLXN_23(8), MB(7)=>XLXN_23(7),
      MB(6)=>XLXN_23(6), MB(5)=>XLXN_23(5), MB(4)=>XLXN_23(4),
      MB(3)=>XLXN_23(3), MB(2)=>XLXN_23(2), MB(1)=>XLXN_23(1),
      MB(0)=>XLXN_23(0), MA(15)=>XLXN_3(15), MA(14)=>XLXN_3(14),
      MA(13)=>XLXN_3(13), MA(12)=>XLXN_3(12), MA(11)=>XLXN_3(11),
      MA(10)=>XLXN_3(10), MA(9)=>XLXN_3(9), MA(8)=>XLXN_3(8), MA(7)=>XLXN_3(7),
      MA(6)=>XLXN_3(6), MA(5)=>XLXN_3(5), MA(4)=>XLXN_3(4), MA(3)=>XLXN_3(3),
      MA(2)=>XLXN_3(2), MA(1)=>XLXN_3(1), MA(0)=>XLXN_3(0), S(1)=>XLXN_2(1),
      S(0)=>XLXN_2(0), O(15)=>S_DUMMY(15), O(14)=>S_DUMMY(14),
      O(13)=>S_DUMMY(13), O(12)=>S_DUMMY(12), O(11)=>S_DUMMY(11),
      O(10)=>S_DUMMY(10), O(9)=>S_DUMMY(9), O(8)=>S_DUMMY(8), O(7)=>S_DUMMY(7),
      O(6)=>S_DUMMY(6), O(5)=>S_DUMMY(5), O(4)=>S_DUMMY(4), O(3)=>S_DUMMY(3),
      O(2)=>S_DUMMY(2), O(1)=>S_DUMMY(1), O(0)=>S_DUMMY(0));

   XLXI_13 : of_enable
      PORT MAP (control(3)=>control(3), control(2)=>control(2),
      control(1)=>control(1), control(0)=>control(0), enable=>XLXN_18);

   XLXI_7 : OR2
      PORT MAP (I0=>shift_overflow, I1=>add_overflow, O=>XLXN_17);

   XLXI_17 : shift
      PORT MAP (A(15)=>A(15), A(14)=>A(14), A(13)=>A(13), A(12)=>A(12),
      A(11)=>A(11), A(10)=>A(10), A(9)=>A(9), A(8)=>A(8), A(7)=>A(7),
      A(6)=>A(6), A(5)=>A(5), A(4)=>A(4), A(3)=>A(3), A(2)=>A(2), A(1)=>A(1),
      A(0)=>A(0), B(3)=>B(3), B(2)=>B(2), B(1)=>B(1), B(0)=>B(0),
      control(3)=>control(3), control(2)=>control(2), control(1)=>control(1),
      control(0)=>control(0), shifted_out=>shift_overflow,
      shift_result(15)=>XLXN_23(15), shift_result(14)=>XLXN_23(14),
      shift_result(13)=>XLXN_23(13), shift_result(12)=>XLXN_23(12),
      shift_result(11)=>XLXN_23(11), shift_result(10)=>XLXN_23(10),
      shift_result(9)=>XLXN_23(9), shift_result(8)=>XLXN_23(8),
      shift_result(7)=>XLXN_23(7), shift_result(6)=>XLXN_23(6),
      shift_result(5)=>XLXN_23(5), shift_result(4)=>XLXN_23(4),
      shift_result(3)=>XLXN_23(3), shift_result(2)=>XLXN_23(2),
      shift_result(1)=>XLXN_23(1), shift_result(0)=>XLXN_23(0));

   XLXI_16 : zero_detect
      PORT MAP (bit_string(15)=>S_DUMMY(15), bit_string(14)=>S_DUMMY(14),
      bit_string(13)=>S_DUMMY(13), bit_string(12)=>S_DUMMY(12),
      bit_string(11)=>S_DUMMY(11), bit_string(10)=>S_DUMMY(10),
      bit_string(9)=>S_DUMMY(9), bit_string(8)=>S_DUMMY(8),
      bit_string(7)=>S_DUMMY(7), bit_string(6)=>S_DUMMY(6),
      bit_string(5)=>S_DUMMY(5), bit_string(4)=>S_DUMMY(4),
      bit_string(3)=>S_DUMMY(3), bit_string(2)=>S_DUMMY(2),
      bit_string(1)=>S_DUMMY(1), bit_string(0)=>S_DUMMY(0), isZero=>Zero);

END SCHEMATIC;



