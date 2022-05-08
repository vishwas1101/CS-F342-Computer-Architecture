`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 15:35:09
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
input Clk,Reset,
input [3:0] ALUctrl,
input [31:0] Data1,Data2,
input [4:0] Rd,
input RegWrite,
output reg [3:0] ALUctrl_ID_EX,
output reg [31:0] Data1_ID_EX,Data2_ID_EX,
output reg [4:0] Rd_ID_EX,
output reg RegWrite_ID_EX
);

always @ (posedge Clk, negedge Reset)
begin  
    if( Reset == 0 ) begin
        ALUctrl_ID_EX = 4'b0;
        Data1_ID_EX = 32'b0;
        Data2_ID_EX = 32'b0;
        Rd_ID_EX = 5'b0;
        RegWrite_ID_EX = 1'b0;
        end
    else begin
        ALUctrl_ID_EX = ALUctrl;
        Data1_ID_EX = Data1;
        Data2_ID_EX = Data2;
        Rd_ID_EX = Rd;
        RegWrite_ID_EX = RegWrite;
        end
end
endmodule

