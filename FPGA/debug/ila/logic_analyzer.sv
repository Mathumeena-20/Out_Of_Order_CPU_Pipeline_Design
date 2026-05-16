`timescale 1ns/1ps

module logic_analyzer
#(
    parameter WIDTH = 64,
    parameter DEPTH = 256
)
(
    input  logic clk,
    input  logic rst,

    input  logic trigger,

    input  logic [WIDTH-1:0] probe_data
);

    logic [WIDTH-1:0] capture_mem [0:DEPTH-1];

    logic [$clog2(DEPTH)-1:0] wr_ptr;

    always_ff @(posedge clk) begin

        if (rst)

            wr_ptr <= 0;

        else if (trigger) begin

            capture_mem[wr_ptr]
            <= probe_data;

            wr_ptr <= wr_ptr + 1;

        end

    end

endmodule