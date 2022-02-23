module calculate_Sdelta(out_Sdelta, out_Sdelta5, out_Sdelta10, out_Sdelta15, out_Sdelta20, S_x,
			S_x5, S_x10, S_x15, S_x20, out_D);
output [63:0] out_Sdelta, out_Sdelta5, out_Sdelta10, out_Sdelta15, out_Sdelta20;
input [63:0] S_x, S_x5, S_x10, S_x15, S_x20, out_D;

assign out_Sdelta = S_x20 ^ out_D;
assign out_Sdelta5 = S_x15 ^ out_D;
assign out_Sdelta10 = S_x10 ^ out_D;
assign out_Sdelta15 = S_x5 ^ out_D;
assign out_Sdelta20 = S_x ^ out_D;

endmodule

