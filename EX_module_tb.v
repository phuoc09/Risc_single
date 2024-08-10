`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2024 07:23:13 PM
// Design Name: 
// Module Name: EX_module_tb
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


module EX_module_tb;
reg [31:0] DataA,DataB;
//reg [31:0] Imm;
//reg [31:0] pc;
reg BrUn;
reg [2:0] Branch;
reg Jump;
//reg [4:0] ALUSel;
//reg ASel,BSel;

//wire [31:0] alu_out;
//wire [31:0] Wr_data;
wire PCSel;
wire BrLT,BrEq;

//EX_module execute(
//                  .DataA(DataA),
//                  .DataB(DataB),
//                  .Imm(Imm),
//                  .pc(pc),
//                  .BrUn(BrUn),
//                  .Branch(Branch),
//                  .Jump(Jump),
//                  .ALUSel(ALUSel),
//                  .ASel(ASel),
//                  .BSel(BSel),
//                 .alu_out(alu_out),
//                 .Wr_data(Wr_data),
//                 .PCSel(PCSel));



branch_comp branch_cmp(.DataA(DataA),.DataB(DataB),.BrUn(BrUn),.BrLT(BrLT),.BrEq(BrEq));
Branch_control branch_ctrl(.BrLT(BrLT),.BrEq(BrEq),.Jump(Jump),.Branch(Branch),.PCSel(PCSel));
initial begin
//        // ADD
//        DataA <= 32'd5;
//        DataB <= 32'd10;
//        Imm <= 32'd4;
//        pc <= 32'h00000008;
//        ALUSel <= 32'd9;
//        BrUn <= 1'b0;
//        Jump <= 1'b0;
//        Branch <= 3'b111;
//        ASel <= 1'b0;
//        BSel <= 1'b0;
//        #100;
//        if((alu_out != 32'd15) || (Wr_data !=32'd10 )|| (PCSel!=1'b0)) begin
//            $display("ERROR");
//            $display("alu_out = %d,Wr_data = %d,PCSel = %b",alu_out,Wr_data,PCSel);
//        end else $display("alu_out = %d,Wr_data = %d,PCSel = %b",alu_out,Wr_data,PCSel);
//        $display("-------------------------------------------------------------------");
//        #100;
//        // BNE
//        DataA <= 32'd5;
//        DataB <= 32'd10;
//        Imm <= 32'h00000004;
//        pc <= 32'h00000008;
//        ALUSel <= 32'd9;
//        BrUn <= 1'b0;
//        Jump <= 1'b0;
//        Branch <= 3'b001;
//        ASel <= 1'b1;
//        BSel <= 1'b1;
//        #100;
//        $display("BNE Check:");
//        if((alu_out != 32'h0000000c) || (Wr_data !=32'd10 )|| (PCSel!=1'b1)) begin
//            $display("ERROR");
//            $display("alu_out = %d,Wr_data = %d,PCSel = %b",alu_out,Wr_data,PCSel);
//        end else $display("alu_out = %d,Wr_data = %d,PCSel = %b",alu_out,Wr_data,PCSel);
//        $display("-------------------------------------------------------------------");
//        #100;
        // BEQ 
//        DataA <= 32'd5;
//        DataB <= 32'd5;
//        Imm <= 32'h00000004;
//        pc <= 32'h00000008;
//        ALUSel <= 32'd9;
//        BrUn <= 1'b0;
//        Jump <= 1'b0;
//        Branch <= 3'b000;
//        ASel <= 1'b1;
//        BSel <= 1'b1;
//        #100;
//        $display("BEQ Check:");
//        if((alu_out != 32'h0000000c) || (Wr_data !=32'd5 )|| (PCSel!=1'b1)) begin
//            $display("ERROR");
//            $display("alu_out = %d,Wr_data = %d,PCSel = %b",alu_out,Wr_data,PCSel);
//        end else $display("alu_out = %d,Wr_data = %d,PCSel = %b",alu_out,Wr_data,PCSel);
//        $display("-------------------------------------------------------------------");
//        #100;

        // BLT
        DataA <= 32'hfffffff6; // -10
        DataB <= 32'hfffffffb; //-5
//        Imm <= 32'h00000004;
//        pc <= 32'h00000008;
//        ALUSel <= 32'd9;
        BrUn <= 1'b0;
        Jump <= 1'b0;
        Branch <= 3'b010;
//        ASel <= 1'b1;
//        BSel <= 1'b1;
        #100;
        $display("BLT Check:");
        if(PCSel!=1'b1) begin
            $display("ERROR");
            $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);
        end else 
        //$display("alu_out = %d,Wr_data = %d,PCSel = %b",alu_out,Wr_data,PCSel);
        $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);
        $display("-------------------------------------------------------------------");
        #100;
        // BGE
        DataA <= 32'hfffffffb; // -5
        DataB <= 32'hfffffff6; // -10
//        Imm <= 32'h00000004;
//        pc <= 32'h00000008;
//        ALUSel <= 32'd9;
        BrUn <= 1'b0;
        Jump <= 1'b0;
        Branch <= 3'b011;
//        ASel <= 1'b1;
//        BSel <= 1'b1;
        #100;
        $display("BGE Check:");
        if( (PCSel!=1'b1)) begin
            $display("ERROR");
            $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);
        end else $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);

        //$display("alu_out = %d,Wr_data = %d,PCSel = %b",alu_out,Wr_data,PCSel);
        $display("-------------------------------------------------------------------");
        #100;
        // BLTU
        DataA <= 32'd5;
        DataB <= 32'd10;
//        Imm <= 32'h00000004;
//        pc <= 32'h00000008;
//        ALUSel <= 32'd9;
        BrUn <= 1'b1;
        Jump <= 1'b0;
        Branch <= 3'b100;
//        ASel <= 1'b1;
//        BSel <= 1'b1;
        #100;
        $display("BLTU Check:");
        if((PCSel!=1'b1)) begin
            $display("ERROR");
            $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);
        end else  $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);

        //$display("alu_out = %d,Wr_data = %d,PCSel = %b",alu_out,Wr_data,PCSel);
        $display("-------------------------------------------------------------------");
        #100;
        // BGEU
        DataA <= 32'd10; 
        DataB <= 32'd5; 
//        Imm <= 32'h00000004;
//        pc <= 32'h00000008;
//        ALUSel <= 32'd9;
        BrUn <= 1'b1;
        Jump <= 1'b0;
        Branch <= 3'b101;
//        ASel <= 1'b1;
//        BSel <= 1'b1;
        #100;
        $display("BGEU Check:");
        if((PCSel!=1'b1)) begin
            $display("ERROR");
            $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);

        end else $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);

        //$display("alu_out = %d,Wr_data = %d,PCSel = %b",alu_out,Wr_data,PCSel);
        $display("-------------------------------------------------------------------");
        #100;
        // JAR
        DataA <= 32'd10; 
        DataB <= 32'd5; 
//        Imm <= 32'h00000004;
//        pc <= 32'h00000008;
//        ALUSel <= 32'd9;
        BrUn <= 1'b0;
        Jump <= 1'b1;
        Branch <= 3'b111;
//        ASel <= 1'b1;
//        BSel <= 1'b1;
        #100;
        $display(" JAR Check:");
        if( (PCSel!=1'b1)) begin
            $display("ERROR");
            $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);

        end else $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);
        $display("-------------------------------------------------------------------");
        #100;
        // JALR
        DataA <= 32'h0000000c; 
        DataB <= 32'd5; 
//        Imm <= 32'h00000004;
//        pc <= 32'h00000008;
//        ALUSel <= 32'd9;
        BrUn <= 1'b0;
        Jump <= 1'b1;
        Branch <= 3'b111;
//        ASel <= 1'b0;
//        BSel <= 1'b1;
        #100;
        $display("JALR Check:");
        if( (PCSel!=1'b1)) begin
            $display("ERROR");
            $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);

        end else $display("BrLT = %b,BrEq = %b,PCSel = %b",BrLT,BrEq,PCSel);
        $display("-------------------------------------------------------------------");
        #100;
        #100000;
        
    end  
    
assign DataB_w = DataB;               
endmodule
