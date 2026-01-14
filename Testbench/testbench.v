`timescale 1ns / 1ps

module tb_aes256;

    // Testbench signals
    reg clk;
    reg [127:0] PlainText;
    reg [255:0] Key;
    wire [127:0] CipherText;

    // Instantiate the AES-256 module
    top uut (
        .clk(clk),
        .PlainText(PlainText),
        .Key(Key),
        .CipherText(CipherText)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    // Test vectors
    initial begin
        // Khởi tạo giá trị ban đầu
        Key = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
        PlainText = 128'h00000000000000000000000000000000;
        
        $display("========================================");
        $display("AES-256 Pre Simulation");
        $display("========================================");
        
        // Test case 1
        @(negedge clk);
        PlainText = 128'h00112233445566778899aabbccddeeff;
        $display("Time %0t: Input PlainText[0] = %h", $time, PlainText);
        
        // Test case 2
        @(negedge clk);
        PlainText = 128'h00000000000000000000000000000000;
        $display("Time %0t: Input PlainText[1] = %h", $time, PlainText);
        
        // Test case 3
        @(negedge clk);
        PlainText = 128'hffffffffffffffffffffffffffffffff;
        $display("Time %0t: Input PlainText[2] = %h", $time, PlainText);
        
        // Test case 4
        @(negedge clk);
        PlainText = 128'hffeeddccbbaa99887766554433221100;
        $display("Time %0t: Input PlainText[3] = %h", $time, PlainText);
        
        // Test case 5
        @(negedge clk);
        PlainText = 128'h0123456789abcdef0123456789abcdef;
        $display("Time %0t: Input PlainText[4] = %h", $time, PlainText);
        
        // Test case 6
        @(negedge clk);
        PlainText = 128'h11111111111111111111111111111111;
        $display("Time %0t: Input PlainText[5] = %h", $time, PlainText);
        
        // Test case 7
        @(negedge clk);
        PlainText = 128'h22222222222222222222222222222222;
        $display("Time %0t: Input PlainText[6] = %h", $time, PlainText);
        
        // Test case 8
        @(negedge clk);
        PlainText = 128'h33333333333333333333333333333333;
        $display("Time %0t: Input PlainText[7] = %h", $time, PlainText);
        
        // Test case 9
        @(negedge clk);
        PlainText = 128'haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa;
        $display("Time %0t: Input PlainText[8] = %h", $time, PlainText);
        
        // Test case 10
        @(negedge clk);
        PlainText = 128'h55555555555555555555555555555555;
        $display("Time %0t: Input PlainText[9] = %h", $time, PlainText);
        
        // Test case 11
        @(negedge clk);
        PlainText = 128'hdeadbeefdeadbeefdeadbeefdeadbeef;
        $display("Time %0t: Input PlainText[10] = %h", $time, PlainText);
        
        // Test case 12
        @(negedge clk);
        PlainText = 128'hcafebabecafebabecafebabecafebabe;
        $display("Time %0t: Input PlainText[11] = %h", $time, PlainText);
        
        // Test case 13
        @(negedge clk);
        PlainText = 128'h123456789abcdef0fedcba9876543210;
        $display("Time %0t: Input PlainText[12] = %h", $time, PlainText);
        
        // Test case 14
        @(negedge clk);
        PlainText = 128'ha5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5;
        $display("Time %0t: Input PlainText[13] = %h", $time, PlainText);
        
        // Test case 15
        @(negedge clk);
        PlainText = 128'h5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a;
        $display("Time %0t: Input PlainText[14] = %h", $time, PlainText);

        // Đợi đủ thời gian để AES-256 xử lý hết
        repeat(50) @(posedge clk);
        
        $display("========================================");
        $display("Simulation completed!");
        $finish;
    end
    
    // Monitor output changes
    always @(posedge clk) begin
        if (CipherText !== 128'bx && CipherText !== 0) begin
             $display("Time %0t: CipherText Output = %h", $time, CipherText);
        end
    end
    
    // Generate VCD file
    initial begin
        $dumpfile("aes256_tb.vcd");
        $dumpvars(0, tb_aes256);
    end

endmodule