`timescale 1ns/1ps

module async_fifo
#(
    parameter WIDTH = 64,
    parameter DEPTH = 16
)
(
    input  logic wr_clk,
    input  logic rd_clk,
    input  logic rst,

    input  logic wr_en,
    input  logic rd_en,

    input  logic [WIDTH-1:0] wr_data,

    output logic [WIDTH-1:0] rd_data,

    output logic full,
    output logic empty
);

    logic [WIDTH-1:0]
          mem [0:DEPTH-1];

    logic [$clog2(DEPTH):0] wr_ptr;
    logic [$clog2(DEPTH):0] rd_ptr;

    assign full =
           ((wr_ptr + 1) == rd_ptr);

    assign empty =
           (wr_ptr == rd_ptr);

    // -----------------------------------------
    // Write Domain
    // -----------------------------------------

    always_ff @(posedge wr_clk) begin

        if (rst)

            wr_ptr <= 0;

        else if (wr_en && !full) begin

            mem[wr_ptr] <= wr_data;

            wr_ptr <= wr_ptr + 1;

        end

    end

    // -----------------------------------------
    // Read Domain
    // -----------------------------------------

    always_ff @(posedge rd_clk) begin

        if (rst)

            rd_ptr <= 0;

        else if (rd_en && !empty) begin

            rd_data <= mem[rd_ptr];

            rd_ptr <= rd_ptr + 1;

        end

    end

endmodule