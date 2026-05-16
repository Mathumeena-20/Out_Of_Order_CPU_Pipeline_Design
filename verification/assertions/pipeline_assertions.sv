`timescale 1ns/1ps

module pipeline_assertions
(
    input logic clk,
    input logic rst,

    input logic flush_pipeline,
    input logic dispatch_valid
);

    // -------------------------------------------------
    // No Dispatch During Flush
    // -------------------------------------------------

    property no_dispatch_on_flush;

        @(posedge clk)
        disable iff (rst)

        flush_pipeline |-> !dispatch_valid;

    endproperty

    assert property(no_dispatch_on_flush)
    else
        $error("Dispatch During Flush");

endmodule