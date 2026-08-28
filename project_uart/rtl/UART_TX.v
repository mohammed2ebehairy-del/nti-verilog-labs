module UART_TX #(parameter DIVISOR = 434)(
    input clk,
    input rst,
    input wr_en,
    input [7:0] data_in,
    output tx,
    output busy,
    output fifo_full,
    output fifo_empty
);

    wire tick;
    wire [7:0] fifo_dout;
    wire fifo_rd_en;
    wire load, shift_en, cnt_en, cnt_clr;
    wire [1:0] sel;
    wire [7:0] shift_q;
    wire serial_bit;
    wire parity;
    wire bit_done;
    wire [2:0] bit_cnt;

    BRG #(.DIVISOR(DIVISOR)) brg_inst(
        .clk(clk),
        .rst(rst),
        .tick(tick)
    );

    FIFO #(.WIDTH(8), .DEPTH(8), .PTR_WIDTH(3)) fifo_inst(
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(fifo_rd_en),
        .din(data_in),
        .dout(fifo_dout),
        .full(fifo_full),
        .empty(fifo_empty)
    );

    FSM fsm_inst(
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

    Shift_Register #(.WIDTH(8)) shreg_inst(
        .clk(clk),
        .rst(rst),
        .load(load),
        .shift(shift_en),
        .din(fifo_dout),
        .q(shift_q),
        .serial_out(serial_bit)
    );

    parity_bit parity_inst(
        .data(fifo_dout),
        .parity(parity)
    );

    count #(.WIDTH(3), .MAX(7)) count_inst(
        .clk(clk),
        .rst(rst),
        .clr(cnt_clr),
        .en(cnt_en),
        .cnt(bit_cnt),
        .done(bit_done)
    );

    MUX_4_1 mux_inst(
        .in0(1'b0),
        .in1(serial_bit),
        .in2(parity),
        .in3(1'b1),
        .sel(sel),
        .y(tx)
    );

endmodule
