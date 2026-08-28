module full_adder (
    input  logic A,
    input  logic B,
    input  logic Cin,
    output logic S,
    output logic Cout,
    output logic Cout2,
    output logic S2
);
        always_comb begin
        S    = A ^ B ^ Cin;
        Cout = (A & B) | (B & Cin) | (A & Cin);
        assign {Cout2, S2} = A + B + Cin;
    end

endmodule
