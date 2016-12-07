// $Id: $
// File name:   tb_butterfly_blcok.sv
// Created:     11/4/2016
// Author:      Luke McBee
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: test bench for butterfly block

`timescale 1ns/10ps

module tb_butterfly_block();

	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	integer tb_test_case;

	// Test bench dut port signals
	reg [15:0] tb_input_1_real;
	reg [15:0] tb_input_1_imaginary;
	reg [15:0] tb_input_2_real;
	reg [15:0] tb_input_2_imaginary;
	reg [15:0] tb_twiddle_real;
	reg [15:0] tb_twiddle_imaginary;
	reg [15:0] tb_output_1_real;
	reg [15:0] tb_output_1_imaginary;
	reg [15:0] tb_output_2_real;
	reg [15:0] tb_output_2_imaginary;
	
	
	// Test bench verification signals
	//integer tb_test_case_num;
	//reg expected_output;
	//reg tb_prev_mid;
	//reg tb_prev_fin;

	//reg [7:0] byte_data;

	task load_butterfly;
		input logic [15:0] real_1;
		input logic [15:0] imag_1;
		input logic [15:0] real_2;
		input logic [15:0] imag_2;
		input logic [15:0] twid_r;
		input logic [15:0] twid_i;
	begin
		tb_input_1_real = real_1;
		tb_input_1_imaginary = imag_1;
		tb_input_2_real = real_2;
		tb_input_2_imaginary = imag_2;
		tb_twiddle_real = twid_r;
		tb_twiddle_imaginary = twid_i;
	end
	endtask
	
	// DUT portmap
	butterfly_block DUT(
		.input_1_real(tb_input_1_real),
		.input_1_imaginary(tb_input_1_imaginary),
		.input_2_real(tb_input_2_real),
		.input_2_imaginary(tb_input_2_imaginary),
		.frequency(tb_frequency),
		.output_1_real(tb_output_1_real),
		.output_1_imaginary(tb_output_1_imaginary),
		.output_2_real(tb_output_2_real),
		.output_2_imaginary(tb_output_2_imaginary)
	);	
	// Test bench process
	initial
	begin
		tb_test_case =0;
		for(tb_test_case = 0; tb_test_case < 10;tb_test_case = tb_test_case+1)
	begin
		$info("input values: %d + i%d and %d + i%d",tb	
		load_butterfly(5, 4, 3, 2, 2 , 1);

		#(1);

		$info("Real 1 = %d | Imag 1 = %d | Real 2 = %d | Imag 2 = %d", tb_output_1_real, tb_output_1_imaginary, tb_output_2_real, tb_output_2_imaginary);
	end

	end

endmodule
