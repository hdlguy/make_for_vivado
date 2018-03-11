# make_for_vivado
_**https://github.com/hdlguy/make_for_vivado.git**_

## Introduction
This project demonstrates the use of gnu make to build FPGA designs using Vivado.

## files
The build scripts are:
```
    ./build2/Makefile    - the makefile that compiles the whole design
    ./build2/xci2dcp.tcl - compiles .xci logic core files into .dcp design checkpoint files.
    ./build2/bd2dcp.tcl  - compiles an IPI block diagram description into a .dcp file.
    ./build2/hdl2dcp.tcl - uses out_of_context synthesis to convert sub-designs into .dcp files.
    ./build2/synth_top.tcl - converts the top level design into a synthesized .dcp file.
    ./build2/dcp2bit.tcl - does place, route and bitstream generation on the top level design.
    ./build2/bit2mcs.tcl - creates the .mcs programming file from the bit file.
```

## dependency hierarchy
The build hierarchy of the example design is shown below.

```
top.mcs
    top.bit
        top.v
        top.xdc
	    system.dcp
	        system.tcl (an IPI block diagram)
        sig_gen.dcp
            sig_gen.v
            sig_gen.xdc
            ddc_compiler_0.dcp
                ddc_compiler_0.xci
            c_counter_binary_0.dcp
                c_counter_binary_0.xci
        clk_wiz_0.dcp
            clk_wiz_0.xci
```            
## compile instructions
1. Install the Xilinx Vivado tools.
1. Add Vivado to path with something like this
```source /opt/Xilinx/Vivado/2017.2/settings64.sh```
1. Change to the build folder.
1. run make.
You can test the dependencies by using the "touch" linux command on any of the source files.

        
