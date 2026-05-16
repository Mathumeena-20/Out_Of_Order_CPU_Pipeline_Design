`timescale 1ns/1ps

module pipeline_coverage
(
    input logic clk,

    input logic stall_pipeline,
    input logic flush_pipeline
);

    covergroup pipe_cg @(posedge clk);

        coverpoint stall_pipeline;
        coverpoint flush_pipeline;

    endgroup

    pipe_cg cg = new();

endmodule