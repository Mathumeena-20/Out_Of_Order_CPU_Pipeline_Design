`timescale 1ns/1ps

module ras
#(
    parameter XLEN = 64,
    parameter DEPTH = 16
)
(
    input  logic                 clk,
    input  logic                 rst,

    input  logic                 push,
    input  logic                 pop,

    input  logic [XLEN-1:0]      return_addr,

    output logic [XLEN-1:0]      predicted_return
);

logic [XLEN-1:0] stack [DEPTH-1:0];

logic [$clog2(DEPTH):0] sp;

always_ff @(posedge clk) begin

    if (rst) begin

        sp <= 0;

    end

    else begin

        if (push) begin

            stack[sp] <= return_addr;
            sp <= sp + 1;

        end

        if (pop && sp != 0) begin

            sp <= sp - 1;

        end
    end
end

assign predicted_return =
       (sp != 0) ? stack[sp-1] : 0;

endmodule