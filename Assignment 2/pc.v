`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 09:06:54
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,
    input rst, 
    input [7:0] pcIn, 
    output reg [7:0] pcOut
    );
  
  always @(posedge clk, negedge rst) 
  begin
    if(rst == 0)
        pcOut <= 0;
    else
        pcOut <= pcIn;
  end

endmodule
