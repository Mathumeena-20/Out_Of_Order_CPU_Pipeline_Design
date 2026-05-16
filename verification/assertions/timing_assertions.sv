`timescale 1ns/1ps

module timing_assertions
(
    input logic clk,
    input logic rst,

    input logic req,
    input logic ack
);

    // -----------------------------------------
    // ACK must occur within 5 cycles
    // -----------------------------------------

    property ack_timing;

        @(posedge clk)

        disable iff(rst)

        req |-> ##[1:5] ack;

    endproperty

    assert property(ack_timing)
    else

        $error("Timing Violation");

endmodule