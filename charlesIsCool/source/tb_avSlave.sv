// 337 TA Provided Lab 2 Testbench
// This code serves as a test bench for the 1 bit adder design 

`timescale 1ns / 100ps

module tb_avSlave
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
wire tb_slave_read;
wire [8:0]tb_slave_address;
wire [31:0]tb_slave_writedata;
reg [15:0] tb_fft_init_data;
reg [8:0] tb_wAddress;
reg tb_fft_start;
reg tb_slave_chipselect;

// Declare test bench signals
integer tb_test_case;
reg tb_test_rst;
reg tb_sWriteEn;
reg tb_test_slave_read;
reg tb_test_slave_write;
reg [8:0]tb_test_slave_address;
reg [31:0]tb_test_slave_writedata;
reg tb_test_slave_chipselect;
// DUT port map
	avSlave DUT(
			.clk(tb_clk),
			.n_rst(tb_n_rst),
			.slave_read(tb_slave_read),
			.slave_write(tb_slave_write),
			.sWriteEn(tb_sWriteEn),
			.slave_address(tb_slave_address),
			.slave_writedata(tb_slave_writedata),
			.fft_init_data(tb_fft_init_data),
			.wAddress(tb_wAddress),
			.fft_start(tb_fft_start),
			.slave_chipselect(tb_slave_chipselect)
		       );

	// Connect individual test input bits to a vector for easier testing
	assign tb_n_rst = tb_test_rst;
	assign tb_slave_read = tb_test_slave_read;
	assign tb_slave_write = tb_test_slave_write;
	assign tb_slave_address = tb_test_slave_address;
	assign tb_slave_writedata = tb_test_slave_writedata;
	assign tb_slave_chipselect = tb_test_slave_chipselect;
	/*	assign tb_n_rst					= tb_test_inputs[2];
		assign tb_d_plus				= tb_test_inputs[1];
		assign tb_shift_enable				= tb_test_inputs[0];
		assign tb_eop					= tb_test_inputs[3];*/
	// Test bench process
	initial
	begin
	tb_test_case = 0;
	tb_test_slave_read = 1'b0;
	tb_test_slave_write = 1'b0;
	tb_test_slave_writedata = 17'h0000;
	tb_test_slave_address = 9'h00;
	tb_test_slave_chipselect = 1'b0;

	tb_test_rst = 1'b1;
#5;
	tb_test_rst = 1'b0;
#5;
	tb_test_rst = 1'b1;
#5;
	tb_test_slave_write = 1'b1;
	tb_test_slave_address =tb_test_case;
	tb_test_slave_writedata = 17'h1ffff;
	tb_test_slave_chipselect = 1'b1;
#10
	for(tb_test_case =0; tb_test_case < 256;tb_test_case = tb_test_case +1)
	begin
	tb_test_slave_write = 1'b1;
	tb_test_slave_address =tb_test_case;
	tb_test_slave_writedata = tb_test_case;
	tb_test_slave_chipselect = 1'b1;
#30;
	tb_test_slave_write = 1'b0;
	tb_test_slave_address =9'h00;
	tb_test_slave_writedata = 17'h0f0f0;
	tb_test_slave_chipselect = 1'b0;
#30;
	end

	tb_test_slave_write = 1'b1;
	tb_test_slave_address =tb_test_case;
	tb_test_slave_writedata = 17'h10000;
	tb_test_slave_chipselect = 1'b1;

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
