----------------------------------------------------------------------
-- This file is owned and controlled by Xilinx and must be used     --
-- solely for design, simulation, implementation and creation of    --
-- design files limited to Xilinx devices or technologies. Use      --
-- with non-Xilinx devices or technologies is expressly prohibited  --
-- and immediately terminates your license.                         --
--                                                                  --
-- Xilinx products are not intended for use in life support         --
-- appliances, devices, or systems. Use in such applications are    --
-- expressly prohibited.                                            --
--                                                                  --
-- Copyright (C) 2001, Xilinx, Inc.  All Rights Reserved.           --
----------------------------------------------------------------------

-- You must compile the wrapper file busdec16.vhd when simulating
-- the core, busdec16. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "Coregen Users Guide".

-- The synopsys directives "translate_off/translate_on" specified
-- below are supported by XST, FPGA Express, Exemplar and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

-- synopsys translate_off
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

Library XilinxCoreLib;
ENTITY busdec16 IS
	port (
	S: IN std_logic_VECTOR(2 downto 0);
	O: OUT std_logic_VECTOR(7 downto 0));
END busdec16;

ARCHITECTURE busdec16_a OF busdec16 IS

component wrapped_busdec16
	port (
	S: IN std_logic_VECTOR(2 downto 0);
	O: OUT std_logic_VECTOR(7 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_busdec16 use entity XilinxCoreLib.C_DECODE_BINARY_V4_0(behavioral)
		generic map(
			c_has_ainit => 0,
			c_sync_enable => 0,
			c_has_sinit => 0,
			c_has_q => 0,
			c_has_sset => 0,
			c_has_o => 1,
			c_has_en => 0,
			c_out_width => 8,
			c_has_sclr => 0,
			c_sinit_val => "0",
			c_has_aset => 0,
			c_has_aclr => 0,
			c_sel_width => 3,
			c_pipe_stages => 0,
			c_sync_priority => 1,
			c_out_high => 1,
			c_enable_rlocs => 1,
			c_has_ce => 0,
			c_ainit_val => "00000000");
BEGIN

U0 : wrapped_busdec16
		port map (
			S => S,
			O => O);
END busdec16_a;

-- synopsys translate_on

