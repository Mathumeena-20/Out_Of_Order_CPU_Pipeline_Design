`timescale 1ns/1ps

module cache_assertions
(
    input logic clk,
    input logic rst,

    input logic cache_hit,
    input logic stall
);

    // -------------------------------------------------
    // Cache Hit Should Not Stall
    // -------------------------------------------------

    property no_stall_on_hit;

        @(posedge clk)
        disable iff (rst)

        cache_hit |-> !stall;

    endproperty

    assert property(no_stall_on_hit)
    else
        $error("Cache Hit with Stall");

endmodule