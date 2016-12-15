



module mem_buff//the memory buffer which will feed in and out of the butterfly block
(
	input wire fft_start,
	input wire sram_read_ena,
	input wire sram_write_ena,
	input wire [15:0] write_data,
	input wire [9:0] address,
	input wire [511:0] [15:0] main_data,
	output reg [15:0] sample,
	output reg [511:0] [15:0] all_data 

);	
	
	always_ff @ (posedge fft_start)
	begin
		all_data = main_data;
	end
	always_ff @ (posedge sram_read_ena)
	begin
		sample = all_data[address];
	end
	always_ff @ (posedge sram_write_ena)
	begin
		all_data[address] = write_data;
	end

endmodule
