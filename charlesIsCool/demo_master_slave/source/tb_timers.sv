// $Id: $
// File name:   tb_timers.sv
// Created:     11/25/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Test bench for all timers
`timescale 1ns / 100ps

module tb_timers
();
	// Testbench parameters
	localparam CLK_PERIOD = 2.5;

	// DUT portmap signals
	reg tb_clk;
	reg tb_n_rst;
	reg tb_shift_in_ena;
	reg tb_shift_out_ena;
	reg tb_iteration_ena;
	//reg tb_stage_ena;

	reg [3:0] tb_samples_in_count;
	reg [2:0] tb_samples_loaded_count;
	reg tb_samples_in_done;
	reg tb_samples_out_done;
	reg tb_fft_done;
	reg [3:0] tb_iteration_count;
	reg [2:0] tb_stage_count;
	reg [2:0] tb_samples_out_count;
	reg [1:0] tb_samples_written_count;
	reg tb_iteration_done;
	reg tb_samples_loaded_done;
	reg tb_samples_written_done;

	// Testbench signals
	integer tb_test_case = 0;

	// Device under test
	timers DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.shift_in_ena(tb_shift_in_ena),
		.shift_out_ena(tb_shift_out_ena),
		.iteration_ena(tb_iteration_ena),
		//.stage_ena(tb_stage_ena),
		.samples_in_count(tb_samples_in_count),
		.samples_loaded_count(tb_samples_loaded_count),
		.samples_in_done(tb_samples_in_done),
		.samples_out_done(tb_samples_out_done),
		.fft_done(tb_fft_done),
		.iteration_count(tb_iteration_count),
		.stage_count(tb_stage_count),
		.samples_out_count(tb_samples_out_count),
		.samples_written_count(tb_samples_written_count),
		.iteration_done(tb_iteration_done),
		.samples_loaded_done(tb_samples_loaded_done),
		.samples_written_done(tb_samples_written_done)
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
		tb_shift_in_ena = 1'b0;
		tb_shift_out_ena = 1'b0;
		tb_iteration_ena = 1'b0;
		//tb_stage_ena = 1'b0;
		// Wait a couple clock cycles before starting tests
		@(posedge tb_clk);
		@(posedge tb_clk);

		reset_dut;

		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_shift_in_ena = 1'b1;

		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_shift_in_ena = 1'b0;
		tb_shift_out_ena = 1'b1;
		tb_iteration_ena = 1'b1;
		//tb_stage_ena = 1'b1;
	end
endmodule
