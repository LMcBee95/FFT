module StPWrapper(
	input wire clk, //400 MHz
	input wire n_rst, //asynch, active-low
	input wire it_cnt_strobe, //acrtive-high
	input wire serial_in, //serial input, value to be shifted into reg, default = 1
	output reg [15:0] out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16,out17,out18,out19,
	output reg [15:0] out20,out21,out22,out23,out24,out25,out26,out27,out28,out29,out30,out31,out32,out33,out34,out35,out36,out37,out38,out39,
	output reg [15:0] out40,out41,out42,out43,out44,out45,out46,out47
	
);

	always_comb begin
	
	flex_stp_sr sr0 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out0));
	flex_stp_sr sr1 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out1));
	flex_stp_sr sr2 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out2));
	flex_stp_sr sr3 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out3));
	flex_stp_sr sr4 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out4));
	flex_stp_sr sr5 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out5));
	flex_stp_sr sr6 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out6));
	flex_stp_sr sr7 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out7));
	flex_stp_sr sr8 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out8));
	flex_stp_sr sr9 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out9));
	flex_stp_sr sr10 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out10));
	flex_stp_sr sr11 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out11));
	
	flex_stp_sr sr12 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out12));
	flex_stp_sr sr13 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out13));
	flex_stp_sr sr14 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out14));
	flex_stp_sr sr15 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out15));
	flex_stp_sr sr16 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out16));
	flex_stp_sr sr17 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out17));
	flex_stp_sr sr18 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out18));
	flex_stp_sr sr19 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out19));
	flex_stp_sr sr20 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out20));
	flex_stp_sr sr21 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out21));
	flex_stp_sr sr22 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out22));
	flex_stp_sr sr23 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out23));
	
	flex_stp_sr sr24 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out24));
	flex_stp_sr sr25 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out25));
	flex_stp_sr sr26 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out26));
	flex_stp_sr sr27 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out27));
	flex_stp_sr sr28 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out28));
	flex_stp_sr sr29 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out29));
	flex_stp_sr sr30 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out30));
	flex_stp_sr sr31 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out31));
	flex_stp_sr sr32 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out32));
	flex_stp_sr sr33 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out33));
	flex_stp_sr sr34 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out34));
	flex_stp_sr sr35 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out35));
	
	flex_stp_sr sr36 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out36));
	flex_stp_sr sr37 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out37));
	flex_stp_sr sr38 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out38));
	flex_stp_sr sr39 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out39));
	flex_stp_sr sr40 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out40));
	flex_stp_sr sr41 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out41));
	flex_stp_sr sr42 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out42));
	flex_stp_sr sr43 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out43));
	flex_stp_sr sr44 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out44));
	flex_stp_sr sr45 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out45));
	flex_stp_sr sr46 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out46));
	flex_stp_sr sr47 (.clk(clk),.n_rst(n_rst),.shift_enable(it_cnt_strobe),.serial_in(serial_in),.parallel_out(out47));
	
	end
endmodule