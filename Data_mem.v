`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 06:39:33 PM
// Design Name: 
// Module Name: Data_mem
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


module Data_mem(clk,rst,addr,WD,RD,MemRW);
input clk,rst;
input [31:0] addr;
input [31:0] WD;
input MemRW;    // = 1 ==> Write to dmem
output [31:0] RD;

// Data memory 
reg [31:0] d_mem [1023:0];
initial begin
    $readmemh("dmem.mem",d_mem);
end
assign RD = (rst == 1'b0) ? 32'h00000000 : d_mem[addr];
always@(posedge clk ) begin
    if(MemRW) begin
        d_mem[addr] <= WD;
    end 
end
endmodule
