`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 13:21:29
// Design Name: 
// Module Name: processor
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


module processor(
    input clk, 
    input rst
    );
   
wire [31:0] instruction_code, alu_result, read_data_1, read_data_2;
wire reg_write, zero;
wire [3:0] alu_op;

wire [4:0] rs1, rs2, rd; 

assign rs1 = instruction_code[19:15];
assign rs2 = instruction_code[24:20]; 
assign rd = instruction_code[11:7]; 

instr_fetch instrFetch(clk, rst,instruction_code);
reg_file rf(rs1, rs2, rd, alu_result, read_data_1, read_data_2); 
ctrl_unit ctrl(instruction_code, alu_op, reg_write); 
alu a(read_data_1, read_data_2, alu_op, alu_result, zero); 

endmodule
