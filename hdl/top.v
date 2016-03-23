// sig_gen.v
module top (
    input   logic   clk_in,
    output  logic   [7:0]   sin_out,
    output  logic   [7:0]   cos_out,
    output  logic           dcm_locked,
    output  logic   [15:0]  q);

    logic   clk, clk1;
    clk_wiz_0 clk_wiz_inst (
        .clk_in1(clk_in),      // input clk_in1
        .clk_out1(clk1),     // output clk_out1
        .clk_out2(),     // output clk_out2
        .clk_out3(clk),     // output clk_out3
        .locked(dcm_locked)      // output locked
    );

    logic   [7:0]   pre_sin_out, pre_cos_out;
    sig_gen sig_gen_inst (
        .clk(clk),
        .sin_out(pre_sin_out),
        .cos_out(pre_cos_out)
    );

    always_ff @(posedge clk) sin_out <= pre_sin_out;
    always_ff @(posedge clk) cos_out <= pre_cos_out;

    // this is a simple IPI block diagram design.
    system system_inst (.CLK(clk1), .Q(q));

endmodule
