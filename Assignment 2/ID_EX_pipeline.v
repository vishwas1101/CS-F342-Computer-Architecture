`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 10:22:04
// Design Name: 
// Module Name: ID_EX_pipeline
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


module ID_EX_pipeline(
    input clk, rst,
    input aluControl, 
    input [7:0] data1, data2, pc_IF_ID,
    input [2:0] rd, rs1, rs2,
    input regWrite, 
    input branch,
    input immToReg,
    input [7:0] immOut,
    input [1:0] opcode,
    
    output reg aluControl_ID_EX,
    output reg [7:0] data1_ID_EX, data2_ID_EX, pc_ID_EX,
    output reg [2:0] rd_ID_EX, rs1_ID_EX, rs2_ID_EX,
    output reg regWrite_ID_EX, 
    output reg branch_ID_EX, 
    output reg immToReg_ID_EX,
    output reg [7:0] immOut_ID_EX,
    output reg [1:0] opcode_ID_EX
    );
    
    always @(posedge clk, negedge rst) 
        begin 
            if(rst == 0) 
                begin
                    aluControl_ID_EX <= 0;
                    data1_ID_EX <= 0;
                    data2_ID_EX <= 0; 
                    rd_ID_EX <= 0;
                    regWrite_ID_EX <= 0; 
                    branch_ID_EX <= 0;
                    immToReg_ID_EX <= 0;
                    immOut_ID_EX <= 0;
                    pc_ID_EX <=0;
                    rs1_ID_EX <= 0;
                    rs2_ID_EX <= 0; 
                    opcode_ID_EX <= 0; 
                end 
            else 
                begin 
                    aluControl_ID_EX <= aluControl;
                    data1_ID_EX <= data1;
                    data2_ID_EX <= data2; 
                    rd_ID_EX <= rd;
                    regWrite_ID_EX <= regWrite;
                    branch_ID_EX <= branch;
                    immToReg_ID_EX <= immToReg;
                    immOut_ID_EX <= immOut;
                    pc_ID_EX <= pc_IF_ID;
                    rs1_ID_EX <= rs1; 
                    rs2_ID_EX <= rs2; 
                    opcode_ID_EX <= opcode; 
                end
        end
endmodule
