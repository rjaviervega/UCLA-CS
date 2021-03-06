ic_VECTOR(15 downto 0);
	MC: IN std_logic_VECTOR(15 downto 0);
	MD: IN std_logic_VECTOR(15 downto 0);
	ME: IN std_logic_VECTOR(15 downto 0);
	MF: IN std_logic_VECTOR(15 downto 0);
	MG: IN std_logic_VECTOR(15 downto 0);
	MH: IN std_logic_VECTOR(15 downto 0);
	S: IN std_logic_VECTOR(2 downto 0);
	O: OUT std_logic_VECTOR(15 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_buxmux16 use entity XilinxCoreLib.C_MUX_BUS_V4_0(behavioral)
		generic map(
			c_has_ainit => 0,
			c_sync_enable => 0,
			c_has_sinit => 0,
			c_has_q => 0,
			c_has_sset => 0,
			c_has_o => 1,
			c_inputs => 8,
			c_width => 16,
			c_has_en => 0,
			c_has_sclr => 0,
			c_sinit_val => "0000000000000000",
			c_has_aset => 0,
			c_has_aclr => 0,
			c_mux_type => 0,
			c_sel_width => 3,
			c_latency => 0,
			c_sync_priority => 1,
			c_enable_rlocs => 1,
			c_has_ce => 0,
			c_ainit_val => "0000000000000000");
BEGIN

U0 : wrapped_buxmux16
		port map (
			MA => MA,
			MB => MB,
			MC => MC,
			MD => MD,
			ME => ME,
			MF => MF,
			MG => MG,
			MH => MH,
			S => S,
			O => O);
END buxmux16_a;

-- synopsys translate_on

                                                                                                                                                                                                                                                                                                                                                                                                                          MD;
input [15 : 0] ME;
input [15 : 0] MF;
input [15 : 0] MG;
input [15 : 0] MH;
input [2 : 0] S;
output [15 : 0] O;

// synopsys translate_off

	C_MUX_BUS_V4_0 #(
		"0000000000000000",	// c_ainit_val
		1,	// c_family
		0,	// c_has_aclr
		0,	// c_has_ainit
		0,	// c_has_aset
		0,	// c_has_ce
		0,	// c_has_en
		1,	// c_has_o
		0,	// c_has_q
		0,	// c_has_sclr
		0,	// c_has_sinit
		0,	// c_has_sset
		8,	// c_inputs
		0,	// c_latency
		0,	// c_mux_type
		3,	// c_sel_width
		"0000000000000000",	// c_sinit_val
	----------------------------------------------------------------------
-- This file is owned and controlled by Xilinx and must be used     --
-- solely for design, simulation, implementation and creation of    --
-- design files limited to Xilinx devices or technologies. Use      --
-- with non-Xilinx devices or technologies is expressly prohibited  --
-- and immediately terminates your license.                         --
--                                              