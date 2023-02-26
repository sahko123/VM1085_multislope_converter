//altufm_parallel ACCESS_MODE="READ_WRITE" CBX_AUTO_BLACKBOX="ALL" CBX_SINGLE_OUTPUT_FILE="ON" DEVICE_FAMILY="MAX V" ERASE_TIME=500000000 OSC_FREQUENCY=180000 PROGRAM_TIME=1600000 WIDTH_ADDRESS=8 WIDTH_DATA=8 WIDTH_UFM_ADDRESS=9 addr data_valid datain dataout nbusy nerase nread nwrite osc
//VERSION_BEGIN 22.1 cbx_a_gray2bin 2022:10:25:15:36:38:SC cbx_a_graycounter 2022:10:25:15:36:38:SC cbx_altufm_parallel 2022:10:25:15:36:38:SC cbx_cycloneii 2022:10:25:15:36:38:SC cbx_lpm_add_sub 2022:10:25:15:36:38:SC cbx_lpm_compare 2022:10:25:15:36:38:SC cbx_lpm_counter 2022:10:25:15:36:38:SC cbx_lpm_decode 2022:10:25:15:36:36:SC cbx_lpm_mux 2022:10:25:15:36:38:SC cbx_maxii 2022:10:25:15:36:38:SC cbx_mgl 2022:10:25:15:36:55:SC cbx_nadder 2022:10:25:15:36:38:SC cbx_stratix 2022:10:25:15:36:38:SC cbx_stratixii 2022:10:25:15:36:38:SC cbx_util_mgl 2022:10:25:15:36:38:SC  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2022  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and any partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details, at
//  https://fpgasoftware.intel.com/eula.



//synthesis_resources = lpm_counter 1 lut 70 maxv_ufm 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"suppress_da_rule_internal=c101;suppress_da_rule_internal=c103;suppress_da_rule_internal=c104;suppress_da_rule_internal=r101;suppress_da_rule_internal=s104;suppress_da_rule_internal=s102"} *)
module  parallel_bus_ufm_parallel_0
	( 
	addr,
	data_valid,
	datain,
	dataout,
	nbusy,
	nerase,
	nread,
	nwrite,
	osc) /* synthesis synthesis_clearbox=1 */;
	input   [7:0]  addr;
	output   data_valid;
	input   [7:0]  datain;
	output   [7:0]  dataout;
	output   nbusy;
	input   nerase;
	input   nread;
	input   nwrite;
	output   osc;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [7:0]  datain;
	tri1   nerase;
	tri1   nwrite;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[7:0]	A;
	reg	data_valid_out_reg;
	reg	data_valid_reg;
	reg	deco1_dffe;
	reg	deco2_dffe;
	reg	deco3_dffe;
	reg	decode_dffe;
	reg	gated_clk1_dffe;
	reg	gated_clk2_dffe;
	reg	[15:0]	piso_sipo_dffe;
	reg	program_dffe;
	wire	wire_program_dffe_clrn;
	reg	real_decode2_dffe;
	reg	real_decode_dffe;
	wire	[7:0]	wire_tmp_do_d;
	reg	[7:0]	tmp_do;
	wire	[7:0]	wire_tmp_do_ena;
	wire  [4:0]   wire_cntr2_q;
	wire  wire_maxii_ufm_block1_bgpbusy;
	wire  wire_maxii_ufm_block1_busy;
	wire  wire_maxii_ufm_block1_drdout;
	wire  wire_maxii_ufm_block1_osc;
	wire  add_en;
	wire  add_load;
	wire  arclk;
	wire  busy_arclk;
	wire  busy_drclk;
	wire  control_mux;
	wire  copy_tmp_decode;
	wire  data_en;
	wire  data_load;
	wire  data_valid_en;
	wire  dly_tmp_decode;
	wire  drclk;
	wire  drshft;
	wire  erase;
	wire  erase_op;
	wire  gated1;
	wire  gated2;
	wire  hold_decode;
	wire  in_erase;
	wire  in_program;
	wire  in_read_data_en;
	wire  in_read_drclk;
	wire  in_read_drshft;
	wire  in_write_data_en;
	wire  in_write_data_load;
	wire  in_write_drclk;
	wire  in_write_drshft;
	wire  mux_nerase;
	wire  mux_nread;
	wire  mux_nwrite;
	wire oscena;
	wire  [15:0]  piso_sipo_d;
	wire  [15:0]  piso_sipo_q;
	wire  program1;
	wire  q0;
	wire  q1;
	wire  q2;
	wire  q3;
	wire  q4;
	wire  read_data_en;
	wire  read_drclk;
	wire  read_drshft;
	wire  read_op;
	wire  real_decode;
	wire  [7:0]  shiftin;
	wire  start_decode;
	wire  start_op;
	wire  stop_op;
	wire  tmp_add_en;
	wire  tmp_add_load;
	wire  tmp_arclk;
	wire  tmp_arclk0;
	wire  tmp_ardin;
	wire  tmp_arshft;
	wire  tmp_data_valid2;
	wire  tmp_decode;
	wire  [15:0]  tmp_di;
	wire  tmp_drclk;
	wire  tmp_drdin;
	wire  tmp_erase;
	wire  tmp_read;
	wire  tmp_write;
	wire  ufm_arclk;
	wire  ufm_ardin;
	wire  ufm_arshft;
	wire  ufm_bgpbusy;
	wire  ufm_busy;
	wire  ufm_drclk;
	wire  ufm_drdin;
	wire  ufm_drdout;
	wire  ufm_drshft;
	wire  ufm_erase;
	wire  ufm_osc;
	wire  ufm_oscena;
	wire  ufm_program;
	wire  write_data_en;
	wire  write_data_load;
	wire  write_drclk;
	wire  write_drshft;
	wire  write_op;
	wire  [7:0]  X_var;
	wire  [7:0]  Y_var;
	wire  [7:0]  Z_var;

	// synopsys translate_off
	initial
		A = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (add_en == 1'b1)   A <= {Z_var};
	// synopsys translate_off
	initial
		data_valid_out_reg = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		  data_valid_out_reg <= (data_valid_reg & (~ tmp_decode));
	// synopsys translate_off
	initial
		data_valid_reg = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (data_valid_en == 1'b1)   data_valid_reg <= tmp_data_valid2;
	// synopsys translate_off
	initial
		deco1_dffe = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (start_op == 1'b1)   deco1_dffe <= mux_nread;
	// synopsys translate_off
	initial
		deco2_dffe = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (start_op == 1'b1)   deco2_dffe <= mux_nwrite;
	// synopsys translate_off
	initial
		deco3_dffe = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (start_op == 1'b1)   deco3_dffe <= mux_nerase;
	// synopsys translate_off
	initial
		decode_dffe = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		  decode_dffe <= copy_tmp_decode;
	// synopsys translate_off
	initial
		gated_clk1_dffe = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		  gated_clk1_dffe <= busy_arclk;
	// synopsys translate_off
	initial
		gated_clk2_dffe = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		  gated_clk2_dffe <= busy_drclk;
	// synopsys translate_off
	initial
		piso_sipo_dffe = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (data_en == 1'b1)   piso_sipo_dffe <= {piso_sipo_d[15:0]};
	// synopsys translate_off
	initial
		program_dffe = 0;
	// synopsys translate_on
	always @ ( negedge ufm_busy or  negedge wire_program_dffe_clrn)
		if (wire_program_dffe_clrn == 1'b0) program_dffe <= 1'b0;
		else  program_dffe <= (ufm_program | ufm_erase);
	assign
		wire_program_dffe_clrn = (~ (stop_op | (((((~ q4) & (~ q3)) & (~ q2)) & (~ q1)) & (~ q0))));
	// synopsys translate_off
	initial
		real_decode2_dffe = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		  real_decode2_dffe <= real_decode_dffe;
	// synopsys translate_off
	initial
		real_decode_dffe = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		  real_decode_dffe <= start_decode;
	// synopsys translate_off
	initial
		tmp_do[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (wire_tmp_do_ena[0:0] == 1'b1)   tmp_do[0:0] <= wire_tmp_do_d[0:0];
	// synopsys translate_off
	initial
		tmp_do[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (wire_tmp_do_ena[1:1] == 1'b1)   tmp_do[1:1] <= wire_tmp_do_d[1:1];
	// synopsys translate_off
	initial
		tmp_do[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (wire_tmp_do_ena[2:2] == 1'b1)   tmp_do[2:2] <= wire_tmp_do_d[2:2];
	// synopsys translate_off
	initial
		tmp_do[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (wire_tmp_do_ena[3:3] == 1'b1)   tmp_do[3:3] <= wire_tmp_do_d[3:3];
	// synopsys translate_off
	initial
		tmp_do[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (wire_tmp_do_ena[4:4] == 1'b1)   tmp_do[4:4] <= wire_tmp_do_d[4:4];
	// synopsys translate_off
	initial
		tmp_do[5:5] = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (wire_tmp_do_ena[5:5] == 1'b1)   tmp_do[5:5] <= wire_tmp_do_d[5:5];
	// synopsys translate_off
	initial
		tmp_do[6:6] = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (wire_tmp_do_ena[6:6] == 1'b1)   tmp_do[6:6] <= wire_tmp_do_d[6:6];
	// synopsys translate_off
	initial
		tmp_do[7:7] = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		if (wire_tmp_do_ena[7:7] == 1'b1)   tmp_do[7:7] <= wire_tmp_do_d[7:7];
	assign
		wire_tmp_do_d = {piso_sipo_q[15:8]};
	assign
		wire_tmp_do_ena = {8{(data_valid_reg & (~ tmp_decode))}};
	lpm_counter   cntr2
	( 
	.clk_en(tmp_decode),
	.clock(ufm_osc),
	.cnt_en(((~ (ufm_program | ufm_erase)) | program1)),
	.cout(),
	.eq(),
	.q(wire_cntr2_q)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.data({5{1'b0}}),
	.sclr(1'b0),
	.sload(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cntr2.lpm_direction = "UP",
		cntr2.lpm_modulus = 28,
		cntr2.lpm_port_updown = "PORT_UNUSED",
		cntr2.lpm_width = 5,
		cntr2.lpm_type = "lpm_counter";
	maxv_ufm   maxii_ufm_block1
	( 
	.arclk(ufm_arclk),
	.ardin(ufm_ardin),
	.arshft(ufm_arshft),
	.bgpbusy(wire_maxii_ufm_block1_bgpbusy),
	.busy(wire_maxii_ufm_block1_busy),
	.drclk(ufm_drclk),
	.drdin(ufm_drdin),
	.drdout(wire_maxii_ufm_block1_drdout),
	.drshft(ufm_drshft),
	.erase(ufm_erase),
	.osc(wire_maxii_ufm_block1_osc),
	.oscena(ufm_oscena),
	.program(ufm_program)
	// synopsys translate_off
	,
	.ctrl_bgpbusy(1'b0),
	.devclrn(1'b1),
	.devpor(1'b1),
	.sbdin(1'b0),
	.sbdout()
	// synopsys translate_on
	);
	defparam
		maxii_ufm_block1.address_width = 9,
		maxii_ufm_block1.erase_time = 500000000,
		maxii_ufm_block1.init_file = "none",
		maxii_ufm_block1.osc_sim_setting = 180000,
		maxii_ufm_block1.program_time = 1600000,
		maxii_ufm_block1.lpm_type = "maxv_ufm";
	assign
		add_en = (tmp_add_en & ((read_op | write_op) | erase_op)),
		add_load = (tmp_add_load & ((read_op | write_op) | erase_op)),
		arclk = (tmp_arclk0 & ((read_op | write_op) | erase_op)),
		busy_arclk = arclk,
		busy_drclk = drclk,
		control_mux = (((~ q4) & ((q3 | q2) | q1)) | q4),
		copy_tmp_decode = tmp_decode,
		data_en = (((~ read_op) & write_data_en) | (read_op & read_data_en)),
		data_load = (write_data_load & write_op),
		data_valid = data_valid_out_reg,
		data_valid_en = ((q4 & q3) & q1),
		dataout = tmp_do,
		dly_tmp_decode = decode_dffe,
		drclk = (((~ read_op) & write_drclk) | (read_op & read_drclk)),
		drshft = (((~ read_op) & write_drshft) | (read_op & read_drshft)),
		erase = (in_erase & erase_op),
		erase_op = ((tmp_read & tmp_write) & (~ tmp_erase)),
		gated1 = gated_clk1_dffe,
		gated2 = gated_clk2_dffe,
		hold_decode = ((~ real_decode2_dffe) & real_decode),
		in_erase = (((((~ q4) & q3) & (~ q2)) & q1) & q0),
		in_program = ((((q4 & (~ q3)) & (~ q2)) & (~ q1)) & q0),
		in_read_data_en = (((~ q4) & ((q3 & q2) | (q3 & q1))) | (q4 & (((~ q3) | ((~ q2) & (~ q1))) | (q1 & (~ q0))))),
		in_read_drclk = (((~ q4) & ((q3 & q2) | (q3 & q1))) | (q4 & (((~ q3) | ((~ q2) & (~ q1))) | (q1 & (~ q0))))),
		in_read_drshft = (~ (((((~ q4) & q3) & (~ q2)) & q1) & q0)),
		in_write_data_en = ((~ q4) | ((((~ q3) & (~ q2)) & (~ q1)) & (~ q0))),
		in_write_data_load = (~ (((~ q4) & (((q3 | q2) | q1) | q0)) | (q4 & ((((~ q3) & (~ q2)) & (~ q1)) & (~ q0))))),
		in_write_drclk = (~ q4),
		in_write_drshft = in_write_data_en,
		mux_nerase = (((~ control_mux) & nerase) | (control_mux & data_valid_en)),
		mux_nread = (((~ control_mux) & nread) | (control_mux & data_valid_en)),
		mux_nwrite = (((~ control_mux) & nwrite) | (control_mux & data_valid_en)),
		nbusy = ((~ dly_tmp_decode) & (~ ufm_bgpbusy)),
		osc = ufm_osc,
		oscena = 1'b1,
		piso_sipo_d = {((piso_sipo_q[14] & (~ data_load)) | (tmp_di[15] & data_load)), ((piso_sipo_q[13] & (~ data_load)) | (tmp_di[14] & data_load)), ((piso_sipo_q[12] & (~ data_load)) | (tmp_di[13] & data_load)), ((piso_sipo_q[11] & (~ data_load)) | (tmp_di[12] & data_load)), ((piso_sipo_q[10] & (~ data_load)) | (tmp_di[11] & data_load)), ((piso_sipo_q[9] & (~ data_load)) | (tmp_di[10] & data_load)), ((piso_sipo_q[8] & (~ data_load)) | (tmp_di[9] & data_load)), ((piso_sipo_q[7] & (~ data_load)) | (tmp_di[8] & data_load)), ((piso_sipo_q[6] & (~ data_load)) | (tmp_di[7] & data_load)), ((piso_sipo_q[5] & (~ data_load)) | (tmp_di[6] & data_load)), ((piso_sipo_q[4] & (~ data_load)) | (tmp_di[5] & data_load)), ((piso_sipo_q[3] & (~ data_load)) | (tmp_di[4] & data_load)), ((piso_sipo_q[2] & (~ data_load)) | (tmp_di[3] & data_load)), ((piso_sipo_q[1] & (~ data_load)) | (tmp_di[2] & data_load)), ((piso_sipo_q[0] & (~ data_load)) | (tmp_di[1] & data_load)), ((ufm_drdout & (~ data_load)) | (tmp_di[0] & data_load))},
		piso_sipo_q = {piso_sipo_dffe[15:0]},
		program1 = program_dffe,
		q0 = wire_cntr2_q[0],
		q1 = wire_cntr2_q[1],
		q2 = wire_cntr2_q[2],
		q3 = wire_cntr2_q[3],
		q4 = wire_cntr2_q[4],
		read_data_en = (in_read_data_en & read_op),
		read_drclk = (in_read_drclk & read_op),
		read_drshft = (in_read_drshft & read_op),
		read_op = (((~ tmp_read) & tmp_write) & tmp_erase),
		real_decode = start_decode,
		shiftin = {A[6:0], 1'b0},
		start_decode = ((~ ufm_bgpbusy) & (((((~ mux_nread) & mux_nwrite) & mux_nerase) | ((mux_nread & (~ mux_nwrite)) & mux_nerase)) | ((mux_nread & mux_nwrite) & (~ mux_nerase)))),
		start_op = (hold_decode | stop_op),
		stop_op = ((((q4 & q3) & (~ q2)) & q1) & q0),
		tmp_add_en = ((~ q4) & ((~ q3) | ((~ q2) & (~ q1)))),
		tmp_add_load = (~ ((~ q4) & (((((~ q3) & q2) | ((~ q3) & q0)) | ((~ q3) & q1)) | ((q3 & (~ q2)) & (~ q1))))),
		tmp_arclk = (gated1 & (~ ufm_osc)),
		tmp_arclk0 = ((~ q4) & ((~ q3) | (((~ q2) & (~ q1)) & (~ q0)))),
		tmp_ardin = A[7],
		tmp_arshft = add_en,
		tmp_data_valid2 = (stop_op & read_op),
		tmp_decode = (((((~ tmp_read) & tmp_write) & tmp_erase) | ((tmp_read & (~ tmp_write)) & tmp_erase)) | ((tmp_read & tmp_write) & (~ tmp_erase))),
		tmp_di = {datain[7:0], 8'b00000001},
		tmp_drclk = (gated2 & (~ ufm_osc)),
		tmp_drdin = piso_sipo_dffe[15],
		tmp_erase = deco3_dffe,
		tmp_read = deco1_dffe,
		tmp_write = deco2_dffe,
		ufm_arclk = tmp_arclk,
		ufm_ardin = tmp_ardin,
		ufm_arshft = tmp_arshft,
		ufm_bgpbusy = wire_maxii_ufm_block1_bgpbusy,
		ufm_busy = wire_maxii_ufm_block1_busy,
		ufm_drclk = tmp_drclk,
		ufm_drdin = tmp_drdin,
		ufm_drdout = wire_maxii_ufm_block1_drdout,
		ufm_drshft = drshft,
		ufm_erase = ((erase | ufm_busy) & erase_op),
		ufm_osc = wire_maxii_ufm_block1_osc,
		ufm_oscena = oscena,
		ufm_program = (in_program & write_op),
		write_data_en = (in_write_data_en & write_op),
		write_data_load = (in_write_data_load & write_op),
		write_drclk = (in_write_drclk & write_op),
		write_drshft = (in_write_drshft & write_op),
		write_op = ((tmp_read & (~ tmp_write)) & tmp_erase),
		X_var = (shiftin & {8{(~ add_load)}}),
		Y_var = (addr & {8{add_load}}),
		Z_var = (X_var | Y_var);
endmodule //parallel_bus_ufm_parallel_0
//VALID FILE
