module rob_top
(
    input  logic             clk,
    input  logic             rst,

    // Allocate
    input  logic             allocate,
    input  logic [5:0]       dest_phys_reg,
    input  logic [63:0]      alloc_pc,

    // Writeback
    input  logic             wb_valid,
    input  logic [5:0]       wb_rob_index,
    input  logic [63:0]      wb_data,

    // Recovery
    input  logic             branch_mispredict,
    input  logic             exception,

    input  logic [63:0]      recovery_pc,

    // Outputs
    output logic             commit_en,
    output logic [5:0]       commit_dest_reg,
    output logic [63:0]      commit_result,

    output logic             flush_pipeline,
    output logic [63:0]      restart_pc,

    output logic             rob_full,
    output logic             rob_empty
);

rob rob_core (

    .clk(clk),
    .rst(rst),

    .allocate(allocate),
    .dest_phys_reg(dest_phys_reg),
    .alloc_pc(alloc_pc),

    .wb_valid(wb_valid),
    .wb_rob_index(wb_rob_index),
    .wb_data(wb_data),

    .commit_en(commit_en),
    .commit_dest_reg(commit_dest_reg),
    .commit_result(commit_result),

    .rob_full(rob_full),
    .rob_empty(rob_empty)
);

// --------------------------------------------------
// Recovery Logic
// --------------------------------------------------

rob_recovery recovery (

    .clk(clk),
    .rst(rst),

    .branch_mispredict(branch_mispredict),
    .exception(exception),

    .recovery_pc(recovery_pc),

    .flush_pipeline(flush_pipeline),
    .restart_pc(restart_pc)
);

endmodule