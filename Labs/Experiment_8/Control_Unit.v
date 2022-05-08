`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 00:32:49
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(instrCode,ALUctrl,RegWrite);
input [31:0] instrCode;
output reg RegWrite;
output reg [3:0] ALUctrl;
reg instr30;
reg [3:0] func3;

always @ ( instrCode )
begin  
    assign instr30 = instrCode[30];
    assign func3 = instrCode[14:12];
    case (func3)
    3'b000: begin   
            {RegWrite,ALUctrl} = (instr30)? 5'b1_0100 : 5'b1_0010;    // sub or add
            end
    3'b110: {RegWrite,ALUctrl} = 5'b1_0001;   // or
    3'b111: {RegWrite,ALUctrl} = 5'b1_0000;   // and
    3'b001: {RegWrite,ALUctrl} = 5'b1_0101;   // sll
    3'b101: {RegWrite,ALUctrl} = 5'b1_0110;   // srl
    endcase
end
endmodule
