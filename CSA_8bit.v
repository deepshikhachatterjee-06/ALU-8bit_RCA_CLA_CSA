`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2025 22:19:59
// Design Name: 
// Module Name: CSA_8bit
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


module CSA_8bit(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] Sum,
    output Cout
    );
    
     wire [3:0] sum_low;
     wire c_low;
       
     wire [3:0] sum_high0, sum_high1;
     wire c_high0, c_high1;
   
     assign {c_low, sum_low} = A[3:0] + B[3:0] + Cin;
   
     assign {c_high0, sum_high0} = A[7:4] + B[7:4] + 1'b0;
   
     assign {c_high1, sum_high1} = A[7:4] + B[7:4] + 1'b1;
   
     assign Sum[3:0] = sum_low;
     assign Sum[7:4] = c_low ? sum_high1 : sum_high0;
     assign Cout = c_low ? c_high1 : c_high0;

endmodule
