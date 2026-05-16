`timescale 1ns/1ps

module pc_logic
#(
    parameter XLEN = 64
)
(
    input  logic                 clk,
    input  logic                 rst,

    input  logic                 stall,
    input  logic                 flush,

    input  logic [XLEN-1:0]      next_pc,

    output logic [XLEN-1:0]      pc
);

    // -------------------------------------------------
    // Program Counter Register
    // -------------------------------------------------

    always_ff @(posedge clk) begin

        if (rst)

            pc <= 64'h0000_0000_8000_0000;

        else if (flush)

            pc <= next_pc;

        else if (!stall)

            pc <= next_pc;

    end

endmodule