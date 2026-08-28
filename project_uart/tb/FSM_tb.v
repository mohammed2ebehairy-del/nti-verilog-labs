module FSM_tb;

    reg clk, rst, tick, fifo_empty, bit_done;
    wire fifo_rd_en, load, shift_en, cnt_en, cnt_clr;
    wire [1:0] sel;
    wire busy;

    FSM dut(
        .clk(clk),
        .rst(rst),
        .tick(tick),
        .fifo_empty(fifo_empty),
        .bit_done(bit_done),
        .fifo_rd_en(fifo_rd_en),
        .load(load),
        .shift_en(shift_en),
        .cnt_en(cnt_en),
        .cnt_clr(cnt_clr),
        .sel(sel),
        .busy(busy)
    );

    integer i;

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; tick = 0; fifo_empty = 1; bit_done = 0;
        #12 rst = 0;

        fifo_empty = 0;
        #10;

        tick = 1; #10; tick = 0; #10;

        for (i = 0; i < 8; i = i + 1) begin
            bit_done = (i == 7);
            tick = 1; #10; tick = 0; #10;
        end

        tick = 1; #10; tick = 0; #10;
        tick = 1; #10; tick = 0; #10;

        fifo_empty = 1;
        #40 $finish;
    end

endmodule
