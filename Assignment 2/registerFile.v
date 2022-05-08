`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 08:57:48
// Design Name: 
// Module Name: registerFile
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


module registerFile(
  input clk,  
  input rst,  
  input [2:0] readReg1, 
  input [2:0] readReg2,
  input [2:0] writeReg,
  input regWrite,
  output reg [7:0] readData1,
  output reg [7:0] readData2,
  input [7:0] writeData
);

reg [7:0] Reg [7:0]; //An array of 8 8bit values
integer i;

always @(*)
  begin
    if(rst == 0)
      begin
        for(i = 0; i < 8; i = i + 1)
          Reg[i] <= i;
      end
    else 
      begin 
        if(regWrite)
          Reg[writeReg] <= writeData;
      end 
  end 

always @(*)
  begin 
    readData1 = Reg[readReg1];
    readData2 = Reg[readReg2];
  end 

endmodule

