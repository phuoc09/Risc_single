`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2024 03:17:10 PM
// Design Name: 
// Module Name: branch_comp_tb
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


module branch_comp_tb;
    reg BrUn;
    reg [31:0] DataA;
    reg [31:0] DataB;
    wire BrLT;
    wire BrEq;
    branch_comp BC (.BrUn(BrUn),.BrLT(BrLT),.BrEq(BrEq),
                .DataA(DataA),.DataB(DataB)); 
                   
initial begin
        // Initialize values
        BrUn = 0; DataA = 32'd0; DataB = 32'd0;
        #10;  // Wait for 10 time units

        // Test case 1: BrUn = 0, DataA = 0, DataB = 0
        BrUn = 0; DataA = 32'd0; DataB = 32'd0;
        #10;
        $display("BrUn=%b, DataA=%d, DataB=%d, BrLT=%b, BrEq=%b", BrUn, DataA, DataB, BrLT, BrEq);

        // Test case 2: BrUn = 1, DataA = 5, DataB = 10
        BrUn = 1; DataA = 32'd5; DataB = 32'd10;
        #10;
        $display("BrUn=%b, DataA=%d, DataB=%d, BrLT=%b, BrEq=%b", BrUn, DataA, DataB, BrLT, BrEq);

        // Test case 3: BrUn = 1, DataA = 10, DataB = 5
        BrUn = 1; DataA = 32'd10; DataB = 32'd5;
        #10;
        $display("BrUn=%b, DataA=%d, DataB=%d, BrLT=%b, BrEq=%b", BrUn, DataA, DataB, BrLT, BrEq);

        // Test case 4: BrUn = 0, DataA = -5 (in 2's complement), DataB = -10 (in 2's complement)
        BrUn = 0; DataA = 32'hFFFFFFFB; DataB = 32'hFFFFFFF6;
        #10;
        $display("BrUn=%b, DataA=%h, DataB=%h, BrLT=%b, BrEq=%b", BrUn, DataA, DataB, BrLT, BrEq);

        // Test case 5: BrUn = 0, DataA = -10 (in 2's complement), DataB = -5 (in 2's complement)
        BrUn = 0; DataA = 32'hFFFFFFF6; DataB = 32'hFFFFFFFB;
        #10;
        $display("BrUn=%b, DataA=%h, DataB=%h, BrLT=%b, BrEq=%b", BrUn, DataA, DataB, BrLT, BrEq);

        // Test case 6: BrUn = 0, DataA = 0, DataB = 1
        BrUn = 0; DataA = 32'd0; DataB = 32'd1;
        #10;
        $display("BrUn=%b, DataA=%d, DataB=%d, BrLT=%b, BrEq=%b", BrUn, DataA, DataB, BrLT, BrEq);

        // Test case 7: BrUn = 1, DataA = 32'hFFFFFFFF, DataB = 32'h00000000
        BrUn = 1; DataA = 32'hFFFFFFFF; DataB = 32'h00000000;
        #10;
        $display("BrUn=%b, DataA=%h, DataB=%h, BrLT=%b, BrEq=%b", BrUn, DataA, DataB, BrLT, BrEq);

        // Test case 8: BrUn = 1, DataA = 32'h00000000, DataB = 32'hFFFFFFFF
        BrUn = 1; DataA = 32'h00000000; DataB = 32'hFFFFFFFF;
        #10;
        $display("BrUn=%b, DataA=%h, DataB=%h, BrLT=%b, BrEq=%b", BrUn, DataA, DataB, BrLT, BrEq);

        $finish;
    end
 
endmodule
