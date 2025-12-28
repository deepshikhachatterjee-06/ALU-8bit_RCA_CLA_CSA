`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2025 23:19:22
// Design Name: 
// Module Name: alu_rca_top
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


module alu_rca_top(
    input [7:0] A,
    input [7:0] B,
    input [2:0] op,
    output [7:0] Y,
    output Cout
    );
    
    wire [7:0] sum_rca;
    wire c_rca;
    
     RCA_8bit RCA_ADDER (
           .A(A),
           .B(B),
           .Cin(1'b0),     
           .Sum(sum_rca),
           .Cout(c_rca)
       );
   
       alu_8bit ALU (
           .A(A),
           .B(B),
           .op(op),
           .Y(Y),
           .Cout(Cout)
       );
    

endmodule
