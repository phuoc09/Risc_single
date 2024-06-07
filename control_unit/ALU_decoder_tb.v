`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2024 04:26:19 PM
// Design Name: 
// Module Name: ALU_decoder_tb
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


module ALU_decoder_tb;

reg [31:0] Inst;
wire [4:0] ALUSel;
ALU_decoder alu_decode(.Inst(Inst),.ALUSel(ALUSel));

initial 
begin
// ADDI x1, x2, 10
        Inst = 32'h00a10093; 
#10;
$display("ADDI: ALUSel = %d", ALUSel);
if (ALUSel != 5'd0) $display("Test failed for ADDI");
#100;


        Inst = 32'h00a12093; // SLTI x1, x2, 10
#10;
if (ALUSel !== 5'd1) $display("Test failed for SLTI");
else $display("SLTI: ALUSel = %d", ALUSel);
#100;

        Inst = 32'h00a13093; // SLTIU x1, x2, 10
#10;
if (ALUSel !== 5'd2) $display("Test failed for SLTIU");
else $display("SLTIU: ALUSel = %d", ALUSel);
#100;  
     
        Inst = 32'h0ff14093; // XORI x1, x2, 0xFF
#10;
if (ALUSel !== 5'd3) $display("Test failed for XORI");
else $display("XORI: ALUSel = %d", ALUSel);
#100;

        Inst = 32'h0ff16093; // ORI x1, x2, 0xFF
#10;
if (ALUSel !== 5'd4) $display("Test failed for ORI");
else $display("ORI: ALUSel = %d", ALUSel);
#100;
        
        Inst = 32'h0ff17093; // ANDI x1, x2, 0xFF
#10;
if (ALUSel !== 5'd5) $display("Test failed for ANDI");
else $display("ANDI: ALUSel = %d", ALUSel);
#100;
        
        Inst = 32'h00511093; // SLLI x1, x2, 5
#10;
if (ALUSel !== 5'd6) $display("Test failed for SLLI");
else $display("SLLI: ALUSel = %d", ALUSel);
#100;
        Inst = 32'h00515093; // SRLI x1, x2, 5
#10;
if (ALUSel !== 5'd7) $display("Test failed for SRLI");
else $display("SRLI: ALUSel = %d", ALUSel);
#100;

        Inst = 32'h40515093; // SRAI x1, x2, 5
#10;
if (ALUSel !== 5'd8) $display("Test failed for SRAI");
else $display("SRAI: ALUSel = %d", ALUSel);
#100;
        
//        Inst = 32'h003100b3; // ADD x1, x2, x3
//#10;
//$display("ADD: ALUSel = %d", ALUSel);
//        if (ALUSel !== 5'd9) $display("Test failed for ADD");
//         #10;
//        Inst = 32'h403100b3; // SUB x1, x2, x3       
//#10;
//$display("SUB: ALUSel = %d", ALUSel);
//        if (ALUSel !== 5'd10) $display("Test failed for SUB");
//         #10;
//        Inst = 32'h003110b3; // SLL x1, x2, x3        
//#10;
//$display("SLL: ALUSel = %d", ALUSel);
//        if (ALUSel !== 5'd11) $display("Test failed for SLL");
//         #10;
//        Inst = 32'h003120b3; // SLT x1, x2, x3        
//#10;
//$display("SLT: ALUSel = %d", ALUSel);
//        if (ALUSel !== 5'd12) $display("Test failed for SLT");
//         #10;

//        Inst = 32'h003130b3; // SLTU x1, x2, x3       
//#10;
//$display("SLTU: ALUSel = %d", ALUSel);
//        if (ALUSel !== 5'd13) $display("Test failed for SLTU");
//         #10;

//        Inst = 32'h003140b3; // XOR x1, x2, x3        
//#10;
// $display("XOR: ALUSel = %d", ALUSel);
//        if (ALUSel !== 5'd14) $display("Test failed for XOR");
//         #10;
         
//        Inst = 32'h003150b3; // SRL x1, x2, x3        
//#10;
//$display("SRL: ALUSel = %d", ALUSel);
//        if (ALUSel !== 5'd15) $display("Test failed for SRL");
//         #10;

//        Inst = 32'h403150b3; // SRA x1, x2, x3        
//#10;
//$display("SRA: ALUSel = %d", ALUSel);
//        if (ALUSel !== 5'd16) $display("Test failed for SRA");
//         #10;
//        Inst = 32'h003160b3; // OR x1, x2, x3        
//#10;
//$display("OR: ALUSel = %d", ALUSel);
//        if (ALUSel !== 5'd17) $display("Test failed for OR");
//         #10;
//        Inst = 32'h003170b3; // AND x1, x2, x3        
//#10;
// $display("AND: ALUSel = %d", ALUSel);
//        if (ALUSel !== 5'd18) $display("Test failed for AND"); 
//         #10;
$finish;

end
endmodule
