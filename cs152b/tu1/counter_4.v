/*******************************************************************
* This file is owned and controlled by Xilinx and must be used     *
* solely for design, simulation, implementation and creation of    *
* design files limited to Xilinx devices or technologies. Use      *
* with non-Xilinx devices or technologies is expressly prohibited  *
* and immediately terminates your license.                         *
*                                                                  *
* Xilinx products are not intended for use in life support         *
* appliances, devices, or systems. Use in such applications are    *
* expressly prohibited.                                            *
*                                                                  *
* Copyright (C) 2001, Xilinx, Inc.  All Rights Reserved.           *
*******************************************************************/ 

// The synopsys directives "translate_off/translate_on" specified
// below are supported by XST, FPGA Express, Exemplar and Synplicity
// synthesis tools. Ensure they are correct for your synthesis tool(s).

// You must compile the wrapper file counter_4.v when simulating
// the core, counter_4. When compiling the wrapper file, be sure to
// reference the XilinxCoreLib Verilog simulation library. For detailed
// instructions, please refer to the "Coregen Users Guide".

module counter_4 (
	Q,
	CLK,
	CE,
	ACLR);    // synthesis black_box

output [3 : 0] Q;
input CLK;
input CE;
input ACLR;

// synopsys translate_off

	C_COUNTER_BINARY_V4_0 #(
		"0000",	// c_ainit_val
		"0001",	// c_count_by
		0,	// c_count_mode
		"1010",	// c_count_to
		1,	// c_family
		1,	// c_has_aclr
		0,	// c_has_ainit
		0,	// c_has_aset
		1,	// c_has_ce
		0,	// c_has_iv
		0,	// c_has_l
		0,	// c_has_load
		0,	// c_has_q_thresh0
		0,	// c_has_q_thresh1
		0,	// c_has_sclr
		0,	// c_has_sinit
		0,	// c_has_sset
		0,	// c_has_thresh0
		0,	// c_has_thresh1
		0,	// c_has_up
		1,	// c_load_enable
		0,	// c_load_low
		0,	// c_pipe_stages
		1,	// c_restrict_count
		"0",	// c_sinit_val
		0,	// c_sync_enable
		1,	// c_sync_priority
		"1111111111111111",	// c_thresh0_value
		"1111111111111111",	// c_thresh1_value
		1,	// c_thresh_early
		4)	// c_width
	inst (
		.Q(Q),
		.CLK(CLK),
		.CE(CE),
		.ACLR(ACLR));


// synopsys translate_on

// FPGA Express black box declaration
// synopsys attribute fpga_dont_touch "true"
// synthesis attribute fpga_dont_touch of counter_4 is "true"

// XST black box declaration
// box_type "black_box"
// synthesis attribute box_type of counter_4 is "black_box"

endmodule

