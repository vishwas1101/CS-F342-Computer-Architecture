`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 08:51:07
// Design Name: 
// Module Name: immGen
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


    module immGen(
        input [31:0] instr,
        input [1:0] immSel, 
        output reg [31:0] immOut
        );
        
    parameter [2:0] I_type = 2'b00, S_type = 2'b01, B_type = 2'b10, R_type = 2'b11;
    // The S_type and B_type are not being used, have just added it for future extension.
    // Moreover, R-type now has new immediate values in the shift left and shift right instructions
    
    always @(*)
        begin
            case(immSel) 
                I_type: 
                    immOut <= {{11{instr[20]}}, instr[20:0]};  
                R_type: 
                    immOut <= {27'b0, instr[11:6]};
                default:
                    immOut <= 32'bx;
            endcase
        end 
    endmodule
