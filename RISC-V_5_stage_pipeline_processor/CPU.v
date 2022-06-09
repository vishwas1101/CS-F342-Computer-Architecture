`include "registerBank.v"
`include "instructionMemory.v"
`include "ALU.v"
`include "dataMemory.v"
`include "ALUControl.v"
`include "controlUnit.v"
`include "immGen.v"
`include "programCounter.v"
`include "IF_ID_stage.v"
`include "ID_EX_stage.v"
`include "EX_MEM_stage.v"
`include "MEM_WB_stage.v"
`include "forwardingUnit.v"
`include "hazardDetect.v"

module CPU (

  input wire clk,    // Clock
  input wire rst_n  // Reset

);

wire [31:0] instr;
wire [31:0] pcIn, pcOut;
wire pcSrc, zero, branch;
assign pcSrc = branch & zero;

wire [31:0] immOut, immShift;
assign immShift= immOut << 1;

wire [1:0] forwardA, forwardB;
wire enablePc, enableCtrlSig, ifIdWrite;

/*
wire [31:0] readRegData1, readRegData2, writeRegData; 
wire [4:0] rs1, rs2, rd;
wire regWrite;
assign rs1 = instr[19:15];
assign rs2 = instr[24:20];
assign rd = instr[11:7];

wire aluSrc;
wire [3:0] aluCtrl;
wire [31:0] aluResult, aluCtrl2;
wire [1:0] aluOp;

wire [31:0] memData;
wire memToReg;
wire memRead; 
wire memWrite;
*/
wire regEqual, flush, isBranch;

// Instruction Fetch Stage
assign pcIn = pcSrc? (pcOut + immShift) : (pcOut + 4);
programCounter pc (.clk(clk), 
                   .rst_n(rst_n), 
                   .clk_en(enablePc), 
                   .programCounterIn(pcIn), 
                   .programCounterOut(pcOut)
                   );

instructionMemory instrMem (.clk(clk), 
                            .rst_n(rst_n), 
                            .programCounter(pcOut), 
                            .instr(instr)
                            );

// IF/ID pipeline stage 
wire [31:0] idPc, idInstr;

assign regEqual = (idReadRegData1 == idReadRegData2)? 1: 0;
assign isBranch = (instr[6:0]==7'b1100011)? 1:0;
assign flush = regEqual & isBranch;

IF_ID_stage IF_ID (.clk(clk), 
                   .rst_n(rst_n), 
                   .flush(flush), 
                   .enable(ifIdWrite), 
                   .ifInstr(instr), 
                   .ifPc(pcOut), 
                   .idInstr(idInstr), 
                   .idPc(idPc)
                   );

// Instruction Decode stage
wire idAluSrc;
wire [3:0] idAluCtrl;
wire [31:0] idAluResult, idAluCtrl2;
wire [1:0] idAluOp;
wire [1:0] idImmSel;
wire [4:0] idRs1, idRs2, idRd;
assign idRs1 = idInstr[19:15];
assign idRs2 = idInstr[24:20];
assign idRd = idInstr[11:7];
wire [4:0] wbRd;
wire [6:0] idFunct7;
wire [2:0] idfunct3; 
wire [6:0] idOpcode;
assign idFunct7 = idInstr[19:15];
assign idfunct3 = idInstr[14:12];
assign idOpcode = idInstr[6:0];
wire [31:0] idReadRegData1, idReadRegData2, wbWriteRegData; 
wire idRegWrite, wbRegWrite;
wire idBranch;
wire [31:0] idImmOut;
wire [31:0] wbMemData;
wire idMemToReg;
wire idMemRead; 
wire idMemWrite;
wire [13:0] idCtrlSig_enable, idCtrlSig;
assign idCtrlSig_enable = {idAluCtrl, idImmSel, idAluOp, idRegWrite, idAluSrc, idMemRead, idMemWrite, idMemToReg, idBranch};
assign idCtrlSig = enableCtrlSig ? idCtrlSig_enable : 0;

controlUnit ctrlUnit (.opcode(idInstr[6:0]), 
                      .immSel(idImmSel), 
                      .aluOp(idAluOp), 
                      .regWrite(idRegWrite), 
                      .memToReg(idMemToReg), 
                      .aluSrc(idAluSrc), 
                      .memRead(idMemRead), 
                      .memWrite(idMemWrite), 
                      .branch(idBranch)
                      );

ALUControl aluControl (.aluOp(idAluOp), 
                       .funct3(idInstr[14:12]), 
                       .funct7(idInstr[31:25]), 
                       .aluControl(idAluCtrl)
                       );

registerBank regFile (.clk(clk), 
                      .rst_n(rst_n), 
                      .readReg1(idRs1),  
                      .readReg2(idRs2), 
                      .readData1(idReadRegData1),
                      .readData2(idReadRegData2), 
                      .writeReg(wbRd), 
                      .regWrite(wbRegWrite), 
                      .writeData(wbWriteRegData)
                      );

immGen immgen (.instr(idInstr), 
               .immSel(idImmSel), 
               .immOut(idImmOut)
               );

wire [31:0] exPc;
wire [13:0] exCtrlSig;
wire [31:0] exReadRegData1, exReadRegData2, exImm;
wire [4:0] exRs1, exRs2, exRd;

ID_EX_stage ID_EX (.clk(clk), 
                   .rst_n(rst_n), 
                   .flush(flush), 
                   .idRegData1(idReadRegData1), 
                   .idRegData2(idReadRegData2), 
                   .idPc(idPc), 
                   .idImm(idImmOut), 
                   .idRs1(idRs1), 
                   .idRs2(idRs2), 
                   .idRd(idRd), 
                   .idCtrlSig(idCtrlSig), 
                   .exRegData1(exReadRegData1), 
                   .exRegData2(exReadRegData2), 
                   .exPc(exPc), 
                   .exImm(exImm), 
                   .exRs1(exRs1), 
                   .exRs2(exRs2), 
                   .exRd(exRd), 
                   .exCtrlSig(exCtrlSig)
                   );

// Data Forwarding
reg [31:0] aluIn1, aluIn21;
wire [31:0] aluIn2;

always @(*)
  begin
    case(forwardA)
      2'b00: aluIn1 = exReadRegData1;
      2'b01: aluIn1 = wbWriteRegData;
      2'b10: aluIn1 = memAlu[31:0];
      default: aluIn1 = exReadRegData1;
    endcase // forwardA
   
    case(forwardB)
      2'b00: aluIn21 = exReadRegData2;
      2'b01: aluIn21 = wbWriteRegData;
      2'b10: aluIn21 = memAlu[31:0];
      default: aluIn21 = exReadRegData2;
    endcase
  end

assign aluIn2 = (exCtrlSig[4]) ? exImm : aluIn21;

// Execution Stage
wire exZero;
wire [31:0] aluResult;

ALU alu (.aluControl(exCtrlSig[13:10]), 
         .data1(aluIn1), 
         .data2(aluIn2), 
         .aluResult(aluResult), 
         .zero(exZero)
         );

wire [31:0] exPc_temp = (exPc) + (exImm << 1);
wire [9:0] memCtrlSig;
wire [31:0] memRegData2;
wire [31:0] memAlu;
wire [4:0] memRd;
wire [31:0] memPc;

EX_MEM_stage EX_MEM (.clk(clk), 
                     .flush(flush), 
                     .rst_n(rst_n), 
                     .exCtrlSig(exCtrlSig[9:0]), 
                     .exPc(exPc_temp), 
                     .exAluRes(aluResult), 
                     .exRegData2(aluIn21), 
                     .exRd(exRd), 
                     .memPc(memPc), 
                     .memRd(memRd), 
                     .memAluRes(memAlu), 
                     .memRegData2(memRegData2), 
                     .memCtrlSig(memCtrlSig)
                     );

// Memory Stage
wire [31:0] memMemVal; 
dataMemory mem (.clk(clk), 
                .rst_n(rst_n), 
                .addr(memAlu), 
                .writeData(memRegData2), 
                .readData(memRegData2), 
                .memWrite(memCtrlSig[2]), 
                .memRead(memCtrlSig[3])
                );

wire [9:0] wbCtrlSig;
wire [31:0] wbMemVal, wbAlu;

MEM_WB_stage MEM_WB (.clk(clk), 
                     .rst_n(rst_n),   
                     .memCtrlSig(memCtrlSig), 
                     .memAluRes(memAlu), 
                     .memMemValue(memMemVal), 
                     .memRd(memRd), 
                     .wbCtrlSig(wbCtrlSig), 
                     .wbMemValue(wbMemVal), 
                     .wbAluRes(wbAlu), 
                     .wbRd(wbRd)
                     );

assign wbRegWrite = wbCtrlSig[5];
assign wbWriteRegData = (wbCtrlSig[1]) ? wbMemVal : wbAlu;

forwardingUnit forwarding (.exMem_RegWrite(memCtrlSig[5]), 
                           .idEx_Rs1(exRs1), 
                           .idEx_Rs2(exRs2), 
                           .exMem_Rd(memRd), 
                           .memWb_RegWrite(wbCtrlSig[5]), 
                           .memWb_Rd(wbRd), 
                           .forwardA(forwardA), 
                           .forwardB(forwardB)
                           );

wire hazard;


hazardDetect hazardDetect (.idEx_memRead(exCtrlSig[3]), 
                           .ifIdRs1(idRs1), 
                           .ifIdRs2(idRs2), 
                           .idExRd(exRd), 
                           .hazard(hazard)
                           );

assign enablePc = hazard;
assign enableCtrlSig = hazard;
assign enableCtrlSig = hazard;
 
endmodule