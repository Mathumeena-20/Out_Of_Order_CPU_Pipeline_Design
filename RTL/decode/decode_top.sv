module decode_top
(
    input  logic         clk,
    input  logic         rst,

    input  logic [31:0]  instruction,

    // Previous instruction info
    input  logic [4:0]   prev_rd,
    input  logic         prev_reg_write,

    // Outputs
    output logic [6:0]   opcode,
    output logic [4:0]   rd,
    output logic [4:0]   rs1,
    output logic [4:0]   rs2,
    output logic [63:0]  immediate,

    output logic         reg_write,
    output logic         mem_read,
    output logic         mem_write,
    output logic         branch,

    output logic         dependency,

    output logic         is_alu,
    output logic         is_load,
    output logic         is_store,
    output logic         is_branch,
    output logic         is_jump
);

logic [2:0] funct3;
logic [6:0] funct7;

logic alu_src;
logic [1:0] alu_op;

// --------------------------------------------------
// Decoder
// --------------------------------------------------

decoder dec (

    .instruction(instruction),

    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)
);

// --------------------------------------------------
// Control Unit
// --------------------------------------------------

control_unit cu (

    .opcode(opcode),

    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .branch(branch),
    .alu_src(alu_src),

    .alu_op(alu_op)
);

// --------------------------------------------------
// Immediate Generator
// --------------------------------------------------

immediate_generator imm_gen (

    .instruction(instruction),

    .immediate(immediate)
);

// --------------------------------------------------
// Dependency Checker
// --------------------------------------------------

dependency_checker dep_check (

    .current_rs1(rs1),
    .current_rs2(rs2),

    .prev_rd(prev_rd),
    .prev_reg_write(prev_reg_write),

    .dependency(dependency)
);

// --------------------------------------------------
// Instruction Classifier
// --------------------------------------------------

instruction_classifier cls (

    .opcode(opcode),

    .is_alu(is_alu),
    .is_load(is_load),
    .is_store(is_store),
    .is_branch(is_branch),
    .is_jump(is_jump)
);

endmodule