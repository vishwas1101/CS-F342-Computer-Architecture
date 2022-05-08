`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 14:09:23
// Design Name: 
// Module Name: processor_test
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


module processor_test(

    );
    
reg clk, rst; 

Rtype_processor uut(clk, rst); 

always #5 clk = ~clk;
 
initial 
    begin
    clk <= 0; 
    rst <= 1; 
    
    #1 
    rst <= 0; 
    
    #2
    rst <= 1; 
   
    #50 
    $finish;
    end
endmodule
