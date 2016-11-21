// $Id: $
// File name:   flex_pts_sr.sv
// Created:     9/10/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Flexible and Scalable Parallel-to-Serial Shift Register Design
module flex_pts_sr
#(
	parameter NUM_BITS = 32, 
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst, //active-low
	input wire shift_enable, //active-high, allows shift reg to shift out next value for serial_out port
	input wire load_enable, //active-high, allows shift reg to load value at the parallel)in port , TAKE PRIORITY over shift_enable 
	input wire [(NUM_BITS-1):0] parallel_in,
	output reg serial_out //if loading, serial_out = 0
);

reg [(NUM_BITS - 1):0] shift_flop;

always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		shift_flop[(NUM_BITS - 1):0] <= {NUM_BITS{1'b1}}; //flip flops set to 1
		serial_out <= 1'b1;
	end
	else 
	begin
		if(load_enable == 1)
		begin
			//shift_flop[(NUM_BITS-1):0] <= parallel_in[(NUM_BITS-1):0];
			//serail_out <= 1'b1;
			if(SHIFT_MSB == 1)
			begin
				serial_out <= parallel_in[(NUM_BITS - 1)];
				shift_flop[(NUM_BITS - 1):0] <= {parallel_in[(NUM_BITS - 2):0], 1'b1};
			end
			else
			begin
				serial_out <= parallel_in[0];
				shift_flop[(NUM_BITS - 1):0] <= {1'b1, parallel_in[(NUM_BITS - 1):1]};
			end

		end// end initial load enable

		
		else if(shift_enable == 1)
		begin
			//if msb set
			if(SHIFT_MSB==1)
			begin
				serial_out <= shift_flop[(NUM_BITS - 1)];
				shift_flop[(NUM_BITS - 1):0] <= {shift_flop[(NUM_BITS - 2):0], 1'b1};
			end
		
			else
			begin
				serial_out <= shift_flop[0];
				shift_flop[(NUM_BITS - 1):0] <= {1'b1, shift_flop[(NUM_BITS - 1):1]};
			end
		end //END shift enable
	end

end //END always_ff
endmodule
