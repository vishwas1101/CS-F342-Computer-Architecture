`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2022 10:22:36
// Design Name: 
// Module Name: IF_ID_pipeline
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


module IF_ID_pipeline(
    input clk, 
    input rst, flush,
    input [7:0] instrCode, pc,
    output reg [7:0] instrCode_IF_ID, pc_IF_ID
    );
 
always @(posedge clk, negedge rst) 
    begin 
        if((rst == 0) || (flush == 1))
        begin
            instrCode_IF_ID <= 0; 
            pc_IF_ID <= 0; 
        end 
        else 
        begin
            instrCode_IF_ID <= instrCode; 
            pc_IF_ID <= pc;
        end 
    end 
endmodule
