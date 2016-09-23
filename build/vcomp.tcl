# vcomp.tcl
# This TCL script is intended to be called by gnu make as part of a build system for the Vivado compiler collection.
# The first argument is the target file. The rest of the arguments are interpreted as input source files.
if { $::argc > 1 } {
    create_project -in_memory -part xc7a50tfgg484-1 proj
    # get the target file
    set target [lindex $argv 0]
    set target_type [file extension $target]
    puts "targetfile = $target"
    # get the prerequisite files
    for {set i 1} {$i<$argc} {incr i} {
        set prereq [lindex $argv $i]
        puts "prerequisite file = $prereq"
        set prereq_type [file extension $prereq]
        puts "prereq type = $prereq_type"
        switch $prereq_type {
            .v {
                puts "verilog filetype detected"
                read_verilog -sv $prereq
            }
            .vhd {
                puts "VHDL filetype detected"
                read_vhdl $prereq
            }
            .vhdl {
                puts "VHDL filetype detected"
                read_vhdl $prereq
            }
            .dcp {
                puts "presynthesized checkpoint filetype detected"
                read_checkpoint $prereq
            }
            .xdc {
                puts "presynthesized checkpoint filetype detected"
                read_xdc $prereq
            }
            default {
                puts "WARNING: Could not determine file type."
            }
        }
    }
    # get the top entity name from the target.
    set top [file rootname [file tail $target]]
    if {$target_type == ".dcp"} {
        synth_design -mode out_of_context -top $top 
        write_checkpoint -force $target
    }
    if {$target_type == ".bit"} {
        synth_design -top $top 
        write_checkpoint -force [file rootname $target]_post_synth.dcp
        opt_design;
        place_design;
        phys_opt_design;
        route_design;
        write_checkpoint -force [file rootname $target]_post_route.dcp
        report_clocks -file [file rootname $target]_clocks.rpt
        report_timing_summary -file [file rootname $target]_timing_summary.rpt
        write_bitstream -verbose -force $target
    }
    close_project
} else {
    puts "This script converts source files (.dcp, .v, .vhd, .vhdl) to a target .dcp file."
    puts "USAGE: source hdl2dcp.tcl <path/target.dcp> <path/source.x> <path/source.x> <path/source.x> <path/source.x> ... "
}



