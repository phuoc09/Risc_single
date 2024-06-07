//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 05/31/2024 05:46:09 PM
//// Design Name: 
//// Module Name: control_unit_tb
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//module control_unit_tb;

//reg [31:0] Inst;
//wire [2:0] ImmSel;
//wire RegWEn;          // 1 = write enable
//wire BSel;            // 0 = reg, 1= Imm
//wire  MemRW;          // 1 = write , 0 = read
//wire [1:0] WBSel;           // 0 = mem , 1 = alu, 2 = pc+4
//wire BrUn;            // 1 = unsigned, 0 = singed
////output PCSel;           // 1 = alu, 0 = pc+4
//wire ASel;            // 0 = DataA, 1 = pc
//wire [4:0] ALUSel;
//wire [2:0] Branch;  
//                        // 000 = BEQ
//                        // 001 = BNE
//                        // 010 = BLT
//                        // 011 = BGE
//                        // 100 = BLTU
//                        // 101 = BGEU
//wire Jump; 

//control_unit ctrl_unit(.Inst(Inst),.ImmSel(ImmSel),.RegWEn(RegWEn),.BSel(BSel),
//                        .MemRW(MemRW),.WBSel(WBSel),.BrUn(BrUn),.Branch(Branch),
//                        .Jump(Jump),.ASel(ASel),.ALUSel(ALUSel));

//task display_outputs;
//    begin
//        $display("Inst: %h", Inst);
//        $display("ImmSel: %b", ImmSel);
//        $display("RegWEn: %b", RegWEn);
//        $display("BSel: %b", BSel);
//        $display("MemRW: %b", MemRW);
//        $display("WBSel: %b", WBSel);
//        $display("BrUn: %b", BrUn);
//        $display("ASel: %b", ASel);
//        $display("ALUSel: %d", ALUSel);
//        $display("Branch: %b", Branch);
//        $display("Jump: %b", Jump);
//        $display("-----------------------------------");
//    end
    
//endtask
                        
//initial begin
//    Inst = 32'h00000000;
//    #10;
    
//    Inst = 32'h123450b7; // LUI x1, 0x12345
//    #10;
//    display_outputs;
    
//    Inst = 32'h00010097; // AUIPC x1, 0x10
//    #10;
//    display_outputs;
//    Inst = 32'h064000ef; // JAL x1, 100
//    #10;
//    display_outputs;
//    Inst = 32'h000000e7; // JALR x1, x2
//    #10;
//    display_outputs;
//    Inst = 32'h00012083; // LW x1, 0(x2)
//    #10;
//    display_outputs;
//    Inst = 32'h00112023; // SW x1, 0(x2)
//    #10;
//    display_outputs;
//    Inst = 32'h00a10093; // ADDI x1, x2, 10
//    #10;
//    display_outputs;
//    Inst = 32'h00a12093; // SLTI x1, x2, 10
//    #10;
//    display_outputs;
//    Inst = 32'h00a13093; // SLTIU x1, x2, 10
//    #10;
//    display_outputs;
//    Inst = 32'h0ff14093; // XORI x1, x2, 0xFF
//    #10;
//    display_outputs;
//    Inst = 32'h0ff16093; // ORI x1, x2, 0xFF
//    #10;
//    display_outputs;
//    Inst = 32'h0ff17093; // ANDI x1, x2, 0xFF
//    #10;
//    display_outputs;
//    Inst = 32'h00511093; // SLLI x1, x2, 5
//    #10;
//    display_outputs;
//    Inst = 32'h00515093; // SRLI x1, x2, 5
//    #10;
//    display_outputs;
//    Inst = 32'h40515093; // SRAI x1, x2, 5
//    #10;
//    display_outputs;
//    Inst = 32'h003100b3; // ADD x1, x2, x3
//    #10;
//    display_outputs;
//    Inst = 32'h403100b3; // SUB x1, x2, x3
//    #10;
//    display_outputs;
//    Inst = 32'h003110b3; // SLL x1, x2, x3
//    #10;
//    display_outputs;
//    Inst = 32'h003120b3; // SLT x1, x2, x3
//    #10;
//    display_outputs;
//    Inst = 32'h003130b3; // SLTU x1, x2, x3
//    #10;
//    display_outputs;
//    Inst = 32'h003140b3; // XOR x1, x2, x3
//    #10;
//    display_outputs;
//    Inst = 32'h003150b3; // SRL x1, x2, x3
//    #10;
//    display_outputs;
//    Inst = 32'h403150b3; // SRA x1, x2, x3
//    #10;
//    display_outputs;
//    Inst = 32'h003160b3; // OR x1, x2, x3
//    #10;
//    display_outputs;
//    Inst = 32'h003170b3; // AND x1, x2, x3
//    #10;
//    display_outputs;
//    Inst = 32'b0000000_00000_00000_000_00000_1100011; // BEQ
//    #10;
//    display_outputs;
//    Inst = 32'b0000000_00000_00000_001_00000_1100011; // BNE
//    #10;
//    display_outputs;
//    Inst = 32'b0000000_00000_00000_100_00000_1100011; // BLT
//    #10;
//    display_outputs;
//    Inst = 32'b0000000_00000_00000_101_00000_1100011; // BGE
//    #10;
//    display_outputs;
//    Inst = 32'b0000000_00000_00000_110_00000_1100011; // BLTU
//    #10;
//    display_outputs;
//    Inst = 32'b0000000_00000_00000_111_00000_1100011; // BGEU
//    #10;
//    display_outputs;
    
//    $finish;

//end
//endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2024 05:46:09 PM
// Design Name: 
// Module Name: control_unit_tb
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

module control_unit_tb;

reg [31:0] Inst;
wire [2:0] ImmSel;
wire RegWEn;          // 1 = write enable
wire BSel;            // 0 = reg, 1= Imm
wire MemRW;           // 1 = write, 0 = read
wire [1:0] WBSel;     // 0 = mem, 1 = alu, 2 = pc+4
wire BrUn;            // 1 = unsigned, 0 = signed
wire ASel;            // 0 = DataA, 1 = pc
wire [4:0] ALUSel;
wire [2:0] Branch;  
                        // 000 = BEQ
                        // 001 = BNE
                        // 010 = BLT
                        // 011 = BGE
                        // 100 = BLTU
                        // 101 = BGEU
wire Jump;

control_unit ctrl_unit(
    .Inst(Inst),
    .ImmSel(ImmSel),
    .RegWEn(RegWEn),
    .BSel(BSel),
    .MemRW(MemRW),
    .WBSel(WBSel),
    .BrUn(BrUn),
    .Branch(Branch),
    .Jump(Jump),
    .ASel(ASel),
    .ALUSel(ALUSel)
);

task display_outputs;
    begin
        $display("Inst: %h", Inst);
        $display("ImmSel: %b", ImmSel);
        $display("RegWEn: %b", RegWEn);
        $display("BSel: %b", BSel);
        $display("MemRW: %b", MemRW);
        $display("WBSel: %b", WBSel);
        $display("BrUn: %b", BrUn);
        $display("ASel: %b", ASel);
        $display("ALUSel: %d", ALUSel);
        $display("Branch: %b", Branch);
        $display("Jump: %b", Jump);
        $display("-----------------------------------");
    end
endtask

task check_outputs(
    input [2:0] exp_ImmSel,
    input exp_RegWEn,
    input exp_BSel,
    input exp_MemRW,
    input [1:0] exp_WBSel,
    input exp_BrUn,
    input exp_ASel,
    input [4:0] exp_ALUSel,
    input [2:0] exp_Branch,
    input exp_Jump
);
    begin
        if (ImmSel !== exp_ImmSel) $error("ImmSel mismatch: expected %b, got %b", exp_ImmSel, ImmSel);
        if (RegWEn !== exp_RegWEn) $error("RegWEn mismatch: expected %b, got %b", exp_RegWEn, RegWEn);
        if (BSel !== exp_BSel) $error("BSel mismatch: expected %b, got %b", exp_BSel, BSel);
        if (MemRW !== exp_MemRW) $error("MemRW mismatch: expected %b, got %b", exp_MemRW, MemRW);
        if (WBSel !== exp_WBSel) $error("WBSel mismatch: expected %b, got %b", exp_WBSel, WBSel);
        if (BrUn !== exp_BrUn) $error("BrUn mismatch: expected %b, got %b", exp_BrUn, BrUn);
        if (ASel !== exp_ASel) $error("ASel mismatch: expected %b, got %b", exp_ASel, ASel);
        if (ALUSel !== exp_ALUSel) $error("ALUSel mismatch: expected %d, got %d", exp_ALUSel, ALUSel);
        if (Branch !== exp_Branch) $error("Branch mismatch: expected %b, got %b", exp_Branch, Branch);
        if (Jump !== exp_Jump) $error("Jump mismatch: expected %b, got %b", exp_Jump, Jump);
    end
endtask

initial begin
    Inst = 32'h00000000;
    #10;

    Inst = 32'h123450b7; // LUI x1, 0x12345
    #10;
    display_outputs;
    check_outputs(3'b011, 1, 1, 0, 2'b01, 0, 1'bz, 5'd19, 3'bzzz, 0); // Example expected values

    Inst = 32'h00010097; // AUIPC x1, 0x10
    #10;
    display_outputs;
    check_outputs(3'b011, 1, 1, 0, 2'b01, 0, 1, 5'd9, 3'bzzz, 0); // Example expected values

    Inst = 32'h064000ef; // JAL x1, 100
    #10;
    display_outputs;
    check_outputs(3'b100, 1, 1, 0, 2'b10, 0, 1, 5'd9, 3'bzzz, 1); // Example expected values

    Inst = 32'h000000e7; // JALR x1, x2
    #10;
    display_outputs;
    check_outputs(3'b000, 1, 1, 0, 2'b10, 0, 0, 5'd9, 3'bzzz, 1); // Example expected values

    Inst = 32'h00012083; // LW x1, 0(x2)
    #10;
    display_outputs;
    check_outputs(3'b000, 1, 1, 0, 2'b00, 0, 0, 5'd9, 3'bzzz, 0); // Example expected values

    Inst = 32'h00112023; // SW x1, 0(x2)
    #10;
    display_outputs;
    check_outputs(3'b001, 0, 1, 1, 2'bzz, 0, 0, 5'd9, 3'bzzz, 0); // Example expected values

    Inst = 32'h00a10093; // ADDI x1, x2, 10
    #10;
    display_outputs;
    check_outputs(3'b000, 1, 1, 0, 2'b01, 0, 0, 5'd0, 3'bzzz, 0); // Example expected values

    Inst = 32'h00a12093; // SLTI x1, x2, 10
    #10;
    display_outputs;
    check_outputs(3'b000, 1, 1, 0, 2'b01, 0, 0, 5'd1, 3'bzzz, 0); // Example expected values

    Inst = 32'h00a13093; // SLTIU x1, x2, 10
    #10;
    display_outputs;
    check_outputs(3'b000, 1, 1, 0, 2'b01, 0, 0, 5'd2, 3'bzzz, 0); // Example expected values

    Inst = 32'h0ff14093; // XORI x1, x2, 0xFF
    #10;
    display_outputs;
    check_outputs(3'b000, 1, 1, 0, 2'b01, 0, 0, 5'd3, 3'bzzz, 0); // Example expected values

    Inst = 32'h0ff16093; // ORI x1, x2, 0xFF
    #10;
    display_outputs;
    check_outputs(3'b000, 1, 1, 0, 2'b01, 0, 0, 5'd4, 3'bzzz, 0); // Example expected values

    Inst = 32'h0ff17093; // ANDI x1, x2, 0xFF
    #10;
    display_outputs;
    check_outputs(3'b000, 1, 1, 0, 2'b01, 0, 0, 5'd5, 3'bzzz, 0); // Example expected values

    Inst = 32'h00511093; // SLLI x1, x2, 5
    #10;
    display_outputs;
    check_outputs(3'b000, 1, 1, 0, 2'b01, 0, 0, 5'd6, 3'bzzz, 0); // Example expected values

    Inst = 32'h00515093; // SRLI x1, x2, 5
    #10;
    display_outputs;
    check_outputs(3'b000, 1, 1, 0, 2'b01, 0, 0, 5'd7, 3'bzzz, 0); // Example expected values

    Inst = 32'h40515093; // SRAI x1, x2, 5
    #10;
    display_outputs;
    check_outputs(3'b000, 1, 1, 0, 2'b01, 0, 0, 5'd8, 3'bzzz, 0); // Example expected values
    
    // R_Type check

    Inst = 32'h003100b3; // ADD x1, x2, x3
    #10;
    display_outputs;
    check_outputs(3'bzzz, 1, 0, 0, 2'b01, 0, 0, 5'd9, 3'bzzz, 0); // Example expected values

    Inst = 32'h403100b3; // SUB x1, x2, x3
    #10;
    display_outputs;
    check_outputs(3'bzzz, 1, 0, 0, 2'b01, 0, 0, 5'd10, 3'bzzz, 0); // Example expected values

    Inst = 32'h003110b3; // SLL x1, x2, x3
    #10;
    display_outputs;
    check_outputs(3'bzzz, 1, 0, 0, 2'b01, 0, 0, 5'd11, 3'bzzz, 0); // Example expected values

    Inst = 32'h003120b3; // SLT x1, x2, x3
    #10;
    display_outputs;
    check_outputs(3'bzzz, 1, 0, 0, 2'b01, 0, 0, 5'd12, 3'bzzz, 0); // Example expected values

    Inst = 32'h003130b3; // SLTU x1, x2, x3
    #10;
    display_outputs;
    check_outputs(3'bzzz, 1, 0, 0, 2'b01, 0, 0, 5'd13, 3'bzzz, 0); // Example expected values

    Inst = 32'h003140b3; // XOR x1, x2, x3
    #10;
    display_outputs;
    check_outputs(3'bzzz, 1, 0, 0, 2'b01, 0, 0, 5'd14, 3'bzzz, 0); // Example expected values

    Inst = 32'h003150b3; // SRL x1, x2, x3
    #10;
    display_outputs;
    check_outputs(3'bzzz, 1, 0, 0, 2'b01, 0, 0, 5'd15, 3'bzzz, 0); // Example expected values

    Inst = 32'h403150b3; // SRA x1, x2, x3
    #10;
    display_outputs;
    check_outputs(3'bzzz, 1, 0, 0, 2'b01, 0, 0, 5'd16, 3'bzzz, 0); // Example expected values

    Inst = 32'h003160b3; // OR x1, x2, x3
    #10;
    display_outputs;
    check_outputs(3'bzzz, 1, 0, 0, 2'b01, 0, 0, 5'd17, 3'bzzz, 0); // Example expected values

    Inst = 32'h003170b3; // AND x1, x2, x3
    #10;
    display_outputs;
    check_outputs(3'bzzz, 1, 0, 0, 2'b01, 0, 0, 5'd18, 3'bzzz, 0); // Example expected values
    
    
    // Branch check

    Inst = 32'b0000000_00000_00000_000_00000_1100011; // BEQ
    #10;
    display_outputs;
    check_outputs(3'b010, 0, 1, 0, 2'bzz, 0, 1, 5'd9, 3'b000, 0); // Example expected values

    Inst = 32'b0000000_00000_00000_001_00000_1100011; // BNE
    #10;
    display_outputs;
    check_outputs(3'b010, 0, 1, 0, 2'bzz, 0, 1, 5'd9, 3'b001, 0); // Example expected values

    Inst = 32'b0000000_00000_00000_100_00000_1100011; // BLT
    #10;
    display_outputs;
    check_outputs(3'b010, 0, 1, 0, 2'bzz, 0, 1, 5'd9, 3'b010, 0); // Example expected values

    Inst = 32'b0000000_00000_00000_101_00000_1100011; // BGE
    #10;
    display_outputs;
    check_outputs(3'b010, 0, 1, 0, 2'bzz, 0, 1, 5'd9, 3'b011, 0); // Example expected values

    Inst = 32'b0000000_00000_00000_110_00000_1100011; // BLTU
    #10;
    display_outputs;
    check_outputs(3'b010, 0, 1, 0, 2'bzz, 1, 1, 5'd9, 3'b100, 0); // Example expected values

    Inst = 32'b0000000_00000_00000_111_00000_1100011; // BGEU
    #10;
    display_outputs;
    check_outputs(3'b010, 0, 1, 0, 2'bzz, 1, 1, 5'd9, 3'b101, 0); // Example expected values

    $finish;

end
endmodule
