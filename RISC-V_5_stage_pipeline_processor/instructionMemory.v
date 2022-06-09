// instruction memory to fetch the instruction

module instructionMemory (

  input wire clk,    // Clock
  input wire rst_n,  // Reset 

  input wire [31:0] programCounter,
  output wire [31:0] instr
);

reg [7:0] instrMem [(2^32)-1 : 0];

// Defining the instructions in the instrMem in byte addressable manner
initial 
  begin
    
    // A random set of instructions 

    // add rd(1), rs2(2) rs2(3)
    // funct7[31:25] + rs2[24:20] + rs1[19:15] + funct3[14:12] + rd[11:7] + opcode[7:0]
    // 0000000       + 00011      + 00010      + 000           + 00001    + 011011
    instrMem[0] = 8'b10110011;
    instrMem[1] = 8'b00000000;
    instrMem[2] = 8'b00110001;
    instrMem[3] = 8'b00000000;

    // sub rd(4), rs1(5), rs2(6)
    // funct7[31:25] + rs2[24:20] + rs1[19:15] + funct3[14:12] + rd[11:7] + opcode[7:0]
    // 0100000       + 00110      + 00101      + 000           + 00100    + 011011
    instrMem[4] = 8'b00110011;
    instrMem[5] = 8'b10000010;
    instrMem[6] = 8'b01100010;
    instrMem[7] = 8'b01000000;

    // lw r2, 1(r1)
    // offset[31:20] + rs1[19:15] + funct3[14:12] + rd[11:7] + opcode[6:0]
    // 000000000001  + 00001      + 010           + 00010    + 0000011
    instrMem[8]  = 8'b00000011;
    instrMem[9]  = 8'b10100001;
    instrMem[10] = 8'b00010000;
    instrMem[11] = 8'b00000000;

    // sw rs1(3), 1(rs2(4))
    // offset[31:25] + rs1[24:20] + rs2[19:15] + funct3[14:12] + offset[11:7] + opcode[6:0]
    // 0000000       + 00011      + 00100      + 010           + 00001        + 0100011   
    instrMem[12]  = 8'b10100011;
    instrMem[13]  = 8'b00100000;
    instrMem[14]  = 8'b00110010;
    instrMem[15]  = 8'b00000000;

    // beq rs1(8), rs2(5), 8
    // Imm[31](12) + Imm[30:25](10:5) + rs1[24;20] + rs2[19:15] + funct3[14:12] + Imm[11:8](4:1) + Imm[7](11) + opcode[7:0]
    // 0           + 000000           + 01000      + 00101      + 000           + 0100           + 0          + 1100011
    instrMem[16] = 8'b01100011;
    instrMem[17] = 8'b10000100;
    instrMem[18] = 8'b10000010;
    instrMem[19] = 8'b00000000; 
    
  end

assign instr = {instrMem[programCounter+3], instrMem[programCounter+2], instrMem[programCounter+1], instrMem[programCounter]};

endmodule

