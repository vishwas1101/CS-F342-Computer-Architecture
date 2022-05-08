`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 09:10:54
// Design Name: 
// Module Name: instrMem
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


module instrMem(
  input clk,
  input rst,  // Reset 
  input [7:0] pc,
  output [7:0] instr
);

reg [7:0] instrMem [32:0];

// Defining the instructions in the instrMem in byte addressable manner
always @(*)
  begin
    if(rst == 0)
    begin
//    instrMem[0] = 8'b01001010;
////    instrMem[1] = 8'b11000011;
//    instrMem[2] = 8'b01100101;
//    instrMem[3] = 8'b00010011;
//    instrMem[4] = 8'b00000010; 
//    instrMem[5] = 8'b01000010; 
    
    instrMem[0] = 8'b00100011;
    instrMem[1] = 8'b01110100;
    instrMem[2] = 8'b01110110;
    instrMem[3] = 8'b11000010; //jmp 
    instrMem[4] = 8'b00110100;  
    instrMem[5] = 8'b01100110;
    
    end 
  end

assign instr = instrMem[pc];

endmodule
