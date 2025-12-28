`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2025 21:55:48
// Design Name: 
// Module Name: CLA_8bit
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


module CLA_8bit(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] Sum,
    output Cout
    );
    wire [7:0] P;   // Propagate
    wire [7:0] G;   // Generate
    wire [8:0] C;   // Carry
    
    assign G = A & B;
    assign P = A ^ B;
    assign C[0] = Cin;
   
   genvar i;
   generate
       for (i=0; i<8; i=i+1)
        assign C[i+1] = G[i] | (P[i] & C[i]);
   endgenerate
   
   assign Sum  = P ^ C[7:0];
   assign Cout = C[8];
    
endmodule
