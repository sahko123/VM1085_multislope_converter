//altufm_spi ACCESS_MODE="READ_WRITE" BYTE_OF_PAGE_WRITE=8 CBX_AUTO_BLACKBOX="ALL" CBX_SINGLE_OUTPUT_FILE="ON" CONFIG_MODE="BASE" DEVICE_FAMILY="MAX V" ERASE_TIME=500000000 OSC_FREQUENCY=180000 PROGRAM_TIME=1600000 WIDTH_UFM_ADDRESS=9 ncs osc sck si so
//VERSION_BEGIN 22.1 cbx_a_gray2bin 2022:10:25:15:36:38:SC cbx_a_graycounter 2022:10:25:15:36:38:SC cbx_altufm_spi 2022:10:25:15:36:38:SC cbx_cycloneii 2022:10:25:15:36:38:SC cbx_lpm_add_sub 2022:10:25:15:36:38:SC cbx_lpm_compare 2022:10:25:15:36:38:SC cbx_lpm_counter 2022:10:25:15:36:38:SC cbx_lpm_decode 2022:10:25:15:36:36:SC cbx_lpm_mux 2022:10:25:15:36:38:SC cbx_maxii 2022:10:25:15:36:38:SC cbx_mgl 2022:10:25:15:36:55:SC cbx_nadder 2022:10:25:15:36:38:SC cbx_stratix 2022:10:25:15:36:38:SC cbx_stratixii 2022:10:25:15:36:38:SC cbx_util_mgl 2022:10:25:15:36:38:SC  VERSION_END
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



//synthesis_resources = a_graycounter 5 lpm_counter 1 lut 123 maxv_ufm 1 TRI 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"suppress_da_rule_internal=c101;suppress_da_rule_internal=c103;suppress_da_rule_internal=c104;suppress_da_rule_internal=c106;suppress_da_rule_internal=d101;suppress_da_rule_internal=r101;suppress_da_rule_internal=s102;suppress_da_rule_internal=s104"} *)
module  spi_bus_ufm_spi_0
	( 
	ncs,
	osc,
	sck,
	si,
	so) /* synthesis synthesis_clearbox=1 */;
	input   ncs;
	output   osc;
	input   sck;
	input   si;
	output   so;

	wire  [3:0]   wire_address_cntr_q;
	wire  [2:0]   wire_data_cntr_q;
	wire  [3:0]   wire_de_pad_cntr_q;
	wire  [2:0]   wire_op_cntr_q;
	wire  [2:0]   wire_stat_reg_cnt_q;
	reg	addr7_reg;
	wire	wire_addr7_reg_ena;
	reg	addr8_reg;
	wire	wire_addr8_reg_ena;
	reg	addr_cmplt_dly;
	reg	addr_cmplt_dly2;
	reg	addr_sload_reg;
	wire	[1:0]	wire_bp_status_d;
	reg	[1:0]	bp_status;
	wire	[1:0]	wire_bp_status_ena;
	reg	busy_detect;
	wire	wire_busy_detect_ena;
	reg	busy_reg;
	wire	wire_busy_reg_ena;
	reg	busy_reg2;
	reg	data_pdcmplt_reg;
	reg	drdin_reg;
	wire	wire_drdin_reg_ena;
	reg	end_addr_dly_reg;
	wire	wire_end_addr_dly_reg_ena;
	reg	end_addr_reg;
	wire	wire_end_addr_reg_ena;
	reg	erase_reg;
	wire	wire_erase_reg_ena;
	reg	op_cmplt_dly;
	reg	op_cmplt_dly2;
	reg	op_cnt_stage;
	reg	op_cnt_stage2;
	reg	op_code7_dly;
	wire	wire_op_code7_dly_ena;
	wire	[7:0]	wire_op_code_reg_d;
	reg	[7:0]	op_code_reg;
	wire	[7:0]	wire_op_code_reg_ena;
	wire	[7:0]	wire_op_code_streg_d;
	reg	[7:0]	op_code_streg;
	wire	[7:0]	wire_op_code_streg_ena;
	reg	program_reg;
	wire	wire_program_reg_ena;
	wire	[7:0]	wire_rd_addr_reg_d;
	reg	[7:0]	rd_addr_reg;
	wire	[7:0]	wire_rd_addr_reg_ena;
	wire	[7:0]	wire_rd_status_reg_d;
	reg	[7:0]	rd_status_reg;
	wire	[7:0]	wire_rd_status_reg_ena;
	reg	sck_handoff;
	reg	sck_handoff_dly;
	reg	sck_handoff_dly2;
	reg	sck_handoff_dly3;
	reg	start_eosc;
	reg	start_eosc2;
	reg	start_erase_reg;
	wire	wire_start_erase_reg_ena;
	reg	start_sck_ho;
	wire	wire_start_sck_ho_ena;
	reg	start_write;
	wire	[3:0]	wire_wr_status_reg_d;
	reg	[3:0]	wr_status_reg;
	wire	[3:0]	wire_wr_status_reg_ena;
	reg	wren_reg;
	wire	wire_wren_reg_ena;
	reg	wrrd_op_dly;
	wire  [7:0]   wire_read_addr_cntr_q;
	wire  wire_maxii_ufm_block1_bgpbusy;
	wire  wire_maxii_ufm_block1_busy;
	wire  wire_maxii_ufm_block1_drdout;
	wire  wire_maxii_ufm_block1_osc;
	wire	wire_tri_buf2_out;
	wire	wire_tri_buf2_oe;
	wire  addr7_high;
	wire  addr8_high;
	wire  addr_complete_dly;
	wire  addr_complete_dly2;
	wire  addr_sload;
	wire  addr_to_cmplt;
	wire  address_complete;
	wire  bp0_status;
	wire  bp1_status;
	wire  busy_dly;
	wire  chip_erase;
	wire  circuit_reset;
	wire  data_complete;
	wire  data_pad_complete;
	wire  data_pdcmplt_dly;
	wire  end_addr;
	wire  erase_pad_complete;
	wire  finish_prg_er;
	wire  init_end_addr;
	wire  ncs_wire;
	wire  op_code7;
	wire  op_complete;
	wire  op_complete_dly;
	wire  op_complete_dly2;
	wire  op_stage;
	wire oscena;
	wire  rdsr_op;
	wire  reach_addr_lim;
	wire  read_op;
	wire  sck_ho_wire;
	wire  sck_ho_wire2;
	wire  sck_ho_wire_inv;
	wire  sck_wire;
	wire  sec_erase_op;
	wire  si_wire;
	wire  so_wire;
	wire  start_drclk;
	wire  start_erase;
	wire  start_erase_osc;
	wire  start_sck_hndoff;
	wire  streg_complete;
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
	wire  wr_rd_op;
	wire  wrdi_op;
	wire  wren_op;
	wire  wren_status;
	wire  write_op;
	wire  write_protect;
	wire  wrsr_op;

	a_graycounter   address_cntr
	( 
	.aclr(circuit_reset),
	.clk_en((((~ ncs_wire) & op_complete) & (~ address_complete))),
	.clock(sck_wire),
	.q(wire_address_cntr_q),
	.qbin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.cnt_en(1'b1),
	.sclr(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		address_cntr.width = 4,
		address_cntr.lpm_type = "a_graycounter";
	a_graycounter   data_cntr
	( 
	.aclr(circuit_reset),
	.clk_en(((~ ncs_wire) & ((addr_complete_dly2 & read_op) | ((addr_complete_dly2 & write_op) & (~ data_complete))))),
	.clock(sck_wire),
	.q(wire_data_cntr_q),
	.qbin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.cnt_en(1'b1),
	.sclr(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		data_cntr.width = 3,
		data_cntr.lpm_type = "a_graycounter";
	a_graycounter   de_pad_cntr
	( 
	.aclr(op_stage),
	.clk_en(((sck_ho_wire2 & (~ data_pad_complete)) | (start_erase_osc & (~ erase_pad_complete)))),
	.clock((~ ufm_osc)),
	.q(wire_de_pad_cntr_q),
	.qbin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.cnt_en(1'b1),
	.sclr(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		de_pad_cntr.width = 4,
		de_pad_cntr.lpm_type = "a_graycounter";
	a_graycounter   op_cntr
	( 
	.aclr(circuit_reset),
	.clk_en((((~ ncs_wire) & op_stage) & (~ op_complete))),
	.clock(sck_wire),
	.q(wire_op_cntr_q),
	.qbin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.cnt_en(1'b1),
	.sclr(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		op_cntr.width = 3,
		op_cntr.lpm_type = "a_graycounter";
	a_graycounter   stat_reg_cnt
	( 
	.aclr(circuit_reset),
	.clk_en((((~ ncs_wire) & op_complete_dly) & rdsr_op)),
	.clock(sck_wire),
	.q(wire_stat_reg_cnt_q),
	.qbin()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.cnt_en(1'b1),
	.sclr(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		stat_reg_cnt.width = 3,
		stat_reg_cnt.lpm_type = "a_graycounter";
	// synopsys translate_off
	initial
		addr7_reg = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire)
		if (wire_addr7_reg_ena == 1'b1)   addr7_reg <= si_wire;
	assign
		wire_addr7_reg_ena = (((((~ ncs_wire) & wire_address_cntr_q[0]) & (~ wire_address_cntr_q[1])) & (~ wire_address_cntr_q[2])) & (~ wire_address_cntr_q[3]));
	// synopsys translate_off
	initial
		addr8_reg = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire)
		if (wire_addr8_reg_ena == 1'b1)   addr8_reg <= si_wire;
	assign
		wire_addr8_reg_ena = (((((~ ncs_wire) & (~ wire_address_cntr_q[0])) & (~ wire_address_cntr_q[1])) & (~ wire_address_cntr_q[2])) & (~ wire_address_cntr_q[3]));
	// synopsys translate_off
	initial
		addr_cmplt_dly = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) addr_cmplt_dly <= 1'b0;
		else if  (ncs_wire == 1'b0)   addr_cmplt_dly <= address_complete;
	// synopsys translate_off
	initial
		addr_cmplt_dly2 = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) addr_cmplt_dly2 <= 1'b0;
		else if  (ncs_wire == 1'b0)   addr_cmplt_dly2 <= address_complete;
	// synopsys translate_off
	initial
		addr_sload_reg = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) addr_sload_reg <= 1'b0;
		else if  (read_op == 1'b1)   addr_sload_reg <= addr_to_cmplt;
	// synopsys translate_off
	initial
		bp_status[0:0] = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire)
		if (wire_bp_status_ena[0:0] == 1'b1)   bp_status[0:0] <= wire_bp_status_d[0:0];
	// synopsys translate_off
	initial
		bp_status[1:1] = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire)
		if (wire_bp_status_ena[1:1] == 1'b1)   bp_status[1:1] <= wire_bp_status_d[1:1];
	assign
		wire_bp_status_d = {wr_status_reg[3:2]};
	assign
		wire_bp_status_ena = {2{(((~ ncs_wire) & wrsr_op) & address_complete)}};
	// synopsys translate_off
	initial
		busy_detect = 0;
	// synopsys translate_on
	always @ ( negedge busy_dly or  posedge op_stage)
		if (op_stage == 1'b1) busy_detect <= 1'b0;
		else if  (wire_busy_detect_ena == 1'b1)   busy_detect <= 1'b1;
	assign
		wire_busy_detect_ena = (ufm_program | ufm_erase);
	// synopsys translate_off
	initial
		busy_reg = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc or  posedge op_stage)
		if (op_stage == 1'b1) busy_reg <= 1'b0;
		else if  (wire_busy_reg_ena == 1'b1)   busy_reg <= ufm_busy;
	assign
		wire_busy_reg_ena = (ufm_program | ufm_erase);
	// synopsys translate_off
	initial
		busy_reg2 = 0;
	// synopsys translate_on
	always @ ( negedge ufm_osc or  posedge op_stage)
		if (op_stage == 1'b1) busy_reg2 <= 1'b0;
		else  busy_reg2 <= busy_reg;
	// synopsys translate_off
	initial
		data_pdcmplt_reg = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		  data_pdcmplt_reg <= data_pad_complete;
	// synopsys translate_off
	initial
		drdin_reg = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) drdin_reg <= 1'b0;
		else if  (wire_drdin_reg_ena == 1'b1)   drdin_reg <= si_wire;
	assign
		wire_drdin_reg_ena = ((((~ ncs_wire) & write_op) & addr_complete_dly) & (~ data_complete));
	// synopsys translate_off
	initial
		end_addr_dly_reg = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) end_addr_dly_reg <= 1'b0;
		else if  (wire_end_addr_dly_reg_ena == 1'b1)   end_addr_dly_reg <= reach_addr_lim;
	assign
		wire_end_addr_dly_reg_ena = (read_op & data_complete);
	// synopsys translate_off
	initial
		end_addr_reg = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) end_addr_reg <= 1'b0;
		else if  (wire_end_addr_reg_ena == 1'b1)   end_addr_reg <= (init_end_addr | end_addr_dly_reg);
	assign
		wire_end_addr_reg_ena = (read_op & data_complete);
	// synopsys translate_off
	initial
		erase_reg = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc or  posedge finish_prg_er)
		if (finish_prg_er == 1'b1) erase_reg <= 1'b0;
		else if  (wire_erase_reg_ena == 1'b1)   erase_reg <= 1'b1;
	assign
		wire_erase_reg_ena = (((((start_erase & erase_pad_complete) & wren_status) & (~ write_protect)) & (~ ufm_busy)) & (~ ufm_bgpbusy));
	// synopsys translate_off
	initial
		op_cmplt_dly = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_cmplt_dly <= 1'b0;
		else if  (ncs_wire == 1'b0)   op_cmplt_dly <= op_complete;
	// synopsys translate_off
	initial
		op_cmplt_dly2 = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_cmplt_dly2 <= 1'b0;
		else if  (ncs_wire == 1'b0)   op_cmplt_dly2 <= op_complete;
	// synopsys translate_off
	initial
		op_cnt_stage = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_cnt_stage <= 1'b0;
		else if  (ncs_wire == 1'b0)   op_cnt_stage <= (~ op_complete);
	// synopsys translate_off
	initial
		op_cnt_stage2 = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_cnt_stage2 <= 1'b0;
		else if  (ncs_wire == 1'b0)   op_cnt_stage2 <= op_cnt_stage;
	// synopsys translate_off
	initial
		op_code7_dly = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code7_dly <= 1'b0;
		else if  (wire_op_code7_dly_ena == 1'b1)   op_code7_dly <= op_code7;
	assign
		wire_op_code7_dly_ena = ((~ ncs_wire) & op_code7);
	// synopsys translate_off
	initial
		op_code_reg[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_reg[0:0] <= 1'b0;
		else if  (wire_op_code_reg_ena[0:0] == 1'b1)   op_code_reg[0:0] <= wire_op_code_reg_d[0:0];
	// synopsys translate_off
	initial
		op_code_reg[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_reg[1:1] <= 1'b0;
		else if  (wire_op_code_reg_ena[1:1] == 1'b1)   op_code_reg[1:1] <= wire_op_code_reg_d[1:1];
	// synopsys translate_off
	initial
		op_code_reg[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_reg[2:2] <= 1'b0;
		else if  (wire_op_code_reg_ena[2:2] == 1'b1)   op_code_reg[2:2] <= wire_op_code_reg_d[2:2];
	// synopsys translate_off
	initial
		op_code_reg[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_reg[3:3] <= 1'b0;
		else if  (wire_op_code_reg_ena[3:3] == 1'b1)   op_code_reg[3:3] <= wire_op_code_reg_d[3:3];
	// synopsys translate_off
	initial
		op_code_reg[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_reg[4:4] <= 1'b0;
		else if  (wire_op_code_reg_ena[4:4] == 1'b1)   op_code_reg[4:4] <= wire_op_code_reg_d[4:4];
	// synopsys translate_off
	initial
		op_code_reg[5:5] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_reg[5:5] <= 1'b0;
		else if  (wire_op_code_reg_ena[5:5] == 1'b1)   op_code_reg[5:5] <= wire_op_code_reg_d[5:5];
	// synopsys translate_off
	initial
		op_code_reg[6:6] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_reg[6:6] <= 1'b0;
		else if  (wire_op_code_reg_ena[6:6] == 1'b1)   op_code_reg[6:6] <= wire_op_code_reg_d[6:6];
	// synopsys translate_off
	initial
		op_code_reg[7:7] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_reg[7:7] <= 1'b0;
		else if  (wire_op_code_reg_ena[7:7] == 1'b1)   op_code_reg[7:7] <= wire_op_code_reg_d[7:7];
	assign
		wire_op_code_reg_d = {op_code_reg[6:0], si_wire};
	assign
		wire_op_code_reg_ena = {8{(((~ ncs_wire) & (~ op_complete)) & (~ ufm_bgpbusy))}};
	// synopsys translate_off
	initial
		op_code_streg[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_streg[0:0] <= 1'b0;
		else if  (wire_op_code_streg_ena[0:0] == 1'b1)   op_code_streg[0:0] <= wire_op_code_streg_d[0:0];
	// synopsys translate_off
	initial
		op_code_streg[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_streg[1:1] <= 1'b0;
		else if  (wire_op_code_streg_ena[1:1] == 1'b1)   op_code_streg[1:1] <= wire_op_code_streg_d[1:1];
	// synopsys translate_off
	initial
		op_code_streg[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_streg[2:2] <= 1'b0;
		else if  (wire_op_code_streg_ena[2:2] == 1'b1)   op_code_streg[2:2] <= wire_op_code_streg_d[2:2];
	// synopsys translate_off
	initial
		op_code_streg[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_streg[3:3] <= 1'b0;
		else if  (wire_op_code_streg_ena[3:3] == 1'b1)   op_code_streg[3:3] <= wire_op_code_streg_d[3:3];
	// synopsys translate_off
	initial
		op_code_streg[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_streg[4:4] <= 1'b0;
		else if  (wire_op_code_streg_ena[4:4] == 1'b1)   op_code_streg[4:4] <= wire_op_code_streg_d[4:4];
	// synopsys translate_off
	initial
		op_code_streg[5:5] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_streg[5:5] <= 1'b0;
		else if  (wire_op_code_streg_ena[5:5] == 1'b1)   op_code_streg[5:5] <= wire_op_code_streg_d[5:5];
	// synopsys translate_off
	initial
		op_code_streg[6:6] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_streg[6:6] <= 1'b0;
		else if  (wire_op_code_streg_ena[6:6] == 1'b1)   op_code_streg[6:6] <= wire_op_code_streg_d[6:6];
	// synopsys translate_off
	initial
		op_code_streg[7:7] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) op_code_streg[7:7] <= 1'b0;
		else if  (wire_op_code_streg_ena[7:7] == 1'b1)   op_code_streg[7:7] <= wire_op_code_streg_d[7:7];
	assign
		wire_op_code_streg_d = {op_code_streg[6:0], si_wire};
	assign
		wire_op_code_streg_ena = {8{((~ ncs_wire) & (~ op_complete))}};
	// synopsys translate_off
	initial
		program_reg = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc or  posedge finish_prg_er)
		if (finish_prg_er == 1'b1) program_reg <= 1'b0;
		else if  (wire_program_reg_ena == 1'b1)   program_reg <= data_pdcmplt_dly;
	assign
		wire_program_reg_ena = ((((sck_ho_wire & wren_status) & (~ write_protect)) & (~ ufm_busy)) & (~ ufm_bgpbusy));
	// synopsys translate_off
	initial
		rd_addr_reg[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_addr_reg[0:0] <= 1'b0;
		else if  (wire_rd_addr_reg_ena[0:0] == 1'b1)   rd_addr_reg[0:0] <= wire_rd_addr_reg_d[0:0];
	// synopsys translate_off
	initial
		rd_addr_reg[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_addr_reg[1:1] <= 1'b0;
		else if  (wire_rd_addr_reg_ena[1:1] == 1'b1)   rd_addr_reg[1:1] <= wire_rd_addr_reg_d[1:1];
	// synopsys translate_off
	initial
		rd_addr_reg[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_addr_reg[2:2] <= 1'b0;
		else if  (wire_rd_addr_reg_ena[2:2] == 1'b1)   rd_addr_reg[2:2] <= wire_rd_addr_reg_d[2:2];
	// synopsys translate_off
	initial
		rd_addr_reg[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_addr_reg[3:3] <= 1'b0;
		else if  (wire_rd_addr_reg_ena[3:3] == 1'b1)   rd_addr_reg[3:3] <= wire_rd_addr_reg_d[3:3];
	// synopsys translate_off
	initial
		rd_addr_reg[4:4] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_addr_reg[4:4] <= 1'b0;
		else if  (wire_rd_addr_reg_ena[4:4] == 1'b1)   rd_addr_reg[4:4] <= wire_rd_addr_reg_d[4:4];
	// synopsys translate_off
	initial
		rd_addr_reg[5:5] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_addr_reg[5:5] <= 1'b0;
		else if  (wire_rd_addr_reg_ena[5:5] == 1'b1)   rd_addr_reg[5:5] <= wire_rd_addr_reg_d[5:5];
	// synopsys translate_off
	initial
		rd_addr_reg[6:6] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_addr_reg[6:6] <= 1'b0;
		else if  (wire_rd_addr_reg_ena[6:6] == 1'b1)   rd_addr_reg[6:6] <= wire_rd_addr_reg_d[6:6];
	// synopsys translate_off
	initial
		rd_addr_reg[7:7] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_addr_reg[7:7] <= 1'b0;
		else if  (wire_rd_addr_reg_ena[7:7] == 1'b1)   rd_addr_reg[7:7] <= wire_rd_addr_reg_d[7:7];
	assign
		wire_rd_addr_reg_d = {rd_addr_reg[6:0], si_wire};
	assign
		wire_rd_addr_reg_ena = {8{(op_complete & (~ addr_complete_dly))}};
	// synopsys translate_off
	initial
		rd_status_reg[0:0] = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_status_reg[0:0] <= 1'b0;
		else if  (wire_rd_status_reg_ena[0:0] == 1'b1)   rd_status_reg[0:0] <= wire_rd_status_reg_d[0:0];
	// synopsys translate_off
	initial
		rd_status_reg[1:1] = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_status_reg[1:1] <= 1'b0;
		else if  (wire_rd_status_reg_ena[1:1] == 1'b1)   rd_status_reg[1:1] <= wire_rd_status_reg_d[1:1];
	// synopsys translate_off
	initial
		rd_status_reg[2:2] = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_status_reg[2:2] <= 1'b0;
		else if  (wire_rd_status_reg_ena[2:2] == 1'b1)   rd_status_reg[2:2] <= wire_rd_status_reg_d[2:2];
	// synopsys translate_off
	initial
		rd_status_reg[3:3] = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_status_reg[3:3] <= 1'b0;
		else if  (wire_rd_status_reg_ena[3:3] == 1'b1)   rd_status_reg[3:3] <= wire_rd_status_reg_d[3:3];
	// synopsys translate_off
	initial
		rd_status_reg[4:4] = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_status_reg[4:4] <= 1'b0;
		else if  (wire_rd_status_reg_ena[4:4] == 1'b1)   rd_status_reg[4:4] <= wire_rd_status_reg_d[4:4];
	// synopsys translate_off
	initial
		rd_status_reg[5:5] = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_status_reg[5:5] <= 1'b0;
		else if  (wire_rd_status_reg_ena[5:5] == 1'b1)   rd_status_reg[5:5] <= wire_rd_status_reg_d[5:5];
	// synopsys translate_off
	initial
		rd_status_reg[6:6] = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_status_reg[6:6] <= 1'b0;
		else if  (wire_rd_status_reg_ena[6:6] == 1'b1)   rd_status_reg[6:6] <= wire_rd_status_reg_d[6:6];
	// synopsys translate_off
	initial
		rd_status_reg[7:7] = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) rd_status_reg[7:7] <= 1'b0;
		else if  (wire_rd_status_reg_ena[7:7] == 1'b1)   rd_status_reg[7:7] <= wire_rd_status_reg_d[7:7];
	assign
		wire_rd_status_reg_d = {((rd_status_reg[6] & (~ streg_complete)) | ((((ufm_busy | start_sck_hndoff) | start_erase) | ufm_bgpbusy) & streg_complete)), (rd_status_reg[5] & (~ op_code7)), (rd_status_reg[4] & (~ op_code7)), (rd_status_reg[3] & (~ op_code7)), ((bp1_status & op_code7) | (rd_status_reg[2] & (~ op_code7))), ((bp0_status & op_code7) | (rd_status_reg[1] & (~ op_code7))), ((wren_status & op_code7) | (rd_status_reg[0] & (~ op_code7))), (rd_status_reg[7] & (~ op_code7))};
	assign
		wire_rd_status_reg_ena = {8{((~ ncs_wire) & ((op_complete_dly2 & rdsr_op) | op_code7))}};
	// synopsys translate_off
	initial
		sck_handoff = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc or  posedge op_stage)
		if (op_stage == 1'b1) sck_handoff <= 1'b0;
		else  sck_handoff <= start_sck_hndoff;
	// synopsys translate_off
	initial
		sck_handoff_dly = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc or  posedge op_stage)
		if (op_stage == 1'b1) sck_handoff_dly <= 1'b0;
		else  sck_handoff_dly <= sck_handoff;
	// synopsys translate_off
	initial
		sck_handoff_dly2 = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc or  posedge op_stage)
		if (op_stage == 1'b1) sck_handoff_dly2 <= 1'b0;
		else  sck_handoff_dly2 <= sck_ho_wire;
	// synopsys translate_off
	initial
		sck_handoff_dly3 = 0;
	// synopsys translate_on
	always @ ( negedge ufm_osc or  posedge op_stage)
		if (op_stage == 1'b1) sck_handoff_dly3 <= 1'b0;
		else  sck_handoff_dly3 <= sck_ho_wire2;
	// synopsys translate_off
	initial
		start_eosc = 0;
	// synopsys translate_on
	always @ ( negedge ufm_osc)
		  start_eosc <= start_erase;
	// synopsys translate_off
	initial
		start_eosc2 = 0;
	// synopsys translate_on
	always @ ( posedge ufm_osc)
		  start_eosc2 <= start_eosc;
	// synopsys translate_off
	initial
		start_erase_reg = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge finish_prg_er)
		if (finish_prg_er == 1'b1) start_erase_reg <= 1'b0;
		else if  (wire_start_erase_reg_ena == 1'b1)   start_erase_reg <= (sec_erase_op | chip_erase);
	assign
		wire_start_erase_reg_ena = (((~ ncs_wire) & (~ ufm_busy)) & (~ ufm_bgpbusy));
	// synopsys translate_off
	initial
		start_sck_ho = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge finish_prg_er)
		if (finish_prg_er == 1'b1) start_sck_ho <= 1'b0;
		else if  (wire_start_sck_ho_ena == 1'b1)   start_sck_ho <= (data_complete & write_op);
	assign
		wire_start_sck_ho_ena = (((~ ncs_wire) & (~ ufm_busy)) & (~ ufm_bgpbusy));
	// synopsys translate_off
	initial
		start_write = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) start_write <= 1'b0;
		else if  (ncs_wire == 1'b0)   start_write <= addr_complete_dly;
	// synopsys translate_off
	initial
		wr_status_reg[0:0] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire)
		if (wire_wr_status_reg_ena[0:0] == 1'b1)   wr_status_reg[0:0] <= wire_wr_status_reg_d[0:0];
	// synopsys translate_off
	initial
		wr_status_reg[1:1] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire)
		if (wire_wr_status_reg_ena[1:1] == 1'b1)   wr_status_reg[1:1] <= wire_wr_status_reg_d[1:1];
	// synopsys translate_off
	initial
		wr_status_reg[2:2] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire)
		if (wire_wr_status_reg_ena[2:2] == 1'b1)   wr_status_reg[2:2] <= wire_wr_status_reg_d[2:2];
	// synopsys translate_off
	initial
		wr_status_reg[3:3] = 0;
	// synopsys translate_on
	always @ ( posedge sck_wire)
		if (wire_wr_status_reg_ena[3:3] == 1'b1)   wr_status_reg[3:3] <= wire_wr_status_reg_d[3:3];
	assign
		wire_wr_status_reg_d = {wr_status_reg[2:0], si_wire};
	assign
		wire_wr_status_reg_ena = {4{(((~ ncs_wire) & wrsr_op) & (~ address_complete))}};
	// synopsys translate_off
	initial
		wren_reg = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire)
		if (wire_wren_reg_ena == 1'b1)   wren_reg <= (wren_op | (~ wrdi_op));
	assign
		wire_wren_reg_ena = ((~ ncs_wire) & (wren_op | wrdi_op));
	// synopsys translate_off
	initial
		wrrd_op_dly = 0;
	// synopsys translate_on
	always @ ( negedge sck_wire or  posedge circuit_reset)
		if (circuit_reset == 1'b1) wrrd_op_dly <= 1'b0;
		else if  (ncs_wire == 1'b0)   wrrd_op_dly <= (write_op | read_op);
	lpm_counter   read_addr_cntr
	( 
	.aclr(circuit_reset),
	.clk_en((addr_sload | (((((read_op & address_complete) & (~ reach_addr_lim)) & wire_data_cntr_q[2]) & wire_data_cntr_q[1]) & (~ wire_data_cntr_q[0])))),
	.clock((~ sck_wire)),
	.cout(),
	.data({rd_addr_reg[7:0]}),
	.eq(),
	.q(wire_read_addr_cntr_q),
	.sload(addr_sload)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aload(1'b0),
	.aset(1'b0),
	.cin(1'b1),
	.cnt_en(1'b1),
	.sclr(1'b0),
	.sset(1'b0),
	.updown(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		read_addr_cntr.lpm_direction = "UP",
		read_addr_cntr.lpm_port_updown = "PORT_UNUSED",
		read_addr_cntr.lpm_width = 8,
		read_addr_cntr.lpm_type = "lpm_counter";
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
	assign	wire_tri_buf2_out = (wire_tri_buf2_oe === 1'b1) ? ((ufm_drdout & read_op) | (rd_status_reg[7] & rdsr_op)) : 1'bz;
	assign
		wire_tri_buf2_oe = ((((read_op & addr_complete_dly) & (~ end_addr)) | (rdsr_op & op_complete_dly)) & (~ ncs_wire));
	assign
		addr7_high = addr7_reg,
		addr8_high = addr8_reg,
		addr_complete_dly = addr_cmplt_dly,
		addr_complete_dly2 = addr_cmplt_dly2,
		addr_sload = addr_sload_reg,
		addr_to_cmplt = ((((~ wire_address_cntr_q[0]) & (~ wire_address_cntr_q[1])) & wire_address_cntr_q[2]) & (~ wire_address_cntr_q[3])),
		address_complete = ((((~ wire_address_cntr_q[0]) & (~ wire_address_cntr_q[1])) & wire_address_cntr_q[2]) & wire_address_cntr_q[3]),
		bp0_status = bp_status[0],
		bp1_status = bp_status[1],
		busy_dly = busy_reg2,
		chip_erase = (((((((((~ op_code_reg[7]) & op_code_reg[6]) & op_code_reg[5]) & (~ op_code_reg[4])) & (~ op_code_reg[3])) & (~ op_code_reg[2])) & (~ op_code_reg[1])) & (~ op_code_reg[0])) & op_complete),
		circuit_reset = ncs_wire,
		data_complete = (((~ wire_data_cntr_q[0]) & (~ wire_data_cntr_q[1])) & wire_data_cntr_q[2]),
		data_pad_complete = ((((~ wire_de_pad_cntr_q[0]) & (~ wire_de_pad_cntr_q[1])) & wire_de_pad_cntr_q[2]) & wire_de_pad_cntr_q[3]),
		data_pdcmplt_dly = data_pdcmplt_reg,
		end_addr = end_addr_reg,
		erase_pad_complete = (((wire_de_pad_cntr_q[0] & (~ wire_de_pad_cntr_q[1])) & wire_de_pad_cntr_q[2]) & wire_de_pad_cntr_q[3]),
		finish_prg_er = busy_detect,
		init_end_addr = (((((((rd_addr_reg[7] & rd_addr_reg[6]) & rd_addr_reg[5]) & rd_addr_reg[4]) & rd_addr_reg[3]) & rd_addr_reg[2]) & rd_addr_reg[1]) & rd_addr_reg[0]),
		ncs_wire = ncs,
		op_code7 = ((wire_op_cntr_q[0] & (~ wire_op_cntr_q[1])) & wire_op_cntr_q[2]),
		op_complete = (((~ wire_op_cntr_q[0]) & (~ wire_op_cntr_q[1])) & wire_op_cntr_q[2]),
		op_complete_dly = op_cmplt_dly,
		op_complete_dly2 = op_cmplt_dly2,
		op_stage = op_cnt_stage2,
		osc = ufm_osc,
		oscena = 1'b1,
		rdsr_op = (((((((((~ op_code_streg[7]) & (~ op_code_streg[6])) & (~ op_code_streg[5])) & (~ op_code_streg[4])) & (~ op_code_streg[3])) & op_code_streg[2]) & (~ op_code_streg[1])) & op_code_streg[0]) & op_complete),
		reach_addr_lim = (((((((wire_read_addr_cntr_q[7] & wire_read_addr_cntr_q[6]) & wire_read_addr_cntr_q[5]) & wire_read_addr_cntr_q[4]) & wire_read_addr_cntr_q[3]) & wire_read_addr_cntr_q[2]) & wire_read_addr_cntr_q[1]) & wire_read_addr_cntr_q[0]),
		read_op = (((((((((((~ op_code_reg[7]) & (~ op_code_reg[6])) & (~ op_code_reg[5])) & (~ op_code_reg[4])) & (~ op_code_reg[3])) & (~ op_code_reg[2])) & op_code_reg[1]) & op_code_reg[0]) & op_complete) & (~ ufm_busy)) & (~ ufm_bgpbusy)),
		sck_ho_wire = sck_handoff_dly,
		sck_ho_wire2 = sck_handoff_dly2,
		sck_ho_wire_inv = sck_handoff_dly3,
		sck_wire = sck,
		sec_erase_op = (((((((((~ op_code_reg[7]) & (~ op_code_reg[6])) & op_code_reg[5]) & (~ op_code_reg[4])) & (~ op_code_reg[3])) & (~ op_code_reg[2])) & (~ op_code_reg[1])) & (~ op_code_reg[0])) & op_complete),
		si_wire = si,
		so = so_wire,
		so_wire = wire_tri_buf2_out,
		start_drclk = start_write,
		start_erase = start_erase_reg,
		start_erase_osc = start_eosc2,
		start_sck_hndoff = start_sck_ho,
		streg_complete = (((~ wire_stat_reg_cnt_q[0]) & (~ wire_stat_reg_cnt_q[1])) & wire_stat_reg_cnt_q[2]),
		ufm_arclk = (((((sck_wire & op_complete) & (~ addr_complete_dly)) & (write_op | read_op)) | ((wire_data_cntr_q[2] & read_op) & (~ end_addr))) | ((ufm_osc & start_erase_osc) & (~ erase_pad_complete))),
		ufm_ardin = ((((si_wire & op_complete_dly) & (~ addr_complete_dly)) & wr_rd_op) | (start_eosc & wr_rd_op)),
		ufm_arshft = (((op_code7_dly & (~ addr_complete_dly)) & (~ ufm_bgpbusy)) | start_eosc),
		ufm_bgpbusy = wire_maxii_ufm_block1_bgpbusy,
		ufm_busy = wire_maxii_ufm_block1_busy,
		ufm_drclk = (((((~ sck_wire) & read_op) & addr_complete_dly) | ((((~ sck_wire) & write_op) & start_drclk) & (~ sck_ho_wire))) | (((~ ufm_osc) & sck_ho_wire_inv) & (~ data_pdcmplt_dly))),
		ufm_drdin = (drdin_reg | (sck_ho_wire & (~ data_pdcmplt_dly))),
		ufm_drdout = wire_maxii_ufm_block1_drdout,
		ufm_drshft = ((((addr_complete_dly2 & (~ data_complete)) & read_op) | (addr_complete_dly2 & write_op)) | sck_ho_wire),
		ufm_erase = erase_reg,
		ufm_osc = wire_maxii_ufm_block1_osc,
		ufm_oscena = oscena,
		ufm_program = program_reg,
		wr_rd_op = wrrd_op_dly,
		wrdi_op = (((((((((~ op_code_streg[7]) & (~ op_code_streg[6])) & (~ op_code_streg[5])) & (~ op_code_streg[4])) & (~ op_code_streg[3])) & op_code_streg[2]) & (~ op_code_streg[1])) & (~ op_code_streg[0])) & op_complete),
		wren_op = (((((((((~ op_code_streg[7]) & (~ op_code_streg[6])) & (~ op_code_streg[5])) & (~ op_code_streg[4])) & (~ op_code_streg[3])) & op_code_streg[2]) & op_code_streg[1]) & (~ op_code_streg[0])) & op_complete),
		wren_status = wren_reg,
		write_op = (((((((((~ op_code_reg[7]) & (~ op_code_reg[6])) & (~ op_code_reg[5])) & (~ op_code_reg[4])) & (~ op_code_reg[3])) & (~ op_code_reg[2])) & op_code_reg[1]) & (~ op_code_reg[0])) & op_complete),
		write_protect = (((bp0_status & bp1_status) | (bp1_status & addr8_high)) | ((bp0_status & addr8_high) & addr7_high)),
		wrsr_op = (((((((((~ op_code_streg[7]) & (~ op_code_streg[6])) & (~ op_code_streg[5])) & (~ op_code_streg[4])) & (~ op_code_streg[3])) & (~ op_code_streg[2])) & (~ op_code_streg[1])) & op_code_streg[0]) & op_complete);
endmodule //spi_bus_ufm_spi_0
//VALID FILE
