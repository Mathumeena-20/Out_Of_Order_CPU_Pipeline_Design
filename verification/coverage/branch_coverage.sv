`timescale 1ns/1ps

module branch_coverage
(
    input logic clk,

    input logic branch_taken
);

    covergroup branch_cg @(posedge clk);

        coverpoint branch_taken {

            bins taken     = {1};
            bins not_taken = {0};

        }

    endgroup

    branch_cg cg = new();

endmodule