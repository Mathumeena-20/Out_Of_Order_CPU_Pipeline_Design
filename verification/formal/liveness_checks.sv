`timescale 1ns/1ps

module liveness_checks
(
    input logic clk,
    input logic rst,

    input logic request,
    input logic grant
);

    // -------------------------------------------------
    // Every Request Eventually Gets Grant
    // -------------------------------------------------

    property forward_progress;

        @(posedge clk)
        disable iff (rst)

        request |-> ##[1:10] grant;

    endproperty

    assert property(forward_progress);

endmodule