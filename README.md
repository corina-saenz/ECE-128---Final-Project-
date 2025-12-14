# ECE-128-Final-Project-2×2 Matrix Multiplier Using Vivado IP 

## Overview
This project implements a 2×2 matrix multiplier (single dot-product) using Xilinx Vivado IP cores on a Basys-3 FPGA (XC7A35T). The design computes one element of a matrix multiplication using hardware-optimized multiplier and adder IP blocks, displays the result on a seven-segment display, and verifies correctness through both simulation and hardware testing.

The project was completed as part of an FPGA laboratory course and emphasizes IP-based design methodology, hardware verification, and efficient resource usage.

## Mathematical Operation
Due to hardware and display constraints, the project computes one dot-product of a 2×2 matrix multiplication: 𝑐 = 𝑎0 × 𝑏0 + 𝑎1 × 𝑏1. ​

The final result is constrained to values 0–9 and is displayed on the FPGA’s seven-segment display.

## Tools and Platform
- FPGA Board: Basys-3 (Artix-7 XC7A35T)
- Software: Xilinx Vivado Design Suite
- Design Method: Vivado IP Integrator
- Language: Verilog HDL

## Design Architecture

The datapath is implemented using Vivado IP cores:
- Two mult_gen IP cores
  - Compute 𝑎0 × 𝑏0 and 𝑎1 × 𝑏1​
- One c_addsub IP core
  - Adds the two multiplication results
- Seven-segment decoder
  - Converts binary output to display format

The design behaves as a combinational arithmetic datapath, with internal pipelining handled by the IP cores.

## Input Mapping (Basys-3 Switches)
- Signal	      Switches
- a0	          sw[3:0]
- a1	          sw[7:4]
- b0	          sw[11:8]
- b1	          sw[15:12]

The output c is shown on the rightmost seven-segment digit.

## Hardware Output
- Displays values 0–9 on the seven-segment display
- Only the rightmost digit is enabled
- Decimal point is disabled
- Output matches simulation results exactly

## Simulation and Verification

A behavioral testbench was written to verify the arithmetic logic independently of the FPGA hardware.

### Testbench Features
- Generates a clock signal
- Applies multiple known test vectors
- Observes IP pipeline behavior
- Verification performed via waveform inspection (no $display statements)

## Resource Utilization
The final design uses minimal FPGA resources, including:
- Low LUT and register count
- No block RAM usage
- Low overall power consumption
- This demonstrates the efficiency of IP-based arithmetic designs on FPGA platforms.

## Applications
This type of IP-based matrix computation is applicable to:
- Digital signal processing (DSP)
- Robotics and control systems
- Embedded acceleration
- Machine learning and numerical computation

## Conclusion

This project successfully demonstrates:
- Integration of Vivado IP cores for arithmetic operations
- FPGA-based matrix computation
- Hardware verification using seven-segment displays
- Simulation-driven design validation

The design meets all project requirements and serves as a solid foundation for more advanced FPGA-based numerical systems.

### Author
Corina Saenz
ECE 128 – FPGA Laboratory
