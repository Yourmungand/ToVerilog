// -------------------------------------------------------------
// 
// File Name: hdlsrc\ModelToVerilog\GilbertTransformer.v
// Created: 2023-11-15 16:10:41
// 
// Generated by MATLAB 9.9 and HDL Coder 3.17
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: GilbertTransformer
// Source Path: ModelToVerilog/ToVerilog/FI_Full1/GilbertTransformer
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module GilbertTransformer
          (clk,
           reset,
           IN,
           Xr,
           Xi);


  input   clk;
  input   reset;
  input   signed [12:0] IN;  // sfix13_En2
  output  signed [12:0] Xr;  // sfix13_En2
  output  signed [64:0] Xi;  // sfix65_En53


  reg signed [12:0] Delay1_out1;  // sfix13_En2
  reg signed [12:0] Delay2_out1;  // sfix13_En2
  reg signed [12:0] Delay3_out1;  // sfix13_En2
  reg signed [12:0] Delay4_out1;  // sfix13_En2
  reg signed [12:0] Delay5_out1;  // sfix13_En2
  reg signed [12:0] Delay6_out1;  // sfix13_En2
  wire [15:0] Constant7_out1;  // ufix16_En30
  wire [15:0] Constant6_out1;  // ufix16_En16
  wire signed [15:0] Constant5_out1;  // sfix16_En4
  wire signed [15:0] Constant4_out1;  // sfix16_En15
  wire signed [15:0] Constant3_out1;  // sfix16_En29
  wire signed [28:0] Product3_mul_temp;  // sfix29_En31
  wire signed [15:0] Product3_out1;  // sfix16_En19
  wire signed [15:0] Constant2_out1;  // sfix16_En15
  wire [15:0] Constant8_out1;  // ufix16_En16
  wire signed [16:0] Product8_cast;  // sfix17_En16
  wire signed [29:0] Product8_mul_temp;  // sfix30_En18
  wire signed [28:0] Product8_cast_1;  // sfix29_En18
  wire signed [15:0] Product8_out1;  // sfix16_En5
  wire signed [16:0] Product7_cast;  // sfix17_En30
  wire signed [29:0] Product7_mul_temp;  // sfix30_En32
  wire signed [28:0] Product7_cast_1;  // sfix29_En32
  wire signed [15:0] Product7_out1;  // sfix16_En19
  wire signed [16:0] Product6_cast;  // sfix17_En16
  wire signed [29:0] Product6_mul_temp;  // sfix30_En18
  wire signed [28:0] Product6_cast_1;  // sfix29_En18
  wire signed [15:0] Product6_out1;  // sfix16_En5
  wire signed [28:0] Product5_mul_temp;  // sfix29_En6
  wire signed [15:0] Product5_out1;  // sfix16_En4
  wire signed [28:0] Product4_mul_temp;  // sfix29_En17
  wire signed [15:0] Product4_out1;  // sfix16_En5
  wire signed [28:0] Product2_mul_temp;  // sfix29_En17
  wire signed [15:0] Product2_out1;  // sfix16_En5
  wire signed [31:0] Sum1_add_cast;  // sfix32_En19
  wire signed [31:0] Sum1_add_cast_1;  // sfix32_En19
  wire signed [31:0] Sum1_add_temp;  // sfix32_En19
  wire signed [31:0] Sum1_out1;  // sfix32_En18
  wire signed [31:0] Sum2_add_cast;  // sfix32_En18
  wire signed [31:0] Sum2_out1;  // sfix32_En18
  wire signed [31:0] Sum3_add_cast;  // sfix32_En18
  wire signed [31:0] Sum3_out1;  // sfix32_En18
  wire signed [31:0] Sum4_add_cast;  // sfix32_En18
  wire signed [31:0] Sum4_out1;  // sfix32_En18
  wire signed [31:0] Sum5_add_cast;  // sfix32_En18
  wire signed [31:0] Sum5_out1;  // sfix32_En18
  wire signed [63:0] Sum6_add_cast;  // sfix64_En18
  wire signed [63:0] Sum6_add_cast_1;  // sfix64_En18
  wire signed [63:0] Sum6_add_temp;  // sfix64_En18
  wire signed [64:0] Sum6_out1;  // sfix65_En53


  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 13'sb0000000000000;
      end
      else
        Delay1_out1 <= IN;
    end



  always @(posedge clk or posedge reset)
    begin : Delay2_process
      if (reset == 1'b1) begin
        Delay2_out1 <= 13'sb0000000000000;
      end
      else
        Delay2_out1 <= Delay1_out1;
    end



  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1 <= 13'sb0000000000000;
      end
      else
        Delay3_out1 <= Delay2_out1;
    end



  assign Xr = Delay3_out1;

  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        Delay4_out1 <= 13'sb0000000000000;
      end
      else
        Delay4_out1 <= Delay3_out1;
    end



  always @(posedge clk or posedge reset)
    begin : Delay5_process
      if (reset == 1'b1) begin
        Delay5_out1 <= 13'sb0000000000000;
      end
      else
        Delay5_out1 <= Delay4_out1;
    end



  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        Delay6_out1 <= 13'sb0000000000000;
      end
      else
        Delay6_out1 <= Delay5_out1;
    end



  assign Constant7_out1 = 16'b1001001010110110;
  assign Constant6_out1 = 16'b1010010101101001;
  assign Constant5_out1 = 16'sb0000000000000000;
  assign Constant4_out1 = 16'sb1010110101001011;
  assign Constant3_out1 = 16'sb1011011010100101;

  assign Product3_mul_temp = Delay1_out1 * Constant3_out1;
  assign Product3_out1 = Product3_mul_temp[27:12];

  assign Constant2_out1 = 16'sb1011011010000110;
  assign Constant8_out1 = 16'b1001001011110100;

  assign Product8_cast = {1'b0, Constant8_out1};
  assign Product8_mul_temp = Delay6_out1 * Product8_cast;
  assign Product8_cast_1 = Product8_mul_temp[28:0];
  assign Product8_out1 = Product8_cast_1[28:13];

  assign Product7_cast = {1'b0, Constant7_out1};
  assign Product7_mul_temp = Delay5_out1 * Product7_cast;
  assign Product7_cast_1 = Product7_mul_temp[28:0];
  assign Product7_out1 = Product7_cast_1[28:13];

  assign Product6_cast = {1'b0, Constant6_out1};
  assign Product6_mul_temp = Delay4_out1 * Product6_cast;
  assign Product6_cast_1 = Product6_mul_temp[28:0];
  assign Product6_out1 = Product6_cast_1[28:13];

  assign Product5_mul_temp = Delay3_out1 * Constant5_out1;
  assign Product5_out1 = Product5_mul_temp[17:2];

  assign Product4_mul_temp = Delay2_out1 * Constant4_out1;
  assign Product4_out1 = Product4_mul_temp[27:12];

  assign Product2_mul_temp = IN * Constant2_out1;
  assign Product2_out1 = Product2_mul_temp[27:12];

  assign Sum1_add_cast = {{16{Product3_out1[15]}}, Product3_out1};
  assign Sum1_add_cast_1 = {{2{Product2_out1[15]}}, {Product2_out1, 14'b00000000000000}};
  assign Sum1_add_temp = Sum1_add_cast + Sum1_add_cast_1;
  assign Sum1_out1 = {Sum1_add_temp[31], Sum1_add_temp[31:1]};

  assign Sum2_add_cast = {{3{Product4_out1[15]}}, {Product4_out1, 13'b0000000000000}};
  assign Sum2_out1 = Sum2_add_cast + Sum1_out1;

  assign Sum3_add_cast = {{2{Product5_out1[15]}}, {Product5_out1, 14'b00000000000000}};
  assign Sum3_out1 = Sum3_add_cast + Sum2_out1;

  assign Sum4_add_cast = {{3{Product6_out1[15]}}, {Product6_out1, 13'b0000000000000}};
  assign Sum4_out1 = Sum4_add_cast + Sum3_out1;

  assign Sum5_add_cast = {{17{Product7_out1[15]}}, Product7_out1[15:1]};
  assign Sum5_out1 = Sum5_add_cast + Sum4_out1;

  assign Sum6_add_cast = {{35{Product8_out1[15]}}, {Product8_out1, 13'b0000000000000}};
  assign Sum6_add_cast_1 = {{32{Sum5_out1[31]}}, Sum5_out1};
  assign Sum6_add_temp = Sum6_add_cast + Sum6_add_cast_1;
  assign Sum6_out1 = {Sum6_add_temp[29:0], 35'b00000000000000000000000000000000000};

  assign Xi = Sum6_out1;

endmodule  // GilbertTransformer
