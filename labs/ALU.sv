module alu (
    input  logic [7:0]  a,
    input  logic [7:0]  b,
    input  logic [3:0]  alu_fun,
    output logic [15:0] alu_out
);

    always_comb begin
        case (alu_fun)
            4'b0000: alu_out = a + b;
            4'b0001: alu_out = a - b;
            4'b0010: alu_out = a * b;
            4'b0011: alu_out = (b != 0) ? (a / b) : '0;
            4'b0100: alu_out = a & b;
            4'b0101: alu_out = a | b;
            4'b0110: alu_out = ~(a & b);
            4'b0111: alu_out = ~(a | b);
            4'b1000: alu_out = a ^ b;
            4'b1001: alu_out = ~(a ^ b);
            4'b1010: alu_out = (a == b) ? 16'd1 : '0;
            4'b1011: alu_out = (a > b)  ? 16'd2 : '0;
            4'b1100: alu_out = (a < b)  ? 16'd3 : '0;
            4'b1101: alu_out = a >> 1;
            4'b1110: alu_out = a << 1;
            default: alu_out = '0;
        endcase
    end

endmodule
