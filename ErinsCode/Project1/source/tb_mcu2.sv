// $Id: $
// File name:   tb_mcu2.sv
// Created:     11/26/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Test bench for 2nd try at MCU
`timescale 1ns / 100ps

module tb_mcu2
();
	// Testbench parameters
	localparam CLK_PERIOD = 2.5;

	// DUT portmap signals
	reg tb_clk;
	reg tb_n_rst;
	reg tb_fft_start; //overall start of project
	reg tb_samples_in_done; //when all samples have been loaded into input buffer
	reg tb_samples_out_done; //when all samples have been written out of output buffer
	reg [2:0] tb_samples_loaded_count; //Counts how many samples per butterfly block have been loaded
	reg tb_samples_loaded_done; //all components of 1 bb have been loaded
	reg tb_samples_written_done; //all components of 1 bb have been written 
	reg tb_iteration_done;
	reg tb_fft_done;

	reg tb_sram_read_ena; //read enable for SRAM
	reg tb_sram_write_ena; //write enable for SRAM
	reg tb_shift_in_ena; //shift enable for input buffer
	reg tb_shift_out_ena; //shift enable for output buffer
	reg [1:0] tb_addr_mode; //address mode for if loading twiddles, input/output samples
	reg tb_k_ena; //enable for finding k values
	reg tb_k_clear; //clear for finding k values
	reg tb_iteration_ena; //enable for iteration timer

	// Testbench signals
	integer tb_test_case = 0;

	// Device under test
	mcu2 DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.fft_start(tb_fft_start),
		.samples_in_done(tb_samples_in_done),
		.samples_out_done(tb_samples_out_done),
		.samples_loaded_count(tb_samples_loaded_count),
		.samples_loaded_done(tb_samples_loaded_done),
		.samples_written_done(tb_samples_written_done),
		.iteration_done(tb_iteration_done),
		.fft_done(tb_fft_done),
		.sram_read_ena(tb_sram_read_ena),
		.sram_write_ena(tb_swram_write_ena),
		.shift_in_ena(tb_shift_in_ena),
		.shift_out_ena(tb_shift_out_ena),
		.addr_mode(tb_addr_mode),
		.k_ena(tb_k_ena),
		.k_clear(tb_k_clear),
		.iteration_ena(tb_iteration_ena)
	);
	// Clock procedure
	always begin
		tb_clk <= 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk <= 1'b1;
		#(CLK_PERIOD/2.0);
	end

	// Task to reset DUT
	task reset_dut;
		begin
			@(negedge tb_clk);
			tb_n_rst = 1'b0;
			@(posedge tb_clk);
			@(posedge tb_clk);
			//@(posedge tb_clk);
			//@(posedge tb_clk);
			//#1;
			@(negedge tb_clk);
			tb_n_rst = 1'b1;
		end
	endtask
	
	// Task to check output value
	task test_output;
		input expected_output;
		begin
			
			@(posedge tb_clk);
			tb_test_case += 1;
			#(1);
		end
	endtask
	
	// Tests
	initial begin
		// Initialize inputs
		tb_n_rst = 1'b1;
		tb_fft_start = 0; 
		tb_samples_in_done = 0; 
		tb_samples_out_done = 0; 
		tb_samples_loaded_count = 0; 
		tb_samples_loaded_done = 0; 
		tb_samples_written_done = 0; 
		tb_iteration_done = 0;
		tb_fft_done = 0;

		// Wait a couple clock cycles before starting tests
		@(posedge tb_clk);
		@(posedge tb_clk);

		reset_dut;

		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_fft_start = 1'b1;

		@(posedge tb_clk);
		tb_fft_start = 1'b0;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_samples_loaded_count = 3'd4;
		
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_samples_loaded_done = 1'b1;
		tb_samples_loaded_count = 0;
		tb_samples_in_done = 1'b1;
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_samples_written_done = 1'b1;
		tb_samples_out_done = 1'b1;
		tb_fft_done = 1'b1;
		tb_iteration_done = 1'b1;
	end
endmodule
