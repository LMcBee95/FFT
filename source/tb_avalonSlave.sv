// 337 TA Provided Lab 2 Testbench
// This code serves as a test bench for the 1 bit adder design 

`timescale 1ns / 100ps

module tb_avalonSlave
();
	localparam	CLK_PERIOD	= 10;
	
	// Shared Test Variables
	reg tb_clk;
	
	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	wire tb_n_rst;
	wire tb_rEn;
	wire [63:0]tb_address;
	wire [31:0]tb_wData;
	reg [31:0] tb_rData;
	reg [31:0] tb_fft_init_data;
	reg [8:0] tb_wAddress;
	wire tb_fft_done;
	reg tb_fft_start;

	// Declare test bench signals
	integer tb_test_case;
	reg [3:0] tb_test_inputs;
	// DUT port map
	avalonSlave DUT(
	.clk(tb_clk),
	.n_rst(tb_n_rst),
	.rEn(tb_rEn),
	.address(tb_address),
	.wData(tb_wData),
	.rData(tb_rData),
	.fft_init_data(tb_fft_init_data),
	.wAddress(tb_wAddress),
	.fft_done(tb_fft_done),
	.fft_start(tb_fft_start)
);

	// Connect individual test input bits to a vector for easier testing
/*	assign tb_n_rst					= tb_test_inputs[2];
	assign tb_d_plus				= tb_test_inputs[1];
	assign tb_shift_enable				= tb_test_inputs[0];
	assign tb_eop					= tb_test_inputs[3];*/
	// Test bench process
	initial
	begin

	final
	begin
		if(0 != tb_test_case)
		begin
			// Didn't run the test bench through all test cases
			$display("This test bench was not run long enough to execute all test cases. Please run this test bench for at least a total of ns");
		end
		else
		begin
			// Test bench was run to completion
			$display("This test bench has run to completion");
		end
	end
endmodule
