module fft
(

	input wire clk,
	input wire n_rst,
	input wire fft_start,
	output wire fft_done
);


//No Samples Input timer
	//Inputs : input_ena
	//Outputs : it_count_strobe, iteration_strobe, [4:0] samples_in_count_out
	reg input_ena;
	reg it_count_strobe;
	reg iter_strobe;
	reg [5:0] samples_in_count_out;

	no_samples_in number_samples_in
	(
		.clk(clk),
		.n_reset(n_reset),
		.input_ena(input_ena),
		.iter_strobe(iter_strobe),
		.it_count_strobe(it_count_strobe),
		.samples_in_count_out(samples_in_count_out)
	);


//No Iterations Timer
	//Inputs : iteration_strobe
	//Outputs : stage_strobe, [3:0] iteration_count_out
	reg stage_strobe;
	reg [3:0] iteration_count_out;
	
	//How to do the linking
	//.function_variable(external_variable)
	no_iter number_of_iter
	(
		.clk(clk),
		.n_reset(n_reset),
		.stage_strobe(stage_strobe),
		.iteration_count_out(iteration_count_out)
	);

//No Stages Timer
	//Inputs : stage strobe
	//Outputs : stage_done, [2:0] stage_count_out
	reg stage_done;
	reg [2:0] stage_count_out;

	no_stages number_of_stages
	(
		.clk(clk),
		.n_reset(n_reset),
		.stage_strobe(stage_strobe),
		.stage_done(stage_done),
		.stage_count_out(stage_count_out)
	);

//No Samples Out Timer
	//Inputs : output ena
	//Outputs : [4:0] samples_out_count_out, output_strobe
	reg output_strobe;
	reg [4:0] samples_out_count_out;

	no_samples_out number_samples_out
	(
		.clk(clk),
		.n_reset(n_reset),
		.output_ena(output_ena),
		.output_done(output_done),
		.output_strobe(output_strobe),
		.samples_out_count_out(samples_out_count_out)
	);

//Main Controller Unit (MCU)
	//Inputs : fft_start, [2:0] samples_in_count_out, iteration_strobe, stage_done, output_done
	//Outputs : [1:0] addr_mode, fft_done, write_enable, read_enable, output_ena, input_ena

	mcu fft_controller
	(
		.clk(clk),
		.n_rst(n_reset),
		.fft_start(fft_start),
		.samples_in_count_out(samples_in_count_out),
		.iteration_strobe(iteration_strobe),
		.stage_done(stage_done),
		.output_done(output_done),
		.addr_mode(addr_mode),
		.fft_done(fft_done),
		.write_enable(write_enable),
		.read_enable(read_enable),
		.output_ena(output_ena),
		.input_ena(input_ena)
	);



		



endmodule
