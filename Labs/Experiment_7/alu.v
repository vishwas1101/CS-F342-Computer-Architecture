`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 13:41:39
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
    input [3:0] Control, 
    output reg [31:0] Result, 
    output reg Zero);

always @ (A,B,Control)
begin
	case (Control)
	4'b0000: 
	       Result = A & B;
	4'b0001: 
	       Result = A | B;
	4'b0010: 
	       Result = A + B;
	4'b0100: 
	       Result = A - B;
	4'b0101: 
	       Result = A << B;
	4'b0110: 
	       Result = A >> B;
	4'b1000: 
	       Result = (A < B) ? 1 : 0;
	endcase
	if (Result == 0) Zero = 1; else Zero = 0;
end
endmodule
