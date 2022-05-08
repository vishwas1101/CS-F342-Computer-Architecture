`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2022 10:03:58
// Design Name: 
// Module Name: dff_test2
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


module dff_test2(

    );
   
  reg D, clk, rst;
  wire Q;
  
  dff2 d(D, clk, rst, Q);
  
  initial begin
  rst <=0; 
  #2
  rst <=1; 
  end 
  
  initial begin
  clk <=0; 
  repeat(8)
  #5 clk = ~clk;
  $finish;
  end 
  
  initial begin 
  D<=0;
  #10
  D<=1; 
  #22
  D<=0;
  #7
  D<=1;
  end 
  
endmodule
