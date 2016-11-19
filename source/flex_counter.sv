// $Id: $
// File name:   flex_counter.sv
// Created:     9/10/2016
// Author:      Luke McBee
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: flexing counter block thing

module flex_counter
#(
	NUM_CNT_BITS = 10
)

(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [NUM_CNT_BITS - 1:0] rollover_val,
	output reg [NUM_CNT_BITS - 1:0] count_out,
	output reg rollover_flag
);

	reg [NUM_CNT_BITS - 1:0] next_cnt;
	reg next_rollover;

always_ff @ (posedge clk, negedge n_rst)
begin
	//reset	
	if(n_rst == 1'b0) begin
		count_out <= 0;
		rollover_flag <= 0;
	end
	else begin
		rollover_flag <= next_rollover;	
		count_out <= next_cnt;	
	end
end

always_comb begin
	
	if(clear == 1) begin
		next_cnt = 0;				
		next_rollover = 0;
	end
	else if(count_enable == 1'b1) begin
		
		if(count_out >= rollover_val) begin
			next_cnt = 1;
		end
		else begin
			next_cnt = count_out + 1;
		end

		
		
		if(count_out == rollover_val - 1) begin	
			next_rollover = 1;
		end
		else begin
			next_rollover = 0;
		end
	end
	else begin
		next_rollover = rollover_flag;
		next_cnt = count_out;
	end	
end



endmodule
