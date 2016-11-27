module ptsWrapper(
	input wire clk,
	input wire n_rst, //active-low
	input wire out_strobe, //active-high, allows shift reg to shift out next value for serial_out port
	input wire load_enable, //active-high, allows shift reg to load value at the parallel)in port , TAKE PRIORITY over shift_enable 
	input wire [15:0] in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,
	input wire [15:0] in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,in32,
	output reg [15:0] serial_out //if loading, serial_out = 0
);

	reg [31:0][15:0] data_in;

	always_ff @ (posedge clk, negedge n_rst)
	begin
		if(n_rst == 0)
		begin
			data_in <= 0;
			serial_out <= 0;
		end
		
		else if(load_enable == 1)
		begin
			data_in[0] <= in1;
			data_in[1] <= in2;
			data_in[2] <= in3;
			data_in[3] <= in4;
			data_in[4] <= in5;
			data_in[5] <= in6;
			data_in[6] <= in7;
			data_in[7] <= in8;
			data_in[8] <= in9;
			data_in[9] <= in10;
			data_in[10] <= in11;
			data_in[11] <= in12;
			data_in[12] <= in13;
			data_in[13] <= in14;
			data_in[14] <= in15;
			data_in[15] <= in16;
			data_in[16] <= in17;
			data_in[17] <= in18;
			data_in[18] <= in19;
			data_in[19] <= in20;
			data_in[20] <= in21;
			data_in[21] <= in22;
			data_in[22] <= in23;
			data_in[23] <= in24;
			data_in[24] <= in25;
			data_in[25] <= in26;
			data_in[26] <= in27;
			data_in[27] <= in28;
			data_in[28] <= in29;
			data_in[29] <= in30;
			data_in[30] <= in31;
			data_in[31] <= in32;

		end

		else if (out_strobe == 1)
		begin
			serial_out <= data_in[0];
			data_in[31:0] <= {16'd0,data_in[31:1]};
			
		end
	end
endmodule
