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
		.twiddle_real(tb_twiddle_real),
		.twiddle_imaginary(tb_twiddle_imaginary),
		.output_1_real(tb_output_1_real),
		.output_1_imaginary(tb_output_1_imaginary),
		.output_2_real(tb_output_2_real),
		.output_2_imaginary(tb_output_2_imaginary)
	);	
	// Test bench process
	initial
	begin

		//Test 1

		//ARin = 5
		//AIin = 4
		//BRin = 3
		//BIin = 2
		//TRin = 1
		//TIin = 0

		//ARout = 8
		//AIout = 6
		//BRout = 2
		//BIout = 2

		load_butterfly(16'b0000010100000000, 16'b0000010000000000, 16'b0000001100000000, 16'b0000001000000000, 16'b0000000100000000 , 16'b0000000000000000);

		#(1);

		$info("Real 1 = %d | Imag 1 = %d | Real 2 = %d | Imag 2 = %d", tb_output_1_real, tb_output_1_imaginary, tb_output_2_real, tb_output_2_imaginary);

		//Test 2
	
		//ARin = 5
		//AIin = 4
		//BRin = 3
		//BIin = 2
		//TRin = 1
		//TIin = 1

		//ARout = 8
		//AIout = 6
		//BRout = 2
		//BIout = 2

		//ARout = 5
		//AIout = 17
		//BRout = 5
		//BIout = -9

		load_butterfly(16'b0000010100000000, 16'b0000010000000000, 16'b0000001100000000, 16'b0000001000000000, 16'b0000001000000000 , 16'b000001100000000);

		#(1);

		$info("Real 1 = %d | Imag 1 = %d | Real 2 = %d | Imag 2 = %d", tb_output_1_real, tb_output_1_imaginary, tb_output_2_real, tb_output_2_imaginary);

		//Test 3

		//ARin = -3
		//AIin = 0.25
		//BRin = 1
		//BIin = 8
		//TRin = 0.5
		//TIin = 1

		//ARout = 1.5
		//AIout = 3.75
		//BRout = -7.5
		//BIout = -3.25

		load_butterfly(16'b1000001100000000, 16'b0000000001000000, 16'b0000000100000000, 16'b0000100000000000, 16'b0000000010000000 , 16'b1000000010000000);

		#(1);

		$info("Real 1 = %d | Imag 1 = %d | Real 2 = %d | Imag 2 = %d", tb_output_1_real, tb_output_1_imaginary, tb_output_2_real, tb_output_2_imaginary);


		//Test 4

		//ARin = 0
		//AIin = 0
		//BRin = 0
		//BIin = 0
		//TRin = 0
		//TIin = 0

		//ARout = 0
		//AIout = 0
		//BRout = 0
		//BIout = 0

		load_butterfly(16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000 , 16'b0000000000000000);

		#(1);

		$info("Real 1 = %d | Imag 1 = %d | Real 2 = %d | Imag 2 = %d", tb_output_1_real, tb_output_1_imaginary, tb_output_2_real, tb_output_2_imaginary);

		//Test 5

		//ARin = -3.125
		//AIin = 4
		//BRin = 0
		//BIin = 6
		//TRin = 1
		//TIin = 1.5

		//ARout = 0
		//AIout = 0
		//BRout = 0
		//BIout = 0

		load_butterfly(16'b1000001100100000, 16'b0000010000000000, 16'b0000000000000000, 16'b0000011000000000, 16'b0000000100000000 , 16'b0000000110000000);

		#(1);

		$info("Real 1 = %d | Imag 1 = %d | Real 2 = %d | Imag 2 = %d", tb_output_1_real, tb_output_1_imaginary, tb_output_2_real, tb_output_2_imaginary);

	end

endmodule
