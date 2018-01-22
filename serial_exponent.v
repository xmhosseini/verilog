`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EEHPC, UMBC
// Engineer: Morteza Hosseini
// 
// Create Date: 12/02/2017 10:22:30 AM
// Design Name: 
// Module Name: exponent
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module serial_exponent(
    input [15:0] in,
    input clk,
    input start,
    input reset,
    output [15:0] out
    );
    wire [63:0] x0;
    reg [63:0] Y0;
    reg stallOut;
    reg [63:0] tempx0;
    reg [63:0] tempY0;
    
    reg [115:0] ramA [0:19];
    reg [115:0] ramB [0:9];
    
    wire [63:0] Xx00, Xx01;
    wire [63:0] Yy00, Yy01;
    wire [63:0] y_in;
    
    reg CS, NS;
    reg [4:0] counter;
    
    parameter S0=1'b0, S1=1'b1;
    

    wire [63:0] a0, b0;
    
    
    assign x0 = tempx0;
    assign y_in = Y0; 
    assign out = Y0[63:48];
    
    half_exp U00 (.ra1_keep(ramA[counter][115]), .ra1_ofst(ramA[counter][114:99]), .rs1_keep(ramA[counter][98]), .rs1_ofst(ramA[counter][97:82]), .rs2_keep(ramA[counter][81]), .rs2_ofst(ramA[counter][80:65]), .yy_keep(ramA[counter][64]), .ipoffset(ramA[counter][63:0]), .X(Xx01), .Y(Yy01), .x(x0) , .y(y_in));
    //half_exp U01 (.ra1_keep(ramB[counter][115]), .ra1_ofst(ramB[counter][114:99]), .rs1_keep(ramB[counter][98]), .rs1_ofst(ramB[counter][97:82]), .rs2_keep(ramB[counter][81]), .rs2_ofst(ramB[counter][80:65]), .yy_keep(ramB[counter][64]), .ipoffset(ramB[counter][63:0]), .X(Xx01), .Y(Yy01), .x(Xx00)  , .y(Yy00));

    always @* begin
        if(reset) begin
            CS <= 0;
        end
        else begin
            CS <= NS;
        end
    end
    
    always @* begin
        case(CS)
        S0: begin
            if (start == 1'b1) begin
                NS <= S1;
            end
            else begin
                NS <= S0;
            end
        end
        S1: begin
            if (counter < 20) begin
                NS <= S1;
            end
            else begin
                NS <= S0;
            end
        end
        endcase
    end
    
    
    
    always @(posedge clk) begin
    case (CS)
        S0: begin
            counter <= 0;
        ramA[0] <= {1'd1, 16'd63, 1'd0, 16'd00, 1'd0, 16'd00, 1'd0, 64'd187550000000};
        ramA[1] <= {1'd1, 16'd32, 1'd0, 16'd00, 1'd0, 16'd00, 1'd0, 64'd095265000000};
        ramA[2] <= {1'd1, 16'd16, 1'd0, 16'd00, 1'd0, 16'd00, 1'd0, 64'd047633000000};
        ramA[3] <= {1'd1, 16'd08, 1'd0, 16'd00, 1'd0, 16'd00, 1'd0, 64'd023816000000};
        ramA[4] <= {1'd1, 16'd04, 1'd0, 16'd00, 1'd0, 16'd00, 1'd0, 64'd011908000000};
        ramA[5] <= {1'd0, 16'd00, 1'd1, 16'd01, 1'd1, 16'd02, 1'd1, 64'd005954100000};
        ramA[6] <= {1'd0, 16'd00, 1'd1, 16'd01, 1'd1, 16'd04, 1'd1, 64'd003550600000};
        ramA[7] <= {1'd1, 16'd03, 1'd1, 16'd01, 1'd0, 16'd00, 1'd1, 64'd002018700000};
        ramA[8] <= {1'd1, 16'd05, 1'd1, 16'd02, 1'd0, 16'd00, 1'd1, 64'd001060300000};
        ramA[9] <= {1'd0, 16'd00, 1'd1, 16'd03, 1'd0, 16'd00, 1'd1, 64'd000573510000};
        ramA[10] <= {1'd0, 16'd00, 1'd1, 16'd04, 1'd1, 16'd07, 1'd1, 64'd000313130000};
        ramA[11] <= {1'd0, 16'd00, 1'd1, 16'd05, 1'd1, 16'd07, 1'd1, 64'd000171140000};
        ramA[12] <= {1'd0, 16'd00, 1'd1, 16'd06, 1'd1, 16'd07, 1'd1, 64'd000101860000};
        ramA[13] <= {1'd0, 16'd00, 1'd1, 16'd06, 1'd0, 16'd00, 1'd1, 64'd000067639000};
        ramA[14] <= {1'd0, 16'd00, 1'd1, 16'd07, 1'd0, 16'd00, 1'd1, 64'd000033686000};
        ramA[15] <= {1'd0, 16'd00, 1'd1, 16'd08, 1'd0, 16'd00, 1'd1, 64'd000016810000};
        ramA[16] <= {1'd0, 16'd00, 1'd1, 16'd09, 1'd0, 16'd00, 1'd1, 64'd000008396800};
        ramA[17] <= {1'd0, 16'd00, 1'd1, 16'd10, 1'd0, 16'd00, 1'd1, 64'd000004196400};
        ramA[18] <= {1'd0, 16'd00, 1'd1, 16'd11, 1'd0, 16'd00, 1'd1, 64'd000002097700};
        ramA[19] <= {1'd0, 16'd00, 1'd1, 16'd12, 1'd0, 16'd00, 1'd1, 64'd000001048700}; 
            //tempx0 <= {24'd0, in, 24'd0};
            //Y0 <= 64'hFFFF_FFFF_FFFF_FFFF;
        end
        S1: begin
            counter <= counter +1;
            if(start == 1) begin
               tempx0 <= {24'd0, in, 24'd0};
               Y0 <= 64'hFFFF_FFFF_FFFF_FFFF;
            end
            else begin
               tempx0 <= Xx01;
               Y0 <= Yy01;
            end
        end
    endcase
    end
    /*
always @* begin
    if(start == 1) begin
       tempx0 <= {24'd0, in, 24'd0};
       Y0 <= 64'hFFFF_FFFF_FFFF_FFFF;
    end
    else begin
        tempx0 <= Xx01;
        Y0 <= Yy01;
    end
end    */  
endmodule
