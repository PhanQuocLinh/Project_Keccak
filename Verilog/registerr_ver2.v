module registerr_ver2 #(
    parameter DIN_WIDTH  = 1600
)   (out, in, enable, rst_newmess, k, rst_n, clk);

    output  [DIN_WIDTH-1:0] out;
    input   [DIN_WIDTH-1:0] in;
    input   enable, rst_newmess, rst_n, clk, k;

    reg     [DIN_WIDTH-1:0] out;

    always @(posedge clk, negedge rst_n) begin
        if (rst_n == 1'b0)
            out <= {64'h8000000000000000, 320'h0, 64'h0000080000000000, 704'h0, 64'h0000000000100000, 384'h0};
        else
            if (rst_newmess || k)
                out <= {64'h8000000000000000, 320'h0, 64'h0000080000000000, 704'h0, 64'h0000000000100000, 384'h0};
            else begin
                if(enable) 
                    out <= in;
                else 
                    out <= out;
            end
    end
endmodule
