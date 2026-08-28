module SerialToParallel_tb;

    parameter WIDTH = 8;

    reg clk, rst, en, serial_in;
    wire [WIDTH-1:0] parallel_out;
    wire done;

    SerialToParallel #(WIDTH) dut(
        .clk(clk),
        .rst(rst),
        .en(en),
        .serial_in(serial_in),
        .parallel_out(parallel_out),
        .done(done)
    );

    reg [7:0] pattern;
    integer i;

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; en = 0; serial_in = 0;
        pattern = 8'b10110010;
        #12 rst = 0;
        en = 1;

        for (i = 7; i >= 0; i = i - 1) begin
            serial_in = pattern[i];
            #10;
        end

        #10;
        en = 0;
        #30 $finish;
    end

endmodule
