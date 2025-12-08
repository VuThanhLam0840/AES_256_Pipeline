module top(
    input clk, 
    input [127:0] PlainText,
    input [255:0] Key,
    output [127:0] CipherText
);

    reg [127:0] State_Matrix [0:14];

    wire [127:0] RoundKey [0:14];
    Key_Expansion a0(
        .in(Key),
        .clk(clk),
        .Key_0(RoundKey[0]),
        .Key_1(RoundKey[1]),
        .Key_2(RoundKey[2]),
        .Key_3(RoundKey[3]),
        .Key_4(RoundKey[4]),
        .Key_5(RoundKey[5]),
        .Key_6(RoundKey[6]),
        .Key_7(RoundKey[7]),
        .Key_8(RoundKey[8]),
        .Key_9(RoundKey[9]),
        .Key_10(RoundKey[10]),
        .Key_11(RoundKey[11]),
        .Key_12(RoundKey[12]),
        .Key_13(RoundKey[13]),
        .Key_14(RoundKey[14])
    );

    wire [127:0] State_Matrix_In [0:14];
    wire [127:0] after_SubByte[0:13];
    wire [127:0] after_ShiftRows [0:13];
    wire [127:0] after_MixColumns [0:12];
    
    // Round 0
    assign State_Matrix_In[0] = RoundKey[0] ^ PlainText;

    // Round 1
    sbox a1_0(.index(State_Matrix[0][127:120]), .out(after_SubByte[0][127:120]));
    sbox a1_1(.index(State_Matrix[0][119:112]), .out(after_SubByte[0][119:112]));
    sbox a1_2(.index(State_Matrix[0][111:104]), .out(after_SubByte[0][111:104]));
    sbox a1_3(.index(State_Matrix[0][103:96]),  .out(after_SubByte[0][103:96]));
    sbox a1_4(.index(State_Matrix[0][95:88]),   .out(after_SubByte[0][95:88]));
    sbox a1_5(.index(State_Matrix[0][87:80]),   .out(after_SubByte[0][87:80]));
    sbox a1_6(.index(State_Matrix[0][79:72]),   .out(after_SubByte[0][79:72]));
    sbox a1_7(.index(State_Matrix[0][71:64]),   .out(after_SubByte[0][71:64]));
    sbox a1_8(.index(State_Matrix[0][63:56]),   .out(after_SubByte[0][63:56]));
    sbox a1_9(.index(State_Matrix[0][55:48]),   .out(after_SubByte[0][55:48]));
    sbox a1_10(.index(State_Matrix[0][47:40]),  .out(after_SubByte[0][47:40]));
    sbox a1_11(.index(State_Matrix[0][39:32]),  .out(after_SubByte[0][39:32]));
    sbox a1_12(.index(State_Matrix[0][31:24]),  .out(after_SubByte[0][31:24]));
    sbox a1_13(.index(State_Matrix[0][23:16]),  .out(after_SubByte[0][23:16]));
    sbox a1_14(.index(State_Matrix[0][15:8]),   .out(after_SubByte[0][15:8]));
    sbox a1_15(.index(State_Matrix[0][7:0]),    .out(after_SubByte[0][7:0]));

    ShiftRows a1_16(.in(after_SubByte[0]), .out(after_ShiftRows[0]));
    MixColumns a1_17(.in(after_ShiftRows[0]), .out(after_MixColumns[0]));
    assign State_Matrix_In[1] = after_MixColumns[0] ^ RoundKey[1];

    // Round 2
    sbox a2_0(.index(State_Matrix[1][127:120]), .out(after_SubByte[1][127:120]));
    sbox a2_1(.index(State_Matrix[1][119:112]), .out(after_SubByte[1][119:112]));
    sbox a2_2(.index(State_Matrix[1][111:104]), .out(after_SubByte[1][111:104]));
    sbox a2_3(.index(State_Matrix[1][103:96]),  .out(after_SubByte[1][103:96]));
    sbox a2_4(.index(State_Matrix[1][95:88]),   .out(after_SubByte[1][95:88]));
    sbox a2_5(.index(State_Matrix[1][87:80]),   .out(after_SubByte[1][87:80]));
    sbox a2_6(.index(State_Matrix[1][79:72]),   .out(after_SubByte[1][79:72]));
    sbox a2_7(.index(State_Matrix[1][71:64]),   .out(after_SubByte[1][71:64]));
    sbox a2_8(.index(State_Matrix[1][63:56]),   .out(after_SubByte[1][63:56]));
    sbox a2_9(.index(State_Matrix[1][55:48]),   .out(after_SubByte[1][55:48]));
    sbox a2_10(.index(State_Matrix[1][47:40]),  .out(after_SubByte[1][47:40]));
    sbox a2_11(.index(State_Matrix[1][39:32]),  .out(after_SubByte[1][39:32]));
    sbox a2_12(.index(State_Matrix[1][31:24]),  .out(after_SubByte[1][31:24]));
    sbox a2_13(.index(State_Matrix[1][23:16]),  .out(after_SubByte[1][23:16]));
    sbox a2_14(.index(State_Matrix[1][15:8]),   .out(after_SubByte[1][15:8]));
    sbox a2_15(.index(State_Matrix[1][7:0]),    .out(after_SubByte[1][7:0]));

    ShiftRows a2_16(.in(after_SubByte[1]), .out(after_ShiftRows[1]));
    MixColumns a2_17(.in(after_ShiftRows[1]), .out(after_MixColumns[1]));
    assign State_Matrix_In[2] = after_MixColumns[1] ^ RoundKey[2];

    // Round 3
    sbox a3_0(.index(State_Matrix[2][127:120]), .out(after_SubByte[2][127:120]));
    sbox a3_1(.index(State_Matrix[2][119:112]), .out(after_SubByte[2][119:112]));
    sbox a3_2(.index(State_Matrix[2][111:104]), .out(after_SubByte[2][111:104]));
    sbox a3_3(.index(State_Matrix[2][103:96]),  .out(after_SubByte[2][103:96]));
    sbox a3_4(.index(State_Matrix[2][95:88]),   .out(after_SubByte[2][95:88]));
    sbox a3_5(.index(State_Matrix[2][87:80]),   .out(after_SubByte[2][87:80]));
    sbox a3_6(.index(State_Matrix[2][79:72]),   .out(after_SubByte[2][79:72]));
    sbox a3_7(.index(State_Matrix[2][71:64]),   .out(after_SubByte[2][71:64]));
    sbox a3_8(.index(State_Matrix[2][63:56]),   .out(after_SubByte[2][63:56]));
    sbox a3_9(.index(State_Matrix[2][55:48]),   .out(after_SubByte[2][55:48]));
    sbox a3_10(.index(State_Matrix[2][47:40]),  .out(after_SubByte[2][47:40]));
    sbox a3_11(.index(State_Matrix[2][39:32]),  .out(after_SubByte[2][39:32]));
    sbox a3_12(.index(State_Matrix[2][31:24]),  .out(after_SubByte[2][31:24]));
    sbox a3_13(.index(State_Matrix[2][23:16]),  .out(after_SubByte[2][23:16]));
    sbox a3_14(.index(State_Matrix[2][15:8]),   .out(after_SubByte[2][15:8]));
    sbox a3_15(.index(State_Matrix[2][7:0]),    .out(after_SubByte[2][7:0]));

    ShiftRows a3_16(.in(after_SubByte[2]), .out(after_ShiftRows[2]));
    MixColumns a3_17(.in(after_ShiftRows[2]), .out(after_MixColumns[2]));
    assign State_Matrix_In[3] = after_MixColumns[2] ^ RoundKey[3];

    // Round 4
    sbox a4_0(.index(State_Matrix[3][127:120]), .out(after_SubByte[3][127:120]));
    sbox a4_1(.index(State_Matrix[3][119:112]), .out(after_SubByte[3][119:112]));
    sbox a4_2(.index(State_Matrix[3][111:104]), .out(after_SubByte[3][111:104]));
    sbox a4_3(.index(State_Matrix[3][103:96]),  .out(after_SubByte[3][103:96]));
    sbox a4_4(.index(State_Matrix[3][95:88]),   .out(after_SubByte[3][95:88]));
    sbox a4_5(.index(State_Matrix[3][87:80]),   .out(after_SubByte[3][87:80]));
    sbox a4_6(.index(State_Matrix[3][79:72]),   .out(after_SubByte[3][79:72]));
    sbox a4_7(.index(State_Matrix[3][71:64]),   .out(after_SubByte[3][71:64]));
    sbox a4_8(.index(State_Matrix[3][63:56]),   .out(after_SubByte[3][63:56]));
    sbox a4_9(.index(State_Matrix[3][55:48]),   .out(after_SubByte[3][55:48]));
    sbox a4_10(.index(State_Matrix[3][47:40]),  .out(after_SubByte[3][47:40]));
    sbox a4_11(.index(State_Matrix[3][39:32]),  .out(after_SubByte[3][39:32]));
    sbox a4_12(.index(State_Matrix[3][31:24]),  .out(after_SubByte[3][31:24]));
    sbox a4_13(.index(State_Matrix[3][23:16]),  .out(after_SubByte[3][23:16]));
    sbox a4_14(.index(State_Matrix[3][15:8]),   .out(after_SubByte[3][15:8]));
    sbox a4_15(.index(State_Matrix[3][7:0]),    .out(after_SubByte[3][7:0]));

    ShiftRows a4_16(.in(after_SubByte[3]), .out(after_ShiftRows[3]));
    MixColumns a4_17(.in(after_ShiftRows[3]), .out(after_MixColumns[3]));
    assign State_Matrix_In[4] = after_MixColumns[3] ^ RoundKey[4];

    // Round 5
    sbox a5_0(.index(State_Matrix[4][127:120]), .out(after_SubByte[4][127:120]));
    sbox a5_1(.index(State_Matrix[4][119:112]), .out(after_SubByte[4][119:112]));
    sbox a5_2(.index(State_Matrix[4][111:104]), .out(after_SubByte[4][111:104]));
    sbox a5_3(.index(State_Matrix[4][103:96]),  .out(after_SubByte[4][103:96]));
    sbox a5_4(.index(State_Matrix[4][95:88]),   .out(after_SubByte[4][95:88]));
    sbox a5_5(.index(State_Matrix[4][87:80]),   .out(after_SubByte[4][87:80]));
    sbox a5_6(.index(State_Matrix[4][79:72]),   .out(after_SubByte[4][79:72]));
    sbox a5_7(.index(State_Matrix[4][71:64]),   .out(after_SubByte[4][71:64]));
    sbox a5_8(.index(State_Matrix[4][63:56]),   .out(after_SubByte[4][63:56]));
    sbox a5_9(.index(State_Matrix[4][55:48]),   .out(after_SubByte[4][55:48]));
    sbox a5_10(.index(State_Matrix[4][47:40]),  .out(after_SubByte[4][47:40]));
    sbox a5_11(.index(State_Matrix[4][39:32]),  .out(after_SubByte[4][39:32]));
    sbox a5_12(.index(State_Matrix[4][31:24]),  .out(after_SubByte[4][31:24]));
    sbox a5_13(.index(State_Matrix[4][23:16]),  .out(after_SubByte[4][23:16]));
    sbox a5_14(.index(State_Matrix[4][15:8]),   .out(after_SubByte[4][15:8]));
    sbox a5_15(.index(State_Matrix[4][7:0]),    .out(after_SubByte[4][7:0]));

    ShiftRows a5_16(.in(after_SubByte[4]), .out(after_ShiftRows[4]));
    MixColumns a5_17(.in(after_ShiftRows[4]), .out(after_MixColumns[4]));
    assign State_Matrix_In[5] = after_MixColumns[4] ^ RoundKey[5];

    // Round 6
    sbox a6_0(.index(State_Matrix[5][127:120]), .out(after_SubByte[5][127:120]));
    sbox a6_1(.index(State_Matrix[5][119:112]), .out(after_SubByte[5][119:112]));
    sbox a6_2(.index(State_Matrix[5][111:104]), .out(after_SubByte[5][111:104]));
    sbox a6_3(.index(State_Matrix[5][103:96]),  .out(after_SubByte[5][103:96]));
    sbox a6_4(.index(State_Matrix[5][95:88]),   .out(after_SubByte[5][95:88]));
    sbox a6_5(.index(State_Matrix[5][87:80]),   .out(after_SubByte[5][87:80]));
    sbox a6_6(.index(State_Matrix[5][79:72]),   .out(after_SubByte[5][79:72]));
    sbox a6_7(.index(State_Matrix[5][71:64]),   .out(after_SubByte[5][71:64]));
    sbox a6_8(.index(State_Matrix[5][63:56]),   .out(after_SubByte[5][63:56]));
    sbox a6_9(.index(State_Matrix[5][55:48]),   .out(after_SubByte[5][55:48]));
    sbox a6_10(.index(State_Matrix[5][47:40]),  .out(after_SubByte[5][47:40]));
    sbox a6_11(.index(State_Matrix[5][39:32]),  .out(after_SubByte[5][39:32]));
    sbox a6_12(.index(State_Matrix[5][31:24]),  .out(after_SubByte[5][31:24]));
    sbox a6_13(.index(State_Matrix[5][23:16]),  .out(after_SubByte[5][23:16]));
    sbox a6_14(.index(State_Matrix[5][15:8]),   .out(after_SubByte[5][15:8]));
    sbox a6_15(.index(State_Matrix[5][7:0]),    .out(after_SubByte[5][7:0]));

    ShiftRows a6_16(.in(after_SubByte[5]), .out(after_ShiftRows[5]));
    MixColumns a6_17(.in(after_ShiftRows[5]), .out(after_MixColumns[5]));
    assign State_Matrix_In[6] = after_MixColumns[5] ^ RoundKey[6];

    // Round 7
    sbox a7_0(.index(State_Matrix[6][127:120]), .out(after_SubByte[6][127:120]));
    sbox a7_1(.index(State_Matrix[6][119:112]), .out(after_SubByte[6][119:112]));
    sbox a7_2(.index(State_Matrix[6][111:104]), .out(after_SubByte[6][111:104]));
    sbox a7_3(.index(State_Matrix[6][103:96]),  .out(after_SubByte[6][103:96]));
    sbox a7_4(.index(State_Matrix[6][95:88]),   .out(after_SubByte[6][95:88]));
    sbox a7_5(.index(State_Matrix[6][87:80]),   .out(after_SubByte[6][87:80]));
    sbox a7_6(.index(State_Matrix[6][79:72]),   .out(after_SubByte[6][79:72]));
    sbox a7_7(.index(State_Matrix[6][71:64]),   .out(after_SubByte[6][71:64]));
    sbox a7_8(.index(State_Matrix[6][63:56]),   .out(after_SubByte[6][63:56]));
    sbox a7_9(.index(State_Matrix[6][55:48]),   .out(after_SubByte[6][55:48]));
    sbox a7_10(.index(State_Matrix[6][47:40]),  .out(after_SubByte[6][47:40]));
    sbox a7_11(.index(State_Matrix[6][39:32]),  .out(after_SubByte[6][39:32]));
    sbox a7_12(.index(State_Matrix[6][31:24]),  .out(after_SubByte[6][31:24]));
    sbox a7_13(.index(State_Matrix[6][23:16]),  .out(after_SubByte[6][23:16]));
    sbox a7_14(.index(State_Matrix[6][15:8]),   .out(after_SubByte[6][15:8]));
    sbox a7_15(.index(State_Matrix[6][7:0]),    .out(after_SubByte[6][7:0]));

    ShiftRows a7_16(.in(after_SubByte[6]), .out(after_ShiftRows[6]));
    MixColumns a7_17(.in(after_ShiftRows[6]), .out(after_MixColumns[6]));
    assign State_Matrix_In[7] = after_MixColumns[6] ^ RoundKey[7];

    // Round 8
    sbox a8_0(.index(State_Matrix[7][127:120]), .out(after_SubByte[7][127:120]));
    sbox a8_1(.index(State_Matrix[7][119:112]), .out(after_SubByte[7][119:112]));
    sbox a8_2(.index(State_Matrix[7][111:104]), .out(after_SubByte[7][111:104]));
    sbox a8_3(.index(State_Matrix[7][103:96]),  .out(after_SubByte[7][103:96]));
    sbox a8_4(.index(State_Matrix[7][95:88]),   .out(after_SubByte[7][95:88]));
    sbox a8_5(.index(State_Matrix[7][87:80]),   .out(after_SubByte[7][87:80]));
    sbox a8_6(.index(State_Matrix[7][79:72]),   .out(after_SubByte[7][79:72]));
    sbox a8_7(.index(State_Matrix[7][71:64]),   .out(after_SubByte[7][71:64]));
    sbox a8_8(.index(State_Matrix[7][63:56]),   .out(after_SubByte[7][63:56]));
    sbox a8_9(.index(State_Matrix[7][55:48]),   .out(after_SubByte[7][55:48]));
    sbox a8_10(.index(State_Matrix[7][47:40]),  .out(after_SubByte[7][47:40]));
    sbox a8_11(.index(State_Matrix[7][39:32]),  .out(after_SubByte[7][39:32]));
    sbox a8_12(.index(State_Matrix[7][31:24]),  .out(after_SubByte[7][31:24]));
    sbox a8_13(.index(State_Matrix[7][23:16]),  .out(after_SubByte[7][23:16]));
    sbox a8_14(.index(State_Matrix[7][15:8]),   .out(after_SubByte[7][15:8]));
    sbox a8_15(.index(State_Matrix[7][7:0]),    .out(after_SubByte[7][7:0]));

    ShiftRows a8_16(.in(after_SubByte[7]), .out(after_ShiftRows[7]));
    MixColumns a8_17(.in(after_ShiftRows[7]), .out(after_MixColumns[7]));
    assign State_Matrix_In[8] = after_MixColumns[7] ^ RoundKey[8];

    // Round 9
    sbox a9_0(.index(State_Matrix[8][127:120]), .out(after_SubByte[8][127:120]));
    sbox a9_1(.index(State_Matrix[8][119:112]), .out(after_SubByte[8][119:112]));
    sbox a9_2(.index(State_Matrix[8][111:104]), .out(after_SubByte[8][111:104]));
    sbox a9_3(.index(State_Matrix[8][103:96]),  .out(after_SubByte[8][103:96]));
    sbox a9_4(.index(State_Matrix[8][95:88]),   .out(after_SubByte[8][95:88]));
    sbox a9_5(.index(State_Matrix[8][87:80]),   .out(after_SubByte[8][87:80]));
    sbox a9_6(.index(State_Matrix[8][79:72]),   .out(after_SubByte[8][79:72]));
    sbox a9_7(.index(State_Matrix[8][71:64]),   .out(after_SubByte[8][71:64]));
    sbox a9_8(.index(State_Matrix[8][63:56]),   .out(after_SubByte[8][63:56]));
    sbox a9_9(.index(State_Matrix[8][55:48]),   .out(after_SubByte[8][55:48]));
    sbox a9_10(.index(State_Matrix[8][47:40]),  .out(after_SubByte[8][47:40]));
    sbox a9_11(.index(State_Matrix[8][39:32]),  .out(after_SubByte[8][39:32]));
    sbox a9_12(.index(State_Matrix[8][31:24]),  .out(after_SubByte[8][31:24]));
    sbox a9_13(.index(State_Matrix[8][23:16]),  .out(after_SubByte[8][23:16]));
    sbox a9_14(.index(State_Matrix[8][15:8]),   .out(after_SubByte[8][15:8]));
    sbox a9_15(.index(State_Matrix[8][7:0]),    .out(after_SubByte[8][7:0]));

    ShiftRows a9_16(.in(after_SubByte[8]), .out(after_ShiftRows[8]));
    MixColumns a9_17(.in(after_ShiftRows[8]), .out(after_MixColumns[8]));
    assign State_Matrix_In[9] = after_MixColumns[8] ^ RoundKey[9];

    // Round 10
    sbox a10_0(.index(State_Matrix[9][127:120]), .out(after_SubByte[9][127:120]));
    sbox a10_1(.index(State_Matrix[9][119:112]), .out(after_SubByte[9][119:112]));
    sbox a10_2(.index(State_Matrix[9][111:104]), .out(after_SubByte[9][111:104]));
    sbox a10_3(.index(State_Matrix[9][103:96]),  .out(after_SubByte[9][103:96]));
    sbox a10_4(.index(State_Matrix[9][95:88]),   .out(after_SubByte[9][95:88]));
    sbox a10_5(.index(State_Matrix[9][87:80]),   .out(after_SubByte[9][87:80]));
    sbox a10_6(.index(State_Matrix[9][79:72]),   .out(after_SubByte[9][79:72]));
    sbox a10_7(.index(State_Matrix[9][71:64]),   .out(after_SubByte[9][71:64]));
    sbox a10_8(.index(State_Matrix[9][63:56]),   .out(after_SubByte[9][63:56]));
    sbox a10_9(.index(State_Matrix[9][55:48]),   .out(after_SubByte[9][55:48]));
    sbox a10_10(.index(State_Matrix[9][47:40]),  .out(after_SubByte[9][47:40]));
    sbox a10_11(.index(State_Matrix[9][39:32]),  .out(after_SubByte[9][39:32]));
    sbox a10_12(.index(State_Matrix[9][31:24]),  .out(after_SubByte[9][31:24]));
    sbox a10_13(.index(State_Matrix[9][23:16]),  .out(after_SubByte[9][23:16]));
    sbox a10_14(.index(State_Matrix[9][15:8]),   .out(after_SubByte[9][15:8]));
    sbox a10_15(.index(State_Matrix[9][7:0]),    .out(after_SubByte[9][7:0]));

    ShiftRows a10_16(.in(after_SubByte[9]), .out(after_ShiftRows[9]));
    MixColumns a10_17(.in(after_ShiftRows[9]), .out(after_MixColumns[9]));
    assign State_Matrix_In[10] = after_MixColumns[9] ^ RoundKey[10];

    // Round 11
    sbox a11_0(.index(State_Matrix[10][127:120]), .out(after_SubByte[10][127:120]));
    sbox a11_1(.index(State_Matrix[10][119:112]), .out(after_SubByte[10][119:112]));
    sbox a11_2(.index(State_Matrix[10][111:104]), .out(after_SubByte[10][111:104]));
    sbox a11_3(.index(State_Matrix[10][103:96]),  .out(after_SubByte[10][103:96]));
    sbox a11_4(.index(State_Matrix[10][95:88]),   .out(after_SubByte[10][95:88]));
    sbox a11_5(.index(State_Matrix[10][87:80]),   .out(after_SubByte[10][87:80]));
    sbox a11_6(.index(State_Matrix[10][79:72]),   .out(after_SubByte[10][79:72]));
    sbox a11_7(.index(State_Matrix[10][71:64]),   .out(after_SubByte[10][71:64]));
    sbox a11_8(.index(State_Matrix[10][63:56]),   .out(after_SubByte[10][63:56]));
    sbox a11_9(.index(State_Matrix[10][55:48]),   .out(after_SubByte[10][55:48]));
    sbox a11_10(.index(State_Matrix[10][47:40]),  .out(after_SubByte[10][47:40]));
    sbox a11_11(.index(State_Matrix[10][39:32]),  .out(after_SubByte[10][39:32]));
    sbox a11_12(.index(State_Matrix[10][31:24]),  .out(after_SubByte[10][31:24]));
    sbox a11_13(.index(State_Matrix[10][23:16]),  .out(after_SubByte[10][23:16]));
    sbox a11_14(.index(State_Matrix[10][15:8]),   .out(after_SubByte[10][15:8]));
    sbox a11_15(.index(State_Matrix[10][7:0]),    .out(after_SubByte[10][7:0]));

    ShiftRows a11_16(.in(after_SubByte[10]), .out(after_ShiftRows[10]));
    MixColumns a11_17(.in(after_ShiftRows[10]), .out(after_MixColumns[10]));
    assign State_Matrix_In[11] = after_MixColumns[10] ^ RoundKey[11];

    // Round 12
    sbox a12_0(.index(State_Matrix[11][127:120]), .out(after_SubByte[11][127:120]));
    sbox a12_1(.index(State_Matrix[11][119:112]), .out(after_SubByte[11][119:112]));
    sbox a12_2(.index(State_Matrix[11][111:104]), .out(after_SubByte[11][111:104]));
    sbox a12_3(.index(State_Matrix[11][103:96]),  .out(after_SubByte[11][103:96]));
    sbox a12_4(.index(State_Matrix[11][95:88]),   .out(after_SubByte[11][95:88]));
    sbox a12_5(.index(State_Matrix[11][87:80]),   .out(after_SubByte[11][87:80]));
    sbox a12_6(.index(State_Matrix[11][79:72]),   .out(after_SubByte[11][79:72]));
    sbox a12_7(.index(State_Matrix[11][71:64]),   .out(after_SubByte[11][71:64]));
    sbox a12_8(.index(State_Matrix[11][63:56]),   .out(after_SubByte[11][63:56]));
    sbox a12_9(.index(State_Matrix[11][55:48]),   .out(after_SubByte[11][55:48]));
    sbox a12_10(.index(State_Matrix[11][47:40]),  .out(after_SubByte[11][47:40]));
    sbox a12_11(.index(State_Matrix[11][39:32]),  .out(after_SubByte[11][39:32]));
    sbox a12_12(.index(State_Matrix[11][31:24]),  .out(after_SubByte[11][31:24]));
    sbox a12_13(.index(State_Matrix[11][23:16]),  .out(after_SubByte[11][23:16]));
    sbox a12_14(.index(State_Matrix[11][15:8]),   .out(after_SubByte[11][15:8]));
    sbox a12_15(.index(State_Matrix[11][7:0]),    .out(after_SubByte[11][7:0]));

    ShiftRows a12_16(.in(after_SubByte[11]), .out(after_ShiftRows[11]));
    MixColumns a12_17(.in(after_ShiftRows[11]), .out(after_MixColumns[11]));
    assign State_Matrix_In[12] = after_MixColumns[11] ^ RoundKey[12];

    // Round 13
    sbox a13_0(.index(State_Matrix[12][127:120]), .out(after_SubByte[12][127:120]));
    sbox a13_1(.index(State_Matrix[12][119:112]), .out(after_SubByte[12][119:112]));
    sbox a13_2(.index(State_Matrix[12][111:104]), .out(after_SubByte[12][111:104]));
    sbox a13_3(.index(State_Matrix[12][103:96]),  .out(after_SubByte[12][103:96]));
    sbox a13_4(.index(State_Matrix[12][95:88]),   .out(after_SubByte[12][95:88]));
    sbox a13_5(.index(State_Matrix[12][87:80]),   .out(after_SubByte[12][87:80]));
    sbox a13_6(.index(State_Matrix[12][79:72]),   .out(after_SubByte[12][79:72]));
    sbox a13_7(.index(State_Matrix[12][71:64]),   .out(after_SubByte[12][71:64]));
    sbox a13_8(.index(State_Matrix[12][63:56]),   .out(after_SubByte[12][63:56]));
    sbox a13_9(.index(State_Matrix[12][55:48]),   .out(after_SubByte[12][55:48]));
    sbox a13_10(.index(State_Matrix[12][47:40]),  .out(after_SubByte[12][47:40]));
    sbox a13_11(.index(State_Matrix[12][39:32]),  .out(after_SubByte[12][39:32]));
    sbox a13_12(.index(State_Matrix[12][31:24]),  .out(after_SubByte[12][31:24]));
    sbox a13_13(.index(State_Matrix[12][23:16]),  .out(after_SubByte[12][23:16]));
    sbox a13_14(.index(State_Matrix[12][15:8]),   .out(after_SubByte[12][15:8]));
    sbox a13_15(.index(State_Matrix[12][7:0]),    .out(after_SubByte[12][7:0]));

    ShiftRows a13_16(.in(after_SubByte[12]), .out(after_ShiftRows[12]));
    MixColumns a13_17(.in(after_ShiftRows[12]), .out(after_MixColumns[12]));
    assign State_Matrix_In[13] = after_MixColumns[12] ^ RoundKey[13];

    // Round 14 (Final Round - No MixColumns)
    sbox a14_0(.index(State_Matrix[13][127:120]), .out(after_SubByte[13][127:120]));
    sbox a14_1(.index(State_Matrix[13][119:112]), .out(after_SubByte[13][119:112]));
    sbox a14_2(.index(State_Matrix[13][111:104]), .out(after_SubByte[13][111:104]));
    sbox a14_3(.index(State_Matrix[13][103:96]),  .out(after_SubByte[13][103:96]));
    sbox a14_4(.index(State_Matrix[13][95:88]),   .out(after_SubByte[13][95:88]));
    sbox a14_5(.index(State_Matrix[13][87:80]),   .out(after_SubByte[13][87:80]));
    sbox a14_6(.index(State_Matrix[13][79:72]),   .out(after_SubByte[13][79:72]));
    sbox a14_7(.index(State_Matrix[13][71:64]),   .out(after_SubByte[13][71:64]));
    sbox a14_8(.index(State_Matrix[13][63:56]),   .out(after_SubByte[13][63:56]));
    sbox a14_9(.index(State_Matrix[13][55:48]),   .out(after_SubByte[13][55:48]));
    sbox a14_10(.index(State_Matrix[13][47:40]),  .out(after_SubByte[13][47:40]));
    sbox a14_11(.index(State_Matrix[13][39:32]),  .out(after_SubByte[13][39:32]));
    sbox a14_12(.index(State_Matrix[13][31:24]),  .out(after_SubByte[13][31:24]));
    sbox a14_13(.index(State_Matrix[13][23:16]),  .out(after_SubByte[13][23:16]));
    sbox a14_14(.index(State_Matrix[13][15:8]),   .out(after_SubByte[13][15:8]));
    sbox a14_15(.index(State_Matrix[13][7:0]),    .out(after_SubByte[13][7:0]));

    ShiftRows a14_16(.in(after_SubByte[13]), .out(after_ShiftRows[13]));
    assign State_Matrix_In[14] = after_ShiftRows[13] ^ RoundKey[14];

    // Sequential logic to update State_Matrix
    always @(posedge clk) begin
        State_Matrix[0] <= State_Matrix_In[0];
        State_Matrix[1] <= State_Matrix_In[1];
        State_Matrix[2] <= State_Matrix_In[2];
        State_Matrix[3] <= State_Matrix_In[3];
        State_Matrix[4] <= State_Matrix_In[4];
        State_Matrix[5] <= State_Matrix_In[5];
        State_Matrix[6] <= State_Matrix_In[6];
        State_Matrix[7] <= State_Matrix_In[7];
        State_Matrix[8] <= State_Matrix_In[8];
        State_Matrix[9] <= State_Matrix_In[9];
        State_Matrix[10] <= State_Matrix_In[10];
        State_Matrix[11] <= State_Matrix_In[11];
        State_Matrix[12] <= State_Matrix_In[12];
        State_Matrix[13] <= State_Matrix_In[13];
        State_Matrix[14] <= State_Matrix_In[14];
    end

    // Output CipherText
    assign CipherText = State_Matrix[14];

endmodule