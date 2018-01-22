module half_exp#(
                  parameter ra1_keep= 1'd0,  
                  parameter ra1_ofst= 16'h0000,  
                  parameter rs1_keep= 1'd0,  
                  parameter rs1_ofst= 16'h0000,  
                  parameter rs2_keep= 1'd0,  
                  parameter rs2_ofst= 16'h0000,  
                  parameter yy_keep = 1'd0,  
                  parameter ipoffset= 64'h0000_0000
                  )
                  (X, Y,
                   x, y,
                   clk,
                   rst
                   );                         
input  [63:0] x;
input  [63:0] y; 
input  clk, rst;

output  reg [63:0] X;
output  reg [63:0] Y; 

reg mux_select;

wire [63:0] yra1= y >> ra1_ofst;
wire [63:0] yrs1= y >> rs1_ofst;
wire [63:0] yrs2= y >> rs2_ofst;

reg signed [63:0] X_temp;

reg [63:0] Y_temp;
//reg [63:0] Y_temp1;
//reg [63:0] Y_temp2;

always @ (*)
begin
  if (rst)
    begin
    end
  else
    begin
      X_temp  = x - ipoffset;
 //   Y_temp = Y_temp1 + Y_temp2;
      Y_temp =  y*yy_keep+yra1*ra1_keep-yrs1*rs1_keep-yrs2*rs2_keep;
      mux_select =  (X_temp>0);
      X = mux_select ? X_temp : x;
      Y = mux_select ? Y_temp : y;
    end
end

endmodule
