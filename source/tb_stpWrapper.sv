`timescale 1ns/10ps

module tb_stpWrapper();

	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals
	wire tb_clk;
	wire tb_n_reset;
	wire tb_it_cnt_strobe;
	reg [15:0] tb_serial_in;
	reg [47:0][15:0] tb_data_par;

	task load_register;
		input logic it_cnt_strobe;
		input logic [15:0] serial_in;
	begin
		tb_it_cnt_strobe = it_cnt_strobe;
		tb_serial_in = serial_in;
	end
	endtask
	
	// Clock gen block
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end
	
	// DUT portmap
	StPWrapper DUT(
		.clk(tb_clk), //400 MHz
		.n_rst(tb_n_reset), //asynch, active-low
		.it_cnt_strobe(tb_it_cnt_strobe), //active-high
		.serial_in(tb_serial_in), //serial input, value to be shifted into reg, default = 1
		.data_par(tb_data_par)
	);	
	
	// Test bench process
	initial
	begin
		#Test 1: Loading values 0-47
		@(negedge tb_clk);
		load_register(0,16'h0);
		
		for(int i = 0; i < 48; i++)
		begin
			@(negedge tb_clk);
			load_register(1,i)
		end
		
		@(negedge tb_clk);
		load_register(0,16'h0);
		
		#(1);
		$info("Output: ",);
		for(int i = 0; i < 48; i++)
		begin
			@(negedge tb_clk);
			$info("%h", tb_data_par[i]);
		end
	end
endmodule