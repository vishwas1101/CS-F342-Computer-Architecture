`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 13:43:50
// Design Name: 
// Module Name: reg_file
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



module reg_file(
    input [4:0] Read_Reg_Num_1,
    input [4:0] Read_Reg_Num_2,
    input [4:0] Write_Reg_Num_1,
    input [31:0] Write_Data,
    output [31:0] Read_Data_1,
    output [31:0] Read_Data_2,
    input RegWrite,
    input Clk,
    input Reset
);

reg [31:0] RegMemory [31:0];
integer i;
always @ (posedge Clk,negedge Reset)
begin  
    if (Reset == 0)
    begin
        RegMemory[5] = 32'h5;   // t0
        RegMemory[6] = 32'h6;   // t1
        RegMemory[7] = 32'h0;   // t2
        RegMemory[8] = 32'h0;   // s0
        RegMemory[9] = 32'h0;   // s1
      
    end
    else
    if ( RegWrite == 1 )
    begin   
         RegMemory[Write_Reg_Num_1] = Write_Data;
    end
end

assign Read_Data_1 = RegMemory[Read_Reg_Num_1];
assign Read_Data_2 = RegMemory[Read_Reg_Num_2];

endmodule

