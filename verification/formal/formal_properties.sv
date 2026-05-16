`timescale 1ns/1ps

module formal_properties
(
    input logic clk,
    input logic rst,

    input logic valid,
    input logic ready
);

    // -------------------------------------------------
    // Valid Ready Handshake
    // -------------------------------------------------

    property valid_ready_protocol;

        @(posedge clk)
        disable iff (rst)

        valid |-> ##1 ready;

    endproperty

    assert property(valid_ready_protocol);

endmodule