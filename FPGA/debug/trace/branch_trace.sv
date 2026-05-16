`timescale 1ns/1ps

module branch_trace
(
    input  logic clk,
    input  logic rst,

    input  logic branch_valid,

    input  logic [31:0] pc,

    input  logic taken
);

    always_ff @(posedge clk) begin

        if (!rst && branch_valid)

            $display
            (
                "BRANCH TRACE PC=%h TAKEN=%b",
                pc,
                taken
            );

    end

endmodule