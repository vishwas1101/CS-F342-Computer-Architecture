`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2022 11:18:07
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0] A,
    input [31:0] B,
    input [3:0] op,
    output reg [31:0] result,
    output zero
    );
 parameter AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010, SUB = 4'b0100, LESS = 4'b1000; 
 always @(*)
    begin 
        case(op)
            AND: 
                result <= A&B;
            OR: 
                result <= A|B;
            ADD: 
                result <= A+B;
            SUB:
                result <= A-B;
            LESS: 
                result <= (A<B)? 1: 0;
        endcase   
end 
assign zero = (result==0)? 1: 0; 
endmodule
