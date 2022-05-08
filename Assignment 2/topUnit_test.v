`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 13:57:09
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
            rst <= 1; 
            clk <= 0; 
            #1
            rst <= 0; 
            
            #2
            rst <= 1; 
                        
            #100
            $finish;
        end     
endmodule
