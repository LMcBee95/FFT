// $Id: $
// File name:   timers.sv
// Created:     11/25/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: All 6 timers of the design
module timers (
	input wire clk,
	input wire n_rst,
	input reg shift_in_ena,
	input reg shift_out_ena,
	input reg iteration_ena,
	//input reg stage_ena,

	output reg [3:0] samples_in_count,
	output reg [2:0] samples_loaded_count,
	output reg samples_in_done,
	output reg samples_out_done,
	output reg fft_done,
	output reg [4:0] iteration_count,
	output reg [3:0] stage_count,
	output reg [3:0] samples_out_count,
	output reg [2:0] samples_written_count,
	output reg iteration_done,
	output reg samples_loaded_done,
	output reg samples_written_done
);
//reg samples_loaded_done = 1'b0;
//reg iteration_done = 1'b0;
//reg samples_written_done = 1'b0;


flex_counter #(4) samplesIn ( //count 0-8
	.clk(clk), 
	.n_rst(n_rst), 
	.clear(samples_in_done),
	.count_enable(samples_loaded_done),
	//.count_enable(samples_loaded_count == 3'd6),
	.rollover_val(4'd8),
	.count_out(samples_in_count),
	.rollover_flag(samples_in_done)
);

flex_counter #(3) samplesLoaded ( //count 0-5 (ish 6)
	.clk(clk), 
	.n_rst(n_rst), 
	.clear(samples_loaded_done),
	.count_enable(shift_in_ena),
	.rollover_val(3'd6),
	.count_out(samples_loaded_count),
	.rollover_flag(samples_loaded_done)
);

flex_counter #(5) iterationCounter ( //count 0-16
	.clk(clk), 
	.n_rst(n_rst), 
	.clear(iteration_done),
	.count_enable(iteration_ena),
	.rollover_val(5'd16),
	.count_out(iteration_count),
	.rollover_flag(iteration_done)
);

flex_counter #(4) stageCounter ( //counts 0-8
	.clk(clk), 
	.n_rst(n_rst), 
	.clear(fft_done),
	.count_enable(iteration_done),
	.rollover_val(4'd8),
	.count_out(stage_count),
	.rollover_flag(fft_done)
);

flex_counter #(4) samplesOut ( //counts 0-8
	.clk(clk), 
	.n_rst(n_rst), 
	.clear(samples_out_done),
	.count_enable(samples_written_done),
	.rollover_val(4'd8),
	.count_out(samples_out_count),
	.rollover_flag(samples_out_done)
);

flex_counter #(3) samplesWritten ( //count 0-4
	.clk(clk), 
	.n_rst(n_rst), 
	.clear(samples_written_done),
	.count_enable(shift_out_ena),
	.rollover_val(3'd4),
	.count_out(samples_written_count),
	.rollover_flag(samples_written_done)
);

endmodule
