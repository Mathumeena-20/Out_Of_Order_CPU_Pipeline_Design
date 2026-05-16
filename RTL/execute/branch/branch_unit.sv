module branch_unit
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] rs1,
    input  logic [XLEN-1:0] rs2,

    input  logic [2:0]      branch_type,

    input  logic [XLEN-1:0] pc,
    input  logic [XLEN-1:0] imm,

    output logic            branch_taken,
    output logic [XLEN-1:0] branch_target
);

branch_resolver br (

    .rs1(rs1),
    .rs2(rs2),

    .branch_type(branch_type),

    .branch_taken(branch_taken)
);

jump_unit ju (

    .pc(pc),
    .imm(imm),

    .jump_target(branch_target)
);

endmodule