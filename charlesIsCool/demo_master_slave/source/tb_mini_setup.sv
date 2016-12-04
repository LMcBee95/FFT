// $Id: $
// File name:   tb_mini_setup.sv
// Created:     11/26/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Test bench for mini setup

`timescale 1ns / 100ps

module tb_mini_setup
();
	// Testbench parameters
	localparam CLK_PERIOD = 2.5;

	// DUT portmap signals
	reg tb_clk;
	reg tb_n_rst;
	reg tb_fft_start;
	reg tb_fft_done;
	
	reg [511:0] [15:0] tb_main_data;
	reg [511:0] [15:0] tb_all_data;

	// Testbench signals
	integer tb_test_case = 0;
	reg [511:0] [15:0] temp_buff;

	// Device under test
	mini_setup DUT (
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.fft_start(tb_fft_start),
		.fft_done(fft_done),
		.main_data(tb_main_data),
		.all_data(tb_all_data)
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

	task load_data;
		
	begin	
			
		for(int i = 0; i < 512; i++)
		begin
			temp_buff[i] = 1;//i;
		end	
		tb_main_data = temp_buff;		
			
		@(negedge tb_clk);
	end
	endtask
	
	// Tests
	initial begin
		// Initialize inputs
		tb_n_rst = 1'b1;
		tb_fft_start = 1'b0;
		tb_main_data = 0;

		load_data();

		// Wait a couple clock cycles before starting tests
		@(posedge tb_clk);
		@(posedge tb_clk);

		reset_dut;

		@(posedge tb_clk);
		@(posedge tb_clk);
		tb_fft_start = 1'b1;

		@(posedge tb_clk);
		tb_fft_start = 1'b0;
	end
endmodule
