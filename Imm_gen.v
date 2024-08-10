`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 06:55:01 PM
// Design Name: 
// Module Name: Imm_gen
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


module Imm_gen(Inst,ImmSel,Imm);
input [31:0] Inst;
input [2:0] ImmSel;
// I_type:  000
// S_type:  001
// B_type:  010
// U_type:  011
// J_type:  100
output [31:0] Imm;
reg [31:0] Imm_temp;
always @(ImmSel or Inst) begin

case(ImmSel)
 3'b000: Imm_temp = {{20{Inst[31]}},Inst[31:20]};                                  // I_type
 3'b001: Imm_temp = {{20{Inst[31]}},Inst[31:25],Inst[11:7]};                       // S_type
 3'b010: Imm_temp = {{10{Inst[31]}},Inst[7],Inst[30:25],Inst[11:8],{1{1'b0}} };    // B_type
 3'b011: Imm_temp = {Inst[31:12],{12{1'b0}}};                                      // U_type
 3'b100: Imm_temp = {{12{Inst[31]}},Inst[19:12],Inst[20],Inst[30:21],{1{1'b0}}};   // J_type
 default: Imm_temp = 32'h00000000;
endcase            
end
assign Imm = Imm_temp;          
endmodule
