#
all: cores
cores: ../cores/c_counter_binary_0/c_counter_binary_0.dcp ../cores/clk_wiz_0/clk_wiz_0.dcp ../cores/dds_compiler_0/dds_compiler_0.dcp

%.dcp: %.xci
	vivado -mode batch -notrace -nolog -nojournal -source xci2dcp.tcl -tclargs $<

.PHONY: clean
clean:
	rm ../cores/c_counter_binary_0/c_counter_binary_0.dcp


