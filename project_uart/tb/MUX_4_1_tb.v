module MUX_4_1_tb;

    reg in0, in1, in2, in3;
    reg [1:0] sel;
    wire y;

    MUX_4_1 dut(
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .y(y)
    );

    initial begin
        in0 = 0; in1 = 1; in2 = 0; in3 = 1;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        in0 = 1; in1 = 0; in2 = 1; in3 = 0;

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;
    end

endmodule
