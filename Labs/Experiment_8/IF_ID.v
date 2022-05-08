`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 15:29:52
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(Clk,Reset,instrCode,instrCode_IF_ID);

input [31:0] instrCode;
input Clk,Reset;
output reg [31:0] instrCode_IF_ID;

always @ (posedge Clk, negedge Reset)
begin  
    if( Reset == 0 )
        instrCode_IF_ID = 32'b0;
    else
        instrCode_IF_ID = instrCode;
end
endmodule
