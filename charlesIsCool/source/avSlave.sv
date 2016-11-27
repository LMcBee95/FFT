module avSlave(
		input wire clk,
		input wire n_rst,
		input wire slave_read,
		input wire slave_write,
		input wire [8:0] slave_address,
		input wire [31:0]slave_writedata,
		input wire slave_chipselect,

		output reg [15:0] fft_init_data,
		output reg [8:0] wAddress,
		output reg fft_start,
		output reg sWriteEn
);
parameter BYTEENABLEWIDTH = 4;  //Used to increment the address by 4
parameter START_BYTE = 32'h00000053;
parameter STOP_BYTE = 32'h00000012;
parameter INI_WRITE_ADDR = 32'h08500000;
parameter INI_READ_BOT_ADDR = 32'h08001000;
parameter INI_READ_MID_ADDR = 32'h08000800;
parameter INI_READ_TOP_ADDR = 32'h08000000;

reg [31:0] dataIn;

typedef enum {
IDLE,
WRITEADD,
WRITECOMP
}any_state;

any_state state;
any_state nextstate;

always @ (posedge clk, negedge n_rst)
	begin: slaveState
		if(n_rst == 1'b0) begin
			state <= IDLE;
			dataIn <= '0;
		end else begin
			state <= nextstate;
	  	  	if(slave_write && slave_chipselect && (slave_address >= 0) && (slave_address < 513))
	  	  		begin
	  	  	  		dataIn <= slave_writedata;  //write to data buffer
	  	  		end
		end
	end

always_comb
	begin: inputLogic
		nextstate = state;
		case(state)
			IDLE:
			begin
				if(dataIn == 17'h1ffff)
				nextstate = WRITEADD;
			end
			WRITEADD:
			begin
				if(dataIn == 17'h10000) begin

					nextstate = WRITECOMP;
				end 
			end
			WRITECOMP:
			begin
				nextstate = IDLE;
			end
		endcase
	end
always_comb
	begin: outputLogic
	wAddress = 9'bzzzzzzzzz;
	fft_init_data = 0;
	sWriteEn = 1'bz;
	fft_start = 1'b0;
		case(state)
			IDLE:
			begin

			end
			WRITEADD:
			begin
	
				wAddress = slave_address;
				fft_init_data = slave_writedata[15:0];
				sWriteEn = slave_write;
			end
			WRITECOMP:
			begin
				fft_start = 1'b1;
			end
		endcase
	end
endmodule
