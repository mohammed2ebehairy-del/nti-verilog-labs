module BRG #(parameter DIVISOR = 434)(
    input clk,
    input rst,
    output reg tick
);

    reg [15:0] cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt  <= 16'd0;
            tick <= 1'b0;
        end
        else if (cnt == DIVISOR - 1) begin
            cnt  <= 16'd0;
            tick <= 1'b1;
        end
        else begin
            cnt  <= cnt + 1'b1;
            tick <= 1'b0;
        end
    end

endmodule
