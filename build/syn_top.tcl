create_project -in_memory -part xc7a15tcpg236-2 proj
read_ip ../cores/clk_wiz_0/clk_wiz_0.xci
read_checkpoint sig_gen.dcp
read_verilog -sv ../hdl/top.v
read_xdc ../hdl/top.xdc
synth_design -top top;
opt_design;
place_design;
phys_opt_design;
route_design;
write_bitstream -verbose -force top.bit

