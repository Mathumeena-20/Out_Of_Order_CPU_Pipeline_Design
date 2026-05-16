`timescale 1ns/1ps

module functional_coverage
(
    input logic clk,

    input logic [3:0] alu_op
);

    covergroup alu_cg @(posedge clk);

        coverpoint alu_op {

            bins add = {0};
            bins sub = {1};
            bins and_op = {2};
            bins or_op  = {3};
            bins xor_op = {4};

        }

    endgroup

    alu_cg cg = new();

endmodule