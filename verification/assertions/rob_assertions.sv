`timescale 1ns/1ps

module rob_assertions
(
    input logic clk,
    input logic rst,

    input logic rob_full,
    input logic allocate,

    input logic commit_en,
    input logic rob_valid,
    input logic rob_completed
);

    // -------------------------------------------------
    // No Allocation When ROB Full
    // -------------------------------------------------

    property no_allocate_when_full;

        @(posedge clk)
        disable iff (rst)

        rob_full |-> !allocate;

    endproperty

    assert property(no_allocate_when_full)
    else
        $error("ROB Allocation while Full");

    // -------------------------------------------------
    // Commit Only Completed Entries
    // -------------------------------------------------

    property commit_completed_only;

        @(posedge clk)
        disable iff (rst)

        commit_en |-> (rob_valid &&
                       rob_completed);

    endproperty

    assert property(commit_completed_only)
    else
        $error("Invalid ROB Commit");

endmodule