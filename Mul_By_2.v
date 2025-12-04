module Mul_By_2 (
    input wire [7:0] in,
    output reg [7:0] out 
);

wire [8:0] temp = in << 1;
wire adjust = temp [8];

always @(in or adjust or temp) begin
    if(adjust)
        out = temp ^ 8'h1b;
    else
        out = temp[7:0]; 
end
endmodule
