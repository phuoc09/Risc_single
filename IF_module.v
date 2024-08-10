`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2024 06:37:06 PM
// Design Name: 
// Module Name: IF_module
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


module IF_module(clk,rst,ID_Inst,ID_pc,ID_pc_plus4,alu_out,PCSel);
input clk, rst;
input [31:0] alu_out;
input PCSel;
output  [31:0] ID_pc, ID_pc_plus4;
output  [31:0] ID_Inst;

// wires
wire [31:0] pc_w;
wire [31:0] pc_plus4_w;
wire [31:0] inst_w;
wire [31:0] pc_mux_out;
// Pipe register 
//reg [31:0] Inst_reg;
//reg [31:0] pc_reg, pc_plus4_reg;

// Instance
PC p_c(.clk(clk),.rst(rst),.pc(pc_w),.pc_plus4(pc_mux_out));

pc_adder PC_adder(.pc(pc_w),.a(32'd4),.pc_plus4(pc_plus4_w));

Instr_mem I_mem(.addr(pc_w),.rst(rst),.read_data(inst_w));

mux2_1 pc_mux(.in0(pc_plus4_w),.in1(alu_out),.control(PCSel),.out(pc_mux_out));

assign ID_pc = pc_w;
assign ID_pc_plus4 = pc_plus4_w;
assign  ID_Inst = inst_w;
endmodule
