module rob_recovery
(
    input  logic             clk,
    input  logic             rst,

    input  logic             branch_mispredict,
    input  logic             exception,

    input  logic [63:0]      recovery_pc,

    output logic             flush_pipeline,
    output logic [63:0]      restart_pc
);

always_comb begin

    flush_pipeline = 0;
    restart_pc     = 0;

    if (branch_mispredict || exception) begin

        flush_pipeline = 1;
        restart_pc     = recovery_pc;

    end
end

endmodule