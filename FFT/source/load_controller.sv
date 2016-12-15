// $Id: $
// File name:   load_controller.sv
// Created:     11/25/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Load controller
module load_controller
(
	input reg [15:0] twiddle_real,
	input reg [15:0] twiddle_imag,
	input reg [15:0] sample,
	input reg [2:0] samples_loaded_count,

	output reg [15:0] output_value
);

always_comb begin//how the buffer is set up, we load the sample value, then the twiddle, then the twiddle value. This block mux's those values in based on the number of samples loaded
	if(samples_loaded_count < 4) begin
		output_value = sample;
	end
	else if (samples_loaded_count == 4) begin
		output_value = twiddle_real;
	end
	else if (samples_loaded_count == 5) begin
		output_value = twiddle_imag;
	end
	else begin
		output_value = 16'b0;
	end
end

endmodule
