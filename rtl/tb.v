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


    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    // Test vectors
    initial begin
        // Kh?i t?o giá tr? ban ??u
        Key = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
        PlainText = 128'h00000000000000000000000000000000;
        
        $display("========================================");
        $display("AES-256 Post-Impl Simulation - 100MHz");
        $display("========================================");
        

        #100; 


        @(negedge clk); 
        $display("Time %0t: Input PlainText[0]", $time);
        PlainText = 128'h00112233445566778899aabbccddeeff;
        
        @(negedge clk);
        $display("Time %0t: Input PlainText[1]", $time);
        PlainText = 128'h00000000000000000000000000000000;
        
        @(negedge clk);
        $display("Time %0t: Input PlainText[2]", $time);
        PlainText = 128'hffffffffffffffffffffffffffffffff;
        
        @(negedge clk);
        $display("Time %0t: Input PlainText[3]", $time);
        PlainText = 128'hffeeddccbbaa99887766554433221100;
        
        @(negedge clk);
        $display("Time %0t: Input PlainText[4]", $time);
        PlainText = 128'h0123456789abcdef0123456789abcdef;
        
    
        
        @(negedge clk);
        PlainText = 128'h11111111111111111111111111111111;

        repeat(50) @(posedge clk);
        
        $display("========================================");
        $display("Simulation completed!");
        $finish;
    end
    
    
    always @(CipherText) begin
        if (CipherText !== 128'bx && CipherText !== 0) begin
             $display("Time %0t: New Output Detected: %h", $time, CipherText);
        end
    end
    
    // Generate VCD file
    initial begin
        $dumpfile("aes256_tb.vcd");
        $dumpvars(0, tb_aes256);
    end


endmodule
