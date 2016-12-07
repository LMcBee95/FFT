
`timescale 1ns / 100ps
module tb_mem_buff();


	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals
	reg tb_fft_start;
	reg tb_sram_read_ena;
	reg tb_sram_write_ena;
	reg [15:0] tb_write_data;
	reg [9:0] tb_address;
	reg [511:0] [15:0] tb_main_data;
	reg [15:0] tb_sample;
	reg [511:0] [15:0] tb_all_data; 
	

	//task check_integer;
	reg [511:0] [15:0] temp_buff;

	task initialize;
		
	begin
		tb_fft_start = 0;
		tb_sram_read_ena = 0;
		tb_sram_write_ena = 0;
		tb_write_data = 0; 
		tb_address = 0;
		tb_main_data = 0;
	end
	endtask

	task load_buffer;
		
	begin
		tb_fft_start = 0;		
			
		for(int i = 0; i < 512; i++)
		begin
			temp_buff[i] = i;
		end	
		tb_main_data = temp_buff;		
			
		#(5);
	
		tb_fft_start = 1;

		#(5);

		tb_fft_start = 0;
	end
	endtask

	task write_info;
		input logic [15:0] data;
		input logic [9:0] address;
	begin
		
		tb_address = address;
		#(1);		
		tb_write_data = data;
		#(1);
		tb_sram_write_ena = 1;
		#(1);
		tb_sram_write_ena = 1;

		#(1);

		tb_sram_write_ena = 0;

		#(1);
				
	end
	endtask

	task read_info;
		input logic [9:0] address;
	begin
		tb_address = address;
		#(1);		
		tb_sram_write_ena = 1;
		#(1);
		tb_sram_read_ena = 1;
		#(1);
		tb_sram_read_ena = 0;

	end
	endtask

	
	// DUT portmap
	mem_buff DUT(
		.fft_start(tb_fft_start),
		.sram_read_ena(tb_sram_read_ena),
		.sram_write_ena(tb_sram_write_ena),
		.write_data(tb_write_data),
		.address(tb_address),
		.main_data(tb_main_data),
		.sample(tb_sample),
		.all_data(tb_all_data)
		
	);	
	// Test bench process
	initial
	begin
		initialize();
		load_buffer();	

		for(int i = 10; i < 300; i++)
		begin
			write_info(i + 512, i);
		end

		for(int i = 0; i < 512; i++)
		begin
			read_info(i);
		end
	
	end

endmodule
