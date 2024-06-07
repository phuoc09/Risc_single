`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2024 06:35:39 PM
// Design Name: 
// Module Name: single_cycle_datapath
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


module single_cycle_datapath(
clk,rst,ImmSel,RegWEn,BrUn,ASel,BSel,ALUSel,MemRW,WBSel,Branch,Jump,Inst
    );
input clk, rst;
input [2:0] ImmSel;
input RegWEn;
input BrUn;
input ASel,BSel;
input [4:0] ALUSel;
input MemRW;
input [1:0] WBSel;
input [2:0] Branch;
input Jump;

output [31:0] Inst;
wire PCSel;
wire [31:0] alu_out_w;   
wire [31:0] Inst_w; 
wire [31:0] pc_w,pc_plus4_w;

wire [31:0] WB_DataD_w;
wire [31:0] Wr_data_w;
wire [31:0] DataA_w, DataB_w;
wire [31:0] Imm_w;
IF_module fetch(
          .clk(clk),
          .rst(rst),
          .alu_out(alu_out_w),
          .PCSel(PCSel),
          .ID_Inst(Inst_w),
          .ID_pc(pc_w),
          .ID_pc_plus4(pc_plus4_w)
          );

ID_module decode
         (
          .clk(clk),
          .rst(rst),
          .ID_Inst(Inst_w),
          .WB_DataD(WB_DataD_w),
          .WB_RegWEn(RegWEn),
          .ImmSel(ImmSel),
          .EX_DataA(DataA_w),
          .EX_DataB(DataB_w),
          .EX_Imm(Imm_w)
          );
                    
EX_module execute
                 (
                 .DataA(DataA_w),
                 .DataB(DataB_w),
                 .Imm(Imm_w),
                 .pc(pc_w),
                 .BrUn(BrUn),
                 .Branch(Branch),
                 .Jump(Jump),
                 .ALUSel(ALUSel),
                 .ASel(ASel),
                 .BSel(BSel),
                 .alu_out(alu_out_w),
                 .Wr_data(Wr_data_w),
                 .PCSel(PCSel)
                 );                        
WB_module writeback(
            .clk(clk),
            .rst(rst),
            .MemRW(MemRW),
            .WBSel(WBSel),
            .alu_out(alu_out_w),
            .Wr_data(Wr_data_w),
            .pc_plus4(pc_plus4_w),
            .WB_Data(WB_DataD_w)
            ); 
            
assign Inst = Inst_w;   
endmodule
