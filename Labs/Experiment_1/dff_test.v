`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 12:29:03
// Design Name: 
// Module Name: dff_test
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


module dff_test(

    );
   
reg D, En;
wire Q, Qbar; 

dff d(D, En, Q, Qbar); 

initial begin
En = 0; #5 En = 1; #10 En = 0; #10 En = 1; #10 En = 0; #5 $finish;
end 

initial begin
D = 0; #7 D=1; #5 D=0; #8 D=1; #10 D=0; #3 D=1; #7;
end 


endmodule
