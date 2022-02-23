module reg_1600(out, in, enable, clk);
output [1599:0] out;
input [1599:0] in;
input enable, clk;
reg [1599:0] out;

always @(posedge clk) begin

    if(enable) 
        out <= in;
    else 
        out <= out;
    
end

endmodule
