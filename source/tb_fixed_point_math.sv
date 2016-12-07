
`timescale 1ns / 100ps
module tb_fixed_point_math();


	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals
	reg [15:0] tb_input1;
	reg [15:0] tb_input2;
	reg [15:0] tb_product;
	

	//task check_integer;
	


	task load_fixed_point_math;
		input logic [15:0] i1;
		input logic [15:0] i2;
	begin
		tb_input1 = i1;
		tb_input2 = i2;
	end
	endtask
	
	// DUT portmap
	fixed_point_math DUT(
		.input1(tb_input1),
		.input2(tb_input2),
		.product(tb_product)
	);	
	// Test bench process
	initial
	begin
		//Test 1 : 0.5 * 0.5 = 0.25
		load_fixed_point_math(16'b0000000010000000, 16'b0000000010000000);

		#(1);

		$info("input 1 = %b | input 2 = %b | product = %b", tb_input1, tb_input2, tb_product);


		//Test 2 : 1 * 0.5 = ?
		load_fixed_point_math(16'b0000000100000000, 16'b0000000010000000);

		#(100);

		$info("input 1 = %b | input 2 = %b | product = %b", tb_input1, tb_input2, tb_product);

		//Test 3 : 3 * 3 = 9
		load_fixed_point_math(16'b0000001100000000, 16'b0000001100000000);

		#(1);

		$info("input 1 = %b | input 2 = %b | product = %b", tb_input1, tb_input2, tb_product);

		//Test 4 : -3 * 3 = -9
		load_fixed_point_math(16'b1000001100000000, 16'b0000001100000000);

		#(1);

		$info("input 1 = %b | input 2 = %b | product = %b", tb_input1, tb_input2, tb_product);

		//Test 5
		load_fixed_point_math(1, 1);

		#(1);

		$info("input 1 = %b | input 2 = %b | product = %b", tb_input1, tb_input2, tb_product);

		//Test 6
		load_fixed_point_math(1, 1);

		#(1);

		$info("input 1 = %b | input 2 = %b | product = %b", tb_input1, tb_input2, tb_product);


	end

endmodule
