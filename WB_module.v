`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2024 11:03:57 PM
// Design Name: 
// Module Name: WB_module
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


module WB_module(clk,rst,MemRW,WBSel,
                alu_out,Wr_data,pc_plus4,
                WB_Data);
input clk,rst;
input MemRW;
input [1:0] WBSel;
input [31:0] Wr_data;
input [31:0] pc_plus4;
input [31:0] alu_out;

output [31:0] WB_Data;

wire [31:0] RD_w;
Data_mem D_mem(.clk(clk),.rst(rst),.addr(alu_out),.WD(Wr_data),.RD(RD_w),.MemRW(MemRW));
mux3_1 WB_mux(.in0(RD_w),.in1(alu_out),.in2(pc_plus4),.control(WBSel),.out(WB_Data));

endmodule
