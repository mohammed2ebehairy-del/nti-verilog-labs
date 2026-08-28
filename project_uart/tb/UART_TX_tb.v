module UART_TX_tb;

    parameter DIVISOR = 8;

    reg clk, rst, wr_en;
    reg [7:0] data_in;
    wire tx, busy, fifo_full, fifo_empty;

    UART_TX #(.DIVISOR(DIVISOR)) dut(
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .data_in(data_in),
        .tx(tx),
        .busy(busy),
        .fifo_full(fifo_full),
        .fifo_empty(fifo_empty)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    task send_byte(input [7:0] b);
        begin
            data_in = b;
            wr_en   = 1;
            #10;
            wr_en   = 0;
        end
    endtask

    initial begin
        rst = 1; wr_en = 0; data_in = 0;
        #12 rst = 0;

        send_byte(8'h55);
        #20;
        send_byte(8'hA3);

        wait (fifo_empty && !busy);
        #400;

        $finish;
    end

endmodule
