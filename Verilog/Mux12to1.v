module Mux12to1(out, in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7,
		in_8, in_9, in_10, in_11, sel);
output reg [63:0] out;
input [63:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11;
input [3:0] sel;

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
	default: out = in_0;
	endcase
end
endmodule
