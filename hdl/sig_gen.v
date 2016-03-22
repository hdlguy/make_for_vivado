// sig_gen.v
module sig_gen (
    input   logic   clk,
    output  logic   [7:0]   sin_out,
    output  logic   [7:0]   cos_out
);

    // a counter
    logic   [15:0]  count_q;
    c_counter_binary_0 count_inst (
        .CLK(clk),    // input wire CLK
        .Q(count_q)   // output wire [15 : 0] Q
    );

    // a dds
    logic           s_axis_phase_tvalid;
    logic   [15:0]  s_axis_phase_tdata;
    logic           m_axis_data_tvalid;
    logic   [15:0]  m_axis_data_tdata;
    assign s_axis_phase_tvalid = 1'b1;
    assign s_axis_phase_tdata = count_q;
    dds_compiler_0 dds_inst (
        .aclk(clk),                                 // input wire aclk
        .s_axis_phase_tvalid(s_axis_phase_tvalid),  // input wire s_axis_phase_tvalid
        .s_axis_phase_tdata(s_axis_phase_tdata),    // input wire [15 : 0] s_axis_phase_tdata
        .m_axis_data_tvalid(m_axis_data_tvalid),    // output wire m_axis_data_tvalid
        .m_axis_data_tdata(m_axis_data_tdata)       // output wire [15 : 0] m_axis_data_tdata
    );

    assign sin_out = m_axis_data_tdata[15:8];
    assign cos_out = m_axis_data_tdata[ 7:0];
    
endmodule
