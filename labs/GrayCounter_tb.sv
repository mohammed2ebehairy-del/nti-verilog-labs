module GrayCounter_tb;

    reg clk, rst;
    wire [3:0] gray;

    GrayCounter dut(
        .clk(clk),
        .rst(rst),
        .gray(gray)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #12 rst = 0;
        #200 $finish;
    end

endmodule
