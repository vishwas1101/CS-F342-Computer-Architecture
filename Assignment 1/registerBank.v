`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 08:31:53
// Design Name: 
// Module Name: registerBank
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


module registerBank(
    input clk,
    input rst, 
    input regWrite, 
    input [4:0] readReg1, 
    input [4:0] readReg2, 
    input [4:0] writeReg,
    input [31:0] writeData,
    output [31:0] readRegData1, 
    output [31:0] readRegData2
  
    );
   
reg [31:0] regMem [31:0]; 

assign readRegData1 = regMem[readReg1]; 
assign readRegData2 = regMem[readReg2];

always @(posedge clk, negedge rst) 
    begin
        if(rst == 0)
            begin 
                regMem[0] <= 32'b0; 
                regMem[1] <= 32'b0; 
                regMem[2] <= 32'b0; 
                regMem[3] <= 32'b0; 
                regMem[4] <= 32'b0; 
                regMem[5] <= 32'b0; 
                regMem[6] <= 32'b0; 
                regMem[7] <= 32'b0; 
                regMem[8] <= 32'b0; 
                regMem[9] <= 32'b0; 
                regMem[10] <= 32'b0; 
                regMem[11] <= 32'b0; 
                regMem[12] <= 32'b0; 
                regMem[13] <= 32'b0; 
                regMem[14] <= 32'b0; 
                regMem[15] <= 32'b0; 
                regMem[16] <= 32'b0; 
                regMem[17] <= 32'b0; 
                regMem[18] <= 32'b0; 
                regMem[19] <= 32'b0;
                regMem[20] <= 32'b0;
                regMem[21] <= 32'b0;
                regMem[22] <= 32'b0;
                regMem[23] <= 32'b0;
                regMem[24] <= 32'b0;
                regMem[25] <= 32'b0;
                regMem[26] <= 32'b0;
                regMem[27] <= 32'b0;
                regMem[28] <= 32'b0;
                regMem[29] <= 32'b0;
                regMem[30] <= 32'b0;
                regMem[31] <= 32'b0; 
            end  
        else if(regWrite) 
            begin 
                regMem[writeReg] <= writeData; 
            end 
    end 

endmodule
