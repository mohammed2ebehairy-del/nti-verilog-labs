module Mealy01Detector(
    input  clk,
    input  rst,
    input  in,
    output op
);

    reg prev;

    always @(posedge clk or posedge rst) begin
        if (rst)
            prev <= 1'b0;
        else
            prev <= in;
    end

    assign op = (~prev) & in;

endmodule
