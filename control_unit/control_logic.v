`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 08:10:59 PM
// Design Name: 
// Module Name: control_logic
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


module control_logic(Inst,
                     ImmSel,RegWEn,BSel,MemRW,WBSel,BrUn,ASel,Branch,Jump);
output [2:0] ImmSel;
output RegWEn;          // 1 = write enable
output BSel;            // 0 = reg, 1= Imm
output  MemRW;          // 1 = write , 0 = read
output [1:0] WBSel;           // 0 = mem , 1 = alu, 2 = pc+4
output BrUn;            // 1 = unsigned, 0 = singed
//output PCSel;           // 1 = alu, 0 = pc+4
output ASel;            // 0 = DataA, 1 = pc
output [2:0] Branch;  
                        // 000 = BEQ
                        // 001 = BNE
                        // 010 = BLT
                        // 011 = BGE
                        // 100 = BLTU
                        // 101 = BGEU
output Jump; 
                        

input [31:0] Inst;


// declare Opcode
wire [6:0] op;
assign op = Inst[6:0] ;
// declare func3
wire [2:0] func3;
assign func3 = Inst[14:12] ;
assign RegWEn = ((op ==7'b0110111) ||                    // LUI
                 (op ==7'b0010111) ||                    // AUIPC
                 (op ==7'b1101111) ||                    // JAL
                 (op ==7'b1100111) ||                    // JALR
                 (op ==7'b0000011) ||                    // LOAD
                 (op ==7'b0010011) ||                    // I
                 (op ==7'b0110011) ) ? 1'b1 : 1'b0;     // R

assign BSel = (op == 7'b0110011 ) ? 1'b0 : 1'b1;

assign ImmSel = ((op == 7'b0000011) || (op ==7'b0010011) || (op == 7'b1100111)) ? 3'b000 :
                (op == 7'b0100011) ? 3'b001 :
                (op == 7'b1100011) ? 3'b010 :
                ((op == 7'b0110111) || (op == 7'b0010111)) ? 3'b011 : 
                (op == 7'b1101111) ? 3'b100 : 3'bzzz;


assign WBSel = ((op ==7'b0010011) || (op ==7'b0110011) || ( op == 7'b0010111) ||(op == 7'b0110111 )) ? 2'b01 :
                (op ==7'b0000011) ? 2'b00 : 
                ((op ==7'b1101111) || (op ==7'b1100111)) ? 2'b10 : 2'bzz ;
                

assign MemRW = (op == 7'b0100011) ? 1'b1 : 1'b0;

assign BrUn = (({func3,op} == 10'b1101100011 ) || ({func3,op} == 10'b1111100011 )) ? 1'b1 : 1'b0; // BGEU, BLTU

//assign Branch = (
//               (({func3,op} == 10'b0001100011) & (BrEq == 1'b1))  |                     // BEQ
//               (({func3,op} == 10'b0011100011) & (BrEq == 1'b0))  |                     // BNE
//               (({func3,op} == 10'b1001100011) & (BrLT == 1'b1))  |                     // BLT
//               (({func3,op} == 10'b1101100011) & (BrLT == 1'b1))  |                     // BLTU
//               (({func3,op} == 10'b1011100011) & (BrLT == 1'b0))  |                     // BGE
//               (({func3,op} == 10'b1111100011) & (BrLT == 1'b0))                        // BGEU
//               ) ? 1'b1 : 1'b0;

assign Branch = ({func3,op} == 10'b0001100011) ? 3'b000 :               // BEQ
                ({func3,op} == 10'b0011100011) ? 3'b001 :               // BNE
                ({func3,op} == 10'b1001100011) ? 3'b010 :               // BLT
                ({func3,op} == 10'b1101100011) ? 3'b100 :               // BLTU
                ({func3,op} == 10'b1011100011) ? 3'b011 :               // BGE
                ({func3,op} == 10'b1111100011) ? 3'b101 : 3'b111;       // BGEU
                
assign Jump = (( op == 7'b1101111 ) || ({func3,op} == 10'b0001100111)) ? 1'b1 : 1'b0;               

assign ASel = (( op == 7'b1100011) || ( op == 7'b1101111) || ( op == 7'b0010111)) ? 1'b1 :
                (op == 7'b0110111) ? 1'bz : 1'b0;




                 
                 
endmodule
