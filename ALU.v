module ALU(
input [31:0] in1,in2,
input [4:0] ALUSel,
output reg [31:0]out
    );
always@(ALUSel or in1 or in2)    begin
    case (ALUSel) 
            0 : out <= in1 + in2;                                   // ADDI
			1 : out <= {{31{1'b0}}, ($signed(in1) < $signed(in2))} ;// SLTI
			2 : out <= {{31{1'b0}}, (in1 < in2)};                    // SLTIU
			3 : out <= in1 ^ in2;                                    //XORI
			4 : out <= in1 | in2;                                    // ORI
			5 : out <= in1 & in2;                                    // ANDI
			6 : out <= in1 << in2[4:0];                              // SLLI
			7 : out <= in1 >> in2[4:0];                              // SRLI
			8 : out <= $signed(in1) >>> in2[4:0];                    // SRAI
			9 : out <= in1 + in2;                                    // ADD
			10 : out <= in1 - in2;                                   // SUB
			11 : out <= in1 << in2[4:0];                             // SLL
			12 : out <= {{31{1'b0}}, ($signed(in1) < $signed(in2))}; //SLT
			13 : out <= {{31{1'b0}}, (in1 < in2)};                   // SLTU
			14 : out <= in1 ^ in2;                                   // XOR
			15 : out <= in1 >> in2[4:0];                             // SRL
			16 : out <= $signed(in1) >>> in2[4:0];                   // SRA
			17 : out <= in1 | in2;                                   // OR
			18 : out <= in1 & in2;                                   // AND
			19 : out <= in2 ;                                        // LUI 
			default: out <= 32'h00000000;
	   endcase	
    
    
    
end 

endmodule
