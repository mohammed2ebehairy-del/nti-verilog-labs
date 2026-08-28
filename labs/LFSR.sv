module LFSR(
    input clk,
    input rst,
    input en,
    output reg [7:0] out
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            out <= 8'hFF;
        else if (en)
            out <= {out[6:0], out[7] ^ out[5] ^ out[4] ^ out[3]};
    end

endmodule
