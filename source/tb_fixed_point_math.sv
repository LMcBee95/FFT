

module tb_fixed_point_math();


	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals
	reg [15:0] tb_input_1_real;
	reg [15:0] tb_input1;
	reg [15:0] tb_input2;
	reg [15:0] tb_product;
	
	
	// Test bench verification signals
	//integer tb_test_case_num;
	//reg expected_output;
	//reg tb_prev_mid;
	//reg tb_prev_fin;

	//reg [7:0] byte_data;

	task load_fixed_point_math;
		input logic [15:0] i1;
		input logic [15:0] i2;
		input logic [15:0] product;
	begin
		tb_input1 = i1;
		tb_input2 = i2;
	end
	endtask
	
	// DUT portmap
	fixe_point_math DUT(
		.input1(tb_input1),
		.input2(tb_input2),
	);	
	// Test bench process
	initial
	begin
		//Test 1
		load_fixed_point_math(1, 1);

		#(1);

		$info("input 1 = %d | input 2 = %d | product = %d", tb_input1, tb_input2, tb_product);


		//Test 2
		load_fixed_point_math(0, 0);

		#(1);

		$info("input 1 = %d | input 2 = %d | product = %d", tb_input1, tb_input2, tb_product);

		//Test 3
		load_fixed_point_math(16'b11111110000000000, 16'b11111110000000000);

		#(1);

		$info("input 1 = %d | input 2 = %d | product = %d", tb_input1, tb_input2, tb_product);

		//Test 4
		load_fixed_point_math(2, 2);

		#(1);

		$info("input 1 = %d | input 2 = %d | product = %d", tb_input1, tb_input2, tb_product);

		//Test 5
		load_fixed_point_math(1, 1);

		#(1);

		$info("input 1 = %d | input 2 = %d | product = %d", tb_input1, tb_input2, tb_product);

		//Test 6
		load_fixed_point_math(1, 1);

		#(1);

		$info("input 1 = %d | input 2 = %d | product = %d", tb_input1, tb_input2, tb_product);


	end

endmodule
