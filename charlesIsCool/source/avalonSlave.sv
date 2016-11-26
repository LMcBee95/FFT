module avalonSlave(
		input wire clk,
		input wire n_rst,
		input wire slave_read,
		input wire slave_write,
		input wire [8:0] slave_address,
		input wire [15:0]slave_writedata,
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

reg countUp;
reg clear;
reg [8:0]ldCnt;
reg rollover;
reg [15:0] dataIn;
reg [15:0] prev_dataIn;
reg [8:0] prev_address;
flex_counter #9 samNum(.clk(clk),.n_rst(n_rst),.count_enable(countUp),.clear(clear),.rollover_val(9'b100000000),.rollover_flag(rollover),.count_out(ldCnt));
assign fft_start = rollover;
typedef enum {
IDLE,
WRITEADD,
COUNT,
WRITECOMP
}any_state;
any_state state;
any_state nextstate;

always @ (posedge clk, negedge n_rst)
	begin: slaveState
		if(n_rst == 1'b0) begin
			state <= IDLE;
			dataIn <= '0;
			prev_dataIn <= '0;
			prev_address <= '0;
		end else begin
			state <= nextstate;
			prev_address <= slave_address;
	  	  	prev_dataIn <= dataIn;
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
				if(dataIn == 16'hffff)
				nextstate = COUNT;
			end
			WRITEADD:
			begin
				if(ldCnt == 9'h100) begin

					nextstate = WRITECOMP;
				end 
				else if (prev_address != slave_address ) begin 
					nextstate = COUNT;
				end
			end
			COUNT:
			begin
				nextstate = WRITEADD;
			end
			WRITECOMP:
			begin
				nextstate = IDLE;
			end
		endcase
	end
always_comb
	begin: outputLogic
	countUp = 1'b0;
	clear = 1'b0;
	wAddress = 9'bzzzzzzzzz;
	fft_init_data = 0;
	sWriteEn = 1'bz;
		case(state)
			IDLE:
			begin

			end
			WRITEADD:
			begin
	
				wAddress = slave_address;
				fft_init_data = slave_writedata;
				sWriteEn = 1'b1;
			end
			COUNT:
			begin
				countUp = 1'b1;
			end
			WRITECOMP:
			begin
				clear = 1'b1;
				wAddress = prev_address;
				fft_init_data = slave_writedata;
				sWriteEn = 1'b1;
			end
		endcase
	end
endmodule
