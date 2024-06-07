`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2024 09:04:58 PM
// Design Name: 
// Module Name: ALU_decoder
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


module ALU_decoder(Inst,ALUSel_out);
input [31:0]Inst;
output [4:0] ALUSel_out;

reg [4:0] ALUSel;
always@(Inst) begin
//case({Inst[14:12],Inst[5:0]})
//010011
//    3'b000: ALUSel = 5'd0 ;              // ADDI
//    3'b010: ALUSel = 5'd1 ;              // SLTI
//    3'b011: ALUSel = 5'd2 ;              // SLTIU
//    3'b100: ALUSel = 5'd3 ;              // XORI
//    3'b110: ALUSel = 5'd4 ;              // ORI
//    3'b111: ALUSel = 5'd5 ;              // ANDI
//    3'b001: ALUSel = 5'd6 ;              // SLLI
    
//    9'b101010011: begin
//        case(Inst[30]) 
//        1'b0:     ALUSel = 5'd7 ;              // SRLI
//        1'b1:     ALUSel = 5'd8 ;              // SRAI
//        endcase
//    end
    
//    9'b000110011: begin
//        case(Inst[30])
//        1'b0:     ALUSel = 5'd9 ;              // ADD
//        1'b1:     ALUSel = 5'd10 ;             // SUB
//        endcase
//    end
//    9'b001110011: ALUSel = 5'd11 ;              // SLL
//    9'b010110011: ALUSel = 5'd12 ;              // SLT
//    9'b011110011: ALUSel = 5'd13 ;              // SLTU
//    9'b100110011: ALUSel = 5'd14 ;              // XOR
   
//    9'b101110011:  begin
//        case(Inst[30])
//        1'b0:     ALUSel = 5'd15;               // SRL
//        1'b1:     ALUSel = 5'd16;               // SRA
//        endcase   
//    end
    
//    9'b110110011: ALUSel = 5'd17 ;              // OR
//    9'b111110011: ALUSel = 5'd18 ;              // AND
//endcase
    case(Inst[6:0]) 
        // I_Type
        7'b0010011  : begin
            case(Inst[14:12])
                3'b000: ALUSel = 5'd0 ;              // ADDI
                3'b010: ALUSel = 5'd1 ;              // SLTI
                3'b011: ALUSel = 5'd2 ;              // SLTIU
                3'b100: ALUSel = 5'd3 ;              // XORI
                3'b110: ALUSel = 5'd4 ;              // ORI
                3'b111: ALUSel = 5'd5 ;              // ANDI
                3'b001: ALUSel = 5'd6 ;              // SLLI
                3'b101: begin
                    case(Inst[30]) 
                        1'b0:     ALUSel = 5'd7 ;              // SRLI
                        1'b1:     ALUSel = 5'd8 ;              // SRAI
                    endcase
                end    
            endcase
        end
        // R_Type
        7'b0110011: begin
            case(Inst[14:12])
                3'b000: begin
                    case(Inst[30])
                        1'b0:     ALUSel = 5'd9 ;              // ADD
                        1'b1:     ALUSel = 5'd10 ;             // SUB
                    endcase
                end
                3'b001: ALUSel = 5'd11 ;                        // SLL
                3'b010: ALUSel = 5'd12 ;                        // SLT
                3'b011: ALUSel = 5'd13 ;                        // SLTU
                3'b100: ALUSel = 5'd14 ;                        // XOR     
                3'b101:  begin
                    case(Inst[30])
                        1'b0:     ALUSel = 5'd15;               // SRL
                        1'b1:     ALUSel = 5'd16;               // SRA
                    endcase   
                end
    
                3'b110: ALUSel = 5'd17 ;                        // OR
                3'b111: ALUSel = 5'd18 ;                        // AND           
            endcase
        end
        7'b0110111:     ALUSel = 5'd19;                         // LUI
        default:        ALUSel = 5'd9;                          // ELSE                         
    endcase
end

assign ALUSel_out = ALUSel;
endmodule
