module Key_Expansion (
    input wire [255:0] in,
    output [127:0] Key_0,Key_1,Key_2,Key_3,Key_4,Key_5,Key_6,Key_7,Key_8,Key_9,Key_10,Key_11,Key_12,Key_13,Key_14,
    input wire clk
);
  
    wire [31:0] Word_in [0:59];
    reg [31:0] Word [0:59];
   
    assign Word_in[0] = in[255:224];
    assign Word_in[1] = in[223:192];
    assign Word_in[2] = in[191:160];
    assign Word_in[3] = in[159:128];
    assign Word_in[4] = in[127:96];
    assign Word_in[5] = in[95:64];
    assign Word_in[6] = in[63:32];
    assign Word_in[7] = in[31:0];

    wire [31:0] Rcon[0:6];
    
    // Khai báo Rcon
    rcon r0(.index(8'd0),.out(Rcon[0]));
    rcon r1(.index(8'd1),.out(Rcon[1]));
    rcon r2(.index(8'd2),.out(Rcon[2]));
    rcon r3(.index(8'd3),.out(Rcon[3]));
    rcon r4(.index(8'd4),.out(Rcon[4]));
    rcon r5(.index(8'd5),.out(Rcon[5]));
    rcon r6(.index(8'd6),.out(Rcon[6]));

    // ===== VÒNG 1: Word[8] ??n Word[15] =====
    
    // Word[8]: i mod 8 = 0 ? RotWord + SubWord + Rcon
    wire [31:0] RotWord_7 = {Word[7][23:0], Word[7][31:24]};
    wire [31:0] SubWord_7;
    sbox s7_0(.index(RotWord_7[31:24]),.out(SubWord_7[31:24]));
    sbox s7_1(.index(RotWord_7[23:16]),.out(SubWord_7[23:16]));
    sbox s7_2(.index(RotWord_7[15:8]), .out(SubWord_7[15:8]));
    sbox s7_3(.index(RotWord_7[7:0]),  .out(SubWord_7[7:0]));
    assign Word_in[8] = Word[0] ^ SubWord_7 ^ Rcon[0];

    assign Word_in[9]  = Word_in[8] ^ Word[1];
    assign Word_in[10] = Word_in[9] ^ Word[2];
    assign Word_in[11] = Word_in[10] ^ Word[3];

    // Word[12]: i mod 8 = 4 ? ch? SubWord (KHÔNG RotWord, KHÔNG Rcon)
    wire [31:0] SubWord_11;
    sbox s11_0(.index(Word[11][31:24]),.out(SubWord_11[31:24]));
    sbox s11_1(.index(Word[11][23:16]),.out(SubWord_11[23:16]));
    sbox s11_2(.index(Word[11][15:8]), .out(SubWord_11[15:8]));
    sbox s11_3(.index(Word[11][7:0]),  .out(SubWord_11[7:0]));
    assign Word_in[12] = SubWord_11 ^ Word[4];
    
    assign Word_in[13] = Word_in[12] ^ Word[5];
    assign Word_in[14] = Word_in[13] ^ Word[6];
    assign Word_in[15] = Word_in[14] ^ Word[7];

    // ===== VÒNG 2: Word[16] ??n Word[23] =====
    
    // Word[16]: i mod 8 = 0
    wire [31:0] RotWord_15 = {Word[15][23:0], Word[15][31:24]};
    wire [31:0] SubWord_15;
    sbox s15_0(.index(RotWord_15[31:24]),.out(SubWord_15[31:24]));
    sbox s15_1(.index(RotWord_15[23:16]),.out(SubWord_15[23:16]));
    sbox s15_2(.index(RotWord_15[15:8]), .out(SubWord_15[15:8]));
    sbox s15_3(.index(RotWord_15[7:0]),  .out(SubWord_15[7:0]));
    assign Word_in[16] = Word[8] ^ SubWord_15 ^ Rcon[1];

    assign Word_in[17] = Word_in[16] ^ Word[9];
    assign Word_in[18] = Word_in[17] ^ Word[10];
    assign Word_in[19] = Word_in[18] ^ Word[11];

    // Word[20]: i mod 8 = 4
    wire [31:0] SubWord_19;
    sbox s19_0(.index(Word[19][31:24]),.out(SubWord_19[31:24]));
    sbox s19_1(.index(Word[19][23:16]),.out(SubWord_19[23:16]));
    sbox s19_2(.index(Word[19][15:8]), .out(SubWord_19[15:8]));
    sbox s19_3(.index(Word[19][7:0]),  .out(SubWord_19[7:0]));
    assign Word_in[20] = SubWord_19 ^ Word[12];
    
    assign Word_in[21] = Word_in[20] ^ Word[13];
    assign Word_in[22] = Word_in[21] ^ Word[14];
    assign Word_in[23] = Word_in[22] ^ Word[15];

    // ===== VÒNG 3: Word[24] ??n Word[31] =====
    
    wire [31:0] RotWord_23 = {Word[23][23:0], Word[23][31:24]};
    wire [31:0] SubWord_23;
    sbox s23_0(.index(RotWord_23[31:24]),.out(SubWord_23[31:24]));
    sbox s23_1(.index(RotWord_23[23:16]),.out(SubWord_23[23:16]));
    sbox s23_2(.index(RotWord_23[15:8]), .out(SubWord_23[15:8]));
    sbox s23_3(.index(RotWord_23[7:0]),  .out(SubWord_23[7:0]));
    assign Word_in[24] = Word[16] ^ SubWord_23 ^ Rcon[2];

    assign Word_in[25] = Word_in[24] ^ Word[17];
    assign Word_in[26] = Word_in[25] ^ Word[18];
    assign Word_in[27] = Word_in[26] ^ Word[19];

    wire [31:0] SubWord_27;
    sbox s27_0(.index(Word[27][31:24]),.out(SubWord_27[31:24]));
    sbox s27_1(.index(Word[27][23:16]),.out(SubWord_27[23:16]));
    sbox s27_2(.index(Word[27][15:8]), .out(SubWord_27[15:8]));
    sbox s27_3(.index(Word[27][7:0]),  .out(SubWord_27[7:0]));
    assign Word_in[28] = SubWord_27 ^ Word[20];
    
    assign Word_in[29] = Word_in[28] ^ Word[21];
    assign Word_in[30] = Word_in[29] ^ Word[22];
    assign Word_in[31] = Word_in[30] ^ Word[23];

    // ===== VÒNG 4: Word[32] ??n Word[39] =====
    
    wire [31:0] RotWord_31 = {Word[31][23:0], Word[31][31:24]};
    wire [31:0] SubWord_31;
    sbox s31_0(.index(RotWord_31[31:24]),.out(SubWord_31[31:24]));
    sbox s31_1(.index(RotWord_31[23:16]),.out(SubWord_31[23:16]));
    sbox s31_2(.index(RotWord_31[15:8]), .out(SubWord_31[15:8]));
    sbox s31_3(.index(RotWord_31[7:0]),  .out(SubWord_31[7:0]));
    assign Word_in[32] = Word[24] ^ SubWord_31 ^ Rcon[3];

    assign Word_in[33] = Word_in[32] ^ Word[25];
    assign Word_in[34] = Word_in[33] ^ Word[26];
    assign Word_in[35] = Word_in[34] ^ Word[27];

    wire [31:0] SubWord_35;
    sbox s35_0(.index(Word[35][31:24]),.out(SubWord_35[31:24]));
    sbox s35_1(.index(Word[35][23:16]),.out(SubWord_35[23:16]));
    sbox s35_2(.index(Word[35][15:8]), .out(SubWord_35[15:8]));
    sbox s35_3(.index(Word[35][7:0]),  .out(SubWord_35[7:0]));
    assign Word_in[36] = SubWord_35 ^ Word[28];
    
    assign Word_in[37] = Word_in[36] ^ Word[29];
    assign Word_in[38] = Word_in[37] ^ Word[30];
    assign Word_in[39] = Word_in[38] ^ Word[31];

    // ===== VÒNG 5: Word[40] ??n Word[47] =====
    
    wire [31:0] RotWord_39 = {Word[39][23:0], Word[39][31:24]};
    wire [31:0] SubWord_39;
    sbox s39_0(.index(RotWord_39[31:24]),.out(SubWord_39[31:24]));
    sbox s39_1(.index(RotWord_39[23:16]),.out(SubWord_39[23:16]));
    sbox s39_2(.index(RotWord_39[15:8]), .out(SubWord_39[15:8]));
    sbox s39_3(.index(RotWord_39[7:0]),  .out(SubWord_39[7:0]));
    assign Word_in[40] = Word[32] ^ SubWord_39 ^ Rcon[4];

    assign Word_in[41] = Word_in[40] ^ Word[33];
    assign Word_in[42] = Word_in[41] ^ Word[34];
    assign Word_in[43] = Word_in[42] ^ Word[35];

    wire [31:0] SubWord_43;
    sbox s43_0(.index(Word[43][31:24]),.out(SubWord_43[31:24]));
    sbox s43_1(.index(Word[43][23:16]),.out(SubWord_43[23:16]));
    sbox s43_2(.index(Word[43][15:8]), .out(SubWord_43[15:8]));
    sbox s43_3(.index(Word[43][7:0]),  .out(SubWord_43[7:0]));
    assign Word_in[44] = SubWord_43 ^ Word[36];
    
    assign Word_in[45] = Word_in[44] ^ Word[37];
    assign Word_in[46] = Word_in[45] ^ Word[38];
    assign Word_in[47] = Word_in[46] ^ Word[39];

    // ===== VÒNG 6: Word[48] ??n Word[55] =====
    
    wire [31:0] RotWord_47 = {Word[47][23:0], Word[47][31:24]};
    wire [31:0] SubWord_47;
    sbox s47_0(.index(RotWord_47[31:24]),.out(SubWord_47[31:24]));
    sbox s47_1(.index(RotWord_47[23:16]),.out(SubWord_47[23:16]));
    sbox s47_2(.index(RotWord_47[15:8]), .out(SubWord_47[15:8]));
    sbox s47_3(.index(RotWord_47[7:0]),  .out(SubWord_47[7:0]));
    assign Word_in[48] = Word[40] ^ SubWord_47 ^ Rcon[5];

    assign Word_in[49] = Word_in[48] ^ Word[41];
    assign Word_in[50] = Word_in[49] ^ Word[42];
    assign Word_in[51] = Word_in[50] ^ Word[43];

    wire [31:0] SubWord_51;
    sbox s51_0(.index(Word[51][31:24]),.out(SubWord_51[31:24]));
    sbox s51_1(.index(Word[51][23:16]),.out(SubWord_51[23:16]));
    sbox s51_2(.index(Word[51][15:8]), .out(SubWord_51[15:8]));
    sbox s51_3(.index(Word[51][7:0]),  .out(SubWord_51[7:0]));
    assign Word_in[52] = SubWord_51 ^ Word[44];
    
    assign Word_in[53] = Word_in[52] ^ Word[45];
    assign Word_in[54] = Word_in[53] ^ Word[46];
    assign Word_in[55] = Word_in[54] ^ Word[47];

    // ===== VÒNG 7: Word[56] ??n Word[59] (ch? c?n 4 word cu?i) =====
    
    wire [31:0] RotWord_55 = {Word[55][23:0], Word[55][31:24]};
    wire [31:0] SubWord_55;
    sbox s55_0(.index(RotWord_55[31:24]),.out(SubWord_55[31:24]));
    sbox s55_1(.index(RotWord_55[23:16]),.out(SubWord_55[23:16]));
    sbox s55_2(.index(RotWord_55[15:8]), .out(SubWord_55[15:8]));
    sbox s55_3(.index(RotWord_55[7:0]),  .out(SubWord_55[7:0]));
    assign Word_in[56] = Word[48] ^ SubWord_55 ^ Rcon[6];

    assign Word_in[57] = Word_in[56] ^ Word[49];
    assign Word_in[58] = Word_in[57] ^ Word[50];
    assign Word_in[59] = Word_in[58] ^ Word[51];

    // ===== GÁN CÁC ROUND KEY =====
    
  always @(posedge clk) begin
    Word[0] <= Word_in[0];
    Word[1] <= Word_in[1];
    Word[2] <= Word_in[2];
    Word[3] <= Word_in[3];
    Word[4] <= Word_in[4];
    Word[5] <= Word_in[5];
    Word[6] <= Word_in[6];
    Word[7] <= Word_in[7];
    Word[8] <= Word_in[8];
    Word[9] <= Word_in[9];
    Word[10] <= Word_in[10];
    Word[11] <= Word_in[11];
    Word[12] <= Word_in[12];
    Word[13] <= Word_in[13];
    Word[14] <= Word_in[14];
    Word[15] <= Word_in[15];
    Word[16] <= Word_in[16];
    Word[17] <= Word_in[17];
    Word[18] <= Word_in[18];
    Word[19] <= Word_in[19];
    Word[20] <= Word_in[20];
    Word[21] <= Word_in[21];
    Word[22] <= Word_in[22];
    Word[23] <= Word_in[23];
    Word[24] <= Word_in[24];
    Word[25] <= Word_in[25];
    Word[26] <= Word_in[26];
    Word[27] <= Word_in[27];
    Word[28] <= Word_in[28];
    Word[29] <= Word_in[29];
    Word[30] <= Word_in[30];
    Word[31] <= Word_in[31];
    Word[32] <= Word_in[32];
    Word[33] <= Word_in[33];
    Word[34] <= Word_in[34];
    Word[35] <= Word_in[35];
    Word[36] <= Word_in[36];
    Word[37] <= Word_in[37];
    Word[38] <= Word_in[38];
    Word[39] <= Word_in[39];
    Word[40] <= Word_in[40];
    Word[41] <= Word_in[41];
    Word[42] <= Word_in[42];
    Word[43] <= Word_in[43];
    Word[44] <= Word_in[44];
    Word[45] <= Word_in[45];
    Word[46] <= Word_in[46];
    Word[47] <= Word_in[47];
    Word[48] <= Word_in[48];
    Word[49] <= Word_in[49];
    Word[50] <= Word_in[50];
    Word[51] <= Word_in[51];
    Word[52] <= Word_in[52];
    Word[53] <= Word_in[53];
    Word[54] <= Word_in[54];
    Word[55] <= Word_in[55];
    Word[56] <= Word_in[56];
    Word[57] <= Word_in[57];
    Word[58] <= Word_in[58];
    Word[59] <= Word_in[59];
end
    // Assign outputs
    assign Key_0  = {Word_in[0],  Word_in[1],  Word_in[2],  Word_in[3]};
    assign Key_1  = {Word_in[4],  Word_in[5],  Word_in[6],  Word_in[7]};
    assign Key_2  = {Word[8],  Word[9],  Word[10], Word[11]};
    assign Key_3  = {Word[12], Word[13], Word[14], Word[15]};  
    assign Key_4  = {Word[16], Word[17], Word[18], Word[19]};
    assign Key_5  = {Word[20], Word[21], Word[22], Word[23]};  
    assign Key_6  = {Word[24], Word[25], Word[26], Word[27]}; 
    assign Key_7  = {Word[28], Word[29], Word[30], Word[31]};
    assign Key_8  = {Word[32], Word[33], Word[34], Word[35]};
    assign Key_9  = {Word[36], Word[37], Word[38], Word[39]};
    assign Key_10 = {Word[40], Word[41], Word[42], Word[43]}; 
    assign Key_11 = {Word[44], Word[45], Word[46], Word[47]};
    assign Key_12 = {Word[48], Word[49], Word[50], Word[51]};  
    assign Key_13 = {Word[52], Word[53], Word[54], Word[55]};
    assign Key_14 = {Word[56], Word[57], Word[58], Word[59]};

endmodule