`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2025 21:50:35
// Design Name: 
// Module Name: RCA_8bit
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


module RCA_8bit(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    input [7:0] Sum,
    input Cout
    );
    
   wire [7:0] c; 
    
    full_adder fa0 (A[0], B[0], Cin,   Sum[0], c[0]);
    full_adder fa1 (A[1], B[1], c[0],  Sum[1], c[1]);
    full_adder fa2 (A[2], B[2], c[1],  Sum[2], c[2]);
    full_adder fa3 (A[3], B[3], c[2],  Sum[3], c[3]);
    full_adder fa4 (A[4], B[4], c[3],  Sum[4], c[4]);
    full_adder fa5 (A[5], B[5], c[4],  Sum[5], c[5]);
    full_adder fa6 (A[6], B[6], c[5],  Sum[6], c[6]);
    full_adder fa7 (A[7], B[7], c[6],  Sum[7], Cout);
   
endmodule
