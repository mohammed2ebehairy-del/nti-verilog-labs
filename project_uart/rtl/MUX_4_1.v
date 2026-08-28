module MUX_4_1(
    input in0,
    input in1,
    input in2,
    input in3,
    input [1:0] sel,
    output reg y
);

    always @(*) begin
        case (sel)
            2'b00: y = in0;
            2'b01: y = in1;
            2'b10: y = in2;
            2'b11: y = in3;
            default: y = 1'b1;
        endcase
    end

endmodule
