`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 12:35:19
// Design Name: 
// Module Name: forwardingUnit
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


module forwardingUnit(
    input [2:0] rs1_ID_EX, rs2_ID_EX, 
    input [2:0] rd_EX_WB, 
    input [7:0] data1_ID_EX, data2_ID_EX, aluResult_EX_WB, immOut_EX_WB,
    input regWrite_EX_WB, 
    input [1:0] opcode_EX_WB,
   
    output reg [2:0] forward,
    output reg [7:0] aluIn1, 
    output reg [7:0] aluIn2
    );
    
    always @(*)
        begin 
            
            if((regWrite_EX_WB == 1) && (rd_EX_WB == rs1_ID_EX) && (rd_EX_WB == rs2_ID_EX) && (opcode_EX_WB == 2'b01))
                begin 
                forward <= 3'b101; 
                aluIn1 = aluResult_EX_WB; 
                aluIn2 = aluResult_EX_WB; 
                end 
            else if((regWrite_EX_WB == 1) && (rd_EX_WB == rs1_ID_EX) && (opcode_EX_WB == 2'b01)) 
                begin 
                forward <= 3'b001; 
                aluIn1 <= aluResult_EX_WB; 
                aluIn2 <= data2_ID_EX;
                end 
            else if((regWrite_EX_WB == 1) && (rd_EX_WB == rs2_ID_EX) && (opcode_EX_WB == 2'b01)) 
                begin
                forward <= 3'b010;
                aluIn1 <= data1_ID_EX; 
                aluIn2 <= aluResult_EX_WB;
                end 
            else if((regWrite_EX_WB == 1) && (rd_EX_WB == rs1_ID_EX) && (opcode_EX_WB == 2'b00))
                begin 
                forward <= 3'b011; 
                aluIn1 <= immOut_EX_WB; 
                aluIn2 <= data2_ID_EX;
                end 
            else if((regWrite_EX_WB == 1) && (rd_EX_WB == rs2_ID_EX) && (opcode_EX_WB == 2'b00))
                begin 
                forward <= 3'b100; 
                aluIn1 = data1_ID_EX; 
                aluIn2 = immOut_EX_WB;
                end 
            else 
                begin 
                forward <= 3'b000; 
                aluIn1 = data1_ID_EX; 
                aluIn2 = data2_ID_EX;
                end
                
        end 
       
endmodule
