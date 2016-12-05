# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {flex_counter.sv twiddle_index2.sv address_output.sv address_order.sv timers.sv mcu2.sv twiddleRom.sv load_controller.sv fixed_point_math.sv ptsWrapper.sv stpWrapper.sv butterfly_block.sv ButterflyWrapper.sv mem_buff.sv mini_setup.sv}
elaborate mini_setup -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/mini_setup.rep
report_area >> reports/mini_setup.rep
report_power -hier >> reports/mini_setup.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/mini_setup.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
