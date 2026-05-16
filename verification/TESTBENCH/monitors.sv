`timescale 1ns/1ps

module monitors
(
    input logic        clk,

    input logic [31:0] instruction,
    input logic        valid,

    input logic [63:0] alu_result,

    input logic        commit_en
);

    always_ff @(posedge clk) begin

        if (valid) begin

            $display("--------------------------------");

            $display("TIME        : %0t", $time);

            $display("INSTRUCTION : %h",
                     instruction);

            $display("ALU RESULT  : %h",
                     alu_result);

            $display("COMMIT      : %0d",
                     commit_en);

            $display("--------------------------------");

        end

    end

endmodule