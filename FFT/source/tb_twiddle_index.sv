// $Id: $
// File name:   tb_twiddle_index.sv
// Created:     11/23/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Test Bench for twiddle index
`timescale 1ns / 100ps

module tb_twiddle_index
();
	// Testbench parameters
	localparam CLK_PERIOD = 2.5;

	// DUT portmap signals
	reg tb_clk;
	reg tb_n_rst;
	reg [2:0] tb_stage_count_out;
	reg [2:0] tb_index_val;
	
	// Testbench signals
	integer tb_test_case = 0;
	reg expected_index_val;

	// Device under test
	twiddle_index DUT (
		.clk(tb_clk),
		.nrst(tb_n_rst),
		.stage_count_out(tb_stage_count_out),
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

		// Wait a couple clock cycles before starting tests
		@(posedge tb_clk);
		@(posedge tb_clk);

		reset_dut;

		//Test Case 1 - Stage 1
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_stage_count_out = 0;
		expected_index_val = 0;
		test_output(expected_index_val);

		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_stage_count_out = 1;
		expected_index_val = 0;
		test_output(expected_index_val);

	end
endmodule
