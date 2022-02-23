module rho_pi(out, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24);
  input [63:0 ] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24;
  output [1599:0] out;
  
  wire [63:0 ] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24;
  
  assign reg0  = in0; // in0 = 64'h80000000;
  assign reg1  = {in1 [0   ],in1 [63:1 ]};
  assign reg2  = {in2 [61:0],in2 [63:62]};
  assign reg3  = {in3 [27:0],in3 [63:28]};
  assign reg4  = {in4 [26:0],in4 [63:27]};
  assign reg5  = {in5 [35:0],in5 [63:36]};
  assign reg6  = {in6 [43:0],in6 [63:44]}; // in6 = 64'h00400000
  assign reg7  = {in7 [5 :0],in7 [63:6 ]};
  assign reg8  = {in8 [54:0],in8 [63:55]};
  assign reg9  = {in9 [19:0],in9 [63:20]};
  assign reg10 = {in10[2 :0],in10[63:3 ]};
  assign reg11 = {in11[9 :0],in11[63:10]};
  assign reg12 = {in12[42:0],in12[63:43]};
  assign reg13 = {in13[24:0],in13[63:25]};
  assign reg14 = {in14[38:0],in14[63:39]};
  assign reg15 = {in15[40:0],in15[63:41]};
  assign reg16 = {in16[44:0],in16[63:45]};
  assign reg17 = {in17[14:0],in17[63:15]};
  assign reg18 = {in18[20:0],in18[63:21]}; // in18 = 64'h00001000
  assign reg19 = {in19[7 :0],in19[63:8 ]};
  assign reg20 = {in20[17:0],in20[63:18]};
  assign reg21 = {in21[1 :0],in21[63:2 ]};
  assign reg22 = {in22[60:0],in22[63:61]};
  assign reg23 = {in23[55:0],in23[63:56]};
  assign reg24 = {in24[13:0],in24[63:14]};
  
  assign out = {reg0, reg6, reg12, reg18, reg24, reg3, reg9, reg10, reg16, reg22, reg1, reg7, reg13, reg19, reg20, reg4, reg5, reg11, reg17, reg23, reg2, reg8, reg14, reg15, reg21};
endmodule