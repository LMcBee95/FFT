module avalonSlave(
		input wire clk,
		input wire n_rst,
		input wire rEn,
		input wire wEn,
		input wire [63:0] address,
		input wire [31:0]wData,
		output reg[31:0] rData,

		output reg [31:0] fft_init_data,
		output reg [8:0] wAddress,
		output wire fft_start
);
reg countUp;
reg clear;
reg ldCnt;
flex_counter #9 samNum(.clk(clk),.n_rst(n_rst),.count_enable(countUp),.clear(clear),rollover_val(9'b111111111),.rollover_flag(fft_start),.count_out(ldCnt));

typedef enum {
IDLE,
WRITEADD,
WAITWR,
WRITECOMP,
ERR,
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
				nextstate = WRITEADD;
			end
			WRITEADD:
			begin
				if(ldCnt == 9'b111111111) begin
					nextstate = WRITECOMP;
				end 
				else if (wEn != 1'b1) begin 
					nextstate = WAITWR;
				end
			end
			WAITWR:
			begin
				if(wEn ==1'b1)
				nextstate = WRITEADD;
			end
			WRITECOMP:
			begin
				nextState = IDLE;
			end
			ERR:
			begin
				nextState = IDLE;
			end
		endcase
	end
always_comb
	begin: outputLogic
	countUp = 1'b0;
	clear = 1'b0;
	wAddress = 9'b000000000;
	fft_init_data = 8'x00000000;
	fft_start = 1'b0;	
		case(state)
			IDLE:
			begin

			end
			WRITEADD:
			begin
				wAddress = address[8:0];
				fft_init_data = wData;
				countUp = 1'b1;
			end
			WAITWR:
			begin
				countUp = 1'b0;
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
endmodule
