



module fixed_point_math//implements the fixed point math
(
	input wire [15:0] input1,
	input wire [15:0] input2,
	output reg [15:0] product

);


	localparam num_fraction = 8; //The number of bits used for the decimal
	localparam num_decimal = 7;
	

	reg sign;
	reg [29:0] temp_product;	

	always_comb
	begin
	
		sign = input1[15] ^ input2[15]; //XOR the sign bit to get the new sign bit 

		temp_product = input1[14:0] * input2[14:0];

	end

	assign product = {sign, temp_product[29 -num_decimal:num_fraction]};//output is the truncated comb block

endmodule
