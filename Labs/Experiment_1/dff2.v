`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2022 10:01:52
// Design Name: 
// Module Name: dff2
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


module dff2(
    input D,
    input clk,
    input rst,
    output reg Q
    );
   
  always @(posedge clk, negedge rst) 
    begin
    if(rst==0)
        Q<=0;
    else 
        Q<=D; 
    end 
endmodule
