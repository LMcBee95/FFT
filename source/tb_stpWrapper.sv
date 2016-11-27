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
		load_register(0,16'h0);
		
		load_register(1,16'h0);
		load_register(1,16'h1);
		load_register(1,16'h2);
		load_register(1,16'h3);
		load_register(1,16'h4);
		load_register(1,16'h5);
		load_register(1,16'h6);
		load_register(1,16'h7);
		load_register(1,16'h8);
		load_register(1,16'h9);
		load_register(1,16'hA);
		load_register(1,16'hB);
		load_register(1,16'hC);
		load_register(1,16'hD);
		load_register(1,16'hE);
		load_register(1,16'hF);
		load_register(1,16'h10);
		load_register(1,16'h11);
		load_register(1,16'h12);
		load_register(1,16'h13);
		load_register(1,16'h14);
		load_register(1,16'h15);
		load_register(1,16'h16);
		load_register(1,16'h17);
		load_register(1,16'h18);
		load_register(1,16'h19);
		load_register(1,16'h1A);
		load_register(1,16'h1B);
		load_register(1,16'h1C);
		load_register(1,16'h1D);
		load_register(1,16'h1E);
		load_register(1,16'h1F);
		load_register(1,16'h20);
		load_register(1,16'h21);
		load_register(1,16'h22);
		load_register(1,16'h23);
		load_register(1,16'h24);
		load_register(1,16'h25);
		load_register(1,16'h26);
		load_register(1,16'h27);
		load_register(1,16'h28);
		load_register(1,16'h29);
		load_register(1,16'h2A);
		load_register(1,16'h2B);
		load_register(1,16'h2C);
		load_register(1,16'h2D);
		load_register(1,16'h2E);
		load_register(1,16'h2F);
		
		load_register(0,16'h0);
		
		#(1);
		$info("Output: ",);
		for(int i = 0; i < 48; i++)
		begin
			$info("%h", tb_data_par[i]);
		end
		


	end

endmodule