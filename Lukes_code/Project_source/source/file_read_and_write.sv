



module file_read_and_write
(
	input wire read_enable,
	input wire write_enable,
	input wire start_write,
	input wire end_write,
	input wire [9:0] address,
	input wire [15:0] input_data,
	output reg [15:0] output_data
);
	localparam SEEK_START	= 0;
	localparam SEEK_CUR		= 1;
	localparam SEEK_END		= 2;


	parameter  IMAGE_FILE   = "./image.txt";
	integer image_file;

	reg [9:0] temp_address;

	always_comb
	begin
		output_data = 0;

		if(start_write == 1)
		begin
			image_file = $fopen(IMAGE_FILE, "r+");
		end
		else if(end_write == 1)
		begin
			$fclose(image_file);
		end
		else if(write_enable == 1)
		begin
			$fclose(image_file);
			image_file = $fopen(IMAGE_FILE, "a+");
			$fwrite(image_file, "%c", input_data);
		end
		else if(read_enable == 1)
		begin
			$fclose(image_file);
			image_file = $fopen(IMAGE_FILE, "r+");
			$fseek(image_file, 0, SEEK_START);
			output_data = $fgetc(image_file);
		end

	end
	

endmodule
