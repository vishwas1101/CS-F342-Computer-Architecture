`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 08:27:26
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
            // li 4thReg, 3
            Mem[3]<=8'hfc;
            Mem[2]<=8'h80;
            Mem[1]<=8'h00;
            Mem[0]<=8'h03; 
            
            // li 5thReg, 8                
            Mem[7]<=8'hfc;
            Mem[6]<=8'ha0;
            Mem[5]<=8'h00;
            Mem[4]<=8'h08;
            
            // add 6thReg, 4thReg, 5thReg
            Mem[11]<=8'h00;
            Mem[10]<=8'hc4;
            Mem[9]<=8'h28;
            Mem[8]<=8'h20;
            
            // sub 7thReg, 5thReg, 4thReg
            Mem[15]<=8'h00;
            Mem[14]<=8'he5;
            Mem[13]<=8'h20;
            Mem[12]<=8'h22;
            
            // and 8thReg, 4thReg, 5thReg
            Mem[19]<=8'h01;
            Mem[18]<=8'h04;
            Mem[17]<=8'h28; 
            Mem[16]<=8'h24;
            
            // or 9thReg, 4htReg, 5thReg
            Mem[23]<=8'h01;
            Mem[22]<=8'h24;
            Mem[21]<=8'h28; 
            Mem[20]<=8'h25;
            
            // sll 10thReg, 4thReg, 1
            Mem[27]<=8'h01;
            Mem[26]<=8'h44;
            Mem[25]<=8'h00; 
            Mem[24]<=8'h40;
            
            //srl 11thReg, 4thReg, 1
            Mem[31]<=8'h01;
            Mem[30]<=8'h64;
            Mem[29]<=8'h00; 
            Mem[28]<=8'h42;
        end 
end
assign instrCode = {Mem[pc+3], Mem[pc+2], Mem[pc+1], Mem[pc]};

endmodule
