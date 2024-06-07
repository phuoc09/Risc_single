`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 06:25:08 PM
// Design Name: 
// Module Name: PC
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


module PC(clk,rst,pc,pc_plus4);
input clk,rst;
input [31:0] pc_plus4;

output reg [31:0] pc;

always@(posedge clk or negedge rst) begin

if(rst == 32'h00000000) begin
    pc <= 32'h00000000;
end else begin
    pc <= pc_plus4;
end
end
endmodule
