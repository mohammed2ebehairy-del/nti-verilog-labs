module ParallelToSerial #(parameter WIDTH = 8)(
    input  clk,
    input  rst,
    input  load,
    input  start,
    input  [WIDTH-1:0] parallel_in,
    output reg serial_out,
    output reg done
);

    reg [WIDTH-1:0] shift_reg;
    reg [3:0] cnt;
    reg running;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg  <= {WIDTH{1'b0}};
            cnt        <= 4'd0;
            serial_out <= 1'b0;
            done       <= 1'b0;
            running    <= 1'b0;
        end
        else if (load) begin
            shift_reg <= parallel_in;
            cnt       <= 4'd0;
            done      <= 1'b0;
            running   <= 1'b0;
        end
        else if (start && !running) begin
            running <= 1'b1;
            cnt     <= 4'd0;
        end
        else if (running) begin
            serial_out <= shift_reg[WIDTH-1];
            shift_reg  <= shift_reg << 1;
            cnt        <= cnt + 1'b1;
            if (cnt == WIDTH - 1) begin
                running <= 1'b0;
                done    <= 1'b1;
            end
        end
    end

endmodule
