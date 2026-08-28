module ModuloNCounter #(parameter N = 6)(
    input  clk,
    input  rst,
    input  en,
    output reg [31:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 32'd0;
        else if (en) begin
            if (count == N - 1)
                count <= 32'd0;
            else
                count <= count + 1'b1;
        end
    end

endmodule
