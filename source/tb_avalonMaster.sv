// 337 TA Provided Lab 2 Testbench
// This code serves as a test bench for the 1 bit adder design 

`timescale 1ns / 100ps

module tb_avalonMaster
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
wire tb_rst;
wire tb_rEn;
wire [63:0]tb_address;
wire [15:0]tb_wData;
reg [15:0] tb_rData;
reg [1:0] tb_response;
reg [8:0] tb_sampled_address;
reg [15:0] tb_sampled_data;
reg tb_fft_done;

// Declare test bench signals
integer tb_test_case;
reg tb_test_rst;
reg [15:0]tb_test_rData;
reg tb_test_response;
reg tb_test_fft_done;
reg [63:0]tb_test_sampled_data;

// DUT port map
	avalonMaster DUT(
			.clk(tb_clk),
			.n_rst(tb_rst),
			.rEn(tb_rEn),
			.wEn(tb_wEn),
			.address(tb_address),
			.wData(tb_wData),
			.response(tb_response),
			.fft_done(tb_fft_done),
			.sampled_data(tb_sampled_data),
			.sampled_address(tb_sampled_address),
			.sReEn(tb_sReEn)
		       );

	// Connect individual test input bits to a vector for easier testing
	assign tb_rst = tb_test_rst;
	assign tb_rData = tb_test_rData;
	assign tb_response = tb_test_response;
	assign tb_fft_done = tb_test_fft_done;
	assign tb_sampled_data = tb_test_sampled_data;

	// Test bench process
	initial
	begin
	tb_test_rData = 16'hffff;
	tb_test_response = 2'b00;
	tb_test_fft_done = 1'b0;
	tb_test_sampled_data = 16'hf0f0;

	tb_test_rst = 1'b1;
#5;
	tb_test_rst = 1'b0;
#5;
	tb_test_rst = 1'b1;
#5;

	tb_test_fft_done = 1'b1; 

#10;
	tb_test_fft_done = 1'b0;

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
