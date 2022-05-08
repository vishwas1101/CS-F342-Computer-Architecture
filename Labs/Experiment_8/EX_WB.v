`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 15:42:39
// Design Name: 
// Module Name: EX_WB
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

module EX_WB(
input Clk,Reset,
input RegWrite_ID_EX,
input [31:0] ALUresult,
input [4:0] Rd_ID_EX,
output reg RegWrite_EX_WB,
output reg [31:0] ALUresult_EX_WB,
output reg [4:0] Rd_EX_WB
);

always @ (posedge Clk, negedge Reset)
begin  
    if( Reset == 0 ) begin
        RegWrite_EX_WB = 1'b0;
        ALUresult_EX_WB = 32'b0;
        Rd_EX_WB = 5'b0;
        end
    else begin
        RegWrite_EX_WB = RegWrite_ID_EX;
        ALUresult_EX_WB = ALUresult;
        Rd_EX_WB = Rd_ID_EX;
        end
end
endmodule
