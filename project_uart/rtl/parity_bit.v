module parity_bit(
    input  [7:0] data,
    output parity
);

    assign parity = ^data;

endmodule
