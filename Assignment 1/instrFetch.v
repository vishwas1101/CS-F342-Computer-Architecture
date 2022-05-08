`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 08:26:30
// Design Name: 
// Module Name: instrFetch
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


module instrFetch(
    input clk,
    input rst,
    output [31:0] instrCode
    );
reg [31:0] pc; 

instrMem mem(pc, rst, instrCode); 

always @(posedge clk, negedge rst)
    begin 
        if (rst==0)
            pc <=0; 
        else 
            pc <= pc + 4; 
    end 
endmodule

