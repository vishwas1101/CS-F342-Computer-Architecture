module controlUnit (
  
  input wire [6:0] opcode,

  output reg [1:0] immSel,
  output reg [1:0] aluOp,
  output reg regWrite,
  output reg memToReg,
  output reg aluSrc, 
  output reg memRead, memWrite, 
  output reg branch  
);

//opcodes
localparam [6:0] R_type = 7'b0110011, I_type = 7'b0000011, S_type = 7'b0100011, B_type = 7'b1100011;

always @(*)
  begin
    case(opcode)
      R_type:
        begin
          regWrite = 1'b1;
          aluSrc = 1'b0;
          immSel = 2'bxx;
          aluOp = 2'b10;
          memToReg = 1'b0;
          memWrite = 1'b0;
          memRead = 1'b0;
          branch = 1'b0;
        end 

      I_type:
        begin
          regWrite = 1'b1;
          aluSrc = 1'b1;
          immSel = 2'b00;
          aluOp = 2'b00;
          memToReg = 1'b1;
          memWrite = 1'b0;
          memRead = 1'b1;
          branch = 1'b0;
        end

      S_type:
        begin 
          regWrite = 1'b0;
          aluSrc = 1'b1;
          immSel = 2'b01;
          aluOp = 2'b00;
          memToReg = 1'b1;
          memWrite = 1'b1;
          memRead = 1'b0;
          branch = 1'b0;
        end 

      B_type:
        begin 
          regWrite = 1'b0;
          aluSrc = 1'b0;
          immSel = 2'b10;
          aluOp = 2'b01;
          memToReg = 1'b0;
          memWrite = 1'b0;
          memRead = 1'b0;
          branch = 1'b1;
        end 

      default:
        begin
          regWrite = 1'b1;
          aluSrc = 1'b0;
          immSel = 2'bxx;
          aluOp = 2'b10;
          memToReg = 1'b0;
          memWrite = 1'b0;
          memRead = 1'b0;
          branch = 1'b0; 
        end
    endcase // opcode
  end 
  
endmodule