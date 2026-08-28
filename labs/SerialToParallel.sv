module SerialToParallel #(parameter WIDTH = 8)(
    input  clk,
    input  rst,
    input  en,
    input  serial_in,
    output reg [WIDTH-1:0] parallel_out,
    output reg done
);

    reg [3:0] cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            parallel_out <= {WIDTH{1'b0}};
            cnt          <= 4'd0;
            done         <= 1'b0;
        end
        else if (en) begin
            if (cnt == WIDTH) begin
                done <= 1'b1;
                cnt  <= 4'd0;
            end
            else begin
                parallel_out <= {parallel_out[WIDTH-2:0], serial_in};
                cnt          <= cnt + 1'b1;
                done         <= 1'b0;
            end
        end
    end

endmodule
