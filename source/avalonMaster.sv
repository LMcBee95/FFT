module avalonMaster(
		input wire clk,
		input wire n_rst,
		output wire rEn,
		output wire wEn,
		output wire [63:0] address,
		output wire [15:0]wData,
		input reg[15:0] rData,

		input wire fft_done,
		input wire[15:0] sampled_data,
		output reg [8:0] sampled_address
		
);
reg countUp;
reg clear;
reg ldCnt;
reg transdone;
flex_counter #9 samNum(.clk(clk),.n_rst(n_rst),.count_enable(countUp),.clear(clear),rollover_val(9'b111111111),.rollover_flag(transdone),.count_out(ldCnt));

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
		case(state)
			IDLE:
			begin

			end
			WRITEADD:
			begin
			end
			WAITWR:
			begin
			end
			WRITECOMP:
			begin
			end
			ERR:
			begin
			end
		endcase
	end
endmodule
