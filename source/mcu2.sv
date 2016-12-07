// $Id: $
// File name:   mcu2.sv
// Created:     11/25/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Overall 2nd try at MCU
module mcu2 (
	input wire clk,
	input wire n_rst,
	input reg fft_start, //overall start of project
	input reg samples_in_done, //when all samples have been loaded into input buffer
	input reg samples_out_done, //when all samples have been written out of output buffer
	input reg [2:0] samples_loaded_count, //Counts how many samples per butterfly block have been loaded
	input reg samples_loaded_done, //all components of 1 bb have been loaded
	input reg samples_written_done, //all components of 1 bb have been written 
	input reg iteration_done,
	input reg fft_done,

	output reg sram_read_ena, //read enable for SRAM
	output reg sram_write_ena, //write enable for SRAM
	output reg shift_in_ena, //shift enable for input buffer
	output reg load_enable, //load output of butterfly block into the pts module
	output reg shift_out_ena, //shift enable for output buffer
	output reg [1:0] addr_mode, //address mode for if loading twiddles, input/output samples
	output reg k_ena, //enable for finding k values
	output reg k_clear, //clear for finding k values
	output reg iteration_ena //enable for iteration timer
	//output reg stage_ena, //enable for stage timer
);

//State encoding
localparam	STATE_Idle = 0,
		STATE_InputSamples = 1,
		STATE_GetInputAddress = 2,
		STATE_ReadSRAM = 3,
		STATE_LoadController = 4,
		STATE_ShiftInBuffer = 5,
		STATE_GetTwiddle = 6,
		STATE_ReadTwiddle = 7,
		STATE_WaitBB = 8,
		STATE_OutputSamples = 9,
		STATE_GetOutputAddress = 10,
		STATE_ShiftOutBuffer = 11,
		STATE_WriteSRAM = 12,
		STATE_UpdateCounters = 13,
		STATE_WaitTimers = 14, //NEW
		STATE_CheckFFTDone = 15,
		STATE_LoadData = 16,
		STATE_WaitAddress = 17;

//State reg's
reg [5:0] currentState;
reg [5:0] nextState;


//Outputs
always_ff @ (posedge clk, negedge n_rst)
begin
	if(1'b0 == n_rst) begin
		currentState <= STATE_Idle;
	end
	else begin
		currentState <= nextState;
	end
end

//State transition block
always_comb begin
	//Set default values
	nextState = currentState;
	
	case(currentState)
		STATE_Idle: begin
			if(fft_start == 1'b1) begin
				nextState = STATE_InputSamples;
			end
			else begin
				nextState = STATE_Idle;
			end
		end
		STATE_InputSamples: begin
			if(samples_in_done == 1'b1) begin //never happens at the moment
				nextState = STATE_WaitBB;
			end
			else begin
				nextState = STATE_GetInputAddress;
			end
		end
		STATE_GetInputAddress: begin
			if(samples_in_done == 1'b1) begin
				nextState = STATE_WaitBB;
			end
			else begin
				nextState = STATE_ReadSRAM;
			end
		end
		STATE_ReadSRAM: begin
			nextState = STATE_LoadController;
		end
		STATE_LoadController: begin
			nextState = STATE_ShiftInBuffer;
		end
		STATE_ShiftInBuffer: begin
			/*if (samples_loaded_done == 1'b1) begin
				nextState = STATE_InputSamples;
			end*/
			if(samples_loaded_count == 3'd5) begin
				nextState = STATE_InputSamples;
			end
			else if(samples_loaded_count < 3) begin
				nextState = STATE_GetInputAddress;
			end
			else if (samples_loaded_done == 1'b0) begin
				nextState = STATE_GetTwiddle;
			end
			
			/*else begin//error
				nextState = STATE_Idle;
			end*/
		end
		STATE_GetTwiddle: begin
			nextState = STATE_ReadTwiddle;
		end
		STATE_ReadTwiddle: begin
			nextState = STATE_LoadController;
		end
		STATE_WaitBB: begin
			nextState = STATE_LoadData;
		end
		STATE_LoadData: begin
			nextState = STATE_OutputSamples;
		end	
		STATE_OutputSamples: begin
			if(samples_out_done == 1'b0) begin
				nextState = STATE_GetOutputAddress;
			end
			else if (samples_out_done == 1'b1) begin
				nextState = STATE_UpdateCounters;
			end
		end
		STATE_GetOutputAddress: begin
			nextState = STATE_ShiftOutBuffer; //needs to be FIFO
		end
		STATE_ShiftOutBuffer: begin
			nextState = STATE_WriteSRAM;
		end
		STATE_WriteSRAM: begin
			if(samples_written_done == 1'b0) begin
				nextState = STATE_GetOutputAddress;
			end
			else if (samples_written_done == 1'b1) begin
				nextState = STATE_OutputSamples;
			end
		end
		STATE_UpdateCounters: begin
			/*if(fft_done == 1'b0) begin
				nextState = STATE_GetInputAddress;
			end
			else if (fft_done == 1'b1) begin
				nextState = STATE_Idle;
			end*/
			nextState = STATE_WaitTimers;
		end
		STATE_WaitTimers: begin
			nextState = STATE_CheckFFTDone;
		end
		STATE_CheckFFTDone: begin
			if(fft_done == 1'b0) begin
				nextState = STATE_GetInputAddress;
			end
			else if (fft_done == 1'b1) begin
				nextState = STATE_Idle;
			end
		end
	endcase
end

//Output logic
always_comb begin
	//Set default values
	sram_read_ena = 0;
	sram_write_ena = 0;
	shift_in_ena = 0;
	shift_out_ena = 0;
	addr_mode = 0;
	k_ena = 0;
	k_clear = 0;
	iteration_ena = 0;
	load_enable = 0;
	//stage_ena = 0;

	case(currentState)
		STATE_Idle: begin
			addr_mode = 0;
		end
		STATE_InputSamples: begin
			addr_mode = 2'b01; //Change input mode
		end
		STATE_GetInputAddress: begin //wait for addresses to be right 
			addr_mode = 2'b01; //Change input mode
		end
		STATE_ReadSRAM: begin
			sram_read_ena = 1'b1; //enable SRAM Read
			addr_mode = 2'b01; 
		end
		STATE_LoadController: begin //wait for load controller to get right value
			sram_read_ena = 1'b0; //disable SRAM Read
			addr_mode = 2'b01; 
		end
		STATE_ShiftInBuffer: begin
			shift_in_ena = 1'b1;
			addr_mode = 2'b01; 
		end
		STATE_GetTwiddle: begin
			addr_mode = 2'b10; 
			k_ena = 1'b1; //enable k
		end
		STATE_ReadTwiddle: begin
			addr_mode = 2'b10; 
			k_ena = 1'b0; //disable k
		end
		STATE_WaitBB: begin
			addr_mode = 2'b00; 
		end
		STATE_LoadData: begin
			addr_mode = 2'b00;
			load_enable = 1'b1;
		end
		STATE_OutputSamples: begin
			addr_mode = 2'b11; //output mode 
		end
		STATE_GetOutputAddress: begin //wait for address to be right
			addr_mode = 2'b11; 
		end
		STATE_ShiftOutBuffer: begin
			shift_out_ena = 1'b1;
			addr_mode = 2'b11; 
		end
		STATE_WriteSRAM: begin
			sram_write_ena = 1'b1;
			addr_mode = 2'b11; 
		end
		STATE_UpdateCounters: begin
			addr_mode = 2'b00; 
			iteration_ena = 1'b1;
		end
		STATE_WaitTimers: begin
			addr_mode = 2'b00; 
		end
		STATE_CheckFFTDone: begin
			addr_mode = 2'b00; 
		end
	endcase

	//add this here?
	if(iteration_done == 1'b1) begin
		k_clear = 1'b1;
	end
	else begin
		k_clear = 1'b0;
	end

end


endmodule
