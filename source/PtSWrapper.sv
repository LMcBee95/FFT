module PtSWrapper(
	input wire clk,
	input wire n_rst, //active-low
	input wire shift_enable, //active-high, allows shift reg to shift out next value for serial_out port
	input wire out_strobe, //active-high, allows shift reg to load value at the parallel)in port , TAKE PRIORITY over shift_enable 
	input wire [31:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,
	output reg serial_out //if loading, serial_out = 0
);


	always_comb begin
		
		flex_pts_sr sr1 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in1),.serial_out(serial_out));
		flex_pts_sr sr2 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in2),.serial_out(serial_out));
		flex_pts_sr sr3 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in3),.serial_out(serial_out));
		flex_pts_sr sr4 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in4),.serial_out(serial_out));
		flex_pts_sr sr5 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in5),.serial_out(serial_out));
		flex_pts_sr sr6 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in6),.serial_out(serial_out));
		flex_pts_sr sr7 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in7),.serial_out(serial_out));
		flex_pts_sr sr8 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in8),.serial_out(serial_out));
		flex_pts_sr sr9 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in9),.serial_out(serial_out));
		flex_pts_sr sr10 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in10),.serial_out(serial_out));
		flex_pts_sr sr11 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in11),.serial_out(serial_out));
		flex_pts_sr sr12 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in12),.serial_out(serial_out));
		flex_pts_sr sr13 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in13),.serial_out(serial_out));
		flex_pts_sr sr14 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in14),.serial_out(serial_out));
		flex_pts_sr sr15 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in15),.serial_out(serial_out));
		flex_pts_sr sr16 (.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable),.load_enable(out_strobe),.parallel_in(in16),.serial_out(serial_out));
		
	end
endmodule