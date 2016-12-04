// $Id: $
// File name:   twiddle_index2.sv
// Created:     11/23/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Try 2
module twiddle_index2
(
	input wire clk,
	input wire nrst,
	input reg [3:0] stage_count_out,
	input reg k_enable,
	input reg k_clear,
	output reg [6:0] index_val
);
reg [7:0] cur_k;
reg [7:0] next_k = 0;
//reg [7:0] k_calculated = 8'b0;
reg [7:0] next_index_val;
reg [2:0] prev_stage = 0;

always_comb begin
	//next_k = cur_k * (2**(stage_count_out + 1) / 2);
	////k_calculated = cur_k * (2**(8 - stage_count_out + 1) / 2);
	
	//next_index_val = next_k % 8;
	////next_index_val = k_calculated % 8;

	//next_k = next_k + 8'b1;
	

	/*next_k = cur_k + 1;

	if(next_k >= 256/(2**(7-stage_count_out + 1))) begin
		next_k = 0;
	end

	if(k_enable == 1'b0) begin
		next_k = cur_k;
	end*/

	
	
	
	if(k_enable == 1'b1 && k_clear == 1'b0) begin
		next_k = cur_k + 1;

		if(next_k >= 256/(2**(7-stage_count_out + 1))) begin
			next_k = 0;
		end
	end
	else if (k_enable == 1'b0 && k_clear == 1'b0) begin
		next_k = cur_k;
	end
	else if(k_clear == 1'b1) begin
		next_k = 0;
	end

	next_index_val = next_k;

end


always_ff @(posedge clk, negedge nrst) 
begin
	if(nrst == 1'b0) begin
		cur_k <= 0;
		index_val <= 0;
		//updated_k <= 0;
	end
	else begin
		cur_k <= next_k;
		index_val <= next_index_val;
	end
end


endmodule
