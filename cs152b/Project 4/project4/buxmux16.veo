ames.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : buxmux16
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
-- INST_TAG_END ------ End INSTANTIATION Template ------------

-- You must compile the wrapper file buxmux16.vhd when simulating
-- the core, buxmux16. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "Coregen Users Guide".

                                                                                                                                                                                                                                                                                                                                                                                                                                                                 rt connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
buxmux16 YourInstanceName (
	.MA(MA),
	.MB(MB),
	.MC(MC),
	.MD(MD),
	.ME(ME),
	.MF(MF),
	.MG(MG),
	.MH(MH),
	.S(S),
	.O(O));

// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file buxmux16.v when simulating
// the core, buxmux16. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "Coregen Users Guide".

