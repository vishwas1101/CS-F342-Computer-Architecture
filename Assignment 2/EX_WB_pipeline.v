`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 10:24:24
// Design Name: 
// Module Name: EX_WB_pipeline
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


module EX_WB_pipeline(
    input clk, rst, 
    input [7:0] pc_ID_EX, aluResult, immOut_ID_EX,
    input branch_ID_EX, regWrite_ID_EX, immToReg_ID_EX,  
    input [2:0] rd_ID_EX, 
    input [1:0] opcode_ID_EX,
    
    output reg [7:0] pc_EX_WB, aluResult_EX_WB, immOut_EX_WB, 
    output reg branch_EX_WB, regWrite_EX_WB, immToReg_EX_WB, 
    output reg [2:0] rd_EX_WB,
    output reg [1:0] opcode_EX_WB
    );
 
    always @(posedge clk, negedge rst)
        begin 
            if(rst == 0) 
                begin
                    pc_EX_WB <= 0; 
                    aluResult_EX_WB <= 0; 
                    immOut_EX_WB <= 0; 
                    branch_EX_WB <= 0; 
                    regWrite_EX_WB <= 0; 
                    immToReg_EX_WB <= 0;
                    rd_EX_WB <= 0; 
                    opcode_EX_WB <= 0;
                end 
             else
                begin 
                    pc_EX_WB <= pc_ID_EX; 
                    aluResult_EX_WB <= aluResult; 
                    immOut_EX_WB <= immOut_ID_EX; 
                    branch_EX_WB <= branch_ID_EX; 
                    regWrite_EX_WB <= regWrite_ID_EX; 
                    immToReg_EX_WB <= immToReg_ID_EX;
                    rd_EX_WB <= rd_ID_EX; 
                    opcode_EX_WB <= opcode_ID_EX; 
                end 
        end
endmodule
