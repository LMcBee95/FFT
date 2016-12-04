// $Id: $
// File name:   tb_file_read_and_write.sv
// Created:     11/4/2016
// Author:      Luke McBee
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: test bench for butterfly block

`timescale 1ns/10ps

module tb_file_read_and_write();

	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals	
	reg tb_read_enable;
	reg tb_write_enable;
	reg tb_start_write;
	reg tb_end_write;
	reg [9:0] tb_address;
	reg [15:0] tb_input_data;
	reg [15:0] tb_output_data;

	task write_data;
		input logic [9:0] addr;
		input logic [15:0] in;
	begin
		tb_read_enable = 0;
		tb_write_enable = 1;
		tb_address = addr;
		tb_input_data = in;
				tb_start_write = 0;
		tb_end_write = 0;
		
	end
	endtask
	
	task read_data;
		input logic [9:0] addr;
	begin
		tb_read_enable = 1;
		tb_write_enable = 0;
		tb_address = addr;
		tb_input_data = 0;
		tb_start_write = 0;
		tb_end_write = 0;
	end
	endtask

	task end_file;
		
	begin
		tb_end_write = 1;
		tb_start_write = 0;
	end
	endtask

	task start_file;
		
	begin
		tb_start_write = 1;
		tb_end_write = 0;
	end
	endtask
	
	// DUT portmap
	file_read_and_write DUT(
		.read_enable(tb_read_enable),
		.write_enable(tb_write_enable),
		.start_write(tb_start_write),
		.end_write(tb_end_write),
		.address(tb_address),		
		.input_data(tb_input_data),
		.output_data(tb_output_data)
	);	
	// Test bench process
	initial
	begin
	
		start_file();

		write_data(0, 16'h41);
		write_data(0, 16'h43);
		write_data(0, 16'h45);
		write_data(0, 16'h47);
		write_data(0, 16'h49);
		
		#(10);

		read_data(0);


		#(5);
		
		end_file();

	end

endmodule
