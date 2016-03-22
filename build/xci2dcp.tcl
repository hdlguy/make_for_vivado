if { $::argc == 1 } {
    create_project -in_memory -part xc7a15tcpg236-2 proj
    read_ip  [lindex $argv 0]
    upgrade_ip [get_ips *]
    generate_target {All} [get_ips *]
    synth_ip [get_ips *]
    close_project
} else {
    puts "USAGE: source xci2dcp.tcl <path/filename.xci>"
}



