module SequenceDetector011_tb;

    reg clk, rst, in;
    wire op_mealy, op_moore;

    Mealy011Detector dut_mealy(
        .clk(clk),
        .rst(rst),
        .in(in),
        .op(op_mealy)
    );

    Moore011Detector dut_moore(
        .clk(clk),
        .rst(rst),
        .in(in),
        .op(op_moore)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; in = 0;
        #12 rst = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #30 $finish;
    end

endmodule
