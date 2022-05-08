`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2022 16:36:59
// Design Name: 
// Module Name: instrFetch_test
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


module instrFetch_test(
    );
reg clk, rst;  
wire [31:0] instrCode
instrFetch fetch(clk, rst, instrCode);

always #5 clk = ~clk; 

initial
begin 
clk<=0; 
rst<=1; 

#1 
rst<=0;

#3 
rst<=0; 


#50
$finish; 
end 
endmodule
