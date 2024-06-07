`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2024 06:18:22 PM
// Design Name: 
// Module Name: mux3_1
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


module mux3_1(in0,in1,in2,control,out);
    input [31:0] in0,in1,in2;
    input [1:0] control;
    output [31:0] out;
    reg [31:0] out_tmp;
    always@(control or in1  or in0 or in2) begin
        case(control)
            2'b00: out_tmp = in0;
            2'b01: out_tmp = in1;
            2'b10: out_tmp = in2;
            default: out_tmp = 32'hzzzzzzzz;
        endcase
    end
    assign out = out_tmp;
endmodule
