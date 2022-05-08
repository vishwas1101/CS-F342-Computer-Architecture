`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2022 11:47:39
// Design Name: 
// Module Name: decoder
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


module decoder(
    input A,
    input B,
    output reg Y0,
    output reg Y1,
    output reg Y2,
    output reg Y3
    );
 
/* wire A_bar, B_bar; 
 
 not n1(A_bar, A);
 not n2(B_bar, B); 
 
 and a1(Y0, A_bar, B_bar);
 and a2(Y1, A, B_bar); 
 and a4(Y3, A, B);
 and a3(Y2, A_bar, B);*/
 
  always@(A, B)
    begin 
       case({B,A})
        2'b00: 
            begin
                Y0<=1;
                Y1<=0;
                Y2<=0;
                Y3<=0;
            end 
        
        2'b01:
            begin
                Y0<=0;
                Y1<=1;
                Y2<=0;
                Y3<=0;
            end   
        
        2'b10:
            begin
                Y0<=0;
                Y1<=0;
                Y2<=1;
                Y3<=0;
            end          
        
        2'b11:
            begin
                Y0<=0;
                Y1<=0;
                Y2<=0;
                Y3<=1;
            end  
       endcase 
    end 
endmodule
