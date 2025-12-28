`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2025 00:38:06
// Design Name: 
// Module Name: alu_csa_top
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


module alu_csa_top(
    input  [7:0] A,
    input  [7:0] B,
    input        Cin,
    output [7:0] Sum,
    output       Cout
    );
    
    wire [7:0] sum_csa;
    wire c_csa;
    
        CSA_8bit CSA_ADDER (
            .A(A),
            .B(B),
            .Cin(1'b0),
            .Sum(sum_csa),
            .Cout(c_csa)
        );
    
        alu_8bit ALU (
            .A(A),
            .B(B),
            .op(op),
            .Y(Y),
            .Cout(Cout)
        );
endmodule
