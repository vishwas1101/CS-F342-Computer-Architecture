module hazardDetect (
  input wire [4:0] ifIdRs1, ifIdRs2,
  input wire [4:0] idExRd,
  input idEx_memRead,

  output hazard
);

assign hazard = (((idEx_memRead == 1) && ((idExRd == ifIdRs1) || (idExRd == ifIdRs2)))? 1 : 0);

endmodule