module count #(parameter WIDTH = 3, parameter MAX = 7)(
    input clk,
    input rst,
    input clr,
    input en,
    output reg [WIDTH-1:0] cnt,
    output done
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            cnt <= {WIDTH{1'b0}};
        else if (clr)
            cnt <= {WIDTH{1'b0}};
        else if (en) begin
            if (cnt == MAX)
                cnt <= {WIDTH{1'b0}};
            else
                cnt <= cnt + 1'b1;
        end
    end

    assign done = (cnt == MAX);

endmodule
