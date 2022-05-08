`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2022 13:30:07
// Design Name: 
// Module Name: ctrl_unit
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


module ctrl_unit(
    input [31:0] instruction_code,
    output reg [3:0] alu_op, 
    output reg reg_write
    );
    
wire [3:0] func3;

assign func3 = instruction_code[14:12];

always @(*)
begin  
    
    case (func3)
    3'b000: 
        begin   
            {reg_write,alu_op} = (instruction_code[30])? 5'b1_0100 : 5'b1_0010;    // sub or add
         end
    3'b110: 
        begin 
            {reg_write,alu_op} = 5'b1_0001;   // or
        end 
    3'b111: 
        begin 
            {reg_write,alu_op} = 5'b1_0000;   // and
        end 
    3'b001: 
        begin 
            {reg_write,alu_op} = 5'b1_0101;   // sll
        end 
    3'b110: 
        begin
            {reg_write,alu_op} = 5'b1_0110;   // srl
        end 
    endcase
end
endmodule

