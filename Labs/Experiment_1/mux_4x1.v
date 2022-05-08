`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 12:07:58
// Design Name: 
// Module Name: mux_4x1
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


module mux_4x1(
    input A,
    input B,
    input C,
    input D,
    input [1:0] S,
    output reg Out
    );
   
always @(S)
    begin 
        case(S)
            2'b00:
                Out <= A; 
            2'b01:
                Out <= B; 
            2'b10: 
                Out <= C; 
            2'b11: 
                Out <= D;
         endcase    
                        
    end 
endmodule
