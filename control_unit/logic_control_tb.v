`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2024 03:19:43 PM
// Design Name: 
// Module Name: logic_control_tb
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


module logic_control_tb;

wire [2:0] ImmSel;                                              
wire RegWEn;          // 1 = write enable                       
wire BSel;            // 0 = reg, 1= Imm                        
wire  MemRW;          // 1 = write , 0 = read                   
wire [1:0] WBSel;           // 0 = mem , 1 = alu, 2 = pc+4      
wire BrUn;            // 1 = unsigned, 0 = singed               
wire PCSel;           // 1 = alu, 0 = pc+4                      
wire ASel;            // 0 = DataA, 1 = pc                      
                                                                
reg [31:0] Inst;                                                
reg BrLT,BrEq;
control_logic logic_control(.Inst(Inst),.ImmSel(ImmSel),.RegWEn(RegWEn),.BSel(BSel),
                            .MemRW(MemRW),.WBSel(WBSel),.BrUn(BrUn),
                            .ASel(ASel),.Branch());
                            

initial begin
        Inst = 32'h123450b7; // LUI x1, 0x12345
        #10
        $display("LUI: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h00010097; // AUIPC x1, 0x10
#10;
$display("AUIPC: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h064000ef; // JAL x1, 100
#10;
$display("JAL: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h000000e7; // JALR x1, x2
#10;
$display("JALR: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h00012083; // LW x1, 0(x2)
#10;
$display("LW: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h00112023; // SW x1, 0(x2)
#10;
$display("SW: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h00a10093; // ADDI x1, x2, 10
#10;
$display("ADDI: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h00a12093; // SLTI x1, x2, 10
#10;
$display("SLTI: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h00a13093; // SLTIU x1, x2, 10
#10;
$display("SLTIU: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h0ff14093; // XORI x1, x2, 0xFF
#10;
$display("XORI: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h0ff16093; // ORI x1, x2, 0xFF
#10;
$display("ORI: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h0ff17093; // ANDI x1, x2, 0xFF
#10;
$display("ANDI: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h00511093; // SLLI x1, x2, 5
#10;
$display("SLLI: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h00515093; // SRLI x1, x2, 5
#10;
$display("SRLI: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h40515093; // SRAI x1, x2, 5
#10;
$display("SRAI: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h003100b3; // ADD x1, x2, x3
#10;
$display("ADD: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h403100b3; // SUB x1, x2, x3       
#10;
$display("SUB: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h003110b3; // SLL x1, x2, x3        
#10;
$display("SLL: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h003120b3; // SLT x1, x2, x3        
#10;
$display("SLT: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel); 
        Inst = 32'h003130b3; // SLTU x1, x2, x3       
#10;
$display("SLTU: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);         
        Inst = 32'h003140b3; // XOR x1, x2, x3        
#10;
$display("XOR: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h003150b3; // SRL x1, x2, x3        
#10;
$display("SRL: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h403150b3; // SRA x1, x2, x3        
#10;
$display("SRA: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h003160b3; // OR x1, x2, x3        
#10;
$display("OR: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);
        Inst = 32'h003170b3; // AND x1, x2, x3        
#10; 
$display("AND: ImmSel=%b, RegWEn=%b, BSel=%b, MemRW=%b, WBSel=%b, BrUn=%b, PCSel=%b, ASel=%b", ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, PCSel, ASel);     
 // Branch test
 // Test BEQ
        Inst = 32'b0000000_00000_00000_000_00000_1100011; // BEQ
        BrEq = 0;
        #10;
        $display("BEQ: PCSel = %b, ImmSel = %b, RegWEn = %b, BSel = %b, MemRW = %b, WBSel = %b, BrUn = %b, ASel = %b", PCSel, ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, ASel);
        if (PCSel !== 1'b1) $display("Test failed for BEQ");

        // Test BNE
        Inst = 32'b0000000_00000_00000_001_00000_1100011; // BNE
        BrEq = 1;
        #10;
        $display("BNE: PCSel = %b, ImmSel = %b, RegWEn = %b, BSel = %b, MemRW = %b, WBSel = %b, BrUn = %b, ASel = %b", PCSel, ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, ASel);
        if (PCSel !== 1'b1) $display("Test failed for BNE");

        // Test BLT
        Inst = 32'b0000000_00000_00000_100_00000_1100011; // BLT
        BrLT = 0;
        #10;
        $display("BLT: PCSel = %b, ImmSel = %b, RegWEn = %b, BSel = %b, MemRW = %b, WBSel = %b, BrUn = %b, ASel = %b", PCSel, ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, ASel);
        if (PCSel !== 1'b1) $display("Test failed for BLT");

        // Test BGE
        Inst = 32'b0000000_00000_00000_101_00000_1100011; // BGE
        BrLT = 1;
        #10;
        $display("BGE: PCSel = %b, ImmSel = %b, RegWEn = %b, BSel = %b, MemRW = %b, WBSel = %b, BrUn = %b, ASel = %b", PCSel, ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, ASel);
        if (PCSel !== 1'b1) $display("Test failed for BGE");

        // Test BLTU
        Inst = 32'b0000000_00000_00000_110_00000_1100011; // BLTU
        BrLT = 0;
        #10;
        $display("BLTU: PCSel = %b, ImmSel = %b, RegWEn = %b, BSel = %b, MemRW = %b, WBSel = %b, BrUn = %b, ASel = %b", PCSel, ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, ASel);
        if (PCSel !== 1'b1) $display("Test failed for BLTU");

        // Test BGEU
        Inst = 32'b0000000_00000_00000_111_00000_1100011; // BGEU
        BrLT = 1;
        #10;
        $display("BGEU: PCSel = %b, ImmSel = %b, RegWEn = %b, BSel = %b, MemRW = %b, WBSel = %b, BrUn = %b, ASel = %b", PCSel, ImmSel, RegWEn, BSel, MemRW, WBSel, BrUn, ASel);
        if (PCSel !== 1'b1) $display("Test failed for BGEU");
$finish;
end

endmodule
