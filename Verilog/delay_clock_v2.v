`ifndef nbit_DFF_INCLUDED
    `include "dff.v"
    `define nbit_DFF_INCLUDED
`endif

module delay_clock_v2(clk,resetn,enable,in,out);
    // parameter DATA_WIDTH = 8;
    parameter N_CLOCKs = 24;
    
    input  clk;
    input  resetn;
    input  enable;
    input  in;
    output out;
    
    
    
    //Registers for delay n clock(s)
    wire	[0 : N_CLOCKs-1]	tmp ;
    
    //assign statement
    assign out = tmp[N_CLOCKs-1];
    
    //Generate instances
    genvar i;
    generate
    for (i = 0; i < N_CLOCKs; i=i+1) 
    begin:	gen_delay
        if(i == 0) 
            dff dff_ins(clk,resetn,enable,in,tmp[i]);
        else 
            dff dff_ins(clk,resetn,enable,tmp[i-1],tmp[i]);
    end
    endgenerate
    

endmodule

// `ifndef nbit_DFF_INCLUDED
// `include "nbit_dff.v"
// `define nbit_DFF_INCLUDED
// `endif

// module delay_clock(clk,resetn,enable,in,out);
// 	parameter DATA_WIDTH = 1;
// 	parameter N_CLOCKs = 1;
	
// 	input clk;
// 	input resetn;
// 	input enable;
// 	input [DATA_WIDTH-1:0] in;
// 	output [DATA_WIDTH-1:0] out;
	
	
	
// 	//Registers for delay n clock(s)
// 	wire [DATA_WIDTH-1:0] tmp [0 : N_CLOCKs-1];
	
// 	//assign statement
// 	assign out = tmp[N_CLOCKs-1];
	
// 	//Generate instances
// 	genvar i;
// 	generate
// 	for (i = 0; i < N_CLOCKs; i=i+1) begin : delay
// 		if(i == 0) nbit_dff #(DATA_WIDTH) nbit_dff_ins(clk,resetn,enable,in,tmp[i]);
// 		else nbit_dff#(DATA_WIDTH) nbit_dff_ins(clk,resetn,enable,tmp[i-1],tmp[i]);
// 	end
// 	endgenerate
// endmodule