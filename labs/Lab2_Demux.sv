module demux_1_to_4 (
    input  logic in,
    input  logic [1:0] sel,
    output logic [3:0] y
);

    always_comb begin
        y = 4'b0000; 

        case (sel)
            2'b00: y[0] = in;
            2'b01: y[1] = in;
            2'b10: y[2] = in;
            2'b11: y[3] = in;
            default: y = 4'b0000;
        endcase
    end

endmodule
