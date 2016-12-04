// $Id: $
// File name:   twiddle_index.sv
// Created:     11/23/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Outputs which index from twiddle ROM to use
module twiddle_index #(
	MAX_NUM_STAGES = 8,
	NUM_SAMPLES = 256
)
(
	input wire clk,
	input wire nrst,
	input reg [2:0] stage_count_out,
	output reg [2:0] index_val
);
reg [7:0] cur_k;
reg [7:0] updated_k;
reg [7:0] k_in;
reg [2:0] next_index_val;

always_ff @(posedge clk, negedge nrst) 
begin
	if(nrst == 1'b0) begin
		k_in <= 0;
		index_val <= 0;
		//updated_k <= 0;
	end
	else begin
		k_in <= updated_k;
		index_val <= next_index_val;
	end
end

always_comb begin
	//Set default values
	next_index_val = index_val;
	cur_k = k_in;
	updated_k = k_in;

	//update cur_k and next_index_val
	cur_k = k_in * (2**(stage_count_out + 1)) / 2;
	next_index_val = cur_k % 8;

	if(cur_k + 1 > (NUM_SAMPLES / (2**(stage_count_out + 1)))) begin
		updated_k = 0;
	end
	else begin
		updated_k = cur_k + 1;
	end

end





endmodule
