module FIFO_tb;

    parameter WIDTH     = 8;
    parameter DEPTH     = 8;
    parameter PTR_WIDTH = 3;

    reg clk, rst, wr_en, rd_en;
    reg [WIDTH-1:0] din;
    wire [WIDTH-1:0] dout;
    wire full, empty;

    FIFO #(.WIDTH(WIDTH), .DEPTH(DEPTH), .PTR_WIDTH(PTR_WIDTH)) dut(
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    integer i;

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; wr_en = 0; rd_en = 0; din = 0;
        #12 rst = 0;

        for (i = 0; i < 10; i = i + 1) begin
            din   = i;
            wr_en = 1;
            #10;
        end
        wr_en = 0;

        #10;

        for (i = 0; i < 10; i = i + 1) begin
            rd_en = 1;
            #10;
        end
        rd_en = 0;

        #20 $finish;
    end

endmodule
