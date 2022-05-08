`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 09:09:13
// Design Name: 
// Module Name: dataMemory
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


// THIS MODULE IS NOT REQUIRED FOR THE CURRENT SET OF INSTRUCTION IMPLEMENTED. 
// IT IS ONLY ADDED FOR THE SAKE OF COMPLETION OF THE ENTIRE DATAPATH.

module dataMemory (
  input clk,  
  input rst,  
  input memWrite,
  input memRead,
  input [31:0] addr,
  input [31:0] writeData,
  output [31:0] readData

);

reg [7:0] dataMem [255:0];

integer i;

always@(posedge clk, posedge rst)
  begin
    if(rst == 0)
      dataMem[i] <= 8'b0;
    else 
      begin 
        if(memWrite)
          begin
            dataMem[addr] <= writeData[7:0]; 
            dataMem[addr+1] <= writeData[15:8];
            dataMem[addr+2] <= writeData[23:16];
            dataMem[addr+3] <= writeData[31:24];
          end 
      end 
  end 

assign readData = (memRead)? {dataMem[addr+3], dataMem[addr+2], dataMem[addr+1], dataMem[addr+0]} : 32'bx;

endmodule
