module FSMCounter_tb;

    parameter N = 4;

    reg clk, rst, en;
    wire [N-1:0] count;

    FSMCounter #(N) dut(
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(count)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; en = 0;
        #12 rst = 0;
        #10 en = 1;
        #200 en = 0;
        #20 $finish;
    end

endmodule
