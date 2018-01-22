//'timescale 1ns/1ps

//matlab simulating file = exp_cordic_negative_values_better_coefficients_for_our_HW.m
// Given x0=64'h 0000_0000_._d3a1_db40 Y0 = 64'h _._7006_1da9_5eed_95e1
//meaning 
// x0 = 0.8267 Y0=exp(-x0) = 0.4376

module parallel_exponent (Y0, x0, clk, rst);

input   [63:0]  x0; 
input   clk, rst;
output  [63:0]  Y0;

wire [63:0] Xx00, Xx01, Xx02, Xx03, Xx04, Xx05, Xx06, Xx07, Xx08, Xx09, Xx10, Xx11, Xx12, Xx13, Xx14, Xx15, Xx16, Xx17, Xx18, Errr;
wire [63:0] Yy00, Yy01, Yy02, Yy03, Yy04, Yy05, Yy06, Yy07, Yy08, Yy09, Yy10, Yy11, Yy12, Yy13, Yy14, Yy15, Yy16, Yy17, Yy18;

wire [63:0] y_in = 64'hFFFF_FFFF_FFFF_FFFF;  //supposedly 0.999999999 = 1
////////////////////////////////////////////////////// 
//ra1_keep= 1'd0, ra1_ofst= 16'h0000, rs1_keep= 1'd0, rs1_ofst= 16'h0000, rs2_keep= 1'd0, rs2_ofst= 16'h0000, yy_keep = 1'd0, ipoffset= 64'h0000_0000
half_exp #(1'd1, 16'd63, 1'd0, 16'd00, 1'd0, 16'd00, 1'd0, 64'd187550000000  ) U00 (.X(Xx00), .Y(Yy00), .x(x0)    , .y(y_in)   , .clk(clk), .rst(rst));
half_exp #(1'd1, 16'd32, 1'd0, 16'd00, 1'd0, 16'd00, 1'd0, 64'd095265000000  ) U01 (.X(Xx01), .Y(Yy01), .x(Xx00)  , .y(Yy00)   , .clk(clk), .rst(rst));
half_exp #(1'd1, 16'd16, 1'd0, 16'd00, 1'd0, 16'd00, 1'd0, 64'd047633000000  ) U02 (.X(Xx02), .Y(Yy02), .x(Xx01)  , .y(Yy01)   , .clk(clk), .rst(rst));
half_exp #(1'd1, 16'd08, 1'd0, 16'd00, 1'd0, 16'd00, 1'd0, 64'd023816000000  ) U03 (.X(Xx03), .Y(Yy03), .x(Xx02)  , .y(Yy02)   , .clk(clk), .rst(rst));
half_exp #(1'd1, 16'd04, 1'd0, 16'd00, 1'd0, 16'd00, 1'd0, 64'd011908000000  ) U04 (.X(Xx04), .Y(Yy04), .x(Xx03)  , .y(Yy03)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd01, 1'd1, 16'd02, 1'd1, 64'd005954100000  ) U05 (.X(Xx05), .Y(Yy05), .x(Xx04)  , .y(Yy04)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd01, 1'd1, 16'd04, 1'd1, 64'd003550600000  ) U06 (.X(Xx06), .Y(Yy06), .x(Xx05)  , .y(Yy05)   , .clk(clk), .rst(rst));
half_exp #(1'd1, 16'd03, 1'd1, 16'd01, 1'd0, 16'd00, 1'd1, 64'd002018700000  ) U07 (.X(Xx07), .Y(Yy07), .x(Xx06)  , .y(Yy06)   , .clk(clk), .rst(rst));
half_exp #(1'd1, 16'd05, 1'd1, 16'd02, 1'd0, 16'd00, 1'd1, 64'd001060300000  ) U08 (.X(Xx08), .Y(Yy08), .x(Xx07)  , .y(Yy07)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd03, 1'd0, 16'd00, 1'd1, 64'd000573510000  ) U09 (.X(Xx09), .Y(Yy09), .x(Xx08)  , .y(Yy08)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd04, 1'd1, 16'd07, 1'd1, 64'd000313130000  ) U10 (.X(Xx10), .Y(Yy10), .x(Xx09)  , .y(Yy09)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd05, 1'd1, 16'd07, 1'd1, 64'd000171140000  ) U11 (.X(Xx11), .Y(Yy11), .x(Xx10)  , .y(Yy10)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd06, 1'd1, 16'd07, 1'd1, 64'd000101860000  ) U12 (.X(Xx12), .Y(Yy12), .x(Xx11)  , .y(Yy11)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd06, 1'd0, 16'd00, 1'd1, 64'd000067639000  ) U13 (.X(Xx13), .Y(Yy13), .x(Xx12)  , .y(Yy12)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd07, 1'd0, 16'd00, 1'd1, 64'd000033686000  ) U14 (.X(Xx14), .Y(Yy14), .x(Xx13)  , .y(Yy13)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd08, 1'd0, 16'd00, 1'd1, 64'd000016810000  ) U15 (.X(Xx15), .Y(Yy15), .x(Xx14)  , .y(Yy14)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd09, 1'd0, 16'd00, 1'd1, 64'd000008396800  ) U16 (.X(Xx16), .Y(Yy16), .x(Xx15)  , .y(Yy15)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd10, 1'd0, 16'd00, 1'd1, 64'd000004196400  ) U17 (.X(Xx17), .Y(Yy17), .x(Xx16)  , .y(Yy16)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd11, 1'd0, 16'd00, 1'd1, 64'd000002097700  ) U18 (.X(Xx18), .Y(Yy18), .x(Xx17)  , .y(Yy17)   , .clk(clk), .rst(rst));
half_exp #(1'd0, 16'd00, 1'd1, 16'd12, 1'd0, 16'd00, 1'd1, 64'd000001048700  ) U19 (.X(Errr), .Y(Y0  ), .x(Xx18)  , .y(Yy18)   , .clk(clk), .rst(rst));


endmodule

///////////////////////////
