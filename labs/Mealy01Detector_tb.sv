module Mealy01Detector_tb;

    reg clk, rst, in;
    wire op;

    Mealy01Detector dut(
        .clk(clk),
        .rst(rst),
        .in(in),
        .op(op)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; in = 0;
        #12 rst = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #30 $finish;
    end

endmodule
