`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 12:13:04
// Design Name: 
// Module Name: topUnit_test
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


module topUnit_test(

    );

reg clk, rst; 

topUnit uut(clk, rst); 

always #5 clk = ~clk; 

initial 
    begin 
        clk <= 0;
        rst <= 1;
        
        #1
        rst <= 0; 
        
        #3
        rst <= 1;
        
        #100
        $finish;
    end 
endmodule
