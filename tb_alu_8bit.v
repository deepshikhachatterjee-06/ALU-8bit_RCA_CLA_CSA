`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2025 01:00:09
// Design Name: 
// Module Name: tb_alu_8bit
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


module tb_alu_8bit;
 reg  [7:0] A;
   reg  [7:0] B;
   reg  [2:0] op;
   wire [7:0] Y;
   wire       Cout;

   // DUT(Device under test)
   alu_8bit DUT (
       .A(A),
       .B(B),
       .op(op),
       .Y(Y),
       .Cout(Cout)
   );

   initial begin
       $monitor("Time=%0t | op=%b | A=%h | B=%h | Y=%h | Cout=%b",
                $time, op, A, B, Y, Cout);

       //RCA
       A = 8'h3C; B = 8'h27; op = 3'b000; #10;
       //CLA
       A = 8'h5E; B = 8'h3A; op = 3'b001; #10;
       //CSA
       A = 8'hB5; B = 8'h6E; op = 3'b010; #10;
       //SUB
       A = 8'h50; B = 8'h20; op = 3'b011; #10;
       //INC A
       A = 8'hFF; B = 8'h00; op = 3'b100; #10;
       //DEC A
       A = 8'h00; B = 8'h00; op = 3'b101; #10;
       //COMPARE
       A = 8'h40; B = 8'h20; op = 3'b110; #10;
       //PASS A
       A = 8'hAA; B = 8'h00; op = 3'b111; #10;
       $finish;
   end
endmodule
