module rcon(
    input  wire [3:0]  index,    // Round selection (0-13)
    output wire [31:0] out     // Round constant output
);

    wire [31:0] rcon_data [0:6];
    
    // Round constants for AES-256
    // Each round constant is multiplied by 2 in GF(2^8)
    // When overflow occurs, XOR with 0x1B
    assign rcon_data[0]  = 32'h0100_0000;  // 2^0
    assign rcon_data[1]  = 32'h0200_0000;  // 2^1
    assign rcon_data[2]  = 32'h0400_0000;  // 2^2
    assign rcon_data[3]  = 32'h0800_0000;  // 2^3
    assign rcon_data[4]  = 32'h1000_0000;  // 2^4
    assign rcon_data[5]  = 32'h2000_0000;  // 2^5
    assign rcon_data[6]  = 32'h4000_0000;  // 2^6
 
    
    // Select output based on input
    assign out = (index < 4'd7) ? rcon_data[index] : rcon_data[6];

endmodule