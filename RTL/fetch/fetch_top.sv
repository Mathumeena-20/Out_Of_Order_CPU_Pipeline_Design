module fetch_top
#(
    parameter XLEN = 64
)
(
    input  logic                 clk,
    input  logic                 rst,

    input  logic                 branch_taken,
    input  logic [XLEN-1:0]      branch_target,

    input  logic                 decode_pop,

    output logic [31:0]          fetch_inst,
    output logic [XLEN-1:0]      fetch_pc,

    output logic                 queue_empty,
    output logic                 queue_full
);

logic [31:0] instruction;
logic [63:0] pc;

// -----------------------------------------------------
// Fetch Unit
// -----------------------------------------------------

fetch_unit fetch_u (

    .clk(clk),
    .rst(rst),

    .stall(queue_full),
    .flush(branch_taken),

    .branch_taken(branch_taken),
    .branch_target(branch_target),

    .fetch_pc(pc),
    .instruction(instruction)
);

// -----------------------------------------------------
// Fetch Queue
// -----------------------------------------------------

fetch_queue fq (

    .clk(clk),
    .rst(rst),

    .push(!queue_full),
    .inst_in(instruction),
    .pc_in(pc),

    .pop(decode_pop),

    .inst_out(fetch_inst),
    .pc_out(fetch_pc),

    .empty(queue_empty),
    .full(queue_full)
);

endmodule