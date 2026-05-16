module rob_commit_logic
#(
    parameter ROB_ENTRIES = 32
)
(
    input  logic                     clk,
    input  logic                     rst,

    input  logic                     head_valid,
    input  logic                     head_completed,

    input  logic [5:0]               head_dest_reg,
    input  logic [63:0]              head_result,

    output logic                     commit_en,

    output logic [5:0]               commit_dest_reg,
    output logic [63:0]              commit_result
);

always_comb begin

    commit_en        = 0;
    commit_dest_reg  = 0;
    commit_result    = 0;

    if (head_valid && head_completed) begin

        commit_en        = 1;

        commit_dest_reg  = head_dest_reg;
        commit_result    = head_result;

    end
end

endmodule