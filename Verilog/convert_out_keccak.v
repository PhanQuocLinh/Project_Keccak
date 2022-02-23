module convert_out_keccak #(
    parameter DOUT_WIDTH = 256
)   (out, in);
    // integer i;
    integer j;
    input   [0:DOUT_WIDTH-1] in;
    output  [DOUT_WIDTH-1:0] out;

    // reg [511:0] reversed;
    reg [DOUT_WIDTH-1:0] result;

    // mirror bits in wide 10-bit value    
    always @*
    begin
    // for(i=0;i<512;i=i+1)
    //     reversed[i] = in[511-i];
    for(j=0;j<DOUT_WIDTH;j=j+8)
    begin
        result[j]   = in[DOUT_WIDTH-8 - j];
        result[j+1] = in[DOUT_WIDTH-7 - j];
        result[j+2] = in[DOUT_WIDTH-6 - j];
        result[j+3] = in[DOUT_WIDTH-5 - j];
        result[j+4] = in[DOUT_WIDTH-4 - j];
        result[j+5] = in[DOUT_WIDTH-3 - j];
        result[j+6] = in[DOUT_WIDTH-2 - j];
        result[j+7] = in[DOUT_WIDTH-1 - j];
    end
    end
    assign out = result;
endmodule
