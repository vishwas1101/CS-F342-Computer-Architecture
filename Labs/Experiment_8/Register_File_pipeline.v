`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 15:21:37
// Design Name: 
// Module Name: Register_File_pipeline
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

module Register_File_pipeline(
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
always @ (*)
begin  
    if (Reset == 0)
    begin
        RegMemory[0] = 32'h0000_0000;
        RegMemory[1] = 32'h0000_0000;
        RegMemory[2] = 32'h0000_0000;
        RegMemory[3] = 32'h0000_0000;
        RegMemory[4] = 32'h0000_0000;
        RegMemory[5] = 32'h0000_0001;   // t0
        RegMemory[6] = 32'h0000_0002;   // t1
        RegMemory[7] = 32'h0000_0003;   // t2
        RegMemory[8] = 32'h0000_0006;   // s0
        RegMemory[9] = 32'h0000_0007;   // s1
        RegMemory[18] = 32'h0000_0004;   // s2
        RegMemory[19] = 32'h0000_0005;   // s3
        RegMemory[28] = 32'h0000_0008;   // t3
        RegMemory[29] = 32'h0000_0009;   // t4
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
