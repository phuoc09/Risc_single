`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2024 12:40:19 PM
// Design Name: 
// Module Name: Branch_control
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


module Branch_control(BrLT,BrEq,Jump,Branch,PCSel);
input BrLT;
input BrEq;
input Jump;
input [2:0] Branch;
output PCSel;

assign PCSel = (
               (Jump == 1'b1)                      ||              // JALR or JAL
               ((Branch == 3'b000) && (BrEq == 1'b1))  ||                     // BEQ
               ((Branch == 3'b001) && (BrEq == 1'b0))  ||                     // BNE
               ((Branch == 3'b010) && (BrLT == 1'b1))  ||                     // BLT
               ((Branch == 3'b011) && (BrLT == 1'b0))  ||                     // BGE
               ((Branch == 3'b100) && (BrLT == 1'b1))  ||                     // BLTU
               ((Branch == 3'b101) && (BrLT == 1'b0))                        // BGEU
               ) ? 1'b1 : 1'b0;


endmodule
