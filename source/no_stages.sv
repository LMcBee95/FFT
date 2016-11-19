// $Id: $
// File name:   no_stages.sv
// Created:     11/18/2016
// Author:      Luke McBee
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: counter keeping track of the number of stages completed

module no_stages
(
	input wire clk,
	input wire n_reset,
	input wire stage_strobe,
	input wire clear,
	output reg stage_done,
	output reg [2:0] stage_count_out

);
	
	flex_counter #(3) stage
	(
		.clk(clk), 
		.n_rst(n_reset),
		.clear(clear),
		.count_enable(stage_strobe),
		.count_out(stage_count_out),
		.rollover_val(8), //Rollover at 8 because that is the number of stages needed for a 256 point FFT
		.rollover_flag(stage_done)
	);

endmodule

