module forwardingUnit (

  input wire [4:0] idEx_Rs1, idEx_Rs2,
  input wire [4:0] exMem_Rd, memWb_Rd,
  input wire exMem_RegWrite, memWb_RegWrite,

  output reg [1:0] forwardA, forwardB
);

always @(*)
  begin
    forwardA = 2'b00;

    if((exMem_RegWrite == 1) && (exMem_Rd == idEx_Rs1) && (exMem_Rd != 5'b0))
      forwardA = 2'b10;
    else if((memWb_RegWrite == 1) && (memWb_Rd == idEx_Rs1) && (memWb_Rd != 5'b0))
      forwardA = 2'b01;

    forwardB = 2'b00;

    if((exMem_RegWrite == 1) && (exMem_Rd == idEx_Rs2) && (exMem_Rd != 5'b0))
      forwardB = 2'b10;
    else if((memWb_RegWrite == 1) && (memWb_Rd == idEx_Rs2) && (memWb_Rd != 5'b0))
      forwardB = 2'b01;
  end

endmodule