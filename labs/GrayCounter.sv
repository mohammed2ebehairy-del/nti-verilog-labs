module GrayCounter(
    input  clk,
    input  rst,
    output reg [3:0] gray
);

    reg [3:0] bin;

    always @(posedge clk or posedge rst) begin
        if (rst)
            bin <= 4'b0000;
        else
            bin <= bin + 1'b1;
    end

    always @(*) begin
        gray = bin ^ (bin >> 1);
    end

endmodule
