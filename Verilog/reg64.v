module reg64(out, in, enable, rst_n, clk);
output [63:0] out;
input [63:0] in;
input enable, rst_n, clk;
reg [63:0] out;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0)
        out <= 0;
    else begin
        if(enable) 
            out <= in;
        else 
            out <= out;
    end
end

endmodule
