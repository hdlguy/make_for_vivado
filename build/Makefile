# This makefile demonstrates the use of Gnu Make to compile FPGA designs using Xilinx Vivado.
# Watch out! Gnu Make uses the tab character to indicate commands to execute. If your editor replaces 
# the tabs with spaces the makefile will not run.
all: cores ./results/top.mcs

cores: ../cores/c_counter_binary_0/c_counter_binary_0.dcp ../cores/clk_wiz_0/clk_wiz_0.dcp ../cores/dds_compiler_0/dds_compiler_0.dcp

./results/top.bit: ../hdl/top.v ../hdl/top.xdc ./results/sig_gen.dcp ../cores/clk_wiz_0/clk_wiz_0.dcp ./results/system.dcp
	vivado -nolog -nojournal -mode batch -notrace -source vcomp.tcl -tclargs $@ $^

./results/system.dcp: ../hdl/system.tcl
	vivado -nolog -nojournal -mode batch -notrace -source bd2dcp.tcl -tclargs $@ $<

./results/sig_gen.dcp: ../hdl/sig_gen.v ../cores/dds_compiler_0/dds_compiler_0.dcp ../cores/c_counter_binary_0/c_counter_binary_0.dcp ../hdl/sig_gen.xdc
	vivado -nolog -nojournal -mode batch -notrace -source vcomp.tcl -tclargs $@ $^

%.mcs: %.bit
	vivado -nolog -nojournal -mode batch -notrace -source bit2mcs.tcl -tclargs $@ $<

%.dcp: %.xci
	vivado -nolog -nojournal -mode batch -notrace -source xci2dcp.tcl -tclargs $<

.PHONY: clean
clean:
	rm --force \
	./results/system.dcp \
	./results/top.mcs ./results/top.bit ./results/sig_gen.dcp \
	../cores/c_counter_binary_0/c_counter_binary_0.dcp \
	../cores/clk_wiz_0/clk_wiz_0.dcp \
	../cores/dds_compiler_0/dds_compiler_0.dcp


