`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2024 07:08:11 PM
// Design Name: 
// Module Name: EX_module
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


module EX_module(DataA,DataB,Imm,pc,BrUn,Branch,Jump,ALUSel,ASel,BSel,
                 alu_out,Wr_data,PCSel);
                 
    input [31:0] DataA,DataB;
    input [31:0] Imm,pc;
    input BrUn;
    input [2:0] Branch;
    input Jump;
    input [4:0] ALUSel;
    input ASel,BSel;
    
    output [31:0] alu_out;
    output [31:0] Wr_data;
    output PCSel;
    
    wire BrLT_w,BrEq_w;
    wire [31:0] muxA_out,muxB_out;
    branch_comp br_cmp(.BrUn(BrUn),.DataA(DataA),.DataB(DataB),
                        .BrLT(BrLT_w),.BrEq(BrEq_w));
       
    Branch_control branch_ctrl(.BrLT(BrLT_w),.BrEq(BrEq_w),.Jump(Jump),.Branch(Branch),.PCSel(PCSel));              
                   
    ALU alu(.in1(muxA_out),.in2(muxB_out),.ALUSel(ALUSel),.out(alu_out));
    
    mux2_1 muxA(.in0(DataA),.in1(pc),.control(ASel),.out(muxA_out));
    mux2_1 muxB(.in0(DataB),.in1(Imm),.control(BSel),.out(muxB_out));
    
    assign Wr_data = DataB;
endmodule
