// 337 TA Provided Lab 2 Testbench
// This code serves as a test bench for the 1 bit adder design 

`timescale 1ns / 100ps

module tb_custom_master_slave
();
localparam	CLK_PERIOD	= 10;
localparam MASTER_ADDRESSWIDTH = 32 ;  	// ADDRESSWIDTH specifies how many addresses the Master can address 
localparam SLAVE_ADDRESSWIDTH = 9 ;// ADDRESSWIDTH specifies how many addresses the slave needs to be mapped to. log(NUMREGS)
localparam DATAWIDTH = 32 ;// DATAWIDTH specifies the data width. Default 32 bits
localparam NUMREGS = 8 ;      		// Number of Internal Registers for Custom Logic
localparam REGWIDTH = 32;      		// Data Width for the Internal Registers. Default 32 bits
localparam START_BYTE = 9'h1FF;

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
wire [SLAVE_ADDRESSWIDTH-1:0]tb_slave_address;
wire [DATAWIDTH-1:0]tb_slave_writedata;
reg tb_slave_chipselect;

// Declare test bench signals
integer tb_test_case;
reg tb_test_rst;;
reg tb_test_slave_read;
reg tb_test_slave_write;
reg [SLAVE_ADDRESSWIDTH-1:0]tb_test_slave_address;
reg [DATAWIDTH-1:0]tb_test_slave_writedata;
reg tb_test_slave_chipselect;
reg tb_slave_readdatavalid;
reg tb_slave_waitrequest;
reg [DATAWIDTH-1:0]tb_slave_readdata;

reg [MASTER_ADDRESSWIDTH-1:0]tb_master_address;
reg [DATAWIDTH-1:0]tb_master_writedata;
reg tb_master_write;
reg tb_master_read;
reg [DATAWIDTH-1:0]tb_master_readdata;
reg tb_master_readdatavalid;
reg tb_master_waitrequest;

reg [DATAWIDTH-1:0]tb_test_master_readdata;
reg tb_test_master_readdatavalid;
reg tb_test_master_waitrequest;


// DUT port map
	custom_master_slave DUT(
			.clk(tb_clk),
			.n_rst(tb_n_rst),

			.slave_read(tb_slave_read),
			.slave_write(tb_slave_write),
			.slave_address(tb_slave_address),
			.slave_writedata(tb_slave_writedata),
			.slave_readdata(tb_slave_readdata),
			.slave_chipselect(tb_slave_chipselect),
//			.slave_readdatavalid(tb_slave_readdatavalid),
//			.slave_waitrequest(tb_slave_waitrequest),


			.master_address(tb_master_address),
			.master_writedata(tb_master_writedata),
			.master_write(tb_master_write),
			.master_read(tb_master_read),
			.master_readdata(tb_master_readdata),
			.master_readdatavalid(tb_master_readdatavalid),
			.master_waitrequest(tb_master_waitrequest)

		       );




	// Connect individual test input bits to a vector for easier testing
	assign tb_n_rst = tb_test_rst;
	assign tb_slave_read = tb_test_slave_read;
	assign tb_slave_write = tb_test_slave_write;
	assign tb_slave_address = tb_test_slave_address;
	assign tb_slave_writedata = tb_test_slave_writedata;
	assign tb_slave_chipselect = tb_test_slave_chipselect;

	assign tb_master_readdata = tb_test_master_readdata;
	assign tb_master_readdatavalid = tb_test_master_readdatavalid;
	assign tb_master_waitrequest = tb_test_master_waitrequest;



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
	tb_test_slave_writedata = 16'h0000;
	tb_test_slave_address = 9'h00;
	tb_test_slave_chipselect = 1'b0;
	tb_test_master_waitrequest = 1'b0;
tb_test_master_readdata ='0;
tb_test_master_readdatavalid = '0;

	tb_test_rst = 1'b1;
#5;
	tb_test_rst = 1'b0;
#5;
	tb_test_rst = 1'b1;
#5;
	tb_test_slave_write = 1'b1;
	tb_test_slave_address =tb_test_case;
	tb_test_slave_writedata = 16'hffff;
	tb_test_slave_chipselect = 1'b1;
#10
	for(tb_test_case =0; tb_test_case < 256;tb_test_case = tb_test_case +1)
	begin
	tb_test_slave_write = 1'b1;
	tb_test_slave_address =tb_test_case;
	tb_test_slave_writedata = 16'b0000000100000000;
	tb_test_slave_chipselect = 1'b1;
#30;
	tb_test_slave_write = 1'b0;
	tb_test_slave_address =9'h00;
	tb_test_slave_writedata = 16'hf0f0;
	tb_test_slave_chipselect = 1'b0;
#10;
	end

#10;
	tb_test_slave_read = 1'b0;
	tb_test_slave_write = 1'b1;
	tb_test_slave_address =9'h1ff;
	tb_test_slave_writedata = 16'h0000;
	tb_test_slave_chipselect = 1'b1;
#10;
	tb_test_slave_read = 1'b0;
	tb_test_slave_write = 1'b0;
	tb_test_slave_address =9'h000;
	tb_test_slave_writedata = 16'h0000;
	tb_test_slave_chipselect = 1'b0;
#1000;

#10;
	for(tb_test_case = 0;tb_test_case <512;tb_test_case = tb_test_case +1)
	begin
	tb_test_master_waitrequest = 1'b1;
	#30;
	tb_test_master_waitrequest = 1'b0;
	#10;
	end
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
