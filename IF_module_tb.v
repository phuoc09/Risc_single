`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2024 06:41:19 PM
// Design Name: 
// Module Name: IF_module_tb
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


module IF_module_tb;
reg clk = 1;
reg rst;
wire [31:0]ID_Inst;
wire [31:0]ID_pc;
wire [31:0]ID_pc_plus4;
wire [31:0]alu_out = 32'h00000000;
wire PCSel = 1'b0;

IF_module fetch(
                .clk(clk),
                .rst(rst),
                .ID_Inst(ID_Inst),
                .ID_pc(ID_pc),
                .ID_pc_plus4(ID_pc_plus4),
                .alu_out(alu_out),
                .PCSel(PCSel)
                );

always begin
        clk = ~clk;
        #50;
    end
    initial begin
        rst <= 1'b0;
        #100;
        rst <= 1'b1;
        #1000;
        $finish;
    end
endmodule
