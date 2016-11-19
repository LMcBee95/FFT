// $Id: $
// File name:   no_samples_in.sv
// Created:     11/18/2016
// Author:      Luke McBee
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: counter keeping track of the number of samples inputted

module no_samples_in
(
	input wire clk,
	input wire n_reset,
	input wire input_ena,
	input wire clear,
	output reg iter_strobe,
	output reg it_count_strobe,
	output reg [5:0] samples_in_count_out

);
	
	flex_counter #(6) in_samples
	(
		.clk(clk), 
		.n_rst(n_reset),
		.clear(clear),
		.count_enable(input_ena),
		.count_out(samples_in_count_out),
		.rollover_val(48), //Count up to 48
		.rollover_flag(iter_strobe)
	);

	assign it_count_strobe = cnt_up; //When the next data sample is loaded clock the input shift register to load in the next value

endmodule
