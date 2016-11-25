// $Id: $
// File name:   no_samples_out.sv
// Created:     11/18/2016
// Author:      Luke McBee
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: counter keeping track of the number of samples inputted

module no_samples_out
(
	input wire clk,
	input wire n_reset,
	input wire output_ena,
	output reg output_done,
	output reg output_strobe,
	output reg [5:0] samples_out_count_out
	

);
	
	flex_counter #(6) out_samples
	(
		.clk(clk), 
		.n_rst(n_reset),
		.clear(output_done),
		.count_enable(output_ena),
		.count_out(samples_out_count_out),
		.rollover_val(6'd32), 
		.rollover_flag(output_done)
	);
	
	assign output_strobe = output_ena;


endmodule

