`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2025 01:47:48 AM
// Design Name: 
// Module Name: matrix_mult_bd_wrapper_tb
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


module matrix_mult_bd_wrapper_tb;

    reg        CLK;
    reg  [3:0] a0, a1, b0, b1;
    wire [7:0] c;

    matrix_mult_bd_wrapper dut (
        .CLK (CLK),
        .a0  (a0),
        .a1  (a1),
        .b0  (b0),
        .b1  (b1),
        .c   (c)
    );

    // Clock generator = 100 MHz (10 ns period)
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        // Initialize
        a0 = 0; a1 = 0;
        b0 = 0; b1 = 0;

        // Wait for clock to stabilize
        #20;

        // ---- TEST 1 ----
        // 0*0 + 0*0 = 0
        a0 = 4'd0;  a1 = 4'd0;
        b0 = 4'd0;  b1 = 4'd0;
        #50;

        // ---- TEST 2 ----
        // 1*1 + 0*0 = 1
        a0 = 4'd1;  a1 = 4'd0;
        b0 = 4'd1;  b1 = 4'd0;
        #50;

        // ---- TEST 3 ----
        // 1*1 + 1*1 = 2
        a0 = 4'd1;  a1 = 4'd1;
        b0 = 4'd1;  b1 = 4'd1;
        #50;

        // ---- TEST 4 ----
        // 2*2 + 1*1 = 5
        a0 = 4'd2;  a1 = 4'd1;
        b0 = 4'd2;  b1 = 4'd1;
        #50;

        // ---- TEST 5 ----
        // 3*1 + 2*2 = 7
        a0 = 4'd3;  a1 = 4'd2;
        b0 = 4'd1;  b1 = 4'd2;
        #50;

        // End simulation
        #50;
        $finish;
    end

endmodule
