`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2025 12:32:02 AM
// Design Name: 
// Module Name: top_final_project
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


// Final Project: 2x2 matrix (one dot-product output) using Vivado IP + 7-seg

module top_final_project(
    input        clk,         // board clock
    input  [15:0] sw,         // 16 switches for inputs
    output [6:0] seg,         // segments a..g (Basys3: active LOW)
    output [3:0] an,          // 4 anodes (active LOW)
    output       dp           // decimal point (active LOW)
);

    // Map switches to matrix entries (4 bits each)
    // A = [a0 a1], B = [b0 b1], each from switches
    wire [3:0] a0 = sw[3:0];      // A(1,1)
    wire [3:0] a1 = sw[7:4];      // A(1,2)
    wire [3:0] b0 = sw[11:8];     // B(1,1)
    wire [3:0] b1 = sw[15:12];    // B(2,1)

    // Result from IP: c = a0*b0 + a1*b1
    wire [7:0] c;

    matrix_mult_bd_wrapper U_DOT (
        .CLK (clk),
        .a0  (a0),
        .a1  (a1),
        .b0  (b0),
        .b1  (b1),
        .c   (c)
    );

    wire [3:0] digit = c[3:0];

    // 7-segment decoder for a single decimal digit
    seven_seg_decoder U_DEC (
        .digit (digit),
        .seg   (seg)
    );

    // Use only right-most digit (AN0)
    assign an = 4'b1110;  

    // Turn decimal point off
    assign dp = 1'b1;

endmodule
