module parity_bit_tb;

    reg [7:0] data;
    wire parity;

    parity_bit dut(
        .data(data),
        .parity(parity)
    );

    initial begin
        data = 8'b00000000; #10;
        data = 8'b00000001; #10;
        data = 8'b00000011; #10;
        data = 8'b11111111; #10;
        data = 8'b10101010; #10;
        data = 8'b11001100; #10;
        $finish;
    end

endmodule
