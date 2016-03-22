This project demonstrates the use of gnu make to build FPGA designs using Vivado.

The build scripts are
    ./build/makefile
    ./build/vcomp.tcl

The source hierarchy of the example design is shown below.

top.mcs
    top.bit
        top.v
        top.xdc
        sig_gen.dcp
            sig_gen.v
            sig_gen.xdc
            ddc_compiler_0.dcp
                ddc_compiler_0.xci
            c_counter_binary_0.dcp
                c_counter_binary_0.xci
        clk_wiz_0.dcp
            clk_wiz_0.xci

        
