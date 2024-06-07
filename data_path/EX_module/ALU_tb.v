`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2024 05:18:52 PM
// Design Name: 
// Module Name: ALU_tb
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


`timescale 1ns / 1ps

module ALU_tb;

    // Inputs
    reg [31:0] in1;
    reg [31:0] in2;
    reg [4:0] ALUSel;

    // Outputs
    wire [31:0] out;

    // Instantiate the Unit Under Test (UUT)
    ALU uut (
        .in1(in1), 
        .in2(in2), 
        .ALUSel(ALUSel), 
        .out(out)
    );

    initial begin
        // Initialize Inputs
        in1 = 0;
        in2 = 0;
        ALUSel = 0;

        // Wait for global reset to finish
        #100;

        // Add stimulus here
        // Test ADDI
        in1 = 32'd10; in2 = 32'd5; ALUSel = 5'd0;
        #10;
        $display("ADDI: out = %d", out);
        if (out !== 32'd15) $display("Test failed for ADDI");

        // Test SLTI
        in1 = 32'd5; in2 = 32'd10; ALUSel = 5'd1;
        #10;
        $display("SLTI: out = %d", out);
        if (out !== 32'd1) $display("Test failed for SLTI");

        // Test SLTIU
        in1 = 32'd5; in2 = 32'd10; ALUSel = 5'd2;
        #10;
        $display("SLTIU: out = %d", out);
        if (out !== 32'd1) $display("Test failed for SLTIU");

        // Test XORI
        in1 = 32'd5; in2 = 32'd3; ALUSel = 5'd3;
        #10;
        $display("XORI: out = %d", out);
        if (out !== 32'd6) $display("Test failed for XORI");

        // Test ORI
        in1 = 32'd5; in2 = 32'd3; ALUSel = 5'd4;
        #10;
        $display("ORI: out = %d", out);
        if (out !== 32'd7) $display("Test failed for ORI");

        // Test ANDI
        in1 = 32'd5; in2 = 32'd3; ALUSel = 5'd5;
        #10;
        $display("ANDI: out = %d", out);
        if (out !== 32'd1) $display("Test failed for ANDI");

        // Test SLLI
        in1 = 32'd1; in2 = 32'd3; ALUSel = 5'd6;
        #10;
        $display("SLLI: out = %d", out);
        if (out !== 32'd8) $display("Test failed for SLLI");

        // Test SRLI
        in1 = 32'd16; in2 = 32'd2; ALUSel = 5'd7;
        #10;
        $display("SRLI: out = %d", out);
        if (out !== 32'd4) $display("Test failed for SRLI");

        // Test SRAI
        in1 = -32'd16; in2 = 32'd2; ALUSel = 5'd8;
        #10;
        $display("SRAI: out = %d", out);
        if (out !== -32'd4) $display("Test failed for SRAI");

        // Test ADD
        in1 = 32'd10; in2 = 32'd5; ALUSel = 5'd9;
        #10;
        $display("ADD: out = %d", out);
        if (out !== 32'd15) $display("Test failed for ADD");

        // Test SUB
        in1 = 32'd10; in2 = 32'd5; ALUSel = 5'd10;
        #10;
        $display("SUB: out = %d", out);
        if (out !== 32'd5) $display("Test failed for SUB");

        // Test SLL
        in1 = 32'd1; in2 = 32'd3; ALUSel = 5'd11;
        #10;
        $display("SLL: out = %d", out);
        if (out !== 32'd8) $display("Test failed for SLL");

        // Test SLT
        in1 = 32'd5; in2 = 32'd10; ALUSel = 5'd12;
        #10;
        $display("SLT: out = %d", out);
        if (out !== 32'd1) $display("Test failed for SLT");

        // Test SLTU
        in1 = 32'd5; in2 = 32'd10; ALUSel = 5'd13;
        #10;
        $display("SLTU: out = %d", out);
        if (out !== 32'd1) $display("Test failed for SLTU");

        // Test XOR
        in1 = 32'd5; in2 = 32'd3; ALUSel = 5'd14;
        #10;
        $display("XOR: out = %d", out);
        if (out !== 32'd6) $display("Test failed for XOR");

        // Test SRL
        in1 = 32'd16; in2 = 32'd2; ALUSel = 5'd15;
        #10;
        $display("SRL: out = %d", out);
        if (out !== 32'd4) $display("Test failed for SRL");

        // Test SRA
        in1 = -32'd16; in2 = 32'd2; ALUSel = 5'd16;
        #10;
        $display("SRA: out = %d", out);
        if (out !== -32'd4) $display("Test failed for SRA");

        // Test OR
        in1 = 32'd5; in2 = 32'd3; ALUSel = 5'd17;
        #10;
        $display("OR: out = %d", out);
        if (out !== 32'd7) $display("Test failed for OR");

        // Test AND
        in1 = 32'd5; in2 = 32'd3; ALUSel = 5'd18;
        #10;
        $display("AND: out = %d", out);
        if (out !== 32'd1) $display("Test failed for OR");
        
        $finish;
        end
        
        endmodule

