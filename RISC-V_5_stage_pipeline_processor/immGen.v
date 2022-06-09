// Immediate data generation by selection and sign extension from 12 to 32 bits
module immGen (
  input wire [31:0] instr,
  input wire [1:0] immSel, 
  output wire [31:0] immOut
);

reg [11:0] imm;

localparam [2:0] I_type = 2'b00, S_type = 2'b01, B_type = 2'b10;

always @(*)
  begin
    case(immSel)
      I_type: 
        imm = instr[31:20];

      S_type: 
        imm = {instr[31:25],instr[11:7]};

      B_type: 
        imm = {instr[31],instr[7],instr[30:25],instr[11:8]};

      default: 
        imm = 12'bx;
        
    endcase
  end

assign immOut = {{20{imm[11]}}, imm[11:0]};

endmodule