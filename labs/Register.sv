module Register #(parameter N = 16)(
    input  clk,
    input  load,
    input  reset,
    input  [N-1:0] d,
    output reg [N-1:0] Q
);

    always @(posedge clk) begin
        if (reset)
            Q <= {N{1'b0}};
        else if (load)
            Q <= d;
    end

endmodule
