`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 11:10:14
// Design Name: 
// Module Name: adder_1_bit
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


module adder_1_bit(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
    );
 
 assign S = A^B^Cin; 
 assign Cout = (A&B)|(B&Cin)|(Cin&A);
 
 
endmodule
