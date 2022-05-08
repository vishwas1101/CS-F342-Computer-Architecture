`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.02.2022 16:15:06
// Design Name: 
// Module Name: adder_4_bit
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


module adder_4_bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
    );
   
wire carry [0:2];

adder_1_bit a0(A[0], B[0], Cin, S[0], carry[0]);
adder_1_bit a1(A[1], B[1], carry[0], S[1], carry[1]);
adder_1_bit a2(A[2], B[2], carry[1], S[2], carry[2]);
adder_1_bit a3(A[3], B[3], carry[2], S[3], Cout);
endmodule
