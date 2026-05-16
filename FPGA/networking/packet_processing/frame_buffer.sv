`timescale 1ns/1ps

module frame_buffer
#(
    parameter WIDTH = 64,
    parameter DEPTH = 64
)
(
    input  logic clk,
    input  logic rst,

    input  logic write_en,
    input  logic read_en,

    input  logic [WIDTH-1:0] write_data,

    output logic [WIDTH-1:0] read_data
);

    logic [WIDTH-1:0]
          mem [0:DEPTH-1];

    logic [$clog2(DEPTH)-1:0] wr_ptr;
    logic [$clog2(DEPTH)-1:0] rd_ptr;

    always_ff @(posedge clk) begin

        if (rst) begin

            wr_ptr <= 0;

            rd_ptr <= 0;

        end

        else begin

            if (write_en) begin

                mem[wr_ptr]
                <= write_data;

                wr_ptr <= wr_ptr + 1;

            end

            if (read_en) begin

                read_data <=
                mem[rd_ptr];

                rd_ptr <= rd_ptr + 1;

            end

        end

    end

endmodule