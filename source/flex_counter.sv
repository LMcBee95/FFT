// $Id: $
// File name:   flex_counter.sv
// Created:     9/13/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Flexible Counter Specifications
module flex_counter
#(
	parameter NUM_CNT_BITS = 4
)
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire [(NUM_CNT_BITS - 1):0] rollover_val,
	output reg [(NUM_CNT_BITS - 1):0] count_out,
	output reg rollover_flag
);
reg [(NUM_CNT_BITS - 1):0] count_next = {NUM_CNT_BITS{1'b0}};
reg rf_load = 1'b0;
//initial count_next[(NUM_CNT_BITS - 1):0] = {NUM_CNT_BITS{1'b0}};
//initial rf_load = 1'b0;


always_comb
begin
	//count_next[(NUM_CNT_BITS - 1):0] = {NUM_CNT_BITS{1'b0}};
	//rf_load = 1'b0;

	if(clear == 1'b1)
	begin
		count_next[(NUM_CNT_BITS - 1):0] = {NUM_CNT_BITS{1'b0}};
	end
	else if (count_enable == 1'b1)
	begin
		//if count out is still less than rollover
		if(count_out < rollover_val)
		begin
			count_next = count_out + 1'b1;
		end
		else //adding 1 will go above rolleover value 
		begin
			//rf_load = 1;
			count_next = 4'b0001;
		end
	end
	else
	begin
		count_next = count_out;
	end
	
	if(count_next >= rollover_val)
	begin
		rf_load = 1'b1; //----------
	end
	else
	begin
		rf_load = 1'b0; //-----------
	end

end //end always_comb

always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		count_out <= {NUM_CNT_BITS{1'b0}};
		//count_next <= {NUM_CNT_BITS{1'B0}};
		rollover_flag <= 1'b0;
	end
	else
	begin
		count_out <= count_next;
		rollover_flag <= rf_load;
	end //else not reset end
end //end always_ff

endmodule
