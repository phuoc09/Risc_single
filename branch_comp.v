`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2024 02:52:06 PM
// Design Name: 
// Module Name: branch_comp
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


module branch_comp(DataA,DataB,BrUn,BrLT,BrEq);
input BrUn;
input [31:0] DataA,DataB;
output BrLT;
output BrEq;

//wire [31:0] u_DataA,u_DataB;
//assign u_DataA = (~(DataA)) + 32'd1;
//assign u_DataB = (~(DataB)) + 32'd1;

assign BrEq = (DataA == DataB) ? 1'b1 : 1'b0;
assign BrLT = (((BrUn == 1) && (DataA < DataB)) || ((BrUn == 0) && ($signed(DataA) < $signed(DataB)))) ? 1'b1 : 1'b0;



endmodule
