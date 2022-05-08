`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 11:28:56
// Design Name: 
// Module Name: adder_4_bit_test
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


module adder_4_bit_test(

    );
 
reg [3:0] A, B; 
reg Cin;
wire [3:0] S; 
wire Cout;

adder_4_bit add(A, B, Cin, S, Cout); 

initial 
    begin 
        A<=0;
        B<=0; 
        Cin<=0;
        
        #5
        A<=4'b0110;
        B<=4'b1001;
        Cin<=0; 
        
        #5 
        A<=4'b1111;
        B<=4'b1111;
        Cin<=1; 
        
        #5
        $finish; 
    end

endmodule
