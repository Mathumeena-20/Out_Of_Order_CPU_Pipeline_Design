module dispatch_top
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

    output logic             stall_pipeline
);

logic dispatch_enable;

logic rob_full;
logic rs_full;
logic lsq_full;

logic [5:0] rob_index;
logic [4:0] lsq_index;

// --------------------------------------------------
// Dispatch Unit
// --------------------------------------------------

dispatch_unit du (

    .clk(clk),
    .rst(rst),

    .valid_inst(valid_inst),

    .instruction(instruction),

    .src1_phys(src1_phys),
    .src2_phys(src2_phys),
    .dest_phys(dest_phys),

    .src1_ready(src1_ready),
    .src2_ready(src2_ready),

    .is_load(is_load),
    .is_store(is_store),

    .pc(pc),

    .rob_full(rob_full),
    .rs_full(rs_full),
    .lsq_full(lsq_full),

    .dispatch_enable(dispatch_enable),
    .stall_pipeline(stall_pipeline)
);

// --------------------------------------------------
// ROB Dispatch
// --------------------------------------------------

rob_dispatch robd (

    .clk(clk),
    .rst(rst),

    .dispatch_en(dispatch_enable),

    .dest_phys_reg(dest_phys),
    .pc(pc),

    .rob_index(rob_index),
    .rob_full(rob_full)
);

// --------------------------------------------------
// LSQ Dispatch
// --------------------------------------------------

lsq_dispatch lsqd (

    .clk(clk),
    .rst(rst),

    .dispatch_en(dispatch_enable),

    .is_load(is_load),
    .is_store(is_store),

    .lsq_index(lsq_index),
    .lsq_full(lsq_full)
);

// Simple RS Full Logic
assign rs_full = 1'b0;

endmodule