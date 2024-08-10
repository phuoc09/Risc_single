`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2024 11:13:02 PM
// Design Name: 
// Module Name: WB_module_tb
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


module WB_module_tb;
reg clk = 1;
reg rst;
reg MemRW = 32'h00000000;
reg [1:0] WBSel;
reg [31:0] pc_plus4 = 32'h00000008;
reg [31:0] Wr_data;
reg [31:0] alu_out = 32'h00000004;

wire [31:0] WB_Data;

WB_module wb(.clk(clk),.rst(rst),
            .MemRW(MemRW),.WBSel(WBSel),
                .alu_out(alu_out),.Wr_data(Wr_data),.pc_plus4(pc_plus4),
                .WB_Data(WB_Data)
                );
always begin
        clk = ~clk;
        #50;
    end   
initial begin
        rst <= 1'b0;
        #100;
        rst <= 1'b1;
        #100;
        WBSel <= 2'b00;
        #100;
        $display("WB_Data = %h",WB_Data);
        #200;
        WBSel <= 2'b01;
        #100;
        $display("WB_Data = %h",WB_Data);
        #200;
        WBSel <= 2'b10;
        #100;
        $display("WB_Data = %h",WB_Data);
        #1000;
        $finish;
end                
endmodule
