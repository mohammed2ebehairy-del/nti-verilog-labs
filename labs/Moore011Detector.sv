module Moore011Detector(
    input  clk,
    input  rst,
    input  in,
    output op
);

    reg [1:0] state, next;

    localparam S0 = 2'b00,
               S1 = 2'b01,
               S2 = 2'b10,
               S3 = 2'b11;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next;
    end

    always @(*) begin
        case (state)
            S0: next = in ? S0 : S1;
            S1: next = in ? S2 : S1;
            S2: next = in ? S3 : S1;
            S3: next = in ? S0 : S1;
            default: next = S0;
        endcase
    end

    assign op = (state == S3);

endmodule
