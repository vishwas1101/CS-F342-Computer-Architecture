`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 15:23:49
// Design Name: 
// Module Name: Rtype_processor_pipeline
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


module Rtype_processor_pipeline(input Clk, input Reset);

wire [31:0] Instruction_Code,Instruction_Code_IF_ID,ALU_result,ALUresult_EX_WB,
            Read_Data_1,Read_Data_2,Read_Data_1_ID_EX,Read_Data_2_ID_EX;
wire [3:0] ALUop,ALUop_ID_EX;
wire RegWrite,RegWrite_ID_EX,RegWrite_EX_WB,Zero;

wire [4:0] Rd_ID_EX,Rd_EX_WB;

Instruction_Fetch IF(Clk,Reset,Instruction_Code);

IF_ID pipreg1(Clk,Reset,Instruction_Code,Instruction_Code_IF_ID);

Register_File_pipeline RF(Instruction_Code_IF_ID[19:15],Instruction_Code_IF_ID[24:20],Rd_EX_WB,
                 ALUresult_EX_WB,Read_Data_1,Read_Data_2,RegWrite_EX_WB,Clk,Reset);
                 
ID_EX pipreg2(Clk,Reset,ALUop,Read_Data_1,Read_Data_2,Instruction_Code_IF_ID[11:7],RegWrite,
              ALUop_ID_EX,Read_Data_1_ID_EX,Read_Data_2_ID_EX,Rd_ID_EX,RegWrite_ID_EX);
              
Control_Unit CU(Instruction_Code_IF_ID,ALUop,RegWrite);

ALU ALU1(Read_Data_1_ID_EX,Read_Data_2_ID_EX,ALUop_ID_EX,ALU_result,Zero);

EX_WB pipreg3(Clk,Reset,RegWrite_ID_EX,ALU_result,Rd_ID_EX,RegWrite_EX_WB,ALUresult_EX_WB,Rd_EX_WB);

endmodule
