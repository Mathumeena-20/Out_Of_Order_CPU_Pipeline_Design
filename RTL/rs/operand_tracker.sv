module operand_tracker
(
    input  logic             src1_ready,
    input  logic             src2_ready,

    output logic             operands_ready
);

always_comb begin

    operands_ready = src1_ready && src2_ready;

end

endmodule