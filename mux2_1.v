`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 07:42:39 PM
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(in0,in1,control,out);
input [31:0] in0,in1;
input control;
output reg [31:0] out;

always@(control or in1 or in0 ) begin
    case(control)
    1'b0: out = in0;
    1'b1: out = in1;
    default: out = 32'hzzzzzzzz;
    endcase
end
endmodule
