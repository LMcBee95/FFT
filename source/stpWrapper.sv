module stpWrapper(
	input wire clk, //400 MHz
	input wire n_rst, //asynch, active-low
	input wire it_cnt_strobe, //acrtive-high
	input wire [15:0] serial_in, //serial input, value to be shifted into reg, default = 1
	output reg [47:0] [15:0] data_par_in
	
);

	always_ff @ (posedge clk, negedge n_rst) begin

		if(n_rst == 0)
		begin
			data_par_in <= 0;		
		end

		else if (it_cnt_strobe == 1)
		begin
			data_par_in[47:0] <= {serial_in, data_par_in[47:1]};
		end

	end	
endmodule
