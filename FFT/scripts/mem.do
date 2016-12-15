onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group test_bnech -radix decimal /tb_mem_buff/CHECK_DELAY
add wave -noupdate -group test_bnech -radix decimal /tb_mem_buff/CLK_PERIOD
add wave -noupdate -group test_bnech -radix decimal /tb_mem_buff/tb_address
add wave -noupdate -group test_bnech -radix decimal /tb_mem_buff/tb_all_data
add wave -noupdate -group test_bnech -radix decimal /tb_mem_buff/tb_fft_start
add wave -noupdate -group test_bnech -radix decimal /tb_mem_buff/tb_main_data
add wave -noupdate -group test_bnech -radix decimal /tb_mem_buff/tb_output_value
add wave -noupdate -group test_bnech -radix decimal /tb_mem_buff/tb_sram_read_ena
add wave -noupdate -group test_bnech -radix decimal /tb_mem_buff/tb_sram_write_ena
add wave -noupdate -group test_bnech -radix decimal /tb_mem_buff/tb_write_data
add wave -noupdate -group test_bnech -radix decimal /tb_mem_buff/temp_buff
add wave -noupdate -expand -group actual -radix decimal /tb_mem_buff/DUT/address
add wave -noupdate -expand -group actual -radix decimal /tb_mem_buff/DUT/all_data
add wave -noupdate -expand -group actual -radix decimal /tb_mem_buff/DUT/fft_start
add wave -noupdate -expand -group actual -radix decimal /tb_mem_buff/DUT/main_data
add wave -noupdate -expand -group actual -radix decimal /tb_mem_buff/DUT/output_value
add wave -noupdate -expand -group actual -radix decimal /tb_mem_buff/DUT/sram_read_ena
add wave -noupdate -expand -group actual -radix decimal /tb_mem_buff/DUT/sram_write_ena
add wave -noupdate -expand -group actual -radix decimal /tb_mem_buff/DUT/write_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {848 ps}
