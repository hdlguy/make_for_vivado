#
all: cores ../hdl/sig_gen.dcp

cores: ../cores/c_counter_binary_0/c_counter_binary_0.dcp ../cores/clk_wiz_0/clk_wiz_0.dcp ../cores/dds_compiler_0/dds_compiler_0.dcp

../hdl/sig_gen.dcp: ../hdl/sig_gen.v ../cores/dds_compiler_0/dds_compiler_0.dcp ../cores/c_counter_binary_0/c_counter_binary_0.dcp
	vivado -mode batch -notrace -nolog -nojournal -source hdl2dcp.tcl -tclargs $@ $^

%.dcp: %.xci
	vivado -mode batch -notrace -nolog -nojournal -source xci2dcp.tcl -tclargs $<

.PHONY: clean
clean:
	rm ../cores/c_counter_binary_0/c_counter_binary_0.dcp


