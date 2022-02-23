module module12counter(out, rst_n, up, clk);
// up = 1 -> counter up; up = 0 -> counter unchange
output reg [3:0] out;
input rst_n, clk, up;

always @(posedge clk, negedge rst_n) begin
    if(~rst_n) 
        out <= 4'd0;
    else 
        if (up)
            if (out == 4'd11)
                out <= 4'd0;
            else
                out <= out + 4'd1;
        else
            out <= out;
        // if(up && out < 5'd23) out <= out + 5'd1;
        // else if(up && out == 5'd23) out <= 0;
        // else if(~up) out <= out;
end

endmodule
