module FIFO #(parameter WIDTH = 8, parameter DEPTH = 8, parameter PTR_WIDTH = 3)(
    input clk,
    input rst,
    input wr_en,
    input rd_en,
    input [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout,
    output full,
    output empty
);

    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [PTR_WIDTH-1:0] wr_ptr, rd_ptr;
    reg [PTR_WIDTH:0] fifo_cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wr_ptr   <= {PTR_WIDTH{1'b0}};
            rd_ptr   <= {PTR_WIDTH{1'b0}};
            fifo_cnt <= {(PTR_WIDTH+1){1'b0}};
            dout     <= {WIDTH{1'b0}};
        end
        else begin
            if (wr_en && !full) begin
                mem[wr_ptr] <= din;
                wr_ptr      <= wr_ptr + 1'b1;
            end

            if (rd_en && !empty) begin
                dout   <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1'b1;
            end

            case ({wr_en && !full, rd_en && !empty})
                2'b10: fifo_cnt <= fifo_cnt + 1'b1;
                2'b01: fifo_cnt <= fifo_cnt - 1'b1;
                default: fifo_cnt <= fifo_cnt;
            endcase
        end
    end

    assign full  = (fifo_cnt == DEPTH);
    assign empty = (fifo_cnt == 0);

endmodule
