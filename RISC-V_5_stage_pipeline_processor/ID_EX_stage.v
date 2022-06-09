module ID_EX_stage (
  input wire clk,    // Clock
  input wire rst_n,  // Reset
  input wire flush,
  
  input wire [31:0] idRegData1, idRegData2,
  input wire [31:0] idPc,
  input wire [31:0] idImm,
  input wire [4:0] idRs1, idRs2, idRd,
  input wire [13:0] idCtrlSig,

  output reg [31:0] exRegData1, exRegData2,
  output reg [31:0] exPc, 
  output reg [31:0] exImm, 
  output reg [4:0] exRs1, exRs2, exRd,
  output reg [13:0] exCtrlSig
);

always @(posedge clk, posedge rst_n)
  begin
    if (rst_n || flush)
      begin 
        exRegData1 <= 32'b0;
        exRegData2 <= 32'b0;
        exPc <= 32'b0;
        exImm <= 32'b0;
        exRs1 <= 5'b0;
        exRs2 <= 5'b0;
        exRd <= 5'b0;
        exCtrlSig <= 14'b0;
      end 
    else 
      begin
        exRegData1 <= idRegData1;
        exRegData2 <= idRegData2;
        exPc <= idPc;
        exImm <= idImm;
        exRs1 <= idRs1;
        exRs2 <= idRs2;
        exRd <= idRd;
        exCtrlSig <= idCtrlSig;
      end 
  end 
endmodule