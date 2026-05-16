module dependency_checker
(
    input  logic [4:0] current_rs1,
    input  logic [4:0] current_rs2,

    input  logic [4:0] prev_rd,
    input  logic       prev_reg_write,

    output logic       dependency
);

always_comb begin

    dependency = 0;

    if (prev_reg_write) begin

        if ((current_rs1 == prev_rd) ||
            (current_rs2 == prev_rd))

            dependency = 1;

    end
end

endmodule