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
wire tb_master_read;
wire [63:0]tb_master_address;
wire [15:0]tb_master_write_data;
reg [15:0] tb_rData;
reg [1:0] tb_master_response;
reg [8:0] tb_sampled_address;
reg [15:0] tb_sampled_data;
reg tb_fft_done;
reg tb_waitrequest;
// Declare test bench signals
integer tb_test_case;
reg tb_test_rst;
reg [15:0]tb_test_rData;
reg tb_test_master_response;
reg tb_test_fft_done;
reg [63:0]tb_test_sampled_data;
reg tb_test_waitrequest;

// DUT port map
	avalonMaster DUT(
			.clk(tb_clk),
			.n_rst(tb_rst),
			.master_read(tb_master_read),
			.master_write(tb_master_write),
			.master_address(tb_master_address),
			.master_write_data(tb_master_write_data),
			.master_response(tb_master_response),
			.fft_done(tb_fft_done),
			.sampled_data(tb_sampled_data),
			.sampled_master_address(tb_sampled_address),
			.sReEn(tb_sReEn),
			.master_waitrequest(tb_master_waitrequest)
		       );

	// Connect individual test input bits to a vector for easier testing
	assign tb_waitrequest = tb_test_waitrequest;
	assign tb_rst = tb_test_rst;
	assign tb_rData = tb_test_rData;
	assign tb_master_response = tb_test_master_response;
	assign tb_fft_done = tb_test_fft_done;
	assign tb_sampled_data = tb_test_sampled_data;

	// Test bench process
	initial
	begin
	tb_test_rData = 16'hffff;
	tb_test_master_response = 2'b00;
	tb_test_fft_done = 1'b0;
	tb_test_sampled_data = 16'hf0f0;
	tb_waitrequest = 1'b0;

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
