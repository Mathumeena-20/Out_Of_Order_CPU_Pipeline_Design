module dispatch_unit
(
    input  logic             clk,
    input  logic             rst,

    input  logic             valid_inst,

    input  logic [31:0]      instruction,

    input  logic [5:0]       src1_phys,
    input  logic [5:0]       src2_phys,
    input  logic [5:0]       dest_phys,

    input  logic             src1_ready,
    input  logic             src2_ready,

    input  logic             is_load,
    input  logic             is_store,

    input  logic [63:0]      pc,

    // Status Signals
    input  logic             rob_full,
    input  logic             rs_full,
    input  logic             lsq_full,

    // Outputs
    output logic             dispatch_enable,
    output logic             stall_pipeline
);

dispatch_control ctrl (

    .valid_inst(valid_inst),

    .rob_full(rob_full),
    .rs_full(rs_full),
    .lsq_full(lsq_full),

    .is_load(is_load),
    .is_store(is_store),

    .dispatch_enable(dispatch_enable),
    .stall_pipeline(stall_pipeline)
);

issue_queue_dispatch iq_dispatch (

    .clk(clk),
    .rst(rst),

    .dispatch_en(dispatch_enable),

    .src1_tag(src1_phys),
    .src2_tag(src2_phys),
    .dest_tag(dest_phys),

    .src1_ready(src1_ready),
    .src2_ready(src2_ready),

    .instruction(instruction),

    .rs_valid()
);

endmodule