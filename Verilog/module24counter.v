module module24counter(out, rst_n, up, clk);
// up = 1 -> counter up; up = 0 -> counter unchange
output reg [4:0] out;
input rst_n, clk, up;

always @(posedge clk, negedge rst_n) begin
    if(~rst_n) 
        out <= 5'd0;
    else begin
        if (up) begin
            if (out == 5'd23)
                out <= 5'd0;
            else
                out <= out + 5'd1;
        end
        else
            out <= out;
    end
        // if(up && out < 5'd23) out <= out + 5'd1;
        // else if(up && out == 5'd23) out <= 0;
        // else if(~up) out <= out;
end

endmodule
