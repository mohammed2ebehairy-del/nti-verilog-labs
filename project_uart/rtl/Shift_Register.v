module Shift_Register #(parameter WIDTH = 8)(
    input clk,
    input rst,
    input load,
    input shift,
    input [WIDTH-1:0] din,
    output reg [WIDTH-1:0] q,
    output serial_out
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= {WIDTH{1'b0}};
        else if (load)
            q <= din;
        else if (shift)
            q <= {1'b0, q[WIDTH-1:1]};
    end

    assign serial_out = q[0];

endmodule
