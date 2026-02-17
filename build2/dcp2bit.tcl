# dcp2bit.tcl
# This TCL script is intended to be called by gnu make as part of a build system for the Vivado compiler collection.
# The first argument is the target file. The rest of the arguments are interpreted as input source files.
# The input .dcp file is a checkpoint of the complete chip design synthesized without the out_of_context option so
# that IO pins are present.

if { $::argc > 1 } {

    # get the target file
    set target [lindex $argv 0]
    puts "targetfile = $target"

    # get the prerequisite files
    for {set i 1} {$i<$argc} {incr i} {
        set prereq [lindex $argv $i]
        puts "prerequisite file = $prereq"
        set prereq_type [file extension $prereq]
        puts "prereq type = $prereq_type"
        switch $prereq_type {
            .dcp {
                puts "presynthesized checkpoint filetype detected"
                open_checkpoint $prereq
            }
            .xdc {
                puts "xilinx design constraints filetype detected"
                read_xdc $prereq
            }
            default {
                puts "WARNING: Could not determine file type."
            }
        }
    }

    # implement toplevel design
    opt_design;
    place_design;
    phys_opt_design;
    route_design;
    write_checkpoint -force [file rootname $target]_post_route.dcp
    report_clocks -file [file rootname $target]_clocks.rpt
    report_timing_summary -file [file rootname $target]_timing_summary.rpt
    write_bitstream -verbose -force $target
    
    close_project

} else {
    puts "This script converts the synthesized chip design checkpoint (.dcp) and option constraints files (.xdc) into a placed and routed .bit file."
    puts "USAGE: source dcp2bit.tcl <path/target.bit> <path/source.dcp> <path/source.xdc> ... "
}



