`timescale 1ns/1ps

module cache_coverage
(
    input logic clk,

    input logic cache_hit
);

    covergroup cache_cg @(posedge clk);

        coverpoint cache_hit {

            bins hit  = {1};
            bins miss = {0};

        }

    endgroup

    cache_cg cg = new();

endmodule