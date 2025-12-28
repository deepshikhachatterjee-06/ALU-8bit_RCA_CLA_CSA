`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2025 23:07:58
// Design Name: 
// Module Name: alu_8bit
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


module alu_8bit(
    input [7:0] A,
    input [7:0] B,
    input [2:0] op,
    output reg [7:0] Y,
    output reg Cout
    );
    
    wire [7:0] sum_rca, sum_cla, sum_csa;
    wire c_rca, c_cla, c_csa;

    RCA_8bit RCA (A, B, 1'b0, sum_rca, c_rca);
    CLA_8bit CLA (A, B, 1'b0, sum_cla, c_cla);
    CSA_8bit CSA (A, B, 1'b0, sum_csa, c_csa);

    always @(*) begin
        Cout = 1'b0;
        case (op)

            3'b000: begin                // RCA
                Y    = sum_rca;
                Cout = c_rca;
            end

            3'b001: begin                // CLA
                Y    = sum_cla;
                Cout = c_cla;
            end

            3'b010: begin                // CSA
                Y    = sum_csa;
                Cout = c_csa;
            end

            3'b011: begin                // SUB
                {Cout, Y} = A - B;
            end

            3'b100: begin                // INC A
                {Cout, Y} = A + 1'b1;
            end

            3'b101: begin                // DEC A
                {Cout, Y} = A - 1'b1;
            end

            3'b110: begin                // COMPARE
                Y    = (A > B) ? 8'd1 : 8'd0;
                Cout = 1'b0;
            end

            3'b111: begin                // PASS A
                Y = A;
            end

            default: Y = 8'b0;

        endcase
    end
endmodule
