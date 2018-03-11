//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
//Date        : Sat Mar 10 20:51:33 2018
//Host        : pedro-crucial-250 running 64-bit Ubuntu 16.04.4 LTS
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (CLK,
    Q);
  input CLK;
  output [15:0]Q;

  wire CLK;
  wire [15:0]Q;

  system system_i
       (.CLK(CLK),
        .Q(Q));
endmodule
