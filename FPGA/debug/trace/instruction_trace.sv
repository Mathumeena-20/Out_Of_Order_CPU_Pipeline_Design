`timescale 1ns/1ps

module instruction_trace
(
    input  logic clk,
    input  logic rst,

    input  logic instr_valid,

    input  logic [31:0] pc,
    input  logic [31:0] instr
);

    always_ff @(posedge clk) begin

        if (!rst && instr_valid)

            $display
            (
                "TRACE PC=%h INSTR=%h",
                pc,
                instr
            );

    end

endmodule