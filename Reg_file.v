`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 06:29:12 PM
// Design Name: 
// Module Name: Reg_file
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


module Reg_file(clk,rst,AddrA,AddrB,AddrD,RegWEn,DataD,DataA,DataB);

input clk,rst;
input [4:0] AddrA,AddrB,AddrD;
input RegWEn;
input [31:0] DataD;

output [31:0] DataA,DataB;

// Register file 
reg [31:0] reg_file [31:0];
initial begin
    $readmemh("regfile.mem",reg_file);
end
// Read function

assign DataA = (rst == 1'b0) ? 32'h00000000 : reg_file[AddrA];
assign DataB = (rst == 1'b0) ? 32'h00000000 : reg_file[AddrB];

always@(posedge clk ) begin
    if(RegWEn) begin
        reg_file [AddrD] <= DataD; 
    end
end

endmodule
