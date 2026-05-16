`timescale 1ns/1ps

module protocol_assertions
(
    input logic clk,
    input logic rst,

    input logic start,
    input logic done
);

    // -----------------------------------------
    // DONE must eventually follow START
    // -----------------------------------------

    property start_done_protocol;

        @(posedge clk)

        disable iff(rst)

        start |-> ##[1:20] done;

    endproperty

    assert property(start_done_protocol)
    else

        $error("Protocol Failure");

endmodule