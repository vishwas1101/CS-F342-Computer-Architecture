`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 09:20:06
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


 module controlUnit(
    input [1:0] opcode,
    output reg [1:0] immSel, 
    output reg aluControl,
    output reg regWrite, 
    output reg immToReg, 
    output reg branch
    );
  
parameter [1:0] ADD = 2'b01, JUMP = 2'b11, LOAD = 2'b00; 

always @(*)
    begin
        case(opcode)
            LOAD:
                begin
                    immSel = 01;
                    aluControl = 0; 
                    regWrite = 1; 
                    immToReg = 1; 
                    branch = 0;  
                end 
            
            ADD: 
                begin 
                    immSel = 00;
                    aluControl = 1; 
                    regWrite = 1; 
                    immToReg = 0; 
                    branch = 0; 
                end 
           
           JUMP: 
                begin
                    immSel = 11; 
                    aluControl = 0; 
                    regWrite = 0;
                    immToReg = 0;
                    branch = 1; 
                end                           
        endcase 
    end 
endmodule
