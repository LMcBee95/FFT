
`timescale 1ns / 100ps
module tb_fixed_point_add();


	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals
	reg [15:0] tb_a;
	reg [15:0] tb_b;
	reg [15:0] tb_c;
	

	//task check_integer;
	


	task load_fixed_point_math;
		input logic [15:0] i1;
		input logic [15:0] i2;
	begin
		tb_a = i1;
		tb_b = i2;
	end
	endtask
	
	// DUT portmap
	fixed_point_add DUT(
		.a(tb_a),
		.b(tb_b),
		.c(tb_c)
	);	
	// Test bench process
	initial
	begin
		//Test 1 : 2 + 1 = 3?
		load_fixed_point_math(16'b0000001000000000, 16'b0000000100000000);

		#(1);

		//Test 2 : -2 + 1 = -1?
		load_fixed_point_math(16'b1000001000000000, 16'b0000000100000000);

		#(1);

		//Test 3 : 2 + -1 = 1?
		load_fixed_point_math(16'b0000001000000000, 16'b1000000100000000);

		#(1);

		//Test 4 : -2 + -1 = -3?
		load_fixed_point_math(16'b1000001000000000, 16'b1000000100000000);

		#(1);


	end

endmodule
