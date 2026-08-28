module Mealy011Detector(
    input  clk,
    input  rst,
    input  in,
    output reg op
);

    reg [1:0] state, next;

    localparam S0 = 2'b00,
               S1 = 2'b01,
               S2 = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next;
    end

    always @(*) begin
        case (state)
            S0: next = in ? S0 : S1;
            S1: next = in ? S2 : S1;
            S2: next = in ? S0 : S1;
            default: next = S0;
        endcase
    end

    always @(*) begin
        op = 1'b0;
        case (state)
            S2: op = in ? 1'b1 : 1'b0;
            default: op = 1'b0;
        endcase
    end

endmodule
