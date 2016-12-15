onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_file_read_and_write/tb_address
add wave -noupdate /tb_file_read_and_write/tb_input_data
add wave -noupdate /tb_file_read_and_write/tb_output_data
add wave -noupdate /tb_file_read_and_write/tb_read_enable
add wave -noupdate /tb_file_read_and_write/tb_write_enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {159 ps} 0}
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
WaveRestoreZoom {0 ps} {1 ns}
