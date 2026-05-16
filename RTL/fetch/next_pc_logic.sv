module next_pc_logic #(parameter XLEN = 64)
(
    input  logic [XLEN-1:0]      current_pc,

    input  logic                 branch_taken,
    input  logic [XLEN-1:0]      branch_target,

    output logic [XLEN-1:0]      next_pc
);

always_comb begin

    if (branch_taken)
        next_pc = branch_target;

    else
        next_pc = current_pc + 4;

end

endmodule