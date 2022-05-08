`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 12:11:00
// Design Name: 
// Module Name: mux_4x1_test
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


module mux_4x1_test(

    );
   
reg A, B, C, D;
reg [1:0] S;
wire out;

mux_4x1 d(A,B,C,D,S, out);

initial 
begin 

A<=1; 
B<=0; 
C<=1; 
D<=0;
S<=2'b00;

#5
S<=2'b01;

#5
S<=2'b10;

#5
$finish;
end

endmodule
