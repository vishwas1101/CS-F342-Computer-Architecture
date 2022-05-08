`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2022 10:33:40
// Design Name: 
// Module Name: aluControl
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


module aluControl(
    input [1:0] aluOp,
    input [5:0] func,   
    
    output reg [3:0] aluCtrl
    );
    
    wire [3:0] funct;
    
    assign funct = {func[5], func[2:0]};  // Not all bits are required
    
    parameter AND = 4'b1100, OR = 4'b1101, ADD = 4'b1000, SUB = 4'b1010, LEFT = 4'b0000, RIGHT = 4'b0010;
    parameter I_type = 2'b00, R_type = 2'b01;
    
    always @(*) 
        begin 
            case(aluOp)
                I_type: 
                    aluCtrl = 4'bx; // You don't need an alucontrol signal for this 
                    
                R_type:
                    begin 
                        case(funct)
                            AND: 
                                aluCtrl = 4'b0000;
                            OR: 
                                aluCtrl = 4'b0001; 
                            ADD: 
                                aluCtrl = 4'b0010; 
                            SUB: 
                                aluCtrl = 4'b0100; 
                            LEFT: 
                                aluCtrl = 4'b0011; 
                            RIGHT: 
                                aluCtrl = 4'b0111; 
                            
                        endcase
                    end 
                    
                default: 
                      aluCtrl = 4'bx; 
             endcase 
        end 
endmodule
