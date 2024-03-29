// -------------------------------------------------------------
// 
// File Name: hdlsrc\ModelToVerilog\EnvelopeDetection.v
// Created: 2023-11-15 16:10:41
// 
// Generated by MATLAB 9.9 and HDL Coder 3.17
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: EnvelopeDetection
// Source Path: ModelToVerilog/ToVerilog/FI_Full1/Subsystem/EnvelopeDetection
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module EnvelopeDetection
          (clk,
           reset,
           Xr,
           Xi,
           Env);


  input   clk;
  input   reset;
  input   signed [12:0] Xr;  // sfix13_En2
  input   signed [64:0] Xi;  // sfix65_En53
  output  signed [11:0] Env;  // sfix12_En1


  wire signed [31:0] Sum1_add_cast;  // sfix32_En19
  wire signed [31:0] Sum1_add_cast_1;  // sfix32_En19
  wire signed [31:0] Sum1_add_temp;  // sfix32_En19
  wire signed [13:0] Sum1_out1;  // sfix14_En2
  wire [15:0] Constant_out1;  // ufix16_En17
  wire signed [16:0] Product_cast;  // sfix17_En17
  wire signed [30:0] Product_mul_temp;  // sfix31_En19
  wire signed [29:0] Product_cast_1;  // sfix30_En19
  wire signed [13:0] Product_out1;  // sfix14_En2
  wire [15:0] Constant1_out1;  // ufix16_En19
  wire signed [11:0] Sum_out1;  // sfix12_En1
  reg signed [11:0] Delay_out1;  // sfix12_En1
  wire signed [16:0] Product1_cast;  // sfix17_En19
  wire signed [28:0] Product1_mul_temp;  // sfix29_En20
  wire signed [27:0] Product1_cast_1;  // sfix28_En20
  wire signed [9:0] Product1_out1;  // sfix10_En2
  wire signed [31:0] Sum_add_cast;  // sfix32_En2
  wire signed [31:0] Sum_add_cast_1;  // sfix32_En2
  wire signed [31:0] Sum_add_temp;  // sfix32_En2


  assign Sum1_add_cast = {{2{Xr[12]}}, {Xr, 17'b00000000000000000}};
  assign Sum1_add_cast_1 = {Xi[64], Xi[64:34]};
  assign Sum1_add_temp = Sum1_add_cast + Sum1_add_cast_1;
  assign Sum1_out1 = Sum1_add_temp[30:17];



  assign Constant_out1 = 16'b1110011010000000;



  assign Product_cast = {1'b0, Constant_out1};
  assign Product_mul_temp = Sum1_out1 * Product_cast;
  assign Product_cast_1 = Product_mul_temp[29:0];
  assign Product_out1 = {Product_cast_1[29], Product_cast_1[29:17]};



  assign Constant1_out1 = 16'b1100110000000000;



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 12'sb000000000000;
      end
      else
        Delay_out1 <= Sum_out1;
    end



  assign Product1_cast = {1'b0, Constant1_out1};
  assign Product1_mul_temp = Delay_out1 * Product1_cast;
  assign Product1_cast_1 = Product1_mul_temp[27:0];
  assign Product1_out1 = Product1_cast_1[27:18];



  assign Sum_add_cast = {{18{Product_out1[13]}}, Product_out1};
  assign Sum_add_cast_1 = {{22{Product1_out1[9]}}, Product1_out1};
  assign Sum_add_temp = Sum_add_cast + Sum_add_cast_1;
  assign Sum_out1 = Sum_add_temp[12:1];



  assign Env = Sum_out1;

endmodule  // EnvelopeDetection
