`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 11:12:44
// Design Name: 
// Module Name: adder_1_bit_test
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


module adder_1_bit_test(

    );
 
reg A, B, Cin;
wire S, Cout;

adder_1_bit add(A, B, Cin, S, Cout); 

initial 
    begin 
        A<=0;
        B<=0; 
        Cin<=0;
        
        #5
        A<=1;
        B<=0;
        Cin<=1; 
        
        #5 
        A<=1;
        B<=1;
        Cin<=1; 
        
        #5
        $finish; 
    end
endmodule
