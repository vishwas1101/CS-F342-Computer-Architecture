module ALU (

  input [3:0] aluControl,
  input wire [31:0] data1,
  input wire [31:0] data2,

  output reg [31:0] aluResult,
  output wire zero
);

// ALU Control 
localparam [3:0] AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010, SUB = 4'b0010, SLT = 4'b1000;

always @(*)
  begin
    case(aluControl)
      AND: 
        aluResult = data1 & data2;

      OR:
        aluResult = data1 | data1;

      ADD:
        aluResult = data1 + data2;

      SUB:
        aluResult = data1 - data2;

      SLT:
        aluResult = (data1 < data2)? 32'b1 : 32'b0;

      default:
        aluResult = 32'bx;
    endcase // aluControl
  end

assign zero = (aluResult == 32'b0)? 1'b1 : 1'b0;

endmodule