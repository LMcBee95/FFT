module fixed_point_add//implements the fixed point addition
(
	input wire [15:0] a,
	input wire [15:0] b,
	output reg [15:0] c

);


	reg [14:0] temp;
	
	always_comb
	begin
	//using rerouting of wires and combinational logic 
		
		if(a[15] == b[15])
		begin
			temp = a[14:0] + b[14:0];
			c = {a[15], temp};
		end	
		else if(a[15] == 1'b1)//MSB is sign, check negativity
		begin
			if(a[14:0] <= b[14:0])
			begin
				temp = b[14:0] - a[14:0];
				c = {b[15], temp};
			end
			else if(a[14:0] > b[14:0])
			begin
				temp = a[14:0] - b[14:0];
				c = {a[15], temp};
			end
		else
		begin
			c = 0;
		   temp = 0;
		   
		end
		end
		else if(b[15] == 1'b1)
		begin
			if(a[14:0] <= b[14:0])
			begin
				temp = b[14:0] - a[14:0];
				c = {b[15], temp};
			end
			else if(a[14:0] > b[14:0])
			begin
				temp = a[14:0] - b[14:0];
				c = {a[15], temp};//We are truncating the overflow
			end
		else
		begin
			c = 0;
		   temp = 0;
		   
		end
		end
		else
		begin
			c = 0;
		   temp = 0;
		   
		end
	end

endmodule
