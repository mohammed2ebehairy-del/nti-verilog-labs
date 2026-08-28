module Shift_Register_tb;

    parameter WIDTH = 8;

    reg clk, rst, load, shift;
    reg [WIDTH-1:0] din;
    wire [WIDTH-1:0] q;
    wire serial_out;

    Shift_Register #(.WIDTH(WIDTH)) dut(
        .clk(clk),
        .rst(rst),
        .load(load),
        .shift(shift),
        .din(din),
        .q(q),
        .serial_out(serial_out)
    );

    integer i;

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; load = 0; shift = 0; din = 0;
        #12 rst = 0;

        din  = 8'b10110010;
        load = 1;
        #10 load = 0;

        for (i = 0; i < 8; i = i + 1) begin
            shift = 1;
            #10;
        end
        shift = 0;

        #20 $finish;
    end

endmodule
