set -tmpdir .
set -overwrite YES
set -xsthdpdir ./xst
run
-ifmt VHDL
-ent alu
-p xcv50-pq240-6
-ifn alu.prj
-opt_mode Speed
-opt_level 1
-check_attribute_syntax YES
-keep_hierarchy No
-glob_opt AllClockNets
-write_timing_constraints No
-fsm_extract YES -fsm_encoding Auto
-fsm_fftype D
-mux_extract YES
-resource_sharing YES
-complex_clken YES
-rom_extract Yes
-ram_extract Yes
-ram_style Auto
-mux_style Auto
-decoder_extract YES
-priority_extract YES
-shreg_extract YES
-shift_extract YES
-xor_collapse YES
-iobuf YES
-equivalent_register_removal YES
-bufg 4
-max_fanout 100
-incremental_synthesis NO
-register_duplication YES
-register_balancing No
-move_first_stage YES
-move_last_stage YES
-slice_packing YES
-iob auto
-ofn alu
-ofmt NGC
                                                                                                                                                                                                                                                 : STRING ;
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
             Mplslib 
pls    zeroBus.vhd OF_detect.vhd negative_detect.vhd one_bus.vhd add.vhf logical.vhd shift.vhd control_module.vhd OF_enable.vhd zero_detect.vhd alu.vhf 
                                                                                                                                                                                                                                                                                                                                                             rol	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
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
      control(1)=>control(1), control(0)=>control(0), sel(1)=>X<?xml version='1.0' encoding='utf-8' ?>
<da_list><da><ds><vendor>UNKNOWN</vendor></ds><le leid="2"><type>net</type><name>xlxi_15_xlxi_23/xlxi_15_xlxi_23/ofl</name></le><msg type="WARNING"><num>454</num><ltext>logical net </ltext><ltext lref="2">'xlxi_15_xlxi_23/ofl'</ltext><ltext> has no load</ltext></msg></da></da_list>
                                                                                                                                                                                              B(0)=>B(0), control(3)=>control(3), control(2)=>control(2),
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
      MBJHDPARSE - VHDL/Verilog Parser.
ISE 4.1i Copyright(c) 1999-2001 Xilinx, Inc.  All rights reserved. 

Scanning    ctrlunit.vhd
Scanning    ctrlunit.vhd
Writing ctrlunit.jhd.

JHDPARSE complete -    0 errors,    0 warnings.
                                                                                                                                                                                                                                                                                          , O(15)=>S_DUMMY(15), O(14)=>S_DUMMY(14),
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
      shift_result(1)=>XLXN_23(1), ISE Auto-Make Log File
-----------------------

Starting: 'jhdparse @ctrlunit.jp'


JHDPARSE - VHDL/Verilog Parser.
ISE 4.1i Copyright(c) 1999-2001 Xilinx, Inc.  All rights reserved. 

Scanning    ctrlunit.vhd
Scanning    ctrlunit.vhd
Writing ctrlunit.jhd.

JHDPARSE complete -    0 errors,    0 warnings.

Done: completed successfully.
                                                                                                                                                                  bit_string(1)=>S_DUMMY(1), bit_string(0)=>S_DUMMY(0), isZero=>Zero);

END SCHEMATIC;



