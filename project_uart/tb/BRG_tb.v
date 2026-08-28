module BRG_tb;

    parameter DIVISOR = 8;

    reg clk, rst;
    wire tick;

    BRG #(.DIVISOR(DIVISOR)) dut(
        .clk(clk),
        .rst(rst),
        .tick(tick)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #12 rst = 0;
        #400;
        $finish;
    end

endmodule
