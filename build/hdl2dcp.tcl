create_project -in_memory -part xc7a15tcpg236-2 proj
read_ip ../cores/dds_compiler_0/dds_compiler_0.xci
read_ip ../cores/c_counter_binary_0/c_counter_binary_0.xci
read_verilog -sv ../hdl/sig_gen.v
synth_design -top sig_gen
write_checkpoint sig_gen.dcp

