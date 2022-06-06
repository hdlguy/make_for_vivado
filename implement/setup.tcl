# This script sets up a Vivado project with all ip references resolved.
# In Linux:
#   vivado -mode batch -source setup.tcl
# In windows use xtcl shell
#   source setup.tcl
close_project -quiet
file delete -force proj.xpr *.os *.jou *.log proj.srcs proj.cache proj.runs

create_project -force -part xc7a50tfgg484-1 proj
set_property target_language verilog [current_project]
set_property default_lib work [current_project]

read_ip ../cores/c_counter_binary_0/c_counter_binary_0.xci
read_ip ../cores/clk_wiz_0/clk_wiz_0.xci
read_ip ../cores/dds_compiler_0/dds_compiler_0.xci


reset_target all [get_files *.xci]
upgrade_ip -quiet  [get_ips *]
generate_target {all} [get_ips *]

source ../hdl/system.tcl
generate_target {synthesis implementation} [get_files ./proj.srcs/sources_1/bd/system/system.bd]
set_property synth_checkpoint_mode None [get_files ./proj.srcs/sources_1/bd/system/system.bd]


read_verilog -sv ../hdl/sig_gen.v
read_verilog -sv ../hdl/top.v

read_xdc ../hdl/top.xdc  
read_xdc ../hdl/top_late.xdc

close_project


