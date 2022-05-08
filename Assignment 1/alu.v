`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 08:30:43
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
 parameter AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010, SUB = 4'b0100, LEFT = 4'b0011, RIGHT = 4'b0111; 
 
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
            LEFT: 
                result <= A << B; 
            RIGHT: 
                result <= A >> B; 
        endcase   
end 

assign zero = (result==0)? 1: 0; 

endmodule
