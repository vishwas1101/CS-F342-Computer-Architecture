`include "registerBank.v"
`include "instructionMemory.v"
`include "ALU.v"
`include "dataMemory.v"
`include "ALUControl.v"
`include "controlUnit.v"
`include "immGen.v"
`include "programCounter.v"

module CPU (

  input wire clk,    // Clock
  input wire rst_n  // Reset

);

wire [31:0] instr;
wire [31:0] pcIn, pcOut;
wire pcSrc, zero, branch;
assign pcSrc = branch & zero;

wire [31:0] readRegData1, readRegData2, writeRegData; 
wire [4:0] rs1, rs2, rd;
wire regWrite;
assign rs1 = instr[19:15];
assign rs2 = instr[24:20];
assign rd = instr[11:7];

wire [31:0] immOut, immShift;
wire [1:0] immSel;
assign immShift= immOut << 1;

wire aluSrc;
wire [3:0] aluCtrl;
wire [31:0] aluResult, aluCtrl2;
wire [1:0] aluOp;

wire [31:0] memData;
wire memToReg;
wire memRead; 
wire memWrite;

// Instruction Fetch Stage
assign pcIn = pcSrc? (pcOut + immShift): (pcOut + 4);
programCounter pc (.clk(clk), .rst_n(rst_n), .programCounterIn(pcIn), .programCounterOut(pcOut));
instructionMemory instrMem (.clk(clk), .rst_n(rst_n), .programCounter(pcOut), .instr(instr));

// Instruction Decode stage
controlUnit ctrlUnit (.opcode(instr[6:0]), .immSel(immSel), .aluOp(aluOp), .regWrite(regWrite), .memToReg(memToReg), .aluSrc(aluSrc), .memRead(memRead), .memWrite(memWrite), .branch(branch));
registerBank regFile (.clk(clk), .rst_n(rst_n), .readReg1(rs1), .readReg2(rs2), .readData1(readRegData1), .readData2(readRegData2), .writeReg(rd), .regWrite(regWrite), .writeData(writeRegData));
immGen immgen (.instr(instr), .immSel(immSel), .immOut(immOut));

// Execution Stage
assign aluCtrl2 = aluSrc? immOut : readRegData2;
ALUControl aluControl (.aluOp(aluOp), .funct3(instr[14:12]), .funct7(instr[31:25]), .aluControl(aluCtrl));
ALU alu (.aluControl(aluCtrl), .data1(readRegData1), .data2(aluCtrl2), .aluResult(aluResult), .zero(zero));

// Memory Stage
dataMemory mem (.clk(clk), .rst_n(rst_n), .addr(aluResult), .writeData(readRegData2), .readData(memData), .memWrite(memWrite), .memRead(memRead));

// Write Back Stage
assign writeRegData = memToReg ? memData : aluResult;


endmodule