// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     10/11/2016
// Author:      Luke McBee
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: test bench for usb receiver

`timescale 1ns/10ps

module tb_no_iter();

	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals
	// Test bench dut port signals
	reg tb_clk;
	reg tb_n_rst;
	reg tb_iteration_strobe;
	reg tb_stage_strobe;
	reg [4:0] tb_iteration_count_out;

	task reset_dut;
	begin
		// Activate the design's reset (does not need to be synchronize with clock)
		tb_n_rst = 1'b0;
		
		// Wait for a couple clock cycles
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		// Release the reset
		@(negedge tb_clk);
		tb_n_rst = 1;
		
		// Wait for a while before activating the design
		@(posedge tb_clk);
		@(posedge tb_clk);
	end
	endtask


	// Clock gen block
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end

	// DUT portmap
	no_iter DUT(
		.clk(tb_clk),
		.n_reset(tb_n_rst),
		.iteration_strobe(tb_iteration_strobe),
		.stage_strobe(tb_stage_strobe),
		.iteration_count_out(tb_iteration_count_out)
	);	
	// Test bench process
	initial
	begin
		tb_iteration_strobe = 0;
		reset_dut;
		for(int i = 0; i < 100; i++)
		begin
			@(posedge tb_clk);
			tb_iteration_strobe = 1'b0;
			@(posedge tb_clk);
			tb_iteration_strobe = 1'b1;
		end
		
		

	end

endmodule
