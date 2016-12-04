// $Id: $
// File name:   mini_setup.sv
// Created:     11/26/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Mini set up wiring 2nd MCU, address controller, timer, and twiddlerOM
module mini_setup (
	input wire clk,
	input wire n_rst,
	input reg fft_start,
	//input wire [511:0] [15:0] main_data,

	output reg sram_read_ena,
	output reg sram_write_ena,
	output reg [15:0] pts_serial_out,
	output reg [9:0]output_address,
	input reg [15:0] sample,
	output reg fft_done

	//output reg [511:0] [15:0] all_data
);

/*
mem_buff MEMORYBUFFER (
	.fft_start(fft_start),
	.sram_read_ena(sram_read_ena),
	.sram_write_ena(sram_write_ena),
	.write_data(pts_serial_out),
	.address(output_address),
	.main_data(main_data),
	.sample(sample),
	.all_data(all_data)

);
*/

reg [3:0] stage_count;
reg k_ena;
reg k_clear;
reg [9:0] a_real; //These are addresses (not the actual sample content)
reg [9:0] a_imag;
reg [9:0] b_real;
reg [9:0] b_imag;
reg [2:0] samples_loaded_count;
reg [1:0] addr_mode;
reg [3:0] samples_in_count;
reg [3:0] samples_out_count;
reg [4:0] iteration_count;
reg shift_in_ena;
reg load_enable;
reg shift_out_ena;
reg samples_in_done;
reg samples_out_done;
reg [2:0] samples_written_count;
reg iteration_done;
reg samples_loaded_done;
reg samples_written_done;
reg iteration_ena;
reg [6:0] twiddle_index;
reg [15:0] twiddle_real;
reg [15:0] twiddle_imag;
reg [15:0] output_value; //value to be sent to input shift buffer (does nothing right now)

reg [47:0] [15:0] data_par_in; //Input parallel data to the butterfly block
reg [31:0] [15:0] data_par_out; //Output parallel data from the butterfly block

twiddle_index2 TWIDDLEINDEX (
	.clk(clk),
	.nrst(n_rst),
	.stage_count_out(stage_count),
	.k_enable(k_ena),
	.k_clear(k_clear),
	.index_val(twiddle_index)
);


address_order ADDRESSORDER (
	.clk(clk),
	.nrst(n_rst),
	.a_real(a_real),
	.a_imag(a_imag),
	.b_real(b_real),
	.b_imag(b_imag),
	.samples_loaded_count(samples_loaded_count | samples_written_count),
	.output_address(output_address)
);

address_output ADDRESSOUTPUT (
	.clk(clk),
	.nrst(n_rst),
	.input_mode(addr_mode),
	.samples_in_count(samples_in_count),
	.samples_out_count(samples_out_count),
	.iteration_count(iteration_count),
	.stage_count(stage_count),
	.a_real(a_real),
	.a_imag(a_imag),
	.b_real(b_real),
	.b_imag(b_imag)
);

timers TIMERS (
	.clk(clk),
	.n_rst(n_rst),
	.shift_in_ena(shift_in_ena),
	.shift_out_ena(shift_out_ena),
	.iteration_ena(iteration_ena),
	.samples_in_count(samples_in_count),
	.samples_loaded_count(samples_loaded_count),
	.samples_in_done(samples_in_done),
	.samples_out_done(samples_out_done),
	.fft_done(fft_done),
	.iteration_count(iteration_count),
	.stage_count(stage_count),
	.samples_out_count(samples_out_count),
	.samples_written_count(samples_written_count),
	.iteration_done(iteration_done),
	.samples_loaded_done(samples_loaded_done),
	.samples_written_done(samples_written_done)
);

mcu2 MCU2 (
	.clk(clk),
	.n_rst(n_rst),
	.fft_start(fft_start),
	.samples_in_done(samples_in_done),
	.samples_out_done(samples_out_done),
	.samples_loaded_count(samples_loaded_count),
	.samples_loaded_done(samples_loaded_done),
	.samples_written_done(samples_written_done),
	.iteration_done(iteration_done),
	.fft_done(fft_done),
	.sram_read_ena(sram_read_ena),
	.sram_write_ena(sram_write_ena),
	.shift_in_ena(shift_in_ena),
	.load_enable(load_enable),
	.shift_out_ena(shift_out_ena),
	.addr_mode(addr_mode),
	.k_ena(k_ena),
	.k_clear(k_clear),
	.iteration_ena(iteration_ena)
);

twiddleRom TWIDDLEROM (
	.twiddle_index(twiddle_index),
	.twiddle_real(twiddle_real),
	.twiddle_img(twiddle_imag)
);

load_controller LOADCONTROLLER (
	.twiddle_real(twiddle_real),
	.twiddle_imag(twiddle_imag),
	.sample(sample),
	.samples_loaded_count(samples_loaded_count),
	.output_value(output_value)
);

stpWrapper STPWRAPPER (	
	.clk(clk),
	.n_rst(n_rst),
	.it_cnt_strobe(shift_in_ena),
	.serial_in(output_value),//16'b0000000100000000),
	.data_par_in(data_par_in)
);

ButterflyWrapper BUTTERFLYWRAPPER (
	.data_par_in(data_par_in),
	.data_par_out(data_par_out)
);

ptsWrapper PTSWRAPPER (
	.clk(clk),
	.n_rst(n_rst),
	.out_strobe(shift_out_ena),
	.load_enable(load_enable),
	.data_par_out(data_par_out),
	.serial_out(pts_serial_out)
	
);





endmodule

