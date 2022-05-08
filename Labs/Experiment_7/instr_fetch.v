`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 13:26:36
// Design Name: 
// Module Name: instr_fetch
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


module instr_fetch(
    input clk, 
    input rst, 
    output [31:0] instruction_code
    );

reg [31:0] PC;

Instruction_Memory IM(PC, rst, instruction_code);

always@(posedge clk,negedge rst)
begin
    if(rst == 0)
    PC <= 0;
    else 
    PC <= PC + 4;
end

endmodule
