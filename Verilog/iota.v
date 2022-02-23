module iota(out, in, rc);
  integer i;
  
  input [1599:0] in;
  input [7:0] rc;
  output[1599:0] out;
  
  reg [7:0] reversed;
  always @*
    begin
      for(i=0;i<8;i=i+1)
        reversed[i] = rc[7-i];
    end
  
  assign {out[1599], out[1598], out[1597], out[1596], out[1592], out[1584], out[1568], out[1536]} = 
            {in[1599], in[1598], in[1597], in[1596], in[1592], in[1584], in[1568], in[1536]} ^ reversed[7:0];
  assign out[1535:0   ] = in[1535:0   ];
  assign {out[1595:1593] , out[1591:1585], out[1583:1569], out[1567:1537]} = 
            {in[1595:1593] , in[1591:1585], in[1583:1569], in[1567:1537]};
endmodule
  
  