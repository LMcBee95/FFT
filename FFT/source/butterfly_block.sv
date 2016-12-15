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


	reg [15:0] p1; //Intermediate product 1
	reg [15:0] p2; //Intermediate product 2
	reg [15:0] p3; //Intermediate product 3
	reg [15:0] p4; //Intermediate product 4

	reg [15:0] np4; //Negative intermediate product 4

	reg [15:0] yR; //Sumation of the real products
	reg [15:0] yI; //Sumation of the imaginary products

	reg [15:0] nyR; //Negative of the sumation of the real products
	reg [15:0] nyI; //Negative of the sumation of the imaginary products
	

	fixed_point_math PRODUCT1 ( // BR * TR
		.input1(input_2_real),
		.input2(twiddle_real),
		.product(p1)
	);

	fixed_point_math PRODUCT2 ( //BR * TI
		.input1(input_2_real),
		.input2(twiddle_imaginary),
		.product(p2)
	);

	fixed_point_math PRODUCT3 ( //BI * TR
		.input1(input_2_imaginary),
		.input2(twiddle_real),
		.product(p3)
	);

	fixed_point_math PRODUCT4 ( //BI * TI
		.input1(input_2_imaginary),
		.input2(twiddle_imaginary),
		.product(p4)
	);

	fixed_point_math NEGPROD4 ( //P4 * -1
		.input1(p4),
		.input2(16'h8100),
		.product(np4)
	);


	fixed_point_add SUMR ( //BR * TR - BI * TI
		.a(p1),
		.b(np4),
		.c(yR)
	);
	
	fixed_point_add SUMI ( //BR * TI + BI * TR
		.a(p2),
		.b(p3),
		.c(yI)
	);

	fixed_point_math NEGSUMR (
		.input1(yR),
		.input2(16'h8100),
		.product(nyR)
	);

	fixed_point_math NEGSUMI (
		.input1(yI),
		.input2(16'h8100),
		.product(nyI)
	);

	fixed_point_add AR (
		.a(input_1_real),
		.b(yR),
		.c(output_1_real)
	);

	fixed_point_add AI(
		.a(input_1_imaginary),
		.b(yI),
		.c(output_1_imaginary)
	);

	fixed_point_add BR (
		.a(input_1_real),
		.b(nyR),
		.c(output_2_real)
	);

	fixed_point_add BI (
		.a(input_1_imaginary),
		.b(nyI),
		.c(output_2_imaginary)
	);

endmodule

