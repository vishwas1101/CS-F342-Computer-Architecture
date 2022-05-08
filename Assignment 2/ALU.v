`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 08:52:29
// Design Name: 
// Module Name: ALU
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


module ALU(
  input  aluControl,
  input [7:0] data1,
  input [7:0] data2,
  output reg [7:0] aluResult
);

//aluControl tells if you need to add or not 
always @(*)
  begin
    if(aluControl)
        aluResult = data1 + data2;
  end

endmodule
