`timescale 1ns/10ps

module tb_stpWrapper();

	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals
	reg tb_clk;
	reg tb_n_reset;
	reg tb_it_cnt_strobe;
	reg [15:0] tb_serial_in;
	reg [47:0][15:0] tb_data_par_in;

	task load_register;
		input logic strobe;
		input logic [15:0] serial;
	begin
		tb_it_cnt_strobe = strobe;
		tb_serial_in = serial;
	end
	endtask
	
	task reset_dut;
	begin
		// Activate the design's reset (does not need to be synchronize with clock)
		tb_n_reset = 1'b0;
		
		// Wait for a couple clock cycles
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		// Release the reset
		@(negedge tb_clk);
		tb_n_reset = 1;
		
		// Wait for a while before activating the design
		@(posedge tb_clk);
		@(posedge tb_clk);
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
	stpWrapper DUT(
		.clk(tb_clk), //400 MHz
		.n_rst(tb_n_reset), //asynch, active-low
		.it_cnt_strobe(tb_it_cnt_strobe), //active-high
		.serial_in(tb_serial_in), //serial input, value to be shifted into reg, default = 1
		.data_par_in(tb_data_par_in)
	);	
	
	// Test bench process
	initial
	begin
		reset_dut;
		//#Test 1: Loading values 0-47
		@(negedge tb_clk);
		load_register(0,16'h0);
		
		for(int i = 0; i < 48; i++)
		begin
			@(negedge tb_clk);
			load_register(1,i);
		end
		
		@(negedge tb_clk);
		load_register(0,16'h0);
		
		#(1);
		$info("Output: ",);
		for(int i = 0; i < 48; i++)
		begin
			@(negedge tb_clk);
			$info("%h", tb_data_par_in[i]);
		end

		//#Test 1: Loading values 47-0
		@(negedge tb_clk);
		load_register(0,16'h0);
		
		for(int i = 0; i < 48; i++)
		begin
			@(negedge tb_clk);
			load_register(1,(47-i)%17);
		end
		
		@(negedge tb_clk);
		load_register(0,16'h0);
		
		#(1);
		$info("Output: ",);
		for(int i = 0; i < 48; i++)
		begin
			@(negedge tb_clk);
			$info("%h", tb_data_par_in[i]);
		end
	end
endmodule
