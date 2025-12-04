module MixColumns (
    input wire [127: 0] in,
    output wire [127:0] out
);

wire [7:0] in00 = in[127:120]; 
wire [7:0] in10 = in[119:112];
wire [7:0] in20 = in[111:104];
wire [7:0] in30 = in[103:96];
wire [7:0] in01 = in[95:88];  
wire [7:0] in11 = in[87:80];
wire [7:0] in21 = in[79:72];  
wire [7:0] in31 = in[71:64];
wire [7:0] in02 = in[63:56];  
wire [7:0] in12 = in[55:48];
wire [7:0] in22 = in[47:40];  
wire [7:0] in32 = in[39:32];
wire [7:0] in03 = in[31:24];  
wire [7:0] in13 = in[23:16];
wire [7:0] in23 = in[15:8];   
wire [7:0] in33 = in[7:0];


// Bang gia tri
wire [7:0] T2 [0:15];
wire [7:0] T3 [0:15];

Mul_By_2 a0(.in(in00),.out(T2[0]));
Mul_By_2 a1(.in(in10), .out(T2[1]));
Mul_By_2 a2(.in(in20), .out(T2[2]));
Mul_By_2 a3(.in(in30), .out(T2[3]));
Mul_By_2 a4(.in(in01), .out(T2[4]));
Mul_By_2 a5(.in(in11), .out(T2[5]));
Mul_By_2 a6(.in(in21), .out(T2[6]));
Mul_By_2 a7(.in(in31), .out(T2[7]));
Mul_By_2 a8(.in(in02), .out(T2[8]));
Mul_By_2 a9(.in(in12), .out(T2[9]));
Mul_By_2 a10(.in(in22), .out(T2[10]));
Mul_By_2 a11(.in(in32), .out(T2[11]));
Mul_By_2 a12(.in(in03), .out(T2[12]));
Mul_By_2 a13(.in(in13), .out(T2[13]));
Mul_By_2 a14(.in(in23), .out(T2[14]));
Mul_By_2 a15(.in(in33), .out(T2[15]));


Mul_By_3 a16(.in(in00), .out(T3[0]));
Mul_By_3 a17(.in(in10), .out(T3[1]));
Mul_By_3 a18(.in(in20), .out(T3[2]));
Mul_By_3 a19(.in(in30), .out(T3[3]));
Mul_By_3 a20(.in(in01), .out(T3[4]));
Mul_By_3 a21(.in(in11), .out(T3[5]));
Mul_By_3 a22(.in(in21), .out(T3[6]));
Mul_By_3 a23(.in(in31), .out(T3[7]));
Mul_By_3 a24(.in(in02), .out(T3[8]));
Mul_By_3 a25(.in(in12), .out(T3[9]));
Mul_By_3 a26(.in(in22), .out(T3[10]));
Mul_By_3 a27(.in(in32), .out(T3[11]));
Mul_By_3 a28(.in(in03), .out(T3[12]));
Mul_By_3 a29(.in(in13), .out(T3[13]));
Mul_By_3 a30(.in(in23), .out(T3[14]));
Mul_By_3 a31(.in(in33), .out(T3[15]));

wire [7:0] T0 [0:15];
wire [7:0] T1 [0:15];

// FIND A00
wire [7:0] A00;
assign T0[0] = T2[0] ^ T3[1];
assign T1[0] = in20 ^ in30;
assign A00 = T0[0] ^ T1[0];

//FIND A10
wire [7:0] A10;
assign T0[1] = T2[1] ^ T3[2];
assign T1[1] = in00 ^ in30;
assign A10 = T0[1] ^ T1[1];

//FIND A20
wire [7:0] A20;
assign T0[2] = T2[2] ^ T3[3];
assign T1[2] = in00 ^ in10;
assign A20 = T0[2] ^ T1[2];

//FIND A30
wire [7:0] A30;
assign T0[3] = T2[3] ^ T3[0];
assign T1[3] = in10 ^ in20;
assign A30 = T0[3] ^ T1[3];

//FIND A01
wire [7:0] A01;
assign T0[4] = T2[4] ^ T3[5];
assign T1[4] = in21 ^ in31;
assign A01 = T0[4] ^ T1[4];

//FIND A11
wire [7:0] A11;
assign T0[5] = T2[5] ^ T3[6];
assign T1[5] = in01 ^ in31;
assign A11 = T0[5] ^ T1[5];

//FIND A21
wire [7:0] A21;
assign T0[6] = T2[6] ^ T3[7];
assign T1[6] = in01 ^ in11;
assign A21 = T0[6] ^ T1[6];

//FIND A31
wire [7:0] A31;
assign T0[7] = T2[7] ^ T3[4];
assign T1[7] = in11 ^ in21;
assign A31 =T0[7] ^ T1[7];

//FIND A02
wire [7:0] A02;
assign T0[8] = T2[8] ^ T3[9];
assign T1[8] = in22 ^ in32;
assign A02 = T0[8] ^ T1[8];

// FIND A12
wire [7:0] A12;
assign T0[9] = T2[9] ^ T3[10];
assign T1[9] = in02 ^ in32;
assign A12 = T0[9] ^ T1[9];

//FIND A22
wire [7:0] A22;
assign T0[10] = T2[10] ^ T3[11];
assign T1[10] = in02 ^ in12;
assign A22 = T0[10] ^ T1[10]  ;

//FIND A32
wire [7:0] A32;
assign T0[11] = T2[11] ^ T3[8];
assign T1[11] = in12 ^ in22;
assign A32 = T0[11] ^ T1[11];

//FIND A03
wire [7:0] A03;
assign T0[12] = T2[12] ^ T3[13];
assign T1[12] = in23 ^ in33;
assign A03 = T0[12] ^ T1[12];

//FIND A13
wire [7:0] A13;
assign T0[13] = T2[13] ^ T3[14];
assign T1[13] = in03 ^ in33;
assign A13 = T0[13] ^ T1[13];

//FIND A23
wire [7:0] A23;
assign T0[14] = T2[14] ^ T3[15];
assign T1[14] = in03 ^ in13;
assign A23 = T0[14] ^ T1[14];

//FIND A33
wire [7:0] A33;
assign T0[15] = T2[15] ^ T3[12];
assign T1[15] = in13 ^ in23;
assign A33 = T0[15] ^ T1[15];

assign out = {A00,A10,A20,A30,A01,A11,A21,A31,A02,A12,A22,A32,A03,A13,A23,A33};

 
endmodule