`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 11:24:29
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

    wire [7:0] instrCode, pcIn, pcOut, immOut, pc_EX_WB, immOut_EX_WB;
    wire branch, branch_EX_WB, branch_ID_EX;
    wire [7:0] pc_ID_EX;
    wire [7:0] jmpAddr;
    wire flush; 
    assign flush = branch; 
    
    assign pcIn = branch? (jmpAddr):(pcOut + 1);
//    assign pcIn = pcOut + 1; 
    
    //Instruction fetch
    pc programCounter(clk, rst, pcIn, pcOut); 
    instrMem IM(clk, rst, pcOut, instrCode); 
    
    wire [7:0] instrCode_IF_ID, pc_IF_ID;
    
    // IF-ID pipeline
    IF_ID_pipeline ifid(clk, rst, flush, instrCode, pcOut, instrCode_IF_ID, pc_IF_ID); 
    
    //Instruction decode
    wire [1:0] opcode, immSel; 
    wire [2:0] readReg1, readReg2, writeReg;
    wire regWrite, immToReg, aluControl, regWrite_EX_WB; 
    wire [7:0] readData1, readData2, writeData_EX_WB; 
    wire [2:0] rd_EX_WB;
    
    assign opcode = instrCode_IF_ID[7:6];
    assign readReg2 = instrCode_IF_ID[2:0]; 
    assign readReg1 = instrCode_IF_ID[5:3]; 
    assign writeReg = instrCode_IF_ID[5:3]; 
    
    registerFile regBank(clk, rst, readReg1, readReg2, rd_EX_WB, regWrite_EX_WB, readData1, readData2, writeData_EX_WB); 
    controlUnit ctrlSignal(opcode, immSel, aluControl, regWrite, immToReg, branch); 
    immGen imm(instrCode_IF_ID, immSel, immOut); 
    
    assign jmpAddr = pc_IF_ID + immOut; 
    
    wire aluControl_ID_EX;
    wire [2:0] rd_ID_EX, rs1_ID_EX, rs2_ID_EX;
    wire regWrite_ID_EX;
    wire immToReg_ID_EX;
    wire [7:0] immOut_ID_EX, data1_ID_EX, data2_ID_EX;
    wire [1:0] opcode_ID_EX; 
    
    //ID-EX pipeline 
    ID_EX_pipeline idex(clk, rst, aluControl, readData1, readData2, jmpAddr, writeReg, readReg1, readReg2, regWrite, branch, immToReg, immOut, opcode,
                    aluControl_ID_EX, data1_ID_EX, data2_ID_EX, pc_ID_EX, rd_ID_EX, rs1_ID_EX, rs2_ID_EX, regWrite_ID_EX, branch_ID_EX, immToReg_ID_EX, immOut_ID_EX, opcode_ID_EX); 
    
    // Execute  
    wire [7:0] aluResult;
    wire [7:0] aluIn1, aluIn2; 
       //forwarding
    wire [2:0] forward;
    wire [7:0] aluResult_EX_WB;
    wire [1:0] opcode_EX_WB; 

    forwardingUnit fwd(rs1_ID_EX, rs2_ID_EX, rd_EX_WB, data1_ID_EX, data2_ID_EX, aluResult_EX_WB, immOut_EX_WB, regWrite_EX_WB, opcode_EX_WB, forward, aluIn1, aluIn2); 
    ALU ex(aluControl_ID_EX, aluIn1, aluIn2, aluResult); 
   
    wire immToReg_EX_WB; 
    
    // EX-WB stage
    EX_WB_pipeline exwb(clk, rst, pc_ID_EX, aluResult, immOut_ID_EX, branch_ID_EX, regWrite_ID_EX, immToReg_ID_EX, rd_ID_EX, opcode_ID_EX,
                        pc_EX_WB, aluResult_EX_WB, immOut_EX_WB, branch_EX_WB, regWrite_EX_WB, immToReg_EX_WB, rd_EX_WB, opcode_EX_WB); 
                        
   //Writeback 
   assign writeData_EX_WB = immToReg_EX_WB? immOut_EX_WB: aluResult_EX_WB; 
     
 
    
endmodule
