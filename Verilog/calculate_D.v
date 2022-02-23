module calculate_D(out_D, out_C1, out_C2);
output [63:0] out_D;
input [63:0] out_C1, out_C2;

assign out_D = out_C1[63:0] ^ {out_C2[0], out_C2[63:1]};

endmodule
