// $Id: $
// File name:   tb_address_order.sv
// Created:     11/24/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Test bench for address orders
`timescale 1ns / 100ps

module tb_address_order
();
	// Testbench parameters
	localparam CLK_PERIOD = 2.5;

	// DUT portmap signals
	reg tb_clk;
	reg tb_n_rst;
	reg [9:0] tb_a_real;
	reg [9:0] tb_a_imag;
	reg [9:0] tb_b_real;
	reg [9:0] tb_b_imag;
	reg [2:0] tb_samples_loaded_count;

	reg [9:0] tb_output_address;

	// Testbench signals
	integer tb_test_case = 0;

	// Device under test
	address_order DUT (
		.clk(tb_clk),
		.nrst(tb_n_rst),
		.a_real(tb_a_real),
		.a_imag(tb_a_imag),
		.b_real(tb_b_real),
		.b_imag(tb_b_imag),
		.samples_loaded_count(tb_samples_loaded_count),
		.output_address(tb_output_address)
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
		tb_a_real = 10'b0;
		tb_a_imag = 10'b0;
		tb_b_real = 10'b0;
		tb_b_imag = 10'b0;
		tb_samples_loaded_count = 3'b0;

		// Wait a couple clock cycles before starting tests
		@(posedge tb_clk);
		@(posedge tb_clk);

		reset_dut;

		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_a_real = 10'b1;
		tb_a_imag = 10'd10;
		tb_b_real = 10'd128;
		tb_b_imag = 10'd511;
//testing various signals to be loaded
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_samples_loaded_count = 1;

		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_samples_loaded_count = 2;

		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_samples_loaded_count = 3;

		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_samples_loaded_count = 4;
	end
endmodule
