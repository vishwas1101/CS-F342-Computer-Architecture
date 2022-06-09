module ALUControl (

  input wire [1:0] aluOp,
  input wire [2:0] funct3,
  input wire [6:0] funct7, // only 1 bit matters for add - sub instruction

  output reg [3:0] aluControl
);

localparam [3:0] ADD = 4'b0000, SUB = 4'b1000, AND = 4'b0111, OR = 4'b0110;
localparam [1:0] I_type = 2'b00, B_type = 2'b01, R_type = 2'b10;

assign funct = {funct7[5], funct3};

always @(*)
  begin 
    case(aluOp)
      I_type:
        aluControl = 4'b0010;

      B_type:
        aluControl = 4'b0110;

      R_type: 
        begin
          case(funct)
            AND: 
              aluControl = 4'b0000;

            OR:
              aluControl = 4'b0001;

            ADD: 
              aluControl = 4'b0010;

            SUB: 
              aluControl = 4'b0110;

            default: 
              aluControl = 4'b0010;
          endcase
        end 

      default: 
        aluControl = 4'bx;

    endcase
  end
endmodule