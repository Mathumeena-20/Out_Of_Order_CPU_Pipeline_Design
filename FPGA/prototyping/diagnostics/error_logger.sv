`timescale 1ns/1ps

module error_logger
#(
    parameter DEPTH = 64
)
(
    input  logic clk,
    input  logic rst,

    input  logic error_valid,

    input  logic [31:0] error_code
);

    logic [31:0]
          error_mem [0:DEPTH-1];

    logic [$clog2(DEPTH)-1:0] wr_ptr;

    always_ff @(posedge clk) begin

        if (rst)

            wr_ptr <= 0;

        else if (error_valid) begin

            error_mem[wr_ptr]
            <= error_code;

            wr_ptr <= wr_ptr + 1;

        end

    end

endmodule