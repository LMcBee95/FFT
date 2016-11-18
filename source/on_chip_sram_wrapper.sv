module on_chip_sram_wrapper
(
	input wire mem_clr,
	input wire mem_init,
	input wire mem_dump,
	input wire verbose,
	input wire init_file_number,
	input wire dump_file_number,
	input wire start_address,
	input wire last_address,
	input wire read_enable,
	input wire write_enable,
	input wire address,
	output wire read_data,
	input wire write_data
);

on
endmodule



		.mem_clr(tb_mem_clr),
		.mem_init(tb_mem_init),
		.mem_dump(tb_mem_dump),
		.verbose(tb_verbose),
		.init_file_number(tb_init_file_number),
		.dump_file_number(tb_dump_file_number),
		.start_address(tb_start_address),
		.last_address(tb_last_address),
		// Memory interface signals
		.read_enable(tb_read_enable),
		.write_enable(tb_write_enable),
		.address(tb_address),
		.read_data(tb_read_data),
		.write_data(tb_write_data)
