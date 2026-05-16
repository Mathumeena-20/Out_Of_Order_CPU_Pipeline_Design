`timescale 1ns/1ps

module interface_coverage
(
    input logic clk,

    input logic valid,
    input logic ready
);

    covergroup interface_cg @(posedge clk);

        coverpoint valid;

        coverpoint ready;

        cross valid, ready;

    endgroup

    interface_cg cg_inst = new();

endmodule