`timescale 1ns/1ps

module rename_assertions
(
    input logic clk,
    input logic rst,

    input logic rename_valid,
    input logic allocation_success
);

    // -------------------------------------------------
    // Rename Must Allocate Physical Register
    // -------------------------------------------------

    property rename_alloc_success;

        @(posedge clk)
        disable iff (rst)

        rename_valid |-> allocation_success;

    endproperty

    assert property(rename_alloc_success)
    else
        $error("Rename Allocation Failed");

endmodule