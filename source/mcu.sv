// $Id: $
// File name:   rcu.sv
// Created:     9/29/2016
// Author:      Luke McBee
// Lab Section: 4
// Version:     1.0  Initial Design Entry
// Description: main controller unit for the FFT

module mcu
(
	input wire clk,
	input wire n_rst,
	input wire fft_start, //An input telling the MCU to start the FFT
	
	input wire [6:0] samples_in_count_out, //Flag for when a group is completed
	input wire iteration_strobe, //Flag for when a stage is completed
	input wire stage_done, //Flag for when all stages are completed
	input wire output_done, //Flag for finishing storing all output samples
	input wire data_sent, //Flag that says when the avalon bus has outputted all of the FFT data from the SRAM	

	output reg [1:0] addr_mode, //Tells the addressing unit what mode to be in

	output reg fft_done, //Says when the FFT process is complete
	output reg write_enable, //Says when the on-chip SRAM should be in write mode
	output reg read_enable,  //Says when teh on-chip SRAM should be in read mode
	output reg output_ena, //Tells the output shift reg to shift out
	output reg input_ena //Tells the input shift reg to shift in
	output reg load_enable; //Tells the parallel to serial to load in the data
);

	//States
		// IDLE : Do nothing in this state
		// LOAD_GROUP_1 : Load in the A and B coefficients for each butterfly block
		// LOAD_GROUP_2 : Load in the twiddle values for each butterfly block
		// BUTTERFLY_WAIT : Wait one clock cylcle for the combinational logic of the butterfly combinational logic
		// LOAD_DATA_OUT : Loads in the butterfly blocks' data into the parallel to serial shift register
		// SHIFT_DATA_OUT : Shift out the data from the output of the butterfly blocks
		// OUTPUT_TO_AVALON : Shift the results of the FFT to the Avalon Bus (and hopefully out of the FPGA)

	//Declare all of the states
	typedef enum {IDLE, LOAD_GROUP_1, LOAD_GROUP_2, BUTTERFLY_WAIT, LOAD_DATA_OUT, SHIFT_DATA_OUT, OUTPUT_TO_AVALON} all_states;

	all_states state; //Current state of the system
	all_states next_state; //Previous state of the system

	always_ff @ (posedge clk, negedge n_rst)	
	begin
		if(n_rst == 0)
		begin
			state <= IDLE;
		end
		else
		begin
			state <= next_state;
		end
	end
	
	//Next State Logic
	always_comb
	begin
		case (state)
			IDLE:	
			begin
				if(fft_start == 1'b1)
				begin
					next_state = LOAD_GROUP_1;
				end
				else
				begin
					next_state = IDLE; 
				end
			end
			LOAD_GROUP_1:	
			begin
				if(samples_in_count_out >= 32)
				begin
					next_state = LOAD_GROUP_2;
				end
				else
				begin
					next_state = LOAD_GROUP_1;
				end
			end
			LOAD_GROUP_2:	
			begin
				if(iteration_strobe == 1'b1)
				begin
					next_state = BUTTERFLY_WAIT;
				end
				else
				begin
					next_state = LOAD_GROUP_2;
				end
			end
			BUTTERFLY_WAIT:	
			begin
				next_state = LOAD_DATA_OUT;
			end
			LOAD_DATA_OUT:
			begin
				next_state = SHIFT_DATA_OUT;
			end
			SHIFT_DATA_OUT:	
			begin
				if(stage_done == 1'b1)
				begin
					if(output_done == 1'b1)
					begin
						next_state = OUTPUT_TO_AVALON;
					end
					else
					begin
						next_state = 	SHIFT_DATA_OUT;
					end
				end
				else if(output_done == 1'b1)
				begin
					next_state = LOAD_GROUP_1;
				end
				else
				begin
					next_state = SHIFT_DATA_OUT;
				end
			end			
			OUTPUT_TO_AVALON:
			begin
				if(data_sent == 1'b1)
				begin
					next_state = IDLE;
				end
				else
				begin
					next_state = OUTPUT_TO_AVALON;
				end
			end
			default:
			begin
				next_state = IDLE;
			end
		endcase
	end

	//Output Logic
	always_comb
	begin
		//Set everything to 0 initially
		input_ena = 0;
		output_ena = 0;
		read_enable = 0;
		write_enable = 0;
		fft_done = 0;
		addr_mode = 0;
		load_enable = 0;

		case (state)
			IDLE:	
			begin
				//Do nothing since everyting is already 0	
				addr_mode = 2'b00;
			end
			LOAD_GROUP_1:	
			begin
				input_ena = 1;
				read_enable = 1;
				addr_mode = 2'b01;
			end
			LOAD_GROUP_2:	
			begin
				input_ena = 1;
				read_enable = 1;
				addr_mode = 2'b10;
			end
			BUTTERFLY_WAIT:	
			begin
				addr_mode = 2'b00;
			end
			LOAD_DATA_OUT:
			begin
				load_enable = 1;
			end
			SHIFT_DATA_OUT:	
			begin
				output_ena = 1;
				write_enable = 1;
				addr_mode = 2'b11;
			end			
			OUTPUT_TO_AVALON:
			begin
				fft_done = 1;
			end
			default:
			begin
				
			end
		endcase
	end

endmodule
