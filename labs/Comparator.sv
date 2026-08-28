module comparator_2bit (
    input  logic [1:0] A,
    input  logic [1:0] B,
    output logic       a_gt_b,
    output logic       a_eq_b,
    output logic       a_lt_b
);

    always_comb begin
        a_gt_b = (A > B);
        a_eq_b = (A == B);
        a_lt_b = (A < B);
    end

endmodule
