// custom_master_slave module : Acts as an avalon slave to receive input commands from PCIE IP

module custom_master_slave #(
	parameter MASTER_ADDRESSWIDTH = 32 ,  	// ADDRESSWIDTH specifies how many addresses the Master can address 
	parameter SLAVE_ADDRESSWIDTH = 9 ,  	// ADDRESSWIDTH specifies how many addresses the slave needs to be mapped to. log(NUMREGS)
	parameter DATAWIDTH = 32 ,    		// DATAWIDTH specifies the data width. Default 32 bits
	parameter NUMREGS = 9 ,       		// Number of Internal Registers for Custom Logic
	parameter REGWIDTH = 32       		// Data Width for the Internal Registers. Default 32 bits
)	
(	
	input logic  clk,
        input logic  n_rst,
	
	// Interface to Top Level
	

	// Bus Slave Interface
        input logic [SLAVE_ADDRESSWIDTH-1:0] slave_address,
        input logic [DATAWIDTH-1:0] slave_writedata,
        input logic  slave_write,
        input logic  slave_read,
        input logic  slave_chipselect,
//      input logic  slave_readdatavalid, 			// These signals are for variable latency reads. 
//	output logic slave_waitrequest,   			// See the Avalon Specifications for details  on how to use them.
        output logic [DATAWIDTH-1:0] slave_readdata,

	// Bus Master Interface
        output logic [MASTER_ADDRESSWIDTH-1:0] master_address,
        output logic [DATAWIDTH-1:0] master_writedata,
        output logic  master_write,
        output logic  master_read,
        input logic [DATAWIDTH-1:0] master_readdata,
        input logic  master_readdatavalid,
        input logic  master_waitrequest,



	//CUstom interface
	output logic f_rden,
	output logic f_wren,
	output logic [8:0]f_address,
	input logic [15:0]f_q,
	output logic [15:0]f_data
		  
);


parameter START_BYTE = 9'h1FF;
parameter STOP_BYTE = 32'hDEADF00B;
parameter SDRAM_ADDR = 32'h08000000;


logic [MASTER_ADDRESSWIDTH-1:0] address, nextAddress;
logic [DATAWIDTH-1:0] nextRead_data, read_data;
logic [NUMREGS-1:0] reg_index, nextRegIndex;
logic [NUMREGS-1:0][REGWIDTH-1:0] read_data_registers;  //Store SDRAM read data for display
logic new_data_flag;

typedef enum {IDLE, WRITE, WRITE_WAIT, READ_REQ, READ_WAIT, READ_ACK, READ_DATA} state_t;
state_t state, nextState;

reg sCon;
reg mCon;

reg fft_done;
reg fft_start;


//reg f_rden;
reg s_rden;
reg m_rden;
reg ffrden;

//reg f_wren;
reg s_wren;
reg m_wren;
reg ffwren;

//reg [8:0]f_address;
reg [8:0]s_address;
reg [8:0]m_address;
reg [8:0]ffaddress;

//reg [15:0]f_q;
reg [15:0]s_q;
reg [15:0]m_q;
reg [15:0]ffq;

//reg [15:0]f_data;
reg [15:0]s_data;
reg [15:0]m_data;
reg [15:0]ffdata;


	/*on_chip_sram_wrapper sram
	(
		// Test bench control signals
		.mem_clr(1'b0),
		.mem_init(1'b0),
		.mem_dump(1'b0),
		.verbose(1'b0),
		.init_file_number(1'b0),
		.dump_file_number(1'b0),
		.start_address(16'h0000),
		.last_address(16'h0000),
		// Memory interface signals
		.read_enable(f_rden),
		.write_enable(f_wren),
		.address(f_address),
		.read_data(f_q),
		.write_data(f_data)
	);*/


	mini_setup FFT_BLOCK(
		.clk(clk),
		.n_rst(n_rst),
		.fft_start(fft_start),

		.sram_read_ena(ffrden),
		.sram_write_ena(ffwren),
		.pts_serial_out(ffdata),
		.output_address(ffaddress),
		.sample(ffq),
		.fft_done(fft_done)
	);

// Slave side 
always_ff @ ( posedge clk ) begin 
  if(!n_rst)
  	begin
    		slave_readdata <= 32'h0;
		s_wren <= 1'b0;
		s_rden <= 1'b0;
		s_address <= 8'h00;
		s_data <= 16'h0000;
		fft_start <=1'b0;
		sCon <= 1'b0;
		
  	end
  else 
  	begin
	if(fft_start) begin
		fft_start <= 1'b0;
	end
  	  if(slave_write && slave_chipselect&& (slave_address < 2**SLAVE_ADDRESSWIDTH))
  	  	begin
		sCon <= 1'b1;
		if(slave_address==START_BYTE) begin
			s_wren <= 1'b0;
			s_rden <= 1'b0;
			s_address <= 16'h0000;
			s_data <= slave_writedata;
			fft_start <=1'b1;
		end else begin
			s_wren <= 1'b1;
			s_rden <= 1'b0;
			s_address <= slave_address;
			s_data <= slave_writedata;
			fft_start <=1'b0;
		end

  	  	end
  	  else if(slave_read && slave_chipselect && (slave_address < 2**SLAVE_ADDRESSWIDTH)) // reading a CSR Register
  	    	begin
       		// Send a value being requested by a master. 
       		// If the computation is small you may compute directly and send it out to the master directly from here.
		sCon <= 1'b1;
		s_wren <= 1'b0;
		s_rden <= 1'b1;
		s_address <= slave_address;
		s_data <= 16'h0000;
  	    	slave_readdata <= f_q;

  	    	end
	   else begin
		sCon <= 1'b0;
		end
  	 end
end




// Master Side 

always_ff @ ( posedge clk ) begin 
	if (!n_rst) begin 
		address <= SDRAM_ADDR;
		reg_index <= 0;
		state <= IDLE;
		read_data <= 32'hFEEDFEED; 
		read_data_registers <= '0;
	end else begin 
		state <= nextState;
		address <= nextAddress;
		reg_index <= nextRegIndex;
		//read_data <= nextRead_data;
		if(new_data_flag)
			read_data_registers[reg_index] <= nextRead_data;
	end
end

// Next State Logic 
// If user wants to input data and addresses using a state machine instead of signals/conditions,
// the following code has commented lines for how this could be done.
always_comb begin 
	nextState = state;
	nextAddress = address;
	nextRegIndex = reg_index;
	nextRead_data = master_readdata;
	new_data_flag = 0;
	case( state ) 
		IDLE : begin 
			if ( fft_done == 1'b1) begin 
				nextState = WRITE;
			end
		end 
		WRITE: begin
			if (!master_waitrequest) begin 
				nextRegIndex = reg_index + 1;
				nextAddress = address + 2;
				if(reg_index < 511) begin
					nextState = WRITE;
				end else begin
					nextState = IDLE;
				end
			end
		end
	endcase
end

// Output Logic 

always_comb begin 
	master_write = 1'b0;
	master_read = 1'b0;
	master_writedata = 9'h0;
	master_address = 32'h1bd;
	m_rden = 1'b0;
	m_wren = 1'b0;
	m_address = 9'b0;
	mCon <= 1'b0;
	case(state) 
		WRITE : begin 
			master_write = 1;
			master_address =  address;
			master_writedata = f_q;
			master_write =1'b1;


			mCon <= 1'b1;
			m_rden = 1'b1;
			m_wren = 1'b0;

			m_address = reg_index;
			m_data = '0;
		end 
	endcase
end

always_comb begin 
	if(mCon ==1'b1) begin
		f_rden = m_rden;
		f_wren = m_wren;
		f_data = m_data;
		f_address = m_address;
		m_q = f_q;
	end else if(sCon==1'b1) begin
		f_rden = s_rden;
		f_wren = s_wren;
		f_data = s_data;
		f_address = s_address;
		s_q = f_q;
	end else begin
		f_rden = ffrden;
		f_wren = ffwren;
		f_data = ffdata;
		f_address = ffaddress;
		ffq = f_q;
	end
end

endmodule

