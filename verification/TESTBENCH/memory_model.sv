`timescale 1ns/1ps

module memory_model
#(
    parameter XLEN = 64,
    parameter MEM_DEPTH = 1024
)
(
    input  logic                     clk,

    input  logic                     read_en,
    input  logic                     write_en,

    input  logic [XLEN-1:0]          addr,
    input  logic [XLEN-1:0]          write_data,

    output logic [XLEN-1:0]          read_data
);

    // -------------------------------------------------
    // Memory Array
    // -------------------------------------------------

    logic [XLEN-1:0] mem [0:MEM_DEPTH-1];

    integer i;

    // -------------------------------------------------
    // Memory Initialization
    // -------------------------------------------------

    initial begin

        for (i = 0; i < MEM_DEPTH; i = i + 1)

            mem[i] = 0;

    end

    // -------------------------------------------------
    // Write Operation
    // -------------------------------------------------

    always_ff @(posedge clk) begin

        if (write_en)

            mem[addr] <= write_data;

    end

    // -------------------------------------------------
    // Read Operation
    // -------------------------------------------------

    always_comb begin

        if (read_en)

            read_data = mem[addr];

        else

            read_data = 0;

    end

endmodule