`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2022 15:35:18
// Design Name: 
// Module Name: Instruction_Fetch
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


module Instruction_Fetch(input Clk, input Reset, output [31:0] Instruction_Code);

reg [31:0]PC;
Instruction_Memory IM(PC,Reset,Instruction_Code);

always@(posedge Clk,negedge Reset)
begin
    if(Reset == 0)
    PC <= 0;
    else
    PC <= PC + 4;
end

endmodule
