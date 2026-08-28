module ModuloNCounter_tb;

    parameter N = 6;

    reg clk, rst, en;
    wire [31:0] count;

    ModuloNCounter #(N) dut(
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
        #250 en = 0;
        #20 $finish;
    end

endmodule
