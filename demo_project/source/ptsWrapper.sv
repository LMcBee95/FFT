module ptsWrapper(
	input wire clk,
	input wire n_rst, //active-low
	input wire out_strobe, //active-high, allows shift reg to shift out next value for serial_out port
	input wire load_enable, //active-high, allows shift reg to load value at the parallel)in port , TAKE PRIORITY over shift_enable 
	input wire [31:0] [15:0] data_par_out,
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
			data_in <= data_par_out;

		end

		else if (out_strobe == 1)
		begin
			serial_out <= data_in[0];
			data_in[31:0] <= {16'd0,data_in[31:1]};
			
		end
	end
endmodule
