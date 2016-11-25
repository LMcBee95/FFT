// $Id: $
// File name:   tb_usb_receiver.sv
// Created:     10/11/2016
// Author:      Luke McBee
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: test bench for usb receiver

`timescale 1ns/10ps

module tb_mcu();

	// Define local constants
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	// Test bench dut port signals
	// Test bench dut port signals
	reg tb_clk;
	reg tb_n_rst;
	reg tb_fft_start;
	reg [6:0] tb_samples_in_count_out;
	reg tb_iteration_strobe;
	reg tb_stage_done;
	reg tb_output_done;
	reg tb_data_sent;
	reg [1:0] tb_addr_mode;
	reg tb_fft_done;
	reg tb_write_enable;
	reg tb_read_enable;
	reg tb_output_enable;
	reg tb_input_enable;

	task reset_dut;
	begin
		// Activate the design's reset (does not need to be synchronize with clock)
		tb_n_rst = 1'b0;
		
		// Wait for a couple clock cycles
		@(posedge tb_clk);
		@(posedge tb_clk);
		
		// Release the reset
		@(negedge tb_clk);
		tb_n_rst = 1;
		
		// Wait for a while before activating the design
		@(posedge tb_clk);
		@(posedge tb_clk);
	end
	endtask

	task reset_receiver;
	begin
		@(negedge tb_clk);
		for(int i = 0; i < 5; i++)
		begin
			@(posedge tb_clk);
		end
	end
	endtask

	task initialize_inputs;
	begin
		tb_data_sent = 0;
		tb_fft_start = 0;
		tb_input_enable = 0;
		tb_iteration_strobe = 0;
		tb_output_done = 0;
		tb_output_enable = 0;
		tb_samples_in_count_out = 0;
		tb_stage_done = 0;
	end
	endtask

	// Clock gen block
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end

	// DUT portmap
	mcu DUT(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.fft_start(tb_fft_start),
		.samples_in_count_out(tb_samples_in_count_out),
		.iteration_strobe(tb_iteration_strobe),
		.stage_done(tb_stage_done),
		.output_done(tb_output_done),
		.data_sent(tb_data_sent),
		.addr_mode(tb_addr_mode),
		.fft_done(tb_fft_done),
		.write_enable(tb_write_enable),
		.read_enable(tb_read_enable),
		.output_ena(tb_output_ena),
		.input_ena(tb_input_ena)
	);	
	// Test bench process
	initial
	begin
		
		//Test 1: Everything working correctly
		initialize_inputs;
		reset_dut;

		tb_fft_start = 1; //initialize the FFT module

		@(posedge tb_clk);
		@(negedge tb_clk);
		
		tb_fft_start = 0;

		//Simulate the samples in counter/timer
		for(int i = 0; i < 64; i++)
		begin
			@(posedge tb_clk);
			tb_input_enable = 1'b1;
			tb_samples_in_count_out = (tb_samples_in_count_out + 1) % 64;
		end

		tb_samples_in_count_out = 0;
		tb_iteration_strobe = 1;

		@(posedge tb_clk);
		@(negedge tb_clk);

		tb_iteration_strobe = 0;
			
		//Simulate the entire process being done
		tb_stage_done = 1;

		for(int i = 0; i < 33; i++)
		begin
			@(posedge tb_clk);
			tb_output_enable = 1'b1;
			
		end

		//Simulate the output register loading everything out
		tb_output_done = 1;

		@(posedge tb_clk);
		@(negedge tb_clk);

		tb_output_done = 0;

		@(posedge tb_clk);
		@(posedge tb_clk);

		//Simulate all data being pulled from the SRAM
		tb_data_sent = 1;
	
		@(posedge tb_clk);
		@(posedge tb_clk);

		tb_data_sent = 0;


	end

endmodule
