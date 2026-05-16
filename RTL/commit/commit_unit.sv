`timescale 1ns/1ps

module commit_unit
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

    output logic                 commit_en,
    output logic [5:0]           commit_dest,
    output logic [XLEN-1:0]      commit_data
);

always_comb begin

    commit_en   = rob_valid && rob_completed;
    commit_dest = rob_dest;
    commit_data = rob_result;

end

endmodule