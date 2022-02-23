module Padding #(
    parameter DIN_WIDTH  = 64,
    parameter DOUT_WIDTH = 256
) (out, in);
    integer j;
    input  [0:DIN_WIDTH-1]          in;
    output [1599 - DOUT_WIDTH*2:0]  out;

    reg [DIN_WIDTH-1:0] result;

    // mirror bits in wide 10-bit value    
    always @*
    begin
    for(j=0;j<DIN_WIDTH;j=j+8)
    begin
        result[j]   = in[DIN_WIDTH-8 - j];
        result[j+1] = in[DIN_WIDTH-7 - j];
        result[j+2] = in[DIN_WIDTH-6 - j];
        result[j+3] = in[DIN_WIDTH-5 - j];
        result[j+4] = in[DIN_WIDTH-4 - j];
        result[j+5] = in[DIN_WIDTH-3 - j];
        result[j+6] = in[DIN_WIDTH-2 - j];
        result[j+7] = in[DIN_WIDTH-1 - j];
    end
    end

    assign out = {result, 1'b1, {(1598 - DOUT_WIDTH*2 - DIN_WIDTH){1'b0}}, 1'b1};
    // assign out = result;
endmodule
