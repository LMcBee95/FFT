// $Id: $
// File name:   tb_twiddle_index2.sv
// Created:     11/23/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Test Bench 2
`timescale 1ns / 100ps

module tb_twiddle_index2
();
	// Testbench parameters
	localparam CLK_PERIOD = 2.5;

	// DUT portmap signals
	reg tb_clk;
	reg tb_n_rst;
	reg [2:0] tb_stage_count_out;
	reg tb_k_enable;
	reg tb_k_clear;
	reg [6:0] tb_index_val;
	
	// Testbench signals
	integer tb_test_case = 0;
	reg expected_index_val;

	// Device under test
	twiddle_index2 DUT (
		.clk(tb_clk),
		.nrst(tb_n_rst),
		.stage_count_out(tb_stage_count_out),
		.k_enable(tb_k_enable),
		.k_clear(tb_k_clear),
		.index_val(tb_index_val)
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
		input expected_index_val;
		begin
			
			@(posedge tb_clk);
			tb_test_case += 1;
			#(1);

			if(expected_index_val == tb_index_val) begin
				$info("Test Case #%0d Had a correct index value", tb_test_case);
			end
			else begin
				$error("ERROR Test Case #%0d Had an incorrect index. Expected: %0d, Got: %0d", tb_test_case, expected_index_val, tb_index_val);
			end
		end
	endtask
	
	// Tests
	initial begin
		// Initialize inputs
		tb_n_rst = 1'b1;
		tb_stage_count_out = 0;
		tb_k_enable = 0;
		tb_k_clear = 0;

		// Wait a couple clock cycles before starting tests
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_stage_count_out = 0;
		reset_dut;

		//Test Case 1 - Stage 1
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		tb_k_clear = 1'b1;
		@(posedge tb_clk);
		tb_k_clear = 1'b0;
		@(posedge tb_clk);
		
		tb_k_enable = 1'b1;
		@(posedge tb_clk);
		tb_k_enable = 1'b0;
		expected_index_val = 0;
		test_output(expected_index_val);

		//Stage 2
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_stage_count_out = 1;
		tb_k_clear = 1'b1;
		tb_k_enable = 1'b1;

		@(posedge tb_clk);
		tb_k_clear = 1'b0;
		tb_k_enable = 1'b0;
		@(posedge tb_clk);
		
		expected_index_val = 1;
		test_output(expected_index_val);

		@(posedge tb_clk);
		@(posedge tb_clk);		
		tb_k_enable = 1'b1;
		@(posedge tb_clk);
		tb_k_enable = 1'b0;

		@(posedge tb_clk);
		@(posedge tb_clk);		
		tb_k_enable = 1'b1;
		@(posedge tb_clk);
		tb_k_enable = 1'b0;

		
		//Stage 3
		@(posedge tb_clk);
		tb_stage_count_out = 2;
		tb_k_clear = 1'b1;
		tb_k_enable = 1'b1;
		@(posedge tb_clk);
		tb_k_clear = 1'b0;
		tb_k_enable = 1'b0;

		@(posedge tb_clk);
		@(posedge tb_clk);		
		tb_k_enable = 1'b1;
		@(posedge tb_clk);
		tb_k_enable = 1'b0;

		@(posedge tb_clk);
		@(posedge tb_clk);		
		tb_k_enable = 1'b1;
		@(posedge tb_clk);
		tb_k_enable = 1'b0;

		@(posedge tb_clk);
		@(posedge tb_clk);		
		tb_k_enable = 1'b1;
		@(posedge tb_clk);
		tb_k_enable = 1'b0;

		@(posedge tb_clk);
		@(posedge tb_clk);		
		tb_k_enable = 1'b1;
		@(posedge tb_clk);
		tb_k_enable = 1'b0;

		//Stage 4
		@(posedge tb_clk);
		tb_stage_count_out = 3;
		tb_k_clear = 1'b1;
		tb_k_enable = 1'b1;
		@(posedge tb_clk);
		tb_k_clear = 1'b0;
		tb_k_enable = 1'b0;

		//Stage 8
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_stage_count_out = 7;
		tb_k_clear = 1'b1;
		tb_k_enable = 1'b1;
		@(posedge tb_clk);
		tb_k_clear = 1'b0;
	

	end
endmodule
