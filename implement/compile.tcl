# Script to compile the FPGA with zynq processor system all the way to bit file.
# In Linux:
#   vivado -mode batch -source compile.tcl
# In windows use xtcl shell
#   source compile.tcl

close_project -quiet

open_project proj.xpr

update_compile_order -fileset sources_1
reset_run synth_1
launch_runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -jobs 8
wait_on_run impl_1

open_run impl_1
report_timing_summary   -file   ./results/timing.rpt
report_utilization      -file   ./results/utilization.rpt
write_debug_probes      -force  ./results/top.ltx

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 22 [current_design]
set_property BITSTREAM.Config.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

write_bitstream -verbose -force ./results/top.bit

close_project

