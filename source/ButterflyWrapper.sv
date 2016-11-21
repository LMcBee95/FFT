module ButterflyWrapper
(
	input wire [15:0] input_1_real,
	input wire [15:0] input_1_imaginary,
	input wire [15:0] input_2_real,
	input wire [15:0] input_2_imaginary,
	input wire [15:0] twiddle1_real, //Twiddle value, might need to be split into two different inputs
	input wire [15:0] twiddle1_imaginary,
	
	input wire [15:0] input_3_real,
	input wire [15:0] input_3_imaginary,
	input wire [15:0] input_4_real,
	input wire [15:0] input_4_imaginary,
	input wire [15:0] twiddle2_real, //Twiddle value, might need to be split into two different inputs
	input wire [15:0] twiddle2_imaginary,
	
	input wire [15:0] input_5_real,
	input wire [15:0] input_5_imaginary,
	input wire [15:0] input_6_real,
	input wire [15:0] input_6_imaginary,
	input wire [15:0] twiddle3_real, //Twiddle value, might need to be split into two different inputs
	input wire [15:0] twiddle3_imaginary,

	input wire [15:0] input_7_real,
	input wire [15:0] input_7_imaginary,
	input wire [15:0] input_8_real,
	input wire [15:0] input_8_imaginary,
	input wire [15:0] twiddle4_real, //Twiddle value, might need to be split into two different inputs
	input wire [15:0] twiddle4_imaginary,
	
	input wire [15:0] input_9_real,
	input wire [15:0] input_9_imaginary,
	input wire [15:0] input_10_real,
	input wire [15:0] input_10_imaginary,
	input wire [15:0] twiddle5_real, //Twiddle value, might need to be split into two different inputs
	input wire [15:0] twiddle5_imaginary,
	
	input wire [15:0] input_11_real,
	input wire [15:0] input_11_imaginary,
	input wire [15:0] input_12_real,
	input wire [15:0] input_12_imaginary,
	input wire [15:0] twiddle6_real, //Twiddle value, might need to be split into two different inputs
	input wire [15:0] twiddle6_imaginary,
	
	input wire [15:0] input_13_real,
	input wire [15:0] input_13_imaginary,
	input wire [15:0] input_14_real,
	input wire [15:0] input_14_imaginary,
	input wire [15:0] twiddle7_real, //Twiddle value, might need to be split into two different inputs
	input wire [15:0] twiddle7_imaginary,
	
	input wire [15:0] input_15_real,
	input wire [15:0] input_15_imaginary,
	input wire [15:0] input_16_real,
	input wire [15:0] input_16_imaginary,
	input wire [15:0] twiddle8_real, //Twiddle value, might need to be split into two different inputs
	input wire [15:0] twiddle8_imaginary,
	
	output reg [15:0] output_1_real,
	output reg [15:0] output_1_imaginary,
	output reg [15:0] output_2_real,
	output reg [15:0] output_2_imaginary,
	output reg [15:0] output_3_real,
	output reg [15:0] output_3_imaginary,
	output reg [15:0] output_4_real,
	output reg [15:0] output_4_imaginary,
	output reg [15:0] output_5_real,
	output reg [15:0] output_5_imaginary,
	output reg [15:0] output_6_real,
	output reg [15:0] output_6_imaginary,
	output reg [15:0] output_7_real,
	output reg [15:0] output_7_imaginary,
	output reg [15:0] output_8_real,
	output reg [15:0] output_8_imaginary,
	
	output reg [15:0] output_9_real,
	output reg [15:0] output_9_imaginary,
	output reg [15:0] output_10_real,
	output reg [15:0] output_10_imaginary,
	output reg [15:0] output_11_real,
	output reg [15:0] output_11_imaginary,
	output reg [15:0] output_12_real,
	output reg [15:0] output_12_imaginary,
	output reg [15:0] output_13_real,
	output reg [15:0] output_13_imaginary,
	output reg [15:0] output_14_real,
	output reg [15:0] output_14_imaginary,
	output reg [15:0] output_15_real,
	output reg [15:0] output_15_imaginary,
	output reg [15:0] output_16_real,
	output reg [15:0] output_16_imaginary,
	
	output reg [15:0] output_17_real,
	output reg [15:0] output_17_imaginary,
	output reg [15:0] output_18_real,
	output reg [15:0] output_18_imaginary,
	output reg [15:0] output_19_real,
	output reg [15:0] output_19_imaginary,
	output reg [15:0] output_20_real,
	output reg [15:0] output_20_imaginary,
	output reg [15:0] output_21_real,
	output reg [15:0] output_21_imaginary,
	output reg [15:0] output_22_real,
	output reg [15:0] output_22_imaginary,
	output reg [15:0] output_23_real,
	output reg [15:0] output_23_imaginary,
	output reg [15:0] output_24_real,
	output reg [15:0] output_24_imaginary,
	
	output reg [15:0] output_25_real,
	output reg [15:0] output_25_imaginary,
	output reg [15:0] output_26_real,
	output reg [15:0] output_26_imaginary,
	output reg [15:0] output_27_real,
	output reg [15:0] output_27_imaginary,
	output reg [15:0] output_28_real,
	output reg [15:0] output_28_imaginary,
	output reg [15:0] output_29_real,
	output reg [15:0] output_29_imaginary,
	output reg [15:0] output_30_real,
	output reg [15:0] output_30_imaginary,
	output reg [15:0] output_31_real,
	output reg [15:0] output_31_imaginary,
	output reg [15:0] output_32_real,
	output reg [15:0] output_32_imaginary
);

	always_comb begin
		
		butterfly_block b1 (.input_1_real(input_1_real),.input_1_imaginary(input_1_imaginary),.input_2_real(input_2_real),.input_2_imaginary(input_2_imaginary),
							.twiddle_real(twiddle1_real),.twiddle_imaginary(twiddle1_imaginary),
							.output_1_real(output_1_real),.output_1_imaginary(output_1_imaginary),.output_2_real(output_2_real),.output_2_imaginary(output_2_imaginary));
							
		butterfly_block b2 (.input_1_real(input_3_real),.input_1_imaginary(input_3_imaginary),.input_2_real(input_4_real),.input_2_imaginary(input_4_imaginary),
							.twiddle_real(twiddle2_real),.twiddle_imaginary(twiddle2_imaginary),
							.output_1_real(output_3_real),.output_1_imaginary(output_3_imaginary),.output_2_real(output_4_real),.output_2_imaginary(output_4_imaginary));
							
		butterfly_block b3 (.input_1_real(input_5_real),.input_1_imaginary(input_5_imaginary),.input_2_real(input_6_real),.input_2_imaginary(input_6_imaginary),
							.twiddle_real(twiddle3_real),.twiddle_imaginary(twiddle3_imaginary),
							.output_1_real(output_5_real),.output_1_imaginary(output_5_imaginary),.output_2_real(output_6_real),.output_2_imaginary(output_6_imaginary));
							
		butterfly_block b4 (.input_1_real(input_7_real),.input_1_imaginary(input_7_imaginary),.input_2_real(input_8_real),.input_2_imaginary(input_8_imaginary),
							.twiddle_real(twiddle4_real),.twiddle_imaginary(twiddle4_imaginary),
							.output_1_real(output_7_real),.output_1_imaginary(output_7_imaginary),.output_2_real(output_8_real),.output_2_imaginary(output_8_imaginary));
							
		butterfly_block b5 (.input_1_real(input_9_real),.input_1_imaginary(input_9_imaginary),.input_2_real(input_10_real),.input_2_imaginary(input_10_imaginary),
							.twiddle_real(twiddle5_real),.twiddle_imaginary(twiddle5_imaginary),
							.output_1_real(output_9_real),.output_1_imaginary(output_9_imaginary),.output_2_real(output_10_real),.output_2_imaginary(output_10_imaginary));
							
		butterfly_block b6 (.input_1_real(input_11_real),.input_1_imaginary(input_11_imaginary),.input_2_real(input_12_real),.input_2_imaginary(input_12_imaginary),
							.twiddle_real(twiddle6_real),.twiddle_imaginary(twiddle6_imaginary),
							.output_1_real(output_11_real),.output_1_imaginary(output_11_imaginary),.output_2_real(output_12_real),.output_2_imaginary(output_12_imaginary));
							
		butterfly_block b7 (.input_1_real(input_13_real),.input_1_imaginary(input_13_imaginary),.input_2_real(input_14_real),.input_2_imaginary(input_14_imaginary),
							.twiddle_real(twiddle7_real),.twiddle_imaginary(twiddle7_imaginary),
							.output_1_real(output_13_real),.output_1_imaginary(output_13_imaginary),.output_2_real(output_14_real),.output_2_imaginary(output_14_imaginary));
							
		butterfly_block b8 (.input_1_real(input_15_real),.input_1_imaginary(input_15_imaginary),.input_2_real(input_16_real),.input_2_imaginary(input_16_imaginary),
							.twiddle_real(twiddle8_real),.twiddle_imaginary(twiddle8_imaginary),
							.output_1_real(output_15_real),.output_1_imaginary(output_15_imaginary),.output_2_real(output_16_real),.output_2_imaginary(output_16_imaginary));
		
	end
endmodule