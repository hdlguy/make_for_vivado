# bd2dcp.tcl
# This script is intended to be called from a Makefile for converting a TCL file into a dcp file.
# It is assumed tht the tCL file was written from the block diagram editor using the write_bd_tcl command.

if { $::argc == 2 } {
    create_project -in_memory -part xc7a50tfgg484-1 proj
    source [lindex $argv 1]
    set target [lindex $argv 0]
    set top [file rootname [file tail $target]]
    generate_target -force {synthesis implementation} [get_files ./.srcs/sources_1/bd/$top/$top.bd]
    set_property synth_checkpoint_mode None           [get_files ./.srcs/sources_1/bd/$top/$top.bd]
    synth_design -top $top
    write_checkpoint -force $target
    close_project
} else {
    puts "This script converts an IPI block diagram design into a .dcp file."
    puts "The block diagram must have been saved as a .tcl file using the write_bd_tcl Vivado command."
    puts "USAGE: source bd2dcp.tcl <path/target.dcp> <path/source.tcl>"
}
