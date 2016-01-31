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

-- You must compile the wrapper file mux2to1_4bit.vhd when simulating
-- the core, mux2to1_4bit. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "Coregen Users Guide".

-- The synopsys directives "translate_off/translate_on" specified
-- below are supported by XST, FPGA Express, Exemplar and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

-- synopsys translate_off
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

Library XilinxCoreLib;
ENTITY mux2to1_4bit IS
	port (
	MA: IN std_logic_VECTOR(15 downto 0);
	MB: IN std_logic_VECTOR(15 downto 0);
	S: IN std_logic_VECTOR(0 downto 0);
	O: OUT std_logic_VECTOR(15 downto 0));
END mux2to1_4bit;

ARCHITECTURE mux2to1_4bit_a OF mux2to1_4bit IS

component wrapped_mux2to1_4bit
	port (
	MA: IN std_logic_VECTOR(15 downto 0);
	MB: IN std_logic_VECTOR(15 downto 0);
	S: IN std_logic_VECTOR(0 downto 0);
	O: OUT std_logic_VECTOR(15 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_mux2to1_4bit use entity XilinxCoreLib.C_MUX_BUS_V4_0(behavioral)
		generic map(
			c_has_ainit => 0,
			c_sync_enable => 0,
			c_has_sinit => 0,
			c_has_q => 0,
			c_has_sset => 0,
			c_has_o => 1,
			c_inputs => 2,
			c_width => 16,
			c_has_en => 0,
			c_has_sclr => 0,
			c_sinit_val => "0000000000000000",
			c_has_aset => 0,
			c_has_aclr => 0,
			c_mux_type => 0,
			c_sel_width => 1,
			c_latency => 0,
			c_sync_priority => 1,
			c_enable_rlocs => 1,
			c_has_ce => 0,
			c_ainit_val => "0000000000000000");
BEGIN

U0 : wrapped_mux2to1_4bit
		port map (
			MA => MA,
			MB => MB,
			S => S,
			O => O);
END mux2to1_4bit_a;

-- synopsys translate_on

