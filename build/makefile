#
all: cores ../hdl/top.mcs

cores: ../cores/c_counter_binary_0/c_counter_binary_0.dcp ../cores/clk_wiz_0/clk_wiz_0.dcp ../cores/dds_compiler_0/dds_compiler_0.dcp

../hdl/top.bit: ../hdl/top.v ../hdl/top.xdc ../hdl/sig_gen.dcp ../cores/clk_wiz_0/clk_wiz_0.dcp ../hdl/system.dcp
	vivado -nolog -nojournal -mode batch -notrace -source vcomp.tcl -tclargs $@ $^

../hdl/system.dcp: ../hdl/system.tcl
	vivado -nolog -nojournal -mode batch -notrace -source bd2dcp.tcl -tclargs $@ $<

../hdl/sig_gen.dcp: ../hdl/sig_gen.v ../cores/dds_compiler_0/dds_compiler_0.dcp ../cores/c_counter_binary_0/c_counter_binary_0.dcp ../hdl/sig_gen.xdc
	vivado -nolog -nojournal -mode batch -notrace -source vcomp.tcl -tclargs $@ $^

%.mcs: %.bit
	vivado -nolog -nojournal -mode batch -notrace -source bit2mcs.tcl -tclargs $@ $<

%.dcp: %.xci
	vivado -nolog -nojournal -mode batch -notrace -source xci2dcp.tcl -tclargs $<

.PHONY: clean
clean:
	rm \
	../hdl/system.dcp \
	../hdl/top.mcs ../hdl/top.bit ../hdl/sig_gen.dcp \
 	../cores/c_counter_binary_0/c_counter_binary_0.dcp \
	../cores/clk_wiz_0/clk_wiz_0.dcp \
	../cores/dds_compiler_0/dds_compiler_0.dcp


