// $Id: $
// File name:   tb_address_output.sv
// Created:     11/24/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Test bench for output address
`timescale 1ns / 100ps

module tb_address_output
();
	// Testbench parameters
	localparam CLK_PERIOD = 2.5;

	// DUT portmap signals
	reg tb_clk;
	reg tb_n_rst;
	reg [1:0] tb_input_mode;
	reg [4:0] tb_samples_in_count;
	reg [4:0] tb_samples_out_count;
	reg [3:0] tb_iteration_count;
	reg [2:0] tb_stage_count;
	
	reg [9:0] tb_a_real;
	reg [9:0] tb_a_imag;
	reg [9:0] tb_b_real;
	reg [9:0] tb_b_imag;



	// Testbench signals
	integer tb_test_case = 0;

	// Device under test
	address_output DUT (
		.clk(tb_clk),
		.nrst(tb_n_rst),
		.input_mode(tb_input_mode),
		.samples_in_count(tb_samples_in_count),
		.samples_out_count(tb_samples_out_count),
		.iteration_count(tb_iteration_count),
		.stage_count(tb_stage_count),
		.a_real(tb_a_real),
		.a_imag(tb_a_imag),
		.b_real(tb_b_real),
		.b_imag(tb_b_imag)
	);
	// Clock procedure
	always begin
		tb_clk <= 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk <= 1'b1;
		#(CLK_PERIOD/2.0);
	end

	// Task to reset DUT
	task reset_dut;
		begin
			@(negedge tb_clk);
			tb_n_rst = 1'b0;
			@(posedge tb_clk);
			@(posedge tb_clk);
			//@(posedge tb_clk);
			//@(posedge tb_clk);
			//#1;
			@(negedge tb_clk);
			tb_n_rst = 1'b1;
		end
	endtask
	
	// Task to check output value
	task test_output;
		input expected_output;
		begin
			
			@(posedge tb_clk);
			tb_test_case += 1;
			#(1);
		end
	endtask
	
	// Tests
	initial begin
		// Initialize inputs
		tb_n_rst = 1'b1;
		tb_input_mode = 2'b00;
		tb_samples_in_count = 0;
		tb_samples_out_count = 0;
		tb_iteration_count = 0;
		tb_stage_count = 0;

		// Wait a couple clock cycles before starting tests
		@(posedge tb_clk);
		@(posedge tb_clk);

		reset_dut;

		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_input_mode = 2'b01;
		tb_samples_in_count = 0;
		tb_iteration_count = 0;
		tb_stage_count = 0;

		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_input_mode = 2'b01;
		tb_samples_in_count = 1;
		tb_iteration_count = 0;
		tb_stage_count = 0;

		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_input_mode = 2'b01;
		tb_samples_in_count = 7;
		tb_iteration_count = 15;
		tb_stage_count = 0;

		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_input_mode = 2'b01;
		tb_samples_in_count = 7;
		tb_iteration_count = 15;
		tb_stage_count = 7;
	end
endmodule
