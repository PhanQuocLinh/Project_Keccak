module chi(out, in);
  input [1599:0] in;
  output[1599:0] out;
  
  wire [63:0 ] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24;
  
  assign reg0  = in[1599:1536];
  assign reg1  = in[1535:1472]; 
  assign reg2  = in[1471:1408]; 
  assign reg3  = in[1407:1344]; 
  assign reg4  = in[1343:1280]; 
  assign reg5  = in[1279:1216]; 
  assign reg6  = in[1215:1152]; 
  assign reg7  = in[1151:1088]; 
  assign reg8  = in[1087:1024]; 
  assign reg9  = in[1023:960 ];
  assign reg10 = in[959 :896 ];
  assign reg11 = in[895 :832 ]; 
  assign reg12 = in[831 :768 ]; 
  assign reg13 = in[767 :704 ]; 
  assign reg14 = in[703 :640 ]; 
  assign reg15 = in[639 :576 ]; 
  assign reg16 = in[575 :512 ]; 
  assign reg17 = in[511 :448 ]; 
  assign reg18 = in[447 :384 ]; 
  assign reg19 = in[383 :320 ]; 
  assign reg20 = in[319 :256 ]; 
  assign reg21 = in[255 :192 ]; 
  assign reg22 = in[191 :128 ]; 
  assign reg23 = in[127 :64  ];
  assign reg24 = in[63  :0   ];
  
  assign out[1599:1536] = reg0  ^ (~(reg1) & reg2); //r0 = 1, r4 = 0, r3 = 1, r2 = 0, r1 = 1
  assign out[1535:1472] = reg1  ^ (~(reg2) & reg3);
  assign out[1471:1408] = reg2  ^ (~(reg3) & reg4);
  assign out[1407:1344] = reg3  ^ (~(reg4) & reg0);
  assign out[1343:1280] = reg4  ^ (~(reg0) & reg1);
  
  assign out[1279:1216] = reg5  ^ (~(reg6) & reg7);
  assign out[1215:1152] = reg6  ^ (~(reg7) & reg8);
  assign out[1151:1088] = reg7  ^ (~(reg8) & reg9);
  assign out[1087:1024] = reg8  ^ (~(reg9) & reg5);
  assign out[1023:960 ] = reg9  ^ (~(reg5) & reg6);
  
  assign out[959 :896 ] = reg10 ^ (~(reg11) & reg12);
  assign out[895 :832 ] = reg11 ^ (~(reg12) & reg13);
  assign out[831 :768 ] = reg12 ^ (~(reg13) & reg14);
  assign out[767 :704 ] = reg13 ^ (~(reg14) & reg10);
  assign out[703 :640 ] = reg14 ^ (~(reg10) & reg11);
  
  assign out[639 :576 ] = reg15 ^ (~(reg16) & reg17);
  assign out[575 :512 ] = reg16 ^ (~(reg17) & reg18);
  assign out[511 :448 ] = reg17 ^ (~(reg18) & reg19);
  assign out[447 :384 ] = reg18 ^ (~(reg19) & reg15);
  assign out[383 :320 ] = reg19 ^ (~(reg15) & reg16);
  
  assign out[319 :256 ] = reg20 ^ (~(reg21) & reg22);
  assign out[255 :192 ] = reg21 ^ (~(reg22) & reg23);
  assign out[191 :128 ] = reg22 ^ (~(reg23) & reg24);
  assign out[127 :64  ] = reg23 ^ (~(reg24) & reg20);
  assign out[63  :0   ] = reg24 ^ (~(reg20) & reg21);

endmodule