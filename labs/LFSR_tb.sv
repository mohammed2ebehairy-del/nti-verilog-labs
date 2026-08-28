module LFSR_tb;

    reg clk;
    reg rst;
    reg en;
    wire [7:0] out;

    LFSR dut(
        .clk(clk),
        .rst(rst),
        .en(en),
        .out(out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        en  = 0;
        #12;
        rst = 0;
        en  = 1;
        #300;
        en = 0;
        #20;
        rst = 1;
        #10;
        rst = 0;
        #100;
        $finish;
    end

endmodule
