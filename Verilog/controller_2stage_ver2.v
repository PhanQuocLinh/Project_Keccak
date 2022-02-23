module controller_2stage_ver2(
    input               clk,
    input               rst_n,
    input               first_block,
    input               flag,
    input       [4:0]   count,
    output  reg         load,
    // output  reg         sel_mux,
    output  reg         sel_reg_0,
    output  reg         sel_reg_1,
    // output  reg [1:0]   current_state,
    // output  reg [1:0]   next_state,
    // output  reg         rst_1_syn,
    output  reg         up,
    output  reg         k
);
    
    localparam S0 = 2'd0;
    localparam S1 = 2'd1;
    localparam S2 = 2'd3;
    localparam S3 = 2'd2;
    // integer i = 0;
    reg [1:0]  current_state;
    reg [1:0]  next_state;
    always @(*) begin
    case(current_state)
        S0: begin   // new1 - none
            up = 1'd0; 
            sel_reg_0 = 1'b1; sel_reg_1 = 1'b1;
            // rst_1_syn = 1'b0;

            load = 1'b1;

            if(first_block) begin
                k = 1'b1;
            end
            else begin
                k = 1'b0;
            end
            next_state = S1;
        end
        S1: begin   // new2 - i1
            up = 1'd0; 
            sel_reg_0 = 1'b1; sel_reg_1 = 1'b1;  k = 1'b0;
            // rst_1_syn = 1'b0;

            load = 1'b1;

            next_state = S2;
            // next_state = S1;
        end  
        S2: begin   // o1/none - i2
            up = 1'b0;  
            sel_reg_0 = 1'b1; sel_reg_1 = 1'b1; 
            k = 1'b0;

            // load = 1'd0;
            if (count == 5'd23) begin
                if(~flag) begin
                    load = 1'd1;
                end
                else load = 1'd0;
            end else begin
                load = 1'd0;
            end
            next_state = S3;
            
        end
        S3: begin   // o2/none - none
            up = 1'd1; 
            sel_reg_0 = 1'b1; sel_reg_1 = 1'b1;
            
            k = 1'b0;
            // load = 1'b0;

            if (count == 5'd23)     // quay lai thuc hien Round moi 
            begin
                if(~flag) begin
                    load = 1'd1;
                    next_state = S2;
                end
                else begin
                    load = 1'd0;
                    next_state = S0;        
                end
            end
            else
            begin
                load = 1'b0;
                next_state = S2; 
            end

            // next_state = S0;
        end
        default: begin
            load = 1'b0; up = 1'd0;
            sel_reg_0 = 1'b0; sel_reg_1 = 1'b0; 
            k = 1'b0;
            next_state = S0; 
        end 
    endcase
    end
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) 
            current_state <= S0;
        else 
            current_state <= next_state;
    end
endmodule  