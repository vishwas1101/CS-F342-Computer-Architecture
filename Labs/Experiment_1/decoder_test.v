`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 11:53:08
// Design Name: 
// Module Name: decoder_test
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


module decoder_test(

    );
   
 reg A,B; 
 wire Y0, Y1, Y2, Y3; 
 
 decoder d1(A,B,Y0, Y1, Y2, Y3); 
 
 initial 
 begin 
 A<=0;
 B<=0;
 
 #5 
 A<=1;
 B<=1; 
 
 #5 
 A<=0;
 B<=1; 
 
 #5
 A<=1;
 B<=0;
 
 #5
 $finish;
 
 end 
endmodule
