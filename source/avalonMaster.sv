module avalonMaster(
		input wire clk,
		input wire n_rst,
		output reg rEn,
		output reg wEn,
		output reg [63:0] address,
		output reg [15:0]wData,
		input reg [1:0] response,

		input wire fft_done,
		input wire[15:0] sampled_data,
		output reg [8:0] sampled_address,
		output reg sReEn
		
);
reg countUp;
reg clear;
reg [9:0]ldCnt;
reg transdone;

reg waitWrit;
reg rolloverFlag;
reg [1:0]trash;
flex_counter #10 samNum(.clk(clk),.n_rst(n_rst),.count_enable(countUp),.clear(clear),.rollover_val(10'b1000000000),.rollover_flag(transdone),.count_out(ldCnt));

flex_counter #2 holdWrite(.clk(clk),.n_rst(n_rst),.count_enable(waitWrit),.clear(clear),.rollover_val(2'b11),.rollover_flag(rolloverFlag),.count_out(trash));

typedef enum {
IDLE,
WRITEADD,
WAITWR,
WRITECOMP,
ERR,
COUNT
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
				if(fft_done ==1'b1)
				nextstate = COUNT;
			end
			COUNT:
			begin
				nextstate = WRITEADD;
			end		
			WRITEADD:
			begin
				if(response == 2'b01) begin
					nextstate = ERR;
				end
				else if(response == 2'b10) begin
					nextstate = ERR;
				end
				else if(response == 2'b11) begin
					nextstate = ERR;
				end
				
				else if(rolloverFlag ==1'b1)
					begin
						if(ldCnt == 10'b1000000000) begin
							nextstate = WRITECOMP;
						end else begin
							nextstate = COUNT;
						end
					end
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

	rEn =1'b0;
	wEn =1'b0;
	address = 64'hzzzzzzzz;
	wData = 16'hzzzz;
	sampled_address = 16'hzzzz;
	sReEn = 1'b0;
	countUp = 1'b0;
	clear = 1'b0;
	waitWrit =1'b0;

		case(state)
			IDLE:
			begin

			end
			COUNT:
			begin
				countUp =1'b1;	
			end
			WRITEADD:
			begin
				waitWrit = 1'b1;	
				address = 64'hffffffff;
				wEn = 1'b1;
				wData = sampled_data;
				sampled_address = ldCnt-1;
				sReEn = 1'b1;
			end
			WRITECOMP:
			begin
				clear = 1'b1;
			end
			ERR:
			begin
				clear = 1'b1;
			end
		endcase
	end
endmodule
