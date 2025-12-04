module Mul_By_3 (
    input wire [7:0] in,
    output  [7:0] out 
);
wire [7:0] temp;

Mul_By_2 a0(
    .in(in),
    .out(temp)
);
assign out = temp ^ in ;

endmodule