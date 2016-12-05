module ButterflyWrapper
(
	input wire [47:0] [15:0] data_par_in,
	output reg [31:0] [15:0] data_par_out

);
		
	butterfly_block b1 (
		.input_1_real(data_par_in[0]),
		.input_1_imaginary(data_par_in[1]),
		.input_2_real(data_par_in[2]),
		.input_2_imaginary(data_par_in[3]),
		.twiddle_real(data_par_in[32]),
		.twiddle_imaginary(data_par_in[33]),
		.output_1_real(data_par_out[0]),
		.output_1_imaginary(data_par_out[1]),
		.output_2_real(data_par_out[2]),
		.output_2_imaginary(data_par_out[3])
	);

	butterfly_block b2 (
		.input_1_real(data_par_in[4]),
		.input_1_imaginary(data_par_in[5]),
		.input_2_real(data_par_in[6]),
		.input_2_imaginary(data_par_in[7]),
		.twiddle_real(data_par_in[34]),
		.twiddle_imaginary(data_par_in[35]),
		.output_1_real(data_par_out[4]),
		.output_1_imaginary(data_par_out[5]),
		.output_2_real(data_par_out[6]),
		.output_2_imaginary(data_par_out[7])
	);

	butterfly_block b3 (
		.input_1_real(data_par_in[8]),
		.input_1_imaginary(data_par_in[9]),
		.input_2_real(data_par_in[10]),
		.input_2_imaginary(data_par_in[11]),
		.twiddle_real(data_par_in[36]),
		.twiddle_imaginary(data_par_in[37]),
		.output_1_real(data_par_out[8]),
		.output_1_imaginary(data_par_out[9]),
		.output_2_real(data_par_out[10]),
		.output_2_imaginary(data_par_out[11])
	);

	butterfly_block b4 (
		.input_1_real(data_par_in[12]),
		.input_1_imaginary(data_par_in[13]),
		.input_2_real(data_par_in[14]),
		.input_2_imaginary(data_par_in[15]),
		.twiddle_real(data_par_in[38]),
		.twiddle_imaginary(data_par_in[39]),
		.output_1_real(data_par_out[12]),
		.output_1_imaginary(data_par_out[13]),
		.output_2_real(data_par_out[14]),
		.output_2_imaginary(data_par_out[15])
	);

	butterfly_block b5 (
		.input_1_real(data_par_in[16]),
		.input_1_imaginary(data_par_in[17]),
		.input_2_real(data_par_in[18]),
		.input_2_imaginary(data_par_in[19]),
		.twiddle_real(data_par_in[40]),
		.twiddle_imaginary(data_par_in[41]),
		.output_1_real(data_par_out[16]),
		.output_1_imaginary(data_par_out[17]),
		.output_2_real(data_par_out[18]),
		.output_2_imaginary(data_par_out[19])
	);

	butterfly_block b6 (
		.input_1_real(data_par_in[20]),
		.input_1_imaginary(data_par_in[21]),
		.input_2_real(data_par_in[22]),
		.input_2_imaginary(data_par_in[23]),
		.twiddle_real(data_par_in[42]),
		.twiddle_imaginary(data_par_in[43]),
		.output_1_real(data_par_out[20]),
		.output_1_imaginary(data_par_out[21]),
		.output_2_real(data_par_out[22]),
		.output_2_imaginary(data_par_out[23])
	);
	
	butterfly_block b7 (
		.input_1_real(data_par_in[24]),
		.input_1_imaginary(data_par_in[25]),
		.input_2_real(data_par_in[26]),
		.input_2_imaginary(data_par_in[27]),
		.twiddle_real(data_par_in[44]),
		.twiddle_imaginary(data_par_in[45]),
		.output_1_real(data_par_out[24]),
		.output_1_imaginary(data_par_out[25]),
		.output_2_real(data_par_out[26]),
		.output_2_imaginary(data_par_out[27])
	);

	butterfly_block b8 (
		.input_1_real(data_par_in[28]),
		.input_1_imaginary(data_par_in[29]),
		.input_2_real(data_par_in[30]),
		.input_2_imaginary(data_par_in[31]),
		.twiddle_real(data_par_in[46]),
		.twiddle_imaginary(data_par_in[47]),
		.output_1_real(data_par_out[28]),
		.output_1_imaginary(data_par_out[29]),
		.output_2_real(data_par_out[30]),
		.output_2_imaginary(data_par_out[31])
	);


endmodule
