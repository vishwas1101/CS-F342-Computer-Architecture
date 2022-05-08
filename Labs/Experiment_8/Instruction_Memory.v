`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2022 15:05:21
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(PC,Reset,Instruction_Code);
input [31:0]PC;
input Reset;
output [31:0] Instruction_Code;

reg [7:0]Mem[35:0]; // Each location is 8 bits, and 36 such locations exist

assign Instruction_Code = {Mem[PC+3],Mem[PC+2],Mem[PC+1],Mem[PC]};

always@(Reset)
begin
if (Reset == 0)
    begin
    Mem[3] = 8'h00; Mem[2] = 8'h73; Mem[1] = 8'h02; Mem[0] = 8'hb3;  // add t0,t1,t2
    Mem[7] = 8'h40; Mem[6] = 8'h94; Mem[5] = 8'h03; Mem[4] = 8'hb3;  // sub t2,s0,s1
    Mem[11] = 8'h00; Mem[10] = 8'h64; Mem[9] = 8'h14; Mem[8] = 8'hb3;  // sll s1,s0,t1
//    Mem[7] = 8'h01; Mem[6] = 8'hc3; Mem[5] = 8'he4; Mem[4] = 8'h33;  // or s0,t0,t1
//    Mem[11] = 8'h00; Mem[10] = 8'h73; Mem[9] = 8'h14; Mem[8] = 8'hb3;  // sll s1,t1,t2
//    Mem[15] = 8'h41; Mem[14] = 8'hc9; Mem[13] = 8'h89; Mem[12] = 8'h33;  // sub s2,s3,t3
//    Mem[19] = 8'h01; Mem[18] = 8'hde; Mem[17] = 8'h73; Mem[16] = 8'h33;  // and t1,t3,t4
//    Mem[23] = 8'h00; Mem[22] = 8'h7e; Mem[21] = 8'h5e; Mem[20] = 8'h33;  // srl t3,t3,t2
    
    end
end
endmodule
