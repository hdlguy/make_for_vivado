# hdl2dcp.tcl
# This TCL script is intended to be called by gnu make as part of a build system for the Vivado compiler collection.
# The first argument is the target file. The rest of the arguments are interpreted as input source files.
if { $::argc > 1 } {
    create_project -in_memory -part xc7a15tcpg236-2 proj
    set target [lindex $argv 0]
    set target_type [file extension $target]
    puts "targetfile = $target"
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
    synth_design -top $top 
    write_checkpoint -force $target
    close_project
} else {
    puts "This script converts source files (.dcp, .v, .vhd, .vhdl) to a target .dcp file."
    puts "USAGE: source hdl2dcp.tcl <path/target.dcp> <path/source.x> <path/source.x> <path/source.x> <path/source.x> ... "
}



