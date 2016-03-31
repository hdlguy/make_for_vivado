if { $::argc == 1 } {
    create_project -in_memory -part xc7a50tfgg484-1 proj
    read_ip  [lindex $argv 0]
    upgrade_ip [get_ips *]
    generate_target -force {All} [get_ips *]
    synth_ip [get_ips *]
    close_project
} else {
    puts "USAGE: source xci2dcp.tcl <path/filename.xci>"
}



