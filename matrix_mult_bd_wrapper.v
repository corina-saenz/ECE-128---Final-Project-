//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Mon Dec  8 22:21:08 2025
//Host        : Lebron running 64-bit major release  (build 9200)
//Command     : generate_target matrix_mult_bd_wrapper.bd
//Design      : matrix_mult_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module matrix_mult_bd_wrapper
   (CLK,
    a0,
    a1,
    b0,
    b1,
    c);
  input CLK;
  input [3:0]a0;
  input [3:0]a1;
  input [3:0]b0;
  input [3:0]b1;
  output [7:0]c;

  wire CLK;
  wire [3:0]a0;
  wire [3:0]a1;
  wire [3:0]b0;
  wire [3:0]b1;
  wire [7:0]c;

  matrix_mult_bd matrix_mult_bd_i
       (.CLK(CLK),
        .a0(a0),
        .a1(a1),
        .b0(b0),
        .b1(b1),
        .c(c));
endmodule
