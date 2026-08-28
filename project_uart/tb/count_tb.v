module count_tb;

    parameter WIDTH = 3;
    parameter MAX   = 7;

    reg clk, rst, clr, en;
    wire [WIDTH-1:0] cnt;
    wire done;

    count #(.WIDTH(WIDTH), .MAX(MAX)) dut(
        .clk(clk),
        .rst(rst),
        .clr(clr),
        .en(en),
        .cnt(cnt),
        .done(done)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; clr = 0; en = 0;
        #12 rst = 0;
        en = 1;
        #200 en = 0;
        #10 clr = 1;
        #10 clr = 0;
        #20 $finish;
    end

endmodule
