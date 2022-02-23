module keccak_round(
    input                       clk,
    input                       rst_n,
    //input                       start,
    input   [1600-1:0]          in,
    input   [64-1:0]            rc,
    //input                       sel_mux,
    //input                       sel_reg_0,
    //input                       sel_reg_1,
    //input                       up,
    //output  [4:0]               count,
    output  [1600-1:0]    out
    //output                      hash_ready
    // output [1599:0] tp_theta, tp_iota;
);
    //wire [1599-DOUT_WIDTH*2:0] out_pad;
    wire [63:0 ] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24;
    wire [63:0 ] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18, out19, out20, out21, out22, out23, out24;
    wire [1599:0] out_theta, tp_theta, out_rho_pi, out_chi, out_iota, tp_iota;
   // wire [63:0] rc;
    wire [1599:0] in_theta;

    //delay_clock #(.DATA_WIDTH(1),.N_CLOCKs(48)) delay_start(clk, rst_n, 1'b1, start, hash_ready);

    // Padding #(.DIN_WIDTH(DIN_WIDTH), .DOUT_WIDTH(DOUT_WIDTH)) padding(out_pad, in);

    // assign in_theta = (sel_mux == 1'b1) ? {out_pad, {DOUT_WIDTH*2{1'b0}}} : tp_iota;

    convert_input_theta convert_in_theta(reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20 , reg21, reg22, reg23, reg24, in);
    
    theta_nopipe theta(out_theta, {reg0, reg5, reg10, reg15, reg20}, {reg1, reg6, reg11, reg16, reg21}, 
                {reg2, reg7, reg12, reg17, reg22}, {reg3, reg8, reg13, reg18, reg23}, {reg4, reg9, reg14, reg19, reg24});
    
    //reg_1600 inst_reg_0 (tp_theta, out_theta, sel_reg_0, rst_n, clk);
    
    rho_pi rho_pi(out_rho_pi, out_theta[1599:1536], out_theta[1535:1472], out_theta[1471:1408], out_theta[1407:1344], out_theta[1343:1280], out_theta[1279:1216], out_theta[1215:1152], out_theta[1151:1088],
    out_theta[1087:1024], out_theta[1023:960], out_theta[959:896], out_theta[895:832], out_theta[831:768], out_theta[767:704], out_theta[703:640], out_theta[639:576], out_theta[575:512], 
    out_theta[511:448], out_theta[447:384], out_theta[383:320], out_theta[319:256], out_theta[255:192], out_theta[191:128], out_theta[127:64], out_theta[63:0]);
    
    chi chi(out_chi, out_rho_pi);
    
    
    /*module24counter counter(count, rst_n, up, clk);

    Mux24to1 mux_rc(rc, 64'h0000000000000001, 64'h0000000000008082, 64'h800000000000808A, 64'h8000000080008000, 64'h000000000000808B, 64'h0000000080000001, 64'h8000000080008081, 64'h8000000000008009,
            64'h000000000000008A, 64'h0000000000000088, 64'h0000000080008009, 64'h000000008000000A, 64'h000000008000808B, 64'h800000000000008B, 64'h8000000000008089, 64'h8000000000008003,
            64'h8000000000008002, 64'h8000000000000080, 64'h000000000000800A, 64'h800000008000000A, 64'h8000000080008081, 64'h8000000000008080, 64'h0000000080000001, 64'h8000000080008008, count);
    */
    iota iota(out_iota, out_chi, rc);
    assign out = out_iota;
    // reg_1600 inst_reg_1 (tp_iota, out_iota, sel_reg_1, rst_n, clk);
    
    // convert_out_keccak #(.DOUT_WIDTH(DOUT_WIDTH)) convert_out_keccak(out, tp_iota[1599:1600-DOUT_WIDTH]);

endmodule
  
