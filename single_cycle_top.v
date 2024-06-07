`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2024 03:48:59 PM
// Design Name: 
// Module Name: single_cycle_top
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


module single_cycle_top(clk,rst);
input clk,rst;
//
wire [31:0] Inst;
//input  BrLT, BrEq;

wire [2:0] ImmSel;
wire RegWEn;          // 1 = write enable
wire BSel;            // 0 = reg, 1= Imm
wire  MemRW;          // 1 = write , 0 = read
wire [1:0] WBSel;           // 0 = mem , 1 = alu, 2 = pc+4
wire BrUn;            // 1 = unsigned, 0 = singed
//output PCSel;           // 1 = alu, 0 = pc+4
wire ASel;            // 0 = DataA, 1 = pc
wire [4:0] ALUSel;
wire [2:0] Branch;  
                        // 000 = BEQ
                        // 001 = BNE
                        // 010 = BLT
                        // 011 = BGE
                        // 100 = BLTU
                        // 101 = BGEU
wire Jump; 

//
single_cycle_datapath datapath(
                        .clk(clk),
                        .rst(rst),
                        .ImmSel(ImmSel),
                        .RegWEn(RegWEn),
                        .BrUn(BrUn),
                        .ASel(ASel),
                        .BSel(BSel),
                        .ALUSel(ALUSel),
                        .MemRW(MemRW),
                        .WBSel(WBSel),
                        .Branch(Branch),
                        .Jump(Jump),
                        .Inst(Inst)
                     );   
 control_unit control(
            .Inst(Inst),
            .ImmSel(ImmSel),
            .RegWEn(RegWEn),
            .BSel(BSel),
            .MemRW(MemRW),
            .WBSel(WBSel),
            .BrUn(BrUn),
            .Branch(Branch),
            .Jump(Jump),
            .ASel(ASel),
            .ALUSel(ALUSel)
            );                                     

endmodule
