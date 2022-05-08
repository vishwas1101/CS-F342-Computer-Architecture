`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 11:02:22
// Design Name: 
// Module Name: topUnit
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

module topUnit(
    input clk, 
    input rst
    );

wire [31:0] instrCode_instrFetch, instrCode_IF_ID;

// INSTRUCTION FETCH STAGE - IF
instrFetch IF(.clk(clk), .rst(rst), .instrCode(instrCode_instrFetch)); 

// IF-ID pipeline 
IF_ID_pipeline ifid(.clk(clk), .rst(rst), .instr_mem(instrCode_instrFetch), .instr_IF_ID(instrCode_IF_ID)); 


wire [4:0] rs1, rs2, rd, rd_ID_EX, rd_EX_WB; 


assign rs1 = instrCode_IF_ID[19:15];
assign rs2 = instrCode_IF_ID[24:20]; 
assign rd = instrCode_IF_ID[11:7];

wire [3:0] aluOp, aluOp_ID_EX; 
wire regWrite, regWrite_ID_EX, regWrite_EX_WB, memToReg, immToReg, aluSrc, memRead, memWrite, branch; 
wire [31:0] readRegData1, readRegData1_ID_EX , readRegData2, readRegData2_ID_EX, writeData1, writeData2, imm;

// INSTRUCTION DECODE STAGE - ID
controlUnit ctrl(.instrCode(instrCode_IF_ID), .ALUop(aluOp), .RegWrite(regWrite));
registerBank regs(.clk(clk), .rst(rst), .regWrite(regWrite_EX_WB), .readReg1(rs1), .readReg2(rs2), .writeReg(rd_EX_WB), .writeData(writeData2), .readRegData1(readRegData1), .readRegData2(readRegData2)); 

/*immGen immed(.instr(instrCode), .immSel(immSel), .immOut(imm));
*/

// ID-EX pipeline
ID_EX_pipeline idex(.clk(clk), .rst(rst), .regWrite_ctrlUnit(regWrite), .aluCtrl_ctrlUnit(aluOp), .data1_regBank(readRegData1), .data2_regBank(readRegData2), .rd_IF_ID(rd), .regWrite_ID_EX(regWrite_ID_EX), .data1_ID_EX(readRegData1_ID_EX), .data2_ID_EX(readRegData2_ID_EX), .aluCtrl_ID_EX(aluOp_ID_EX), .rd_ID_EX(rd_ID_EX)); 

wire [31:0] aluInput, aluResult, aluResult_EX_WB;
/*assign aluInput = aluSrc? imm: readRegData2; //Deciding the second input to ALU; *//*
*/wire zero;

// EXECUTION STAGE - EX
alu compute(.A(readRegData1_ID_EX), .B(readRegData1_ID_EX), .op(aluOp_ID_EX), .result(aluResult), .zero(zero));

// EX-WB pipeline 
EX_WB_pipeline exwb(.clk(clk), .rst(rst), .aluResult_alu(aluResult), .regWrite_ID_EX(regWrite_ID_EX), .rd_ID_EX(rd_ID_EX), .aluResult_EX_WB(aluResult_EX_WB), .regWrite_EX_WB(regWrite_EX_WB), .rd_EX_WB(rd_EX_WB)); 


assign writeData2 = aluResult_EX_WB; 

endmodule
