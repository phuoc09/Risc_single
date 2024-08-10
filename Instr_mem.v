`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 06:19:57 PM
// Design Name: 
// Module Name: Instr_mem
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


module Instr_mem(addr,rst,read_data);

input [31:0] addr;
input rst;
output [31:0]read_data;

// Instruction memory
reg [31:0] IMem [1023:0];

assign read_data = (rst == 1'b0) ? 32'h00000000 : IMem[addr[31:2]];
initial begin
    // $readmemh("IMEM.mem",IMem);
   // $readmemh("Load_store_IMEM.mem",IMem);
   $readmemh("Jump_Branch_IMEM.mem",IMem);
end

endmodule
