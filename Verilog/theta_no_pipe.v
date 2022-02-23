module theta_nopipe(out_theta, in_theta_0, in_theta_1, 
			in_theta_2, in_theta_3, in_theta_4);
wire [63:0] out_theta_0_0, out_theta_0_1, out_theta_0_2, out_theta_0_3, out_theta_0_4, out_theta_1_0, out_theta_1_1, out_theta_1_2, out_theta_1_3, out_theta_1_4, out_theta_2_0, out_theta_2_1, out_theta_2_2, out_theta_2_3, out_theta_2_4, out_theta_3_0, out_theta_3_1, out_theta_3_2, out_theta_3_3, out_theta_3_4, out_theta_4_0, out_theta_4_1, out_theta_4_2, out_theta_4_3, out_theta_4_4;
output [1599:0] out_theta;
input [319:0] in_theta_0, in_theta_1, in_theta_2, in_theta_3, in_theta_4;
//input [2:0] sel_0, sel_1, sel_2;
// input clk;
/*
wire [319:0] out_mux_0, out_mux_1;
wire [63:0] out_C0, out_C1, w5, w6, out_D, w8;
*/
// wire [319:0] out_mux_0, out_mux_1, out_mux_2;
wire [63:0] out_C0, out_C1, out_C2, out_C3, out_C4, out_D0, out_D1, out_D2, out_D3, out_D4;

wire [63:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21 , reg22, reg23, reg24;
//wire [7:0] out_decode;
//reg_320 reg_320_3 (w9, out_mux_0, en_reg_3, clk);
// mux5to1_320 mux5to1 [1:0] ({out_mux_0, out_mux_1}, in_theta_0, in_theta_1, in_theta_2, in_theta_3, in_theta_4, {sel_0,sel_1});
calculate_C cal_C [4:0] ({out_C0, out_C1, out_C2, out_C3, out_C4}, {in_theta_0, in_theta_1, in_theta_2, in_theta_3, in_theta_4});
// reg_64 reg_64 [1:0] ({w5,w6}, {out_C0, out_C1}, en_reg_01, clk);
calculate_D cal_D [4:0] ({out_D0, out_D1, out_D2, out_D3, out_D4}, {out_C4, out_C0, out_C1, out_C2, out_C3}, {out_C1, out_C2, out_C3, out_C4, out_C0});
// reg_64 reg_64_2 (w8, out_D, en_reg_2, clk);
// mux5to1_320 mux5to1_1 (out_mux_2, in_theta_0, in_theta_1, in_theta_2, in_theta_3, in_theta_4, sel_2);
//reg_320 reg_320_3 (w9, out_mux_2, en_reg_3, clk);
calculate_Sdelta cal_Sdelta [4:0] ({out_theta_0_0, out_theta_0_1, out_theta_0_2, out_theta_0_3, out_theta_0_4}, 
								   {out_theta_1_0, out_theta_1_1, out_theta_1_2, out_theta_1_3, out_theta_1_4},
								   {out_theta_2_0, out_theta_2_1, out_theta_2_2, out_theta_2_3, out_theta_2_4},
								   {out_theta_3_0, out_theta_3_1, out_theta_3_2, out_theta_3_3, out_theta_3_4}, 
								   {out_theta_4_0, out_theta_4_1, out_theta_4_2, out_theta_4_3, out_theta_4_4},
								   {in_theta_0[63:0], in_theta_1[63:0], in_theta_2[63:0], in_theta_3[63:0], in_theta_4[63:0]},
								   {in_theta_0[127:64], in_theta_1[127:64], in_theta_2[127:64], in_theta_3[127:64], in_theta_4[127:64]}, 
								   {in_theta_0[191:128], in_theta_1[191:128], in_theta_2[191:128], in_theta_3[191:128], in_theta_4[191:128]}, 
								   {in_theta_0[255:192], in_theta_1[255:192], in_theta_2[255:192], in_theta_3[255:192], in_theta_4[255:192]}, 
								   {in_theta_0[319:256], in_theta_1[319:256], in_theta_2[319:256], in_theta_3[319:256], in_theta_4[319:256]},
								   {out_D0, out_D1, out_D2, out_D3, out_D4});
// decoder3to8 decoder (out_decode, sel_2);

// One_reg reg_0 (reg0 , out_theta_0_0, 1'b1, clk, 1'b1);
// One_reg reg_5 (reg5 , out_theta_1_0, 1'b1, clk, 1'b1);
// One_reg reg_10(reg10, out_theta_2_0, 1'b1, clk, 1'b1);
// One_reg reg_15(reg15, out_theta_3_0, 1'b1, clk, 1'b1);
// One_reg reg_20(reg20, out_theta_4_0, 1'b1, clk, 1'b1);

// One_reg reg_1 (reg1 , out_theta_0_1, 1'b1, clk, 1'b1);
// One_reg reg_6 (reg6 , out_theta_1_1, 1'b1, clk, 1'b1);
// One_reg reg_11(reg11, out_theta_2_1, 1'b1, clk, 1'b1);
// One_reg reg_16(reg16, out_theta_3_1, 1'b1, clk, 1'b1);
// One_reg reg_21(reg21, out_theta_4_1, 1'b1, clk, 1'b1);

// One_reg reg_2 (reg2 , out_theta_0_2, 1'b1, clk, 1'b1);
// One_reg reg_7 (reg7 , out_theta_1_2, 1'b1, clk, 1'b1);
// One_reg reg_12(reg12, out_theta_2_2, 1'b1, clk, 1'b1);
// One_reg reg_17(reg17, out_theta_3_2, 1'b1, clk, 1'b1);
// One_reg reg_22(reg22, out_theta_4_2, 1'b1, clk, 1'b1);

// One_reg reg_3 (reg3 , out_theta_0_3, 1'b1, clk, 1'b1);
// One_reg reg_8 (reg8 , out_theta_1_3, 1'b1, clk, 1'b1);
// One_reg reg_13(reg13, out_theta_2_3, 1'b1, clk, 1'b1);
// One_reg reg_18(reg18, out_theta_3_3, 1'b1, clk, 1'b1);
// One_reg reg_23(reg23, out_theta_4_3, 1'b1, clk, 1'b1);

// One_reg reg_4 (reg4 , out_theta_0_4, 1'b1, clk, 1'b1);
// One_reg reg_9 (reg9 , out_theta_1_4, 1'b1, clk, 1'b1);
// One_reg reg_14(reg14, out_theta_2_4, 1'b1, clk, 1'b1);
// One_reg reg_19(reg19, out_theta_3_4, 1'b1, clk, 1'b1);
// One_reg reg_24(reg24, out_theta_4_4, 1'b1, clk, 1'b1);

assign out_theta = {out_theta_0_0, out_theta_0_1, out_theta_0_2, out_theta_0_3, out_theta_0_4, out_theta_1_0, out_theta_1_1, out_theta_1_2, out_theta_1_3, out_theta_1_4, out_theta_2_0, out_theta_2_1, out_theta_2_2, out_theta_2_3, out_theta_2_4, out_theta_3_0, out_theta_3_1, out_theta_3_2, out_theta_3_3, out_theta_3_4, out_theta_4_0, out_theta_4_1 , out_theta_4_2, out_theta_4_3, out_theta_4_4};

endmodule
