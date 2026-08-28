module ParallelToSerial_tb;

    parameter WIDTH = 8;

    reg clk, rst, load, start;
    reg [WIDTH-1:0] parallel_in;
    wire serial_out, done;

    ParallelToSerial #(WIDTH) dut(
        .clk(clk),
        .rst(rst),
        .load(load),
        .start(start),
        .parallel_in(parallel_in),
        .serial_out(serial_out),
        .done(done)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; load = 0; start = 0; parallel_in = 0;
        #12 rst = 0;

        parallel_in = 8'b11001010;
        load = 1;
        #10 load = 0;

        start = 1;
        #10 start = 0;

        #120;
        $finish;
    end

endmodule
