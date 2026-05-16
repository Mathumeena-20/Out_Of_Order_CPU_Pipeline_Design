module jump_unit
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] pc,
    input  logic [XLEN-1:0] imm,

    output logic [XLEN-1:0] jump_target
);

assign jump_target = pc + imm;

endmodule