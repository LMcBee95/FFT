// $Id: $
// File name:   no_iter.sv
// Created:     11/18/2016
// Author:      Luke McBee
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: counter keeping track of the number of itterations

module no_iter
(
	input wire clk,
	input wire n_reset,
	input wire iteration_strobe,
	output reg stage_strobe,
	output reg [4:0] iteration_count_out

);
	
	flex_counter #(5) iter
	(
		.clk(clk), 
		.n_rst(n_reset),
		.clear(stage_strobe),
		.count_enable(iteration_strobe),
		.count_out(iteration_count_out),
		.rollover_val(5'd16), //Count up to 16 because there are 16 groups per stage
		.rollover_flag(stage_strobe)
	);

endmodule

