`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2024 06:06:17 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(Inst,
                    ImmSel,RegWEn,BSel,MemRW,WBSel,BrUn,Branch,Jump,ASel,ALUSel);

input [31:0] Inst;
//input  BrLT, BrEq;

output [2:0] ImmSel;
output RegWEn;          // 1 = write enable
output BSel;            // 0 = reg, 1= Imm
output  MemRW;          // 1 = write , 0 = read
output [1:0] WBSel;           // 0 = mem , 1 = alu, 2 = pc+4
output BrUn;            // 1 = unsigned, 0 = singed
//output PCSel;           // 1 = alu, 0 = pc+4
output ASel;            // 0 = DataA, 1 = pc
output [4:0] ALUSel;
output [2:0] Branch;  
                        // 000 = BEQ
                        // 001 = BNE
                        // 010 = BLT
                        // 011 = BGE
                        // 100 = BLTU
                        // 101 = BGEU
output Jump; 

control_logic logic_control(.Inst(Inst),.ImmSel(ImmSel),.RegWEn(RegWEn),.BSel(BSel),
                            .MemRW(MemRW),.WBSel(WBSel),.BrUn(BrUn),
                            .ASel(ASel),.Branch(Branch),.Jump(Jump));
                            
ALU_decoder alu_decode(.Inst(Inst),.ALUSel_out(ALUSel));
endmodule
