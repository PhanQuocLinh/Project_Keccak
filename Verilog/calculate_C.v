module calculate_C(out_C, S_x);
output [63:0] out_C;
input [319:0] S_x;

assign out_C = S_x[63:0] ^ S_x[127:64] ^ S_x[191:128] ^ S_x[255:192] ^ S_x[319:256];

endmodule
 
