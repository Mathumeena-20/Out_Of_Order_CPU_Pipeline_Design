`timescale 1ns/1ps

module fpga_coverage
(
    input logic clk,

    input logic rst,

    input logic test_done,

    input logic error_detected
);

    covergroup fpga_cg @(posedge clk);

        coverpoint test_done;

        coverpoint error_detected;

    endgroup

    fpga_cg cg_inst = new();

endmodule