`timescale 1ns/10ps

module tb_ButterflyWrapper();

	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals
	reg [47:0] [15:0] tb_data_par_in;
	reg [31:0] [15:0] tb_data_par_out;


	//We set up a set of tasks which make loading in the butterfly blocks easy this must be done for all 8 butterflies in the wrapper
	task load_butterfly1;
		input logic [15:0] real_1;
		input logic [15:0] imag_1;
		input logic [15:0] real_2;
		input logic [15:0] imag_2;
		input logic [15:0] twid_r;
		input logic [15:0] twid_i;
	begin
		tb_data_par_in[0] = real_1;
		tb_data_par_in[1] = imag_1;
		tb_data_par_in[2] = real_2;
		tb_data_par_in[3] = imag_2;
		tb_data_par_in[4] = twid_r;
		tb_data_par_in[5] = twid_i;
	end
	endtask
	
	task load_butterfly2;
		input logic [15:0] real_3;
		input logic [15:0] imag_3;
		input logic [15:0] real_4;
		input logic [15:0] imag_4;
		input logic [15:0] twid2_r;
		input logic [15:0] twid2_i;
	begin
		tb_data_par_in[6] = real_3;
		tb_data_par_in[7] = imag_3;
		tb_data_par_in[8] = real_4;
		tb_data_par_in[9] = imag_4;
		tb_data_par_in[10] = twid2_r;
		tb_data_par_in[11] = twid2_i;
	end
	endtask
	
	task load_butterfly3;
		input logic [15:0] real_5;
		input logic [15:0] imag_5;
		input logic [15:0] real_6;
		input logic [15:0] imag_6;
		input logic [15:0] twid3_r;
		input logic [15:0] twid3_i;
	begin
		tb_data_par_in[12] = real_5;
		tb_data_par_in[13] = imag_5;
		tb_data_par_in[14] = real_6;
		tb_data_par_in[15] = imag_6;
		tb_data_par_in[16] = twid3_r;
		tb_data_par_in[17] = twid3_i;
	end
	endtask
	
	task load_butterfly4;
		input logic [15:0] real_7;
		input logic [15:0] imag_7;
		input logic [15:0] real_8;
		input logic [15:0] imag_8;
		input logic [15:0] twid4_r;
		input logic [15:0] twid4_i;
	begin
		tb_data_par_in[18] = real_7;
		tb_data_par_in[19] = imag_7;
		tb_data_par_in[20] = real_8;
		tb_data_par_in[21] = imag_8;
		tb_data_par_in[22] = twid4_r;
		tb_data_par_in[23] = twid4_i;
	end
	endtask
	
	task load_butterfly5;
		input logic [15:0] real_9;
		input logic [15:0] imag_9;
		input logic [15:0] real_10;
		input logic [15:0] imag_10;
		input logic [15:0] twid5_r;
		input logic [15:0] twid5_i;
	begin
		tb_data_par_in[24] = real_9;
		tb_data_par_in[25] = imag_9;
		tb_data_par_in[26] = real_10;
		tb_data_par_in[27] = imag_10;
		tb_data_par_in[28] = twid5_r;
		tb_data_par_in[29] = twid5_i;
	end
	endtask
	
	task load_butterfly6;
		input logic [15:0] real_11;
		input logic [15:0] imag_11;
		input logic [15:0] real_12;
		input logic [15:0] imag_12;
		input logic [15:0] twid6_r;
		input logic [15:0] twid6_i;
	begin
		tb_data_par_in[30] = real_11;
		tb_data_par_in[31] = imag_11;
		tb_data_par_in[32] = real_12;
		tb_data_par_in[33] = imag_12;
		tb_data_par_in[34] = twid6_r;
		tb_data_par_in[35] = twid6_i;
	end
	endtask
	
	task load_butterfly7;
		input logic [15:0] real_13;
		input logic [15:0] imag_13;
		input logic [15:0] real_14;
		input logic [15:0] imag_14;
		input logic [15:0] twid7_r;
		input logic [15:0] twid7_i;
	begin
		tb_data_par_in[36] = real_13;
		tb_data_par_in[37] = imag_13;
		tb_data_par_in[38] = real_14;
		tb_data_par_in[39] = imag_14;
		tb_data_par_in[40] = twid7_r;
		tb_data_par_in[41] = twid7_i;
	end
	endtask
	
	task load_butterfly8;
		input logic [15:0] real_15;
		input logic [15:0] imag_15;
		input logic [15:0] real_16;
		input logic [15:0] imag_16;
		input logic [15:0] twid8_r;
		input logic [15:0] twid8_i;
	begin
		tb_data_par_in[42] = real_15;
		tb_data_par_in[43] = imag_15;
		tb_data_par_in[44] = real_16;
		tb_data_par_in[45] = imag_16;
		tb_data_par_in[46] = twid8_r;
		tb_data_par_in[47] = twid8_i;
	end
	endtask
	
	// DUT portmap
	ButterflyWrapper DUT(		
		.data_par_in(tb_data_par_in),
		.data_par_out(tb_data_par_out)
		
	);	
	// Test bench process
	initial
	begin
		
		load_butterfly1(16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000100000000 , 16'b0000000000000000);
		load_butterfly2(16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000100000000 , 16'b0000000000000000);
		load_butterfly3(16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000100000000 , 16'b0000000000000000);
		load_butterfly4(16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000100000000 , 16'b0000000000000000);
		load_butterfly5(16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000100000000 , 16'b0000000000000000);
		load_butterfly6(16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000100000000 , 16'b0000000000000000);
		load_butterfly7(16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000100000000 , 16'b0000000000000000);
		load_butterfly8(16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000100000000 , 16'b0000000000000000);

		#(1);

		$info("Real 1 = %d | Imag 1 = %d | Real 2 = %d | Imag 2 = %d", tb_data_par_out[0], tb_data_par_out[1], tb_data_par_out[2], tb_data_par_out[3]);
		$info("Real 3 = %d | Imag 3 = %d | Real 4 = %d | Imag 4 = %d", tb_data_par_out[4], tb_data_par_out[5], tb_data_par_out[6], tb_data_par_out[7]);
		$info("Real 5 = %d | Imag 5 = %d | Real 6 = %d | Imag 6 = %d", tb_data_par_out[8], tb_data_par_out[9], tb_data_par_out[10], tb_data_par_out[11]);
		$info("Real 7 = %d | Imag 7 = %d | Real 8 = %d | Imag 8 = %d", tb_data_par_out[12], tb_data_par_out[13], tb_data_par_out[14], tb_data_par_out[15]);
		$info("Real 9 = %d | Imag 9 = %d | Real 10 = %d | Imag 10 = %d", tb_data_par_out[16], tb_data_par_out[17], tb_data_par_out[18], tb_data_par_out[19]);
		$info("Real 11 = %d | Imag 11 = %d | Real 12 = %d | Imag 12 = %d", tb_data_par_out[20], tb_data_par_out[21], tb_data_par_out[22], tb_data_par_out[23]);
		$info("Real 13 = %d | Imag 13 = %d | Real 14 = %d | Imag 14 = %d", tb_data_par_out[24], tb_data_par_out[25], tb_data_par_out[26], tb_data_par_out[27]);
		$info("Real 15 = %d | Imag 15 = %d | Real 16 = %d | Imag 16 = %d", tb_data_par_out[28], tb_data_par_out[29], tb_data_par_out[30], tb_data_par_out[31]);

		
	end
endmodule
