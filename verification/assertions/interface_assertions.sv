`timescale 1ns/1ps

module interface_assertions
(
    input logic clk,
    input logic rst,

    input logic valid,
    input logic ready
);

    // -----------------------------------------
    // VALID must remain asserted
    // until READY
    // -----------------------------------------

    property valid_ready_protocol;

        @(posedge clk)

        disable iff(rst)

        valid |-> ##[1:$] ready;

    endproperty

    assert property(valid_ready_protocol)
    else

        $error("VALID/READY Protocol Violation");

endmodule