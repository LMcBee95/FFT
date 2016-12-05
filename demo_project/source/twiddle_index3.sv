// $Id: $
// File name:   twiddle_index3.sv
// Created:     11/24/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Try 3. This time with just a flex counter
module twiddle_index3 
(
	input wire clk,
	input wire nrst,
	input reg [2:0] stage_count_out,
	input reg k_enable,
	output reg [2:0] index_val
);

reg[