`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2022 11:52:38
// Design Name: 
// Module Name: instrMem_test
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


module instrMem_test();
reg [31:0] pc; 
wire [31:0] instrCode;
reg rst;
instrMem uut(pc, rst, instrCode);
initial 
    begin 
        rst = 1;
        pc = 0; 
        #1 
        rst = 0;    
        #2 
        rst = 1; 
        #10
        pc = 4;   
        #10 
        pc = 8;  
        #10 
        pc = 12; 
        #10 
        $finish; 
    end 
endmodule
