module FSM(
    input clk,
    input rst,
    input tick,
    input fifo_empty,
    input bit_done,
    output reg fifo_rd_en,
    output reg load,
    output reg shift_en,
    output reg cnt_en,
    output reg cnt_clr,
    output reg [1:0] sel,
    output reg busy
);

    localparam IDLE   = 3'd0,
               START  = 3'd1,
               DATA   = 3'd2,
               PARITY = 3'd3,
               STOP   = 3'd4;

    reg [2:0] state, next;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next;
    end

    always @(*) begin
        next        = state;
        fifo_rd_en  = 1'b0;
        load        = 1'b0;
        shift_en    = 1'b0;
        cnt_en      = 1'b0;
        cnt_clr     = 1'b0;
        sel         = 2'b11;
        busy        = 1'b1;

        case (state)
            IDLE: begin
                busy = 1'b0;
                sel  = 2'b11;
                if (!fifo_empty) begin
                    fifo_rd_en = 1'b1;
                    load       = 1'b1;
                    cnt_clr    = 1'b1;
                    next       = START;
                end
            end
            START: begin
                sel = 2'b00;
                if (tick)
                    next = DATA;
            end
            DATA: begin
                sel = 2'b01;
                if (tick) begin
                    shift_en = 1'b1;
                    cnt_en   = 1'b1;
                    if (bit_done)
                        next = PARITY;
                end
            end
            PARITY: begin
                sel = 2'b10;
                if (tick)
                    next = STOP;
            end
            STOP: begin
                sel = 2'b11;
                if (tick)
                    next = IDLE;
            end
            default: next = IDLE;
        endcase
    end

endmodule
