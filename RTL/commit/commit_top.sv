`timescale 1ns/1ps

module commit_top
#(
    parameter XLEN = 64
)
(
    input  logic                 clk,
    input  logic                 rst,

    input  logic                 rob_valid,
    input  logic                 rob_completed,

    input  logic [5:0]           rob_dest,
    input  logic [XLEN-1:0]      rob_result,

    input  logic                 exception_valid,
    input  logic                 branch_mispredict,

    input  logic [XLEN-1:0]      recovery_pc,

    output logic                 commit_en,
    output logic                 flush_pipeline,

    output logic [XLEN-1:0]      restart_pc
);

logic exception_flush;

commit_unit cu (

    .clk(clk),
    .rst(rst),

    .rob_valid(rob_valid),
    .rob_completed(rob_completed),

    .rob_dest(rob_dest),
    .rob_result(rob_result),

    .commit_en(commit_en),
    .commit_dest(),
    .commit_data()
);

precise_exception pe (

    .exception_valid(exception_valid),
    .exception_pc(recovery_pc),

    .flush_pipeline(exception_flush),
    .trap_pc()
);

pipeline_flush pf (

    .exception_flush(exception_flush),
    .branch_mispredict(branch_mispredict),

    .flush(flush_pipeline)
);

recovery_logic rl (

    .flush(flush_pipeline),

    .recovery_pc(recovery_pc),

    .recovery_valid(),
    .restart_pc(restart_pc)
);

endmodule