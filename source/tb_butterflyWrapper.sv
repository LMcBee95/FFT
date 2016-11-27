`timescale 1ns/10ps

module tb_butterflyWrapper();

	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals
	reg [15:0] tb_input_1_real;
	reg [15:0] tb_input_1_imaginary;
	reg [15:0] tb_input_2_real;
	reg [15:0] tb_input_2_imaginary;
	reg [15:0] tb_twiddle1_real;
	reg [15:0] tb_twiddle1_imaginary;

	
	reg [15:0] tb_input_3_real;
	reg [15:0] tb_input_3_imaginary;
	reg [15:0] tb_input_4_real;
	reg [15:0] tb_input_4_imaginary;
	reg [15:0] tb_twiddle2_real; 
	reg [15:0] tb_twiddle2_imaginary;
	
	reg [15:0] tb_input_5_real;
	reg [15:0] tb_input_5_imaginary;
	reg [15:0] tb_input_6_real;
	reg [15:0] tb_input_6_imaginary;
	reg [15:0] tb_twiddle3_real; 
	reg [15:0] tb_twiddle3_imaginary;

	reg [15:0] tb_input_7_real;
	reg [15:0] tb_input_7_imaginary;
	reg [15:0] tb_input_8_real;
	reg [15:0] tb_input_8_imaginary;
	reg [15:0] tb_twiddle4_real; 
	reg [15:0] tb_twiddle4_imaginary;
	
	reg [15:0] tb_input_9_real;
	reg [15:0] tb_input_9_imaginary;
	reg [15:0] tb_input_10_real;
	reg [15:0] tb_input_10_imaginary;
	reg [15:0] tb_twiddle5_real; 
	reg [15:0] tb_twiddle5_imaginary;
	
	reg [15:0] tb_input_11_real;
	reg [15:0] tb_input_11_imaginary;
	reg [15:0] tb_input_12_real;
	reg [15:0] tb_input_12_imaginary;
	reg [15:0] tb_twiddle6_real; 
	reg [15:0] tb_twiddle6_imaginary;
	
	reg [15:0] tb_input_13_real;
	reg [15:0] tb_input_13_imaginary;
	reg [15:0] tb_input_14_real;
	reg [15:0] tb_input_14_imaginary;
	reg [15:0] tb_twiddle7_real; 
	reg [15:0] tb_twiddle7_imaginary;
	
	reg [15:0] tb_input_15_real;
	reg [15:0] tb_input_15_imaginary;
	reg [15:0] tb_input_16_real;
	reg [15:0] tb_input_16_imaginary;
	reg [15:0] tb_twiddle8_real; 
	reg [15:0] tb_twiddle8_imaginary;
	
	reg [15:0] tb_output_1_real;
	reg [15:0] tb_output_1_imaginary;
	reg [15:0] tb_output_2_real;
	reg [15:0] tb_output_2_imaginary;
	reg [15:0] tb_output_3_real;
	reg [15:0] tb_output_3_imaginary;
	reg [15:0] tb_output_4_real;
	reg [15:0] tb_output_4_imaginary;
	reg [15:0] tb_output_5_real;
	reg [15:0] tb_output_5_imaginary;
	reg [15:0] tb_output_6_real;
	reg [15:0] tb_output_6_imaginary;
	reg [15:0] tb_output_7_real;
	reg [15:0] tb_output_7_imaginary;
	reg [15:0] tb_output_8_real;
	reg [15:0] tb_output_8_imaginary;
	
	reg [15:0] tb_output_9_real;
	reg [15:0] tb_output_9_imaginary;
	reg [15:0] tb_output_10_real;
	reg [15:0] tb_output_10_imaginary;
	reg [15:0] tb_output_11_real;
	reg [15:0] tb_output_11_imaginary;
	reg [15:0] tb_output_12_real;
	reg [15:0] tb_output_12_imaginary;
	reg [15:0] tb_output_13_real;
	reg [15:0] tb_output_13_imaginary;
	reg [15:0] tb_output_14_real;
	reg [15:0] tb_output_14_imaginary;
	reg [15:0] tb_output_15_real;
	reg [15:0] tb_output_15_imaginary;
	reg [15:0] tb_output_16_real;
	reg [15:0] tb_output_16_imaginary;
	
	task load_butterfly1;
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
	
	task load_butterfly2;
		input logic [15:0] real_3;
		input logic [15:0] imag_3;
		input logic [15:0] real_4;
		input logic [15:0] imag_4;
		input logic [15:0] twid2_r;
		input logic [15:0] twid2_i;
	begin
		tb_input_3_real = real_3;
		tb_input_3_imaginary = imag_3;
		tb_input_4_real = real_4;
		tb_input_4_imaginary = imag_4;
		tb_twiddle2_real = twid2_r;
		tb_twiddle2_imaginary = twid2_i;
	end
	endtask
	
	task load_butterfly3;
		input logic [15:0] real_5;
		input logic [15:0] imag_5;
		input logic [15:0] real_6;
		input logic [15:0] imag_6;
		input logic [15:0] twid3_r;
		input logic [15:0] twid3_i;
	begin
		tb_input_5_real = real_5;
		tb_input_5_imaginary = imag_5;
		tb_input_6_real = real_6;
		tb_input_6_imaginary = imag_6;
		tb_twiddle3_real = twid3_r;
		tb_twiddle3_imaginary = twid3_i;
	end
	endtask
	
	task load_butterfly4;
		input logic [15:0] real_7;
		input logic [15:0] imag_7;
		input logic [15:0] real_8;
		input logic [15:0] imag_8;
		input logic [15:0] twid4_r;
		input logic [15:0] twid4_i;
	begin
		tb_input_7_real = real_7;
		tb_input_7_imaginary = imag_7;
		tb_input_8_real = real_8;
		tb_input_8_imaginary = imag_8;
		tb_twiddle4_real = twid4_r;
		tb_twiddle4_imaginary = twid4_i;
	end
	endtask
	
	task load_butterfly5;
		input logic [15:0] real_9;
		input logic [15:0] imag_9;
		input logic [15:0] real_10;
		input logic [15:0] imag_10;
		input logic [15:0] twid5_r;
		input logic [15:0] twid5_i;
	begin
		tb_input_9_real = real_9;
		tb_input_9_imaginary = imag_9;
		tb_input_10_real = real_10;
		tb_input_10_imaginary = imag_10;
		tb_twiddle5_real = twid5_r;
		tb_twiddle5_imaginary = twid5_i;
	end
	endtask
	
	task load_butterfly6;
		input logic [15:0] real_11;
		input logic [15:0] imag_11;
		input logic [15:0] real_12;
		input logic [15:0] imag_12;
		input logic [15:0] twid6_r;
		input logic [15:0] twid6_i;
	begin
		tb_input_11_real = real_11;
		tb_input_11_imaginary = imag_11;
		tb_input_12_real = real_12;
		tb_input_12_imaginary = imag_12;
		tb_twiddle6_real = twid6_r;
		tb_twiddle6_imaginary = twid6_i;
	end
	endtask
	
	task load_butterfly7;
		input logic [15:0] real_13;
		input logic [15:0] imag_13;
		input logic [15:0] real_14;
		input logic [15:0] imag_14;
		input logic [15:0] twid7_r;
		input logic [15:0] twid7_i;
	begin
		tb_input_13_real = real_13;
		tb_input_13_imaginary = imag_13;
		tb_input_14_real = real_14;
		tb_input_14_imaginary = imag_14;
		tb_twiddle7_real = twid7_r;
		tb_twiddle7_imaginary = twid7_i;
	end
	endtask
	
	task load_butterfly8;
		input logic [15:0] real_15;
		input logic [15:0] imag_15;
		input logic [15:0] real_16;
		input logic [15:0] imag_16;
		input logic [15:0] twid8_r;
		input logic [15:0] twid8_i;
	begin
		tb_input_15_real = real_15;
		tb_input_15_imaginary = imag_15;
		tb_input_16_real = real_16;
		tb_input_16_imaginary = imag_16;
		tb_twiddle8_real = twid8_r;
		tb_twiddle8_imaginary = twid8_i;
	end
	endtask
	
	// DUT portmap
	butterfly_block DUT(
		.input_1_real(tb_input_1_real),
		.input_1_imaginary(tb_input_1_imaginary),
		.input_2_real(tb_input_2_real),
		.input_2_imaginary(tb_input_2_imaginary),
		.twiddle1_real(tb_twiddle1_real),
		.twiddle1_imaginary(tb_twiddle1_imaginary),
		.output_1_real(tb_output_1_real),
		.output_1_imaginary(tb_output_1_imaginary),
		.output_2_real(tb_output_2_real),
		.output_2_imaginary(tb_output_2_imaginary),
		
		.input_3_real(tb_input_3_real),
		.input_3_imaginary(tb_input_3_imaginary),
		.input_4_real(tb_input_4_real),
		.input_4_imaginary(tb_input_4_imaginary),
		.twiddle2_real(tb_twiddle2_real), 
		.twiddle2_imaginary(tb_twiddle2_imaginary),
		
		.input_5_real(tb_input_5_real),
		.input_5_imaginary(tb_input_5_imaginary),
		.input_6_real(tb_input_6_real),
		.input_6_imaginary(tb_input_6_imaginary),
		.twiddle3_real(tb_twiddle3_real), 
		.twiddle3_imaginary(tb_twiddle3_imaginary),

		.input_7_real(tb_input_7_real),
		.input_7_imaginary(tb_input_7_imaginary),
		.input_8_real(tb_input_8_real),
		.input_8_imaginary(tb_input_8_imaginary),
		.twiddle4_real(tb_twiddle4_real), 
		.twiddle4_imaginary(tb_twiddle4_imaginary),
		
		.input_9_real(tb_input_9_real),
		.input_9_imaginary(tb_input_9_imaginary),
		.input_10_real(tb_input_10_real),
		.input_10_imaginary(tb_input_10_imaginary),
		.twiddle5_real(tb_twiddle5_real), 
		.twiddle5_imaginary(tb_twiddle5_imaginary),
		
		.input_11_real(tb_input_11_real),
		.input_11_imaginary(tb_input_11_imaginary),
		.input_12_real(tb_input_12_real),
		.input_12_imaginary(tb_input_12_imaginary),
		.twiddle6_real(tb_twiddle6_real),
		.twiddle6_imaginary(tb_twiddle6_imaginary),
		
		.input_13_real(tb_input_13_real),
		.input_13_imaginary(tb_input_13_imaginary),
		.input_14_real(tb_input_14_real),
		.input_14_imaginary(tb_input_14_imaginary),
		.twiddle7_real(tb_twiddle7_real), 
		.twiddle7_imaginary(tb_twiddle7_imaginary),
		
		.input_15_real(tb_input_15_real),
		.input_15_imaginary(tb_input_15_imaginary),
		.input_16_real(tb_input_16_real),
		.input_16_imaginary(tb_input_16_imaginary),
		.twiddle8_real(tb_twiddle8_real), 
		.twiddle8_imaginary(tb_twiddle8_imaginary),
		
		.output_3_real(tb_output_3_real),
		.output_3_imaginary(tb_output_3_imaginary),
		.output_4_real(tb_output_4_real),
		.output_4_imaginary(tb_output_4_imaginary),
		.output_5_real(tb_output_5_real),
		.output_5_imaginary(tb_output_5_imaginary),
		.output_6_real(tb_output_6_real),
		.output_6_imaginary(tb_output_6_imaginary),
		.output_7_real(tb_output_7_real),
		.output_7_imaginary(tb_output_7_imaginary),
		.output_8_real(tb_output_8_real),
		.output_8_imaginary(tb_output_8_imaginary),
		
		.output_9_real(tb_output_9_real),
		.output_9_imaginary(tb_output_9_imaginary),
		.output_10_real(tb_output_10_real),
		.output_10_imaginary(tb_output_10_imaginary),
		.output_11_real(tb_output_11_real),
		.output_11_imaginary(tb_output_11_imaginary),
		.output_12_real(tb_output_12_real),
		.output_12_imaginary(tb_output_12_imaginary),
		.output_13_real(tb_output_13_real),
		.output_13_imaginary(tb_output_13_imaginary),
		.output_14_real(tb_output_14_real),
		.output_14_imaginary(tb_output_14_imaginary),
		.output_15_real(tb_output_15_real),
		.output_15_imaginary(tb_output_15_imaginary),
		.output_16_real(tb_output_16_real),
		.output_16_imaginary(tb_output_61_imaginary)
		
	);	
	// Test bench process
	initial
	begin
		load_butterfly1(5, 4, 3, 2, 2 , 1);
		load_butterfly2(5, 4, 3, 2, 2 , 1);
		load_butterfly3(5, 4, 3, 2, 2 , 1);
		load_butterfly4(5, 4, 3, 2, 2 , 1);
		load_butterfly5(5, 4, 3, 2, 2 , 1);
		load_butterfly6(5, 4, 3, 2, 2 , 1);
		load_butterfly7(5, 4, 3, 2, 2 , 1);
		load_butterfly8(5, 4, 3, 2, 2 , 1);

		#(1);

		$info("Real 1 = %d | Imag 1 = %d | Real 2 = %d | Imag 2 = %d", tb_output_1_real, tb_output_1_imaginary, tb_output_2_real, tb_output_2_imaginary);
		$info("Real 3 = %d | Imag 3 = %d | Real 4 = %d | Imag 4 = %d", tb_output_3_real, tb_output_3_imaginary, tb_output_4_real, tb_output_4_imaginary);
		$info("Real 5 = %d | Imag 5 = %d | Real 6 = %d | Imag 6 = %d", tb_output_5_real, tb_output_5_imaginary, tb_output_6_real, tb_output_6_imaginary);
		$info("Real 7 = %d | Imag 7 = %d | Real 8 = %d | Imag 8 = %d", tb_output_7_real, tb_output_7_imaginary, tb_output_8_real, tb_output_8_imaginary);
		$info("Real 9 = %d | Imag 9 = %d | Real 10 = %d | Imag 10 = %d", tb_output_9_real, tb_output_9_imaginary, tb_output_10_real, tb_output_10_imaginary);
		$info("Real 11 = %d | Imag 11 = %d | Real 12 = %d | Imag 12 = %d", tb_output_11_real, tb_output_11_imaginary, tb_output_12_real, tb_output_12_imaginary);
		$info("Real 13 = %d | Imag 13 = %d | Real 14 = %d | Imag 14 = %d", tb_output_13_real, tb_output_13_imaginary, tb_output_14_real, tb_output_14_imaginary);
		$info("Real 15 = %d | Imag 15 = %d | Real 16 = %d | Imag 16 = %d", tb_output_15_real, tb_output_15_imaginary, tb_output_16_real, tb_output_16_imaginary);

		@(negedge tb_clk);
		@(negedge tb_clk);
		load_butterfly1(1, 2, 3, 4, 5, 6);
		load_butterfly2(7, 8, 9, 10, 11, 12);
		load_butterfly3(13, 14, 15, 16, 17, 18);
		load_butterfly4(19, 20, 21, 22, 23, 24);
		load_butterfly5(25, 26, 27, 28, 29, 30);
		load_butterfly6(31, 32, 33, 34, 35, 36);
		load_butterfly7(37, 38, 39, 40, 41, 42);
		load_butterfly8(43, 44, 45, 46, 47, 48);

		#(1);

		$info("Real 1 = %d | Imag 1 = %d | Real 2 = %d | Imag 2 = %d", tb_output_1_real, tb_output_1_imaginary, tb_output_2_real, tb_output_2_imaginary);
		$info("Real 3 = %d | Imag 3 = %d | Real 4 = %d | Imag 4 = %d", tb_output_3_real, tb_output_3_imaginary, tb_output_4_real, tb_output_4_imaginary);
		$info("Real 5 = %d | Imag 5 = %d | Real 6 = %d | Imag 6 = %d", tb_output_5_real, tb_output_5_imaginary, tb_output_6_real, tb_output_6_imaginary);
		$info("Real 7 = %d | Imag 7 = %d | Real 8 = %d | Imag 8 = %d", tb_output_7_real, tb_output_7_imaginary, tb_output_8_real, tb_output_8_imaginary);
		$info("Real 9 = %d | Imag 9 = %d | Real 10 = %d | Imag 10 = %d", tb_output_9_real, tb_output_9_imaginary, tb_output_10_real, tb_output_10_imaginary);
		$info("Real 11 = %d | Imag 11 = %d | Real 12 = %d | Imag 12 = %d", tb_output_11_real, tb_output_11_imaginary, tb_output_12_real, tb_output_12_imaginary);
		$info("Real 13 = %d | Imag 13 = %d | Real 14 = %d | Imag 14 = %d", tb_output_13_real, tb_output_13_imaginary, tb_output_14_real, tb_output_14_imaginary);
		$info("Real 15 = %d | Imag 15 = %d | Real 16 = %d | Imag 16 = %d", tb_output_15_real, tb_output_15_imaginary, tb_output_16_real, tb_output_16_imaginary);
		
	end
endmodule