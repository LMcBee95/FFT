// $Id: $
// File name:   flex_stp_sr.sv
// Created:     9/10/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Flexible and Scalable-to-Parallel Shift Register Design
module flex_stp_sr
#(
	parameter NUM_BITS = 16, 
	parameter SHIFT_MSB = 1 //default 1 = true 
)
(
	input wire clk, //400 MHz
	input wire n_rst, //asynch, active-low
	input wire shift_enable, //acrtive-high
	input wire serial_in, //serial input, value to be shifted into reg, default = 1
	output reg [(NUM_BITS-1):0] parallel_out
);
genvar i;

/*generate
	for(i = 0; i < NUM_BITS; i = i + 1)
	begin
		always_ff @(posedge clk, negedge n_rst) begin
			if (n_rst == 0)
			begin
				parallel_out[i] <= 1'b1;
			end
			else if (shift_enable == 1)
			begin 
				if(SHIFT_MSB) //if most significant bit first
				begin
					parallel_out[i] <= 
				end
				else if (!SHIFT_MSB)
				begin
					parallel_out
				end
				 
			end //end ELSE

		end //end always_ff
	end //end for 



endgenerate*/

always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		parallel_out[(NUM_BITS - 1):0] <= {NUM_BITS{1'b1}};
	end
	else if (shift_enable == 1) 
	begin
		if(SHIFT_MSB == 1)
		begin
			parallel_out[(NUM_BITS - 1):0] <= {parallel_out[(NUM_BITS - 2):0], serial_in}; //msb shift 
		end
		else //if (!SHIFT_MSB)
		begin
			parallel_out[(NUM_BITS - 1):0] <= {serial_in, parallel_out[(NUM_BITS-1):1]}; //lsb shift
		end
	end
end //ff end

endmodule
