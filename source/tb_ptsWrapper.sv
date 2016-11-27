`timescale 1ns/10ps

module tb_ptsWrapper();

	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals
	wire tb_clk;
	wire tb_n_reset;
	wire tb_out_strobe;
	wire tb_load_strobe;
	wire [15:0] tb_in1,tb_in2,tb_in3,tb_in4,tb_in5,tb_in6,tb_in7,tb_in8,tb_in9,tb_in10,tb_in11,tb_in12,tb_in13,tb_in14,tb_in15,tb_in16;
	wire [15:0] tb_in17,tb_in18,tb_in19,tb_in20,tb_in21,tb_in22,tb_in23,tb_in24,tb_in25,tb_in26,tb_in27,tb_in28,tb_in29,tb_in30,tb_in31,tb_in32;
	reg [15:0] tb_serial_out;

	task load_register;
		input logic load_strobe;
		input logic [15:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16;
		input logic [15:0] in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,in32;
	begin
		tb_load_strobe = load_strobe;
		
		tb_in1 = in1;
		tb_in2 = in2;
		tb_in3 = in3;
		tb_in4 = in4;
		tb_in5 = in5;
		tb_in6 = in6;
		tb_in7 = in7;
		tb_in8 = in8;
		tb_in9 = in9;
		tb_in10 = in10;
		tb_in11 = in11;
		tb_in12 = in12;
		tb_in13 = in13;
		tb_in14 = in14;
		tb_in15 = in15;
		tb_in16 = in16;
		tb_in17 = in17;
		tb_in18 = in18;
		tb_in19 = in19;
		tb_in20 = in20;
		tb_in21 = in21;
		tb_in22 = in22;
		tb_in23 = in23;
		tb_in24 = in24;
		tb_in25 = in25;
		tb_in26 = in26;
		tb_in27 = in27;
		tb_in28 = in28;
		tb_in29 = in29;
		tb_in30 = in30;
		tb_in31 = in31;
		tb_in32 = in32;
	end
	endtask
	
	task out_register;
		input logic out_strobe;
	begin
		tb_out_strobe = out_strobe;
	end
	
	// Clock gen block
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end
	
	// DUT portmap
	PtSWrapper DUT(
		.clk(tb_clk), //400 MHz
		.n_rst(tb_n_reset), //asynch, active-low
		.out_strobe(tb_out_strobe);
		.load_strobe(tb_load_strobe);
		
		.in1(tb_in1);
		.in2(tb_in2);
		.in3(tb_in3);
		.in4(tb_in4);
		.in5(tb_in5);
		.in6(tb_in6);
		.in7(tb_in7);
		.in8(tb_in8);
		.in9(tb_in9);
		.in10(tb_in10);
		.in11(tb_in11);
		.in12(tb_in12);
		.in13(tb_in13);
		.in14(tb_in14);
		.in15(tb_in15);
		.in16(tb_in16);
		.in17(tb_in17);
		.in18(tb_in18);
		.in19(tb_in19);
		.in20(tb_in20);
		.in21(tb_in21);
		.in22(tb_in22);
		.in23(tb_in23);
		.in24(tb_in24);
		.in25(tb_in25);
		.in26(tb_in26);
		.in27(tb_in27);
		.in28(tb_in28);
		.in29(tb_in29);
		.in30(tb_in30);
		.in31(tb_in31);
		.in32(tb_in32);
		
		.serial_out(tb_serial_out);
	);	
	
	// Test bench process
	initial
	begin
		#Test 1: Loading values
		@(negedge tb_clk);
		out_register(0);
		
		@(negedge tb_clk);
		load_register(1,
		16'h0,16'h1,
		16'h2,16'h3,
		16'h4,16'h5,
		16'h6,16'h7,
		16'h8,16'h9,
		16'hA,16'hB,
		16'hC,16'hD,
		16'hE,16'hF,
		16'h10,16'h11,
		16'h12,16'h13,
		16'h14,16'h15,
		16'h16,16'h17,
		16'h18,16'h19,
		16'h1A,16'h1B,
		16'h1C,16'h1D,
		16'h1E,16'h1F
		);
		
		@(negedge tb_clk);
		load_register(0,
		16'h0,16'h1,
		16'h2,16'h3,
		16'h4,16'h5,
		16'h6,16'h7,
		16'h8,16'h9,
		16'hA,16'hB,
		16'hC,16'hD,
		16'hE,16'hF,
		16'h10,16'h11,
		16'h12,16'h13,
		16'h14,16'h15,
		16'h16,16'h17,
		16'h18,16'h19,
		16'h1A,16'h1B,
		16'h1C,16'h1D,
		16'h1E,16'h1F
		);
		
		#(1);
		$info("Output: ",);
		for(int i = 0; i < 32; i++)
		begin
			@(negedge tb_clk);
			out_register(1);
			$info("%h", tb_serial_out);
		end
		
	end
endmodule