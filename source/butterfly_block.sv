// $Id: $
// File name:   butterfly_block.sv
// Created:     11/9/16
// Author:      Luke McBee
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: Butterfly block for a FFT

module butterfly_block
(
	
	input wire [15:0] input_1_real,
	input wire [15:0] input_1_imaginary,
	input wire [15:0] input_2_real,
	input wire [15:0] input_2_imaginary,
	input wire [15:0] twiddle_real, //Twiddle value, might need to be split into two different inputs
	input wire [15:0] twiddle_imaginary,	
	output reg [15:0] output_1_real,
	output reg [15:0] output_1_imaginary,
	output reg [15:0] output_2_real,
	output reg [15:0] output_2_imaginary
);

	reg [15:0] temp1;
	reg [15:0] temp2;
	reg [15:0] temp3;
	reg [15:0] temp4;
	reg [15:0] twiddle_1;
	reg [15:0] twiddle_2;

	reg [15:0] temp5;
	reg [15:0] temp6;
	reg [15:0] temp7;
	reg [15:0] temp8;

	reg [15:0] temp9;
	reg [15:0] temp10;

	fixed_point_add OUT1REAL (//
		.a(input_1_real),
		.b(input_2_real),
		.c(output_1_real)
	);

	fixed_point_add OUT1IMAGINARY (//
		.a(input_1_imaginary),
		.b(input_2_imaginary),
		.c(output_1_imaginary)
	);

	assign temp1 = {input_2_real[15] ^ 1'b1, input_2_real[14:0]};//
	/*
	fixed_point_math TEMP1 (
		.input1(input_2_real),
		.input2(16'b1000000100000000), //-1
		.product(temp1)
	);*/

	assign temp2 = {input_2_imaginary[15] ^ 1'b1, input_2_imaginary[14:0]};//
	/*
	fixed_point_math TEMP2 (
		.input1(input_2_imaginary),
		.input2(16'b1000000100000000), //-1
		.product(temp2)
	);
	*/

	fixed_point_add TEMP3 (//
		.a(temp1),
		.b(input_1_real),
		.c(temp3)
	);

	fixed_point_add TEMP4 (//
		.a(temp2),
		.b(input_1_imaginary),
		.c(temp4)
	);

	assign twiddle_1 = twiddle_real;//
	assign twiddle_2 = twiddle_imaginary;//
	

	//Combinational logic for the butterfly block
	always_comb
	begin
		//Calculate the real and imaginary values of the first value
		//output_1_real = input_1_real + input_2_real;
		//output_1_imaginary = input_1_imaginary + input_2_imaginary;

		//Calculate the values that will be pasased to the twiddle factor portion
		//temp1 = input_2_real * -1;
		//temp2 = input_2_imaginary * -1;
		//temp3 = temp1 + input_1_real;
		//temp4 = temp2 + input_1_imaginary;

		//Calculate the twiddle constants to be used in the twiddle factor multiplication
		//twiddle_1 = twiddle_real; //To be fixed later
		//twiddle_2 = twiddle_imaginary; //To be fixed later

		//Calculate the output for the twiddle multiplication portion
		//output_2_real = (temp3 * twiddle_1) - (temp4 * twiddle_2); //Real portion of complex math multiplication
		//output_2_imaginary = (temp3 * twiddle_2) + (temp4 * twiddle_1); //Imaginary portion of complex math multiplication

		//output_2_real = temp5 - temp6; //Real portion of complex math multiplication
		//output_2_imaginary = temp7 - temp8; //Imaginary portion of complex math multiplication

	end

	fixed_point_math TEMP5 (//
		.input1(temp3),
		.input2(twiddle_1),
		.product(temp5)
	);
	
	fixed_point_math TEMP6 (//
		.input1(temp4),
		.input2(twiddle_2),
		.product(temp6)
	);

	fixed_point_math TEMP7 (//
		.input1(temp3),
		.input2(twiddle_2),
		.product(temp7)
	);

	fixed_point_math TEMP8 (//
		.input1(temp4),
		.input2(twiddle_1),
		.product(temp8)
	);

	assign temp9 = {temp6[15] ^ 1'b1, temp6[14:0]};//
	assign temp10 = {temp8[15] ^ 1'b1, temp8[14:0]};//

	fixed_point_add OUT2REAL (//
		.a(temp5),
		.b(temp9),
		.c(output_2_real)
	);

	fixed_point_add OUT2IMAGINARY (//
		.a(temp7),
		.b(temp10),
		.c(output_2_imaginary)
	);


endmodule

