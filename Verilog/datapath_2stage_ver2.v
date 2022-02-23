module datapath_2stage_ver2 #(
    parameter DIN_WIDTH  = 64,
    parameter DOUT_WIDTH = 256
) (
    input                       clk,
    input                       rst_n,
    // input                       start,
    input   [DIN_WIDTH-1:0]     in,
    input                       last_block,
    input                       load,
    // input                       sel_mux,
    input                       sel_reg_0,
    input                       sel_reg_1,
    // input                       rst_newmess,
    input                       up,
    input                       k,
    output  [4:0]               count,
    output                      hash_ready,
    // output  [1599:0]            in_theta, tp_theta, _in_theta, out_iota, w1,
    // output  [7:0]               rc,
    output                      flag,
    output  [DOUT_WIDTH-1:0]    out
);
    wire [1599-DOUT_WIDTH*2:0] out_pad;
    wire [63:0 ] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24;
    wire [1599:0] out_theta, tp_theta/*, tp_iota*/; // w1 out_iota out_rho_pi out_chi
    // wire [63:0] rc;      
    wire [7:0] rc;      // Edit here
    wire [1599:0]  _in_theta, in_theta;
    wire [1599:0]  out_rho_pi_chi_iota;
    wire [1087:0] w1;
    // wire rst_newmess;
    delay_clock_v2 #(.N_CLOCKs(1)) delay_ready(clk, rst_n, 1'b1, flag, hash_ready);
    // delay_clock_v2 #(.N_CLOCKs(48)) delay_reset(clk, rst_n, 1'b1, last_block, rst_newmess);
    delay_clock_v2 #(.N_CLOCKs(47)) delay_flag(clk, rst_n, 1'b1, last_block, flag); 
    Padding #(.DIN_WIDTH(DIN_WIDTH), .DOUT_WIDTH(DOUT_WIDTH)) padding(out_pad, in);

    //assign in_theta = (sel_mux == 1'b1) ? {out_pad, {DOUT_WIDTH*2{1'b0}}} : out_iota;
    
    // assign w1 = (load == 1'b1) ? {in, {DOUT_WIDTH*2{1'b0}}} : 1600'b0; // Edit here
    assign w1 = (load == 1'b1) ? out_pad : 1088'b0;
    // assign in_theta = w1 ^ out_iota;
    assign in_theta = {w1 ^ out_rho_pi_chi_iota[1599:512], out_rho_pi_chi_iota[511:0]};
    reg_1600 inst_reg_0 (_in_theta, in_theta, 1'b1, clk);       // Edit here
    

    convert_input_theta convert_in_theta(reg0 , reg1 , reg2 , reg3 , reg4 , 
                                         reg5 , reg6 , reg7 , reg8 , reg9 , 
                                         reg10, reg11, reg12, reg13, reg14, 
                                         reg15, reg16, reg17, reg18, reg19, 
                                         reg20, reg21, reg22, reg23, reg24, _in_theta);

    theta_nopipe theta(out_theta, 
        {reg0, reg5, reg10, reg15, reg20}, 
        {reg1, reg6, reg11, reg16, reg21}, 
        {reg2, reg7, reg12, reg17, reg22}, 
        {reg3, reg8, reg13, reg18, reg23}, 
        {reg4, reg9, reg14, reg19, reg24});
    

    registerr_ver2 #(.DIN_WIDTH(1600)) inst_reg_1 (tp_theta, out_theta, 1'b1, hash_ready, k, rst_n, clk);       // Edit here

    

    // rho_pi rho_pi(out_rho_pi, 
    //     tp_theta[1599:1536], tp_theta[1535:1472], tp_theta[1471:1408], tp_theta[1407:1344], tp_theta[1343:1280], 
    //     tp_theta[1279:1216], tp_theta[1215:1152], tp_theta[1151:1088], tp_theta[1087:1024], tp_theta[1023:960], 
    //     tp_theta[959:896]  , tp_theta[895:832]  , tp_theta[831:768]  , tp_theta[767:704]  , tp_theta[703:640], 
    //     tp_theta[639:576]  , tp_theta[575:512]  , tp_theta[511:448]  , tp_theta[447:384]  , tp_theta[383:320], 
    //     tp_theta[319:256]  , tp_theta[255:192]  , tp_theta[191:128]  , tp_theta[127:64]   , tp_theta[63:0]);
    
    // chi chi(out_chi, out_rho_pi);
    rho_pi_chi_iota rho_pi_chi_iota(out_rho_pi_chi_iota, rc, 
        tp_theta[1599:1536], tp_theta[1535:1472], tp_theta[1471:1408], tp_theta[1407:1344], tp_theta[1343:1280], 
        tp_theta[1279:1216], tp_theta[1215:1152], tp_theta[1151:1088], tp_theta[1087:1024], tp_theta[1023:960], 
        tp_theta[959:896]  , tp_theta[895:832]  , tp_theta[831:768]  , tp_theta[767:704]  , tp_theta[703:640], 
        tp_theta[639:576]  , tp_theta[575:512]  , tp_theta[511:448]  , tp_theta[447:384]  , tp_theta[383:320], 
        tp_theta[319:256]  , tp_theta[255:192]  , tp_theta[191:128]  , tp_theta[127:64]   , tp_theta[63:0]);
    module24counter counter(count, rst_n, up, clk);
    
    Mux24to1 mux_rc(rc, 8'h01, 8'h32, 8'hBA, 8'hE0, 8'h3b, 8'h41, 8'hF1, 8'hA9,
                        8'h1A, 8'h18, 8'h69, 8'h4A, 8'h7B, 8'h9B, 8'hB9, 8'hA3,
                        8'hA2, 8'h90, 8'h2A, 8'hCA, 8'hF1, 8'hB0, 8'h41, 8'hE8, count);
    
    // iota iota(out_iota, out_rho_pi_chi, rc);
    
    convert_out_keccak #(.DOUT_WIDTH(DOUT_WIDTH)) convert_out_keccak(out, _in_theta[1599:1600-DOUT_WIDTH]);     // Edit here

endmodule