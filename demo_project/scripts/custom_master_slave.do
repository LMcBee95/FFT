onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group test_bench /tb_custom_master_slave/f_address
add wave -noupdate -group test_bench /tb_custom_master_slave/f_data
add wave -noupdate -group test_bench /tb_custom_master_slave/f_q
add wave -noupdate -group test_bench /tb_custom_master_slave/f_rden
add wave -noupdate -group test_bench /tb_custom_master_slave/f_wren
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_clk
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_dump_file_number
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_last_address
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_master_address
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_master_read
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_master_readdata
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_master_readdatavalid
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_master_waitrequest
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_master_write
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_master_writedata
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_mem_dump
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_n_rst
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_slave_address
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_slave_chipselect
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_slave_read
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_slave_readdata
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_slave_readdatavalid
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_slave_waitrequest
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_slave_write
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_slave_writedata
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_start_address
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_test_case
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_test_master_readdata
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_test_master_readdatavalid
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_test_master_waitrequest
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_test_rst
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_test_slave_address
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_test_slave_chipselect
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_test_slave_read
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_test_slave_write
add wave -noupdate -group test_bench /tb_custom_master_slave/tb_test_slave_writedata
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/a_imag
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/a_real
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/addr_mode
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/b_imag
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/b_real
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/data_par_in
add wave -noupdate -expand -group mini_setup -radix decimal -childformat {{{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[31]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[30]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[29]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[28]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[27]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[26]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[25]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[24]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[23]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[22]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[21]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[20]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[19]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[18]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[17]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[16]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[15]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[14]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[13]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[12]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[11]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[10]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[9]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[8]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[7]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[6]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[5]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[4]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[3]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[2]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[1]} -radix decimal} {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[0]} -radix decimal}} -expand -subitemconfig {{/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[31]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[30]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[29]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[28]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[27]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[26]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[25]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[24]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[23]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[22]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[21]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[20]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[19]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[18]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[17]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[16]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[15]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[14]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[13]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[12]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[11]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[10]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[9]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[8]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[7]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[6]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[5]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[4]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[3]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[2]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[1]} {-radix decimal} {/tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out[0]} {-radix decimal}} /tb_custom_master_slave/DUT/FFT_BLOCK/data_par_out
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/fft_done
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/iteration_count
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/iteration_done
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/iteration_ena
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/k_clear
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/k_ena
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/load_enable
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/output_address
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/output_value
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/pts_serial_out
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/samples_in_count
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/samples_in_done
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/samples_loaded_count
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/samples_loaded_done
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/samples_out_count
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/samples_out_done
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/samples_written_count
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/samples_written_done
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/shift_in_ena
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/shift_out_ena
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/sram_read_ena
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/sram_write_ena
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/stage_count
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/twiddle_imag
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/twiddle_index
add wave -noupdate -expand -group mini_setup -radix decimal /tb_custom_master_slave/DUT/FFT_BLOCK/twiddle_real
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/fft_done
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/iteration_count
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/iteration_done
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/samples_in_count
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/samples_in_done
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/samples_loaded_count
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/samples_loaded_done
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/samples_out_count
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/samples_out_done
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/samples_written_count
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/samples_written_done
add wave -noupdate -group timers /tb_custom_master_slave/DUT/FFT_BLOCK/TIMERS/stage_count
add wave -noupdate -group mcu /tb_custom_master_slave/DUT/FFT_BLOCK/MCU2/addr_mode
add wave -noupdate -group mcu /tb_custom_master_slave/DUT/FFT_BLOCK/MCU2/currentState
add wave -noupdate -group mcu /tb_custom_master_slave/DUT/FFT_BLOCK/MCU2/iteration_ena
add wave -noupdate -group mcu /tb_custom_master_slave/DUT/FFT_BLOCK/MCU2/k_clear
add wave -noupdate -group mcu /tb_custom_master_slave/DUT/FFT_BLOCK/MCU2/k_ena
add wave -noupdate -group mcu /tb_custom_master_slave/DUT/FFT_BLOCK/MCU2/load_enable
add wave -noupdate -group mcu /tb_custom_master_slave/DUT/FFT_BLOCK/MCU2/nextState
add wave -noupdate -group mcu /tb_custom_master_slave/DUT/FFT_BLOCK/MCU2/shift_in_ena
add wave -noupdate -group mcu /tb_custom_master_slave/DUT/FFT_BLOCK/MCU2/shift_out_ena
add wave -noupdate -group mcu /tb_custom_master_slave/DUT/FFT_BLOCK/MCU2/sram_read_ena
add wave -noupdate -group mcu /tb_custom_master_slave/DUT/FFT_BLOCK/MCU2/sram_write_ena
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {22515000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {20761171 ps} {23579215 ps}
