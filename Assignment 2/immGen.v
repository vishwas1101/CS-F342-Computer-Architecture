`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 09:59:00
// Design Name: 
// Module Name: immGen
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


module immGen(
    input [7:0] instrCode, 
    input [1:0] immSel,
    output reg [7:0] immOut
    );
   
parameter [1:0] JUMP = 2'b11, LOAD = 2'b01; 


always @(*)
    begin 
        case(immSel) 
            LOAD:
                immOut <= {{5{instrCode[2]}}, instrCode[2:0]};
            JUMP: 
                immOut <= {{2{instrCode[5]}}, instrCode[5:0]}; 
            default: 
                immOut <= 8'bx;
        endcase
    end 
endmodule
