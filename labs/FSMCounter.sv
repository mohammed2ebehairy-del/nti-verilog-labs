module FSMCounter #(parameter N = 4)(
    input  clk,
    input  rst,
    input  en,
    output reg [N-1:0] count
);

    reg [N-1:0] next_count;

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= {N{1'b0}};
        else
            count <= next_count;
    end

    always @(*) begin
        if (en)
            next_count = count + 1'b1;
        else
            next_count = count;
    end

endmodule
