`timescale 1ns/1ps

module capture_buffer
#(
    parameter WIDTH = 64,
    parameter DEPTH = 128
)
(
    input  logic clk,
    input  logic rst,

    input  logic write_en,

    input  logic [WIDTH-1:0] write_data,

    output logic [WIDTH-1:0] read_data
);

    logic [WIDTH-1:0] mem [0:DEPTH-1];

    logic [$clog2(DEPTH)-1:0] ptr;

    always_ff @(posedge clk) begin

        if (rst)

            ptr <= 0;

        else if (write_en) begin

            mem[ptr] <= write_data;

            ptr <= ptr + 1;

        end

    end

    assign read_data = mem[ptr];

endmodule