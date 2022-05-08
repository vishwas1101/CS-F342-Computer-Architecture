`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 10:08:00
// Design Name: 
// Module Name: controlUnit
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


module controlUnit(instrCode,ALUop,RegWrite);
input [31:0] instrCode;
output reg RegWrite;
output reg [3:0] ALUop;
reg instr30;
reg [3:0] func3;

always @ ( instrCode )
begin  
    assign instr30 = instrCode[30];
    assign func3 = instrCode[14:12];
    case (func3)
    3'b000: begin   
            {RegWrite,ALUop} = (instr30)? 5'b1_0100 : 5'b1_0010;    // sub or add
            end
    3'b110: 
            begin 
            {RegWrite,ALUop} = 5'b1_0001;
            end   // or
    3'b111: begin 
            {RegWrite,ALUop} = 5'b1_0000;   // and
            end 
    3'b001: 
            begin 
            {RegWrite,ALUop} = 5'b1_0101;
            end    // sll
    3'b110: begin
            {RegWrite,ALUop} = 5'b1_0110;
            end  // srl
    endcase
end
endmodule
