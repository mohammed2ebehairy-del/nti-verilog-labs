module NBitAdder_tb;

    parameter N = 8;

    reg  [N-1:0] a, b;
    reg          cin;
    wire [N-1:0] sum;
    wire         cout;

    NBitAdder #(N) dut(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        a = 8'd15;  b = 8'd20;  cin = 0; #10;
        a = 8'd200; b = 8'd100; cin = 1; #10;
        a = 8'd255; b = 8'd1;   cin = 0; #10;
        a = 8'd128; b = 8'd128; cin = 0; #10;
        a = 8'd0;   b = 8'd0;   cin = 1; #10;
        $finish;
    end

endmodule
