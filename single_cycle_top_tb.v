`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2024 03:55:55 PM
// Design Name: 
// Module Name: single_cycle_top_tb
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


module single_cycle_top_tb;
reg clk = 1;
reg rst;
//
// wire [31:0] Inst;
//input  BrLT, BrEq;
reg [31:0] reg_file [0:31];
wire [2:0] ImmSel;
wire RegWEn;          // 1 = write enable
wire BSel;            // 0 = reg, 1= Imm
wire  MemRW;          // 1 = write , 0 = read
wire [1:0] WBSel;           // 0 = mem , 1 = alu, 2 = pc+4
wire BrUn;            // 1 = unsigned, 0 = singed
//output PCSel;           // 1 = alu, 0 = pc+4
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
//
wire PCSel;
wire [31:0] alu_out_w;   
wire [31:0] Inst_w; 
wire [31:0] pc_w,pc_plus4_w;

wire [31:0] WB_DataD_w;
wire [31:0] Wr_data_w;
wire [31:0] DataA_w, DataB_w;
wire [31:0] Imm_w;
control_unit control(
            .Inst(Inst_w),
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
IF_module fetch(
          .clk(clk),
          .rst(rst),
          .alu_out(alu_out_w),
          .PCSel(PCSel),
          .ID_Inst(Inst_w),
          .ID_pc(pc_w),
          .ID_pc_plus4(pc_plus4_w)
          );

ID_module decode
         (
          .clk(clk),
          .rst(rst),
          .ID_Inst(Inst_w),
          .WB_DataD(WB_DataD_w),
          .WB_RegWEn(RegWEn),
          .ImmSel(ImmSel),
          .EX_DataA(DataA_w),
          .EX_DataB(DataB_w),
          .EX_Imm(Imm_w)
          );
                    
EX_module execute
                 (
                 .DataA(DataA_w),
                 .DataB(DataB_w),
                 .Imm(Imm_w),
                 .pc(pc_w),
                 .BrUn(BrUn),
                 .Branch(Branch),
                 .Jump(Jump),
                 .ALUSel(ALUSel),
                 .ASel(ASel),
                 .BSel(BSel),
                 .alu_out(alu_out_w),
                 .Wr_data(Wr_data_w),
                 .PCSel(PCSel)
                 );                        
WB_module writeback(
            .clk(clk),
            .rst(rst),
            .MemRW(MemRW),
            .WBSel(WBSel),
            .alu_out(alu_out_w),
            .Wr_data(Wr_data_w),
            .pc_plus4(pc_plus4_w),
            .WB_Data(WB_DataD_w)
            );             


// clk and reset generation
always begin
    clk = ~clk;
    #10;
end
initial begin
    rst <= 1'b0;
    #50;
    rst <= 1'b1;  
end              

//
 initial begin
    $monitor("Time: %d, PC: %h, Instruction: %h, ImmSel: %b, RegWEn: %b, MemRW: %b,WBSel: %b,BrUn: %b,ALUSel: %b,Branch: %b,Jump: %b,ASel: %b,BSel: %b,WB_DataD = %b",
             $time, pc_w, Inst_w,ImmSel ,RegWEn ,MemRW,WBSel,BrUn,ALUSel,Branch,Jump, ASel,BSel,WB_DataD_w);
       $display("DMEM: %h, %h, %h, %h, %h",writeback.D_mem.d_mem[1],writeback.D_mem.d_mem[2],writeback.D_mem.d_mem[3],writeback.D_mem.d_mem[4],writeback.D_mem.d_mem[5]);
  end
  
 initial begin
    #20000;
    $finish;
 end 
  // Check results
  always @(posedge clk) begin
    if (rst == 1'b1) begin
        case(pc_w)
        
        // FOR ARTH
//         32'h00000004: if(decode.reg_file.reg_file[1] != 32'h0000000A) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000008: if(decode.reg_file.reg_file[2] != 32'h00000014) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h0000000c: if(decode.reg_file.reg_file[3] != 32'h00001000) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000010: if(decode.reg_file.reg_file[3] != 32'h00000FFF) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000014: if(decode.reg_file.reg_file[4] != 32'h80000000) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000018: if(decode.reg_file.reg_file[4] != 32'h80000000) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h0000001c: if(decode.reg_file.reg_file[5] != 32'h00000001) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000020: if(decode.reg_file.reg_file[6] != 32'hFFFFFFFF) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000024: if(decode.reg_file.reg_file[7] != 32'h0000001E) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000028: if(decode.reg_file.reg_file[8] != 32'h0000000A) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h0000002c: if(decode.reg_file.reg_file[9] != 32'h00000014) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000030: if(decode.reg_file.reg_file[10] != 32'h00000005) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000034: if(decode.reg_file.reg_file[11] != 32'h00000005) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000038: if(decode.reg_file.reg_file[12] != 32'h00000000) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h0000003c: if(decode.reg_file.reg_file[13] != 32'h0000001E) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000040: if(decode.reg_file.reg_file[14] != 32'h0000001E) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000044: if(decode.reg_file.reg_file[15] != 32'h00000001) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000048: if(decode.reg_file.reg_file[16] != 32'h00000001) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h0000004c: if(decode.reg_file.reg_file[17] != 32'h0000000F) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000050: if(decode.reg_file.reg_file[18] != 32'h00000014) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000054:if(decode.reg_file.reg_file[19] != 32'h00000005) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000058: if(decode.reg_file.reg_file[20] != 32'h00000005) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h0000005c: if(decode.reg_file.reg_file[21] != 32'h0000000A) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000060: if(decode.reg_file.reg_file[22] != 32'h000000FF) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000064: if(decode.reg_file.reg_file[23] != 32'h000000F5) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000068: if(decode.reg_file.reg_file[24] != 32'h00000001) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h0000006c: if(decode.reg_file.reg_file[25] != 32'h00000001) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000070: if(decode.reg_file.reg_file[26] != 32'h12345000) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000074:if(decode.reg_file.reg_file[27] != 32'h00001070) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000078:if(decode.reg_file.reg_file[17] != 32'h0000000A) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");



         // FOR LOAD & STORE   
//         32'h00000004: if(decode.reg_file.reg_file[1] != 32'h0000000A) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000008: if(decode.reg_file.reg_file[2] != 32'h00000014) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h0000000c: if(decode.reg_file.reg_file[3] != 32'h12345000) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000010: if(decode.reg_file.reg_file[3] != 32'h12345678) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000014: if(decode.reg_file.reg_file[4] != 32'h9ABCE000) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000018: if(decode.reg_file.reg_file[4] != 32'h9ABCDEF0) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h0000001c: if(decode.reg_file.reg_file[5] != 32'h00000001) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h00000020: if((decode.reg_file.reg_file[5] != 32'h00000001) || (writeback.D_mem.d_mem[32'h00000001] != 32'h0000000A) ) 
//                       begin 
//                         $display("ERROR");
//                         $display("DMEM[0(x5)]: %h",writeback.D_mem.d_mem[32'h00000001]);
//                       end else begin $display("PASS"); 
//                                $display("DMEM[0(x5)]: %h",writeback.D_mem.d_mem[32'h00000001]);
//                                end
//         32'h00000024: if((decode.reg_file.reg_file[5] != 32'h00000001) || (writeback.D_mem.d_mem[32'h00000005] != 32'h00000014) ) 
//                       begin 
//                         $display("ERROR");
//                         $display("DMEM[4(x5)]: %h",writeback.D_mem.d_mem[32'h00000005]);
//                       end else begin $display("PASS");
//                       $display("DMEM[4(x5)]: %h",writeback.D_mem.d_mem[32'h00000005]);
//                       end
//         32'h00000028: if(decode.reg_file.reg_file[5] != 32'h00000001) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");
//         32'h0000002c: if((decode.reg_file.reg_file[5] != 32'h00000001)||(writeback.D_mem.d_mem[32'h00000001] != 32'h0000000A)||(decode.reg_file.reg_file[6] != 32'h0000000A)) 
//                       begin 
//                         $display("ERROR");
//                         $display("DMEM[0(x5)]: %h,x6: %h",writeback.D_mem.d_mem[32'h00000001],decode.reg_file.reg_file[6]);
//                       end else begin $display("PASS");
//                       $display("DMEM[0(x5)]: %h,x6: %h",writeback.D_mem.d_mem[32'h00000001],decode.reg_file.reg_file[6]);
//                       end
//         32'h00000030: if((decode.reg_file.reg_file[5] != 32'h00000001)||(writeback.D_mem.d_mem[32'h00000005] != 32'h00000014)||(decode.reg_file.reg_file[7] != 32'h00000014)) 
//                       begin 
//                         $display("ERROR");
//                         $display("DMEM[4(x5)]: %h,x7: %h",writeback.D_mem.d_mem[32'h00000005],decode.reg_file.reg_file[7]);
//                       end else  begin $display("PASS");
//                         $display("DMEM[4(x5)]: %h,x7: %h",writeback.D_mem.d_mem[32'h00000005],decode.reg_file.reg_file[7]);
//                       end
//         32'h00000034: if(decode.reg_file.reg_file[17] != 32'h0000000a) 
//                       begin 
//                         $display("ERROR");
//                       end else  $display("PASS");

        // FOR JUMP AND BRANCH
         32'h00000004: if(decode.reg_file.reg_file[1] != 32'h0000000A) 
                       begin 
                         $display("ERROR");
                       end else  $display("PASS");
         32'h00000008: if(decode.reg_file.reg_file[2] != 32'h00000014) 
                       begin 
                         $display("ERROR");
                       end else  $display("PASS");
         32'h0000000c: if(decode.reg_file.reg_file[3] != 32'h00000000) 
                       begin 
                         $display("ERROR");
                       end else  $display("PASS");
         32'h00000010: if(decode.reg_file.reg_file[4] != 32'h00000000) 
                       begin 
                         $display("ERROR");
                       end else  $display("PASS"); 
         32'h00000018: if(decode.reg_file.reg_file[3] != 32'h00000001) 
                       begin 
                         $display("ERROR");
                       end else  $display("PASS"); 
         32'h00000020: if(decode.reg_file.reg_file[3] == 32'h00000002) 
                       begin 
                         $display("ERROR");
                       end else  $display("PASS");                                                                                                                    
        
        32'h00000028: if(decode.reg_file.reg_file[3] == 32'h00000003) 
                       begin 
                         $display("ERROR");
                       end else  $display("PASS");
        32'h00000030: if(decode.reg_file.reg_file[3] != 32'h00000004) 
                       begin 
                         $display("ERROR");
                       end else  $display("PASS");    
        32'h00000038: if(decode.reg_file.reg_file[4] == 32'h00000001) 
                       begin 
                         $display("ERROR");
                       end else  $display("PASS");
        32'h00000040: if( (decode.reg_file.reg_file[5] != 32'h0000003C)) 
                       begin 
                         $display("ERROR");
                       end else  $display("PASS");     
        32'h00000044: if(decode.reg_file.reg_file[6] != 32'h0000003C) 
                       begin 
                         $display("ERROR");
                       end else  $display("PASS"); 
                                                                                                                                                                                                  
        endcase
      end   
  end
  
         
endmodule
