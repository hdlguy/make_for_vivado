# make_for_vivado
_**https://github.com/hdlguy/make_for_vivado.git**_

## Introduction
This project demonstrates the use of gnu make to build FPGA designs using Vivado.

## files
The build scripts are:
```
    ./build/makefile    - the makefile that compiles the whole design
    ./build/vcomp.tcl   - used by make to compile hdl source into .bit or .dcp files.
    ./build/xci2dcp.tcl - used by make to compile .xci logic core files into .dcp design checkpoint files.
    ./build/bd2dcp.tcl  - used by make to compile an IPI block diagram description into a .dcp file.
    ./build/bit2mcs.tcl - used by make to create the .mcs programming file from the bit file.
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

        
