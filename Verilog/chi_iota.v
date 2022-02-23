module chi_iota(out, in, rc);
  input [1599:0] in;
  wire [1599:0] out_chi;
  
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
  
  assign out_chi[1599:1536] = reg0  ^ (~(reg1) & reg2); //r0 = 1, r4 = 0, r3 = 1, r2 = 0, r1 = 1
  assign out_chi[1535:1472] = reg1  ^ (~(reg2) & reg3);
  assign out_chi[1471:1408] = reg2  ^ (~(reg3) & reg4);
  assign out_chi[1407:1344] = reg3  ^ (~(reg4) & reg0);
  assign out_chi[1343:1280] = reg4  ^ (~(reg0) & reg1);
  
  assign out_chi[1279:1216] = reg5  ^ (~(reg6) & reg7);
  assign out_chi[1215:1152] = reg6  ^ (~(reg7) & reg8);
  assign out_chi[1151:1088] = reg7  ^ (~(reg8) & reg9);
  assign out_chi[1087:1024] = reg8  ^ (~(reg9) & reg5);
  assign out_chi[1023:960 ] = reg9  ^ (~(reg5) & reg6);
  
  assign out_chi[959 :896 ] = reg10 ^ (~(reg11) & reg12);
  assign out_chi[895 :832 ] = reg11 ^ (~(reg12) & reg13);
  assign out_chi[831 :768 ] = reg12 ^ (~(reg13) & reg14);
  assign out_chi[767 :704 ] = reg13 ^ (~(reg14) & reg10);
  assign out_chi[703 :640 ] = reg14 ^ (~(reg10) & reg11);
  
  assign out_chi[639 :576 ] = reg15 ^ (~(reg16) & reg17);
  assign out_chi[575 :512 ] = reg16 ^ (~(reg17) & reg18);
  assign out_chi[511 :448 ] = reg17 ^ (~(reg18) & reg19);
  assign out_chi[447 :384 ] = reg18 ^ (~(reg19) & reg15);
  assign out_chi[383 :320 ] = reg19 ^ (~(reg15) & reg16);
  
  assign out_chi[319 :256 ] = reg20 ^ (~(reg21) & reg22);
  assign out_chi[255 :192 ] = reg21 ^ (~(reg22) & reg23);
  assign out_chi[191 :128 ] = reg22 ^ (~(reg23) & reg24);
  assign out_chi[127 :64  ] = reg23 ^ (~(reg24) & reg20);
  assign out_chi[63  :0   ] = reg24 ^ (~(reg20) & reg21);

// endmodule

// module iota(out, in, rc);
  integer i;
  
//   input [1599:0] in;
  input [7:0] rc;
  output[1599:0] out;
  
  reg [7:0] reversed;
  always @*
    begin
      for(i=0;i<8;i=i+1)
        reversed[i] = rc[7-i];
    end
  
  assign {out[1599], out[1598], out[1597], out[1596], out[1592], out[1584], out[1568], out[1536]} = 
            {out_chi[1599], out_chi[1598], out_chi[1597], out_chi[1596], out_chi[1592], out_chi[1584], out_chi[1568], out_chi[1536]} ^ reversed[7:0];
  assign out[1535:0   ] = out_chi[1535:0   ];
  assign {out[1595:1593] , out[1591:1585], out[1583:1569], out[1567:1537]} = 
            {out_chi[1595:1593] , out_chi[1591:1585], out_chi[1583:1569], out_chi[1567:1537]};
endmodule
  
  