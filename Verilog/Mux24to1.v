module Mux24to1(out, in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7,
		in_8, in_9, in_10, in_11, in_12, in_13, in_14, in_15,
		in_16, in_17, in_18, in_19, in_20, in_21, in_22, in_23, sel);
// output reg [63:0] out;
output reg [7:0] out;
// input [63:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, 
// in_13, in_14, in_15, in_16, in_17, in_18, in_19, in_20, in_21, in_22, in_23;
input [7:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, 
in_13, in_14, in_15, in_16, in_17, in_18, in_19, in_20, in_21, in_22, in_23;
input [4:0] sel;

always @(*) begin
	case(sel)
	5'd0: out = in_0;
	5'd1: out = in_1;
	5'd2: out = in_2;
	5'd3: out = in_3;
	5'd4: out = in_4;
	5'd5: out = in_5;
	5'd6: out = in_6;
	5'd7: out = in_7;
	5'd8: out = in_8;
	5'd9: out = in_9;
	5'd10: out = in_10;
	5'd11: out = in_11;
	5'd12: out = in_12;
	5'd13: out = in_13;
	5'd14: out = in_14;
	5'd15: out = in_15;
	5'd16: out = in_16;
	5'd17: out = in_17;
	5'd18: out = in_18;
	5'd19: out = in_19;
	5'd20: out = in_20;
	5'd21: out = in_21;
	5'd22: out = in_22;
	5'd23: out = in_23;
	default: out = in_0;
	endcase
end
endmodule
