`timescale 1ns/1ps

module trace_buffer
#(
    parameter DEPTH = 256
)
(
    input  logic clk,
    input  logic rst,

    input  logic trace_valid,
    input  logic [63:0] trace_data
);

    logic [63:0] mem [0:DEPTH-1];

    logic [$clog2(DEPTH)-1:0] ptr;

    always_ff @(posedge clk) begin

        if (rst)

            ptr <= 0;

        else if (trace_valid) begin

            mem[ptr] <= trace_data;

            ptr <= ptr + 1;

        end

    end

endmodule