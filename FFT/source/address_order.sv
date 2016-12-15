// $Id: $
// File name:   address_order.sv
// Created:     11/24/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Outputs the needed address
module address_order (
	input wire clk,
	input wire nrst,
	input reg [9:0] a_real,
	input reg [9:0] a_imag,
	input reg [9:0] b_real,
	input reg [9:0] b_imag,
	input reg [2:0] samples_loaded_count,
	
	output reg [8:0] output_address
);
//State encoding
localparam	load_real_a = 0,
		load_imag_a = 1,
		load_real_b = 2,
		load_imag_b = 3;
		


reg [9:0] next_address;

always_ff @(posedge clk, negedge nrst) begin
	if(nrst == 1'b0) 
	begin
		output_address <= 10'b0;
	end
	else 
	begin
		output_address <= next_address;
	end
end
//States to scroll through th real and imaginary values of the given value
always_comb begin
	next_address = output_address;
	case(samples_loaded_count)
		load_real_a: begin
			next_address = a_real;
		end
		load_imag_a: begin
			next_address = a_imag;
		end
		load_real_b: begin
			next_address = b_real;
		end
		load_imag_b: begin
			next_address = b_imag;
		end
		default: begin
			next_address = 0;
		end
	endcase
end


endmodule
