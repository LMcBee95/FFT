module avalonSlave(
		input wire clk,
		input wire n_rst,
		input wire rEn,
		input wire wEn,
		input wire [63:0] address,
		input wire [15:0]wData,

		output reg [15:0] fft_init_data,
		output reg [8:0] wAddress,
		output reg fft_start,
		output reg [1:0]writeWaitTime,
		output reg sWriteEn
);
reg countUp;
reg clear;
reg [8:0]ldCnt;
reg rollover;
flex_counter #9 samNum(.clk(clk),.n_rst(n_rst),.count_enable(countUp),.clear(clear),.rollover_val(9'b100000000),.rollover_flag(rollover),.count_out(ldCnt));

typedef enum {
IDLE,
WRITEADD,
COUNT,
WAITWR,
WRITECOMP,
ERR
}any_state;
any_state state;
any_state nextstate;

always @ (posedge clk, negedge n_rst)
	begin: slaveState
		if(n_rst == 1'b0) begin
			state <= IDLE;
		end else begin
			state <= nextstate;
		end
	end

always_comb
	begin: inputLogic
		nextstate = state;
		case(state)
			IDLE:
			begin
				if(wEn ==1'b1)
				nextstate = COUNT;
			end
			WRITEADD:
			begin
				if(ldCnt == 9'b100000000) begin

					nextstate = WRITECOMP;
				end 
				else if (wEn != 1'b1) begin 
					nextstate = WAITWR;
				end
			end
			COUNT:
			begin
				nextstate = WRITEADD;
			end
			WAITWR:
			begin
				if(wEn ==1'b1)
				nextstate = COUNT;
			end
			WRITECOMP:
			begin
				nextstate = IDLE;
			end
			ERR:
			begin
				nextstate = IDLE;
			end
		endcase
	end
always_comb
	begin: outputLogic
	countUp = 1'b0;
	clear = 1'b0;
	wAddress = 9'b000000000;
	fft_init_data = 0;
	fft_start = 1'b0;	
	sWriteEn = 1'b0;
		case(state)
			IDLE:
			begin

			end
			WRITEADD:
			begin
				wAddress = address[8:0];
				fft_init_data = wData;
				sWriteEn = 1'b1;
			end
			COUNT:
			begin
				countUp = 1'b1;
			end
			WAITWR:
			begin

			end
			WRITECOMP:
			begin
				fft_start = 1'b1;
				clear = 1'b1;
			end
			ERR:
			begin
				clear = 1'b1;
			end
		endcase
	end
assign writeWaitTime = 2'b10;
endmodule
