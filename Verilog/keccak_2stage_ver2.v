module keccak_2stage_ver2 #(
    parameter DIN_WIDTH  = 64,
    parameter DOUT_WIDTH = 256
)   (
    input                       clk,
    input                       rst_n,
    input                       first_block,
    input                       last_block,
    input   [DIN_WIDTH-1:0]     in,
    // output  [4:0]               count,
    output  [DOUT_WIDTH-1:0]    out,
    // output  [1:0]               current_state,
    // output  [1:0]               next_state,
    // output  [1599:0]            in_theta, tp_theta, _in_theta, out_iota, w1,
    // output  [7:0]               rc,
    output                      hash_ready
);

    wire            up, load, k, flag;
    wire            sel_reg_0, sel_reg_1;   // Edit here
    // wire            rst_1_syn;
    wire    [4:0]   count;
    
    controller_2stage_ver2 controller
    (
        .clk(clk),
        .rst_n(rst_n),
        .first_block(first_block),
        .flag(flag),
        .count(count),
        // .hash_ready(hash_ready),     // Edit here
        .load(load),
        // .sel_mux(sel_mux),
        .sel_reg_0(sel_reg_0),       
        .sel_reg_1(sel_reg_1),
        // .rst_1_syn(rst_1_syn),
        // .current_state(current_state),
        // .next_state(next_state),
        .up(up),
        .k(k)
    );

    datapath_2stage_ver2 #(.DIN_WIDTH(DIN_WIDTH), .DOUT_WIDTH(DOUT_WIDTH)) datapath
    (
        .clk(clk),
        .rst_n(rst_n),
        // .start(start),            // Edit here
        .in(in),
        .last_block(last_block),
        .load(load),
        // .sel_mux(sel_mux),
        // .sel_reg_0(1'b1),      
        // .sel_reg_1(1'b1),
        .sel_reg_0(sel_reg_0),      
        .sel_reg_1(sel_reg_1),
        // .rst_1_syn(1'b1),
        // .rst_1_syn(rst_1_syn),
        .up(up),
        .k(k),
        .count(count),
        .hash_ready(hash_ready),   // Edit here
        // .in_theta(in_theta),
        // .tp_theta(tp_theta),
        // ._in_theta(_in_theta),
        // .out_iota(out_iota),
        // .w1(w1),
        // .rc(rc),
        .flag(flag),
        .out(out)
    );
endmodule