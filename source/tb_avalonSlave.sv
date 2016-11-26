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
wire [15:0]tb_wData;
reg [15:0] tb_fft_init_data;
reg [8:0] tb_wAddress;
reg tb_fft_start;

// Declare test bench signals
integer tb_test_case;
reg tb_test_rst;
reg tb_sWriteEn;
reg tb_test_rEn;
reg tb_test_wEn;
reg [63:0]tb_test_address;
reg [15:0]tb_test_wData;

// DUT port map
	avalonSlave DUT(
			.clk(tb_clk),
			.n_rst(tb_n_rst),
			.rEn(tb_rEn),
			.wEn(tb_wEn),
			.sWriteEn(tb_sWriteEn),
			.address(tb_address),
			.wData(tb_wData),
			.fft_init_data(tb_fft_init_data),
			.wAddress(tb_wAddress),
			.fft_start(tb_fft_start)
		       );

	// Connect individual test input bits to a vector for easier testing
	assign tb_n_rst = tb_test_rst;
	assign tb_rEn = tb_test_rEn;
	assign tb_wEn = tb_test_wEn;
	assign tb_address = tb_test_address;
	assign tb_wData = tb_test_wData;
	/*	assign tb_n_rst					= tb_test_inputs[2];
		assign tb_d_plus				= tb_test_inputs[1];
		assign tb_shift_enable				= tb_test_inputs[0];
		assign tb_eop					= tb_test_inputs[3];*/
	// Test bench process
	initial
	begin
	tb_test_case = 0;
	tb_test_rEn = 1'b0;
	tb_test_wEn = 1'b0;
	tb_test_wData = 16'h0000;
	tb_test_address = 64'h0000000000000000;

	tb_test_rst = 1'b1;
#5;
	tb_test_rst = 1'b0;
#5;
	tb_test_rst = 1'b1;
#5;

	for(tb_test_case =0; tb_test_case < 256;tb_test_case = tb_test_case +1)
	begin
	tb_test_wEn = 1'b1;
	tb_test_address =tb_test_case;
	tb_test_wData = 16'hf0f0;
#30;
	tb_test_wEn = 1'b0;
	tb_test_address =64'b0000000000000001;
	tb_test_wData = 16'hf0f0;
#10;
	end

#10;
	end
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
