`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2022 11:29:20
// Design Name: 
// Module Name: alu_test
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


module alu_test(

    );
 
reg [31:0] A, B;
reg [3:0] op;
wire zero;
wire [31:0] result; 

alu a(A, B, op, result, zero);

initial begin
A<=23; 
B<=42;
op<=4'b0000;

#20
A<=23; 
B<=42;
op<=4'b0001;

#20
A<=23; 
B<=42;
op<=4'b0010;

#20
A<=23; 
B<=42;
op<=4'b0100;

#20
A<=23; 
B<=42;
op<=4'b1000;

#20
A<=42; 
B<=23;
op<=4'b1000;

#20
A<=42; 
B<=23;
op<=4'b0100;

#20
$finish;
end  
endmodule
