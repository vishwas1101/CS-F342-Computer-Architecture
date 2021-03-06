`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2022 11:29:27
// Design Name: 
// Module Name: instrMem
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


module instrMem(
    input [31:0] pc,
    input rst,
    output [31:0] instrCode
    );
reg [7:0] Mem [35:0];  
 
always @(rst)
begin 
    if(!rst)
        begin
            Mem[3]<=8'h01;
            Mem[2]<=8'h49;
            Mem[1]<=8'h83;
            Mem[0]<=8'h33;                       
            Mem[7]<=8'h00;
            Mem[6]<=8'h6e;
            Mem[5]<=8'h83;
            Mem[4]<=8'h93;
            Mem[11]<=8'h40;
            Mem[10]<=8'hc5;
            Mem[9]<=8'h85;
            Mem[8]<=8'h33;
            Mem[15]<=8'h00;
            Mem[14]<=8'hc9;
            Mem[13]<=8'h24;
            Mem[12]<=8'h83;
        end 
end
assign instrCode = {Mem[pc+3], Mem[pc+2], Mem[pc+1], Mem[pc]};

endmodule

            /*add t1, s3, s4
            addi t2, t4, 6
            sub a0, a1, a2
            lw s1, 12(s2)*/
            