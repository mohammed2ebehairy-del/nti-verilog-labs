module Register_tb;

    parameter N = 16;

    reg clk, load, reset;
    reg [N-1:0] d;
    wire [N-1:0] Q;

    Register #(N) dut(
        .clk(clk),
        .load(load),
        .reset(reset),
        .d(d),
        .Q(Q)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        reset = 1; load = 0; d = 0;
        #12 reset = 0;

        d = 16'hABCD;
        load = 1;
        #10 load = 0;

        #10 d = 16'h1234;
        #10 reset = 1;
        #10 reset = 0;
        #20 $finish;
    end

endmodule
