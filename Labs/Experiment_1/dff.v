`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 12:25:47
// Design Name: 
// Module Name: dff
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


module dff(
    input D,
    input En,
    output Q,
    output Qbar
    );
  
 wire Dn, W1, W2; 
 
 not n1(Dn, D);
 
 nand n2(W1, D, En);
 nand n3(W2, Dn, En);
 
 nand n4(Q, W1, Qbar);
 nand n5(Qbar, W2, Q);
 
 
endmodule
