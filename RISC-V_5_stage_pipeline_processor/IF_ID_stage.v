module IF_ID_stage (
  input wire clk,    // Clock
  input wire rst_n,  // Reset
  input wire enable,
  input wire flush, 

  input wire [31:0] ifInstr,
  input wire [31:0] ifPc,

  output reg [31:0] idPc, 
  output reg [31:0] idInstr
);

always @(posedge clk, posedge rst_n)
  begin
    if (rst_n || flush)
      begin 
        idInstr <= 32'b0;
        idPc <= 32'b0;
      end 
    else
      begin 
        idInstr <= ifInstr;
        idPc <= ifPc;
      end  
  end
endmodule 