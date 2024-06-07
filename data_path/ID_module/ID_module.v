`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2024 06:53:18 PM
// Design Name: 
// Module Name: ID_module
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


module ID_module(clk,rst,
                    ID_Inst,
                    WB_DataD,WB_RegWEn,ImmSel,
                    EX_DataA,EX_DataB,EX_Imm);
// Input from previous stage 
    input clk,rst;
    input [31:0] ID_Inst;
    input WB_RegWEn;
    input [31:0] WB_DataD;
    input [2:0] ImmSel;
    
    // Output 
    output [31:0] EX_DataA, EX_DataB;
    output [31:0] EX_Imm;
    
    wire [31:0] Imm_w;
    wire [31:0] DataA_w,DataB_w;
    
    //
    wire [4:0] AddrA_w,AddrB_w,AddrD_w;
    
    assign  AddrA_w = ID_Inst[19:15];
    assign  AddrB_w = ID_Inst[24:20];
    assign  AddrD_w = ID_Inst[11:7];
    
    Reg_file reg_file(.clk(clk),.rst(rst),
                      .AddrA(AddrA_w),.AddrB(AddrB_w),.AddrD(AddrD_w),
                      .RegWEn(WB_RegWEn),.DataD(WB_DataD),.DataA(DataA_w),.DataB(DataB_w));
                      
                            
    Imm_gen imm_gen (.Inst(ID_Inst),.ImmSel(ImmSel),.Imm(Imm_w));  
    
    assign  EX_Imm = Imm_w ;
    assign EX_DataA = DataA_w;
    assign EX_DataB = DataB_w;
                       
endmodule
