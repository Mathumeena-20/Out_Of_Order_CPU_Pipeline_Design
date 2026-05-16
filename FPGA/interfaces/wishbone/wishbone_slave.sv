`timescale 1ns/1ps

module wishbone_slave
(
    input  logic clk,
    input  logic rst,

    input  logic cyc,
    input  logic stb,
    input  logic we,

    input  logic [31:0] addr,
    input  logic [31:0] wdata,

    output logic [31:0] rdata,
    output logic ack
);

    logic [31:0] mem [0:255];

    always_ff @(posedge clk) begin

        if (cyc && stb) begin

            ack <= 1;

            if (we)

                mem[addr] <= wdata;

            else

                rdata <= mem[addr];

        end

        else

            ack <= 0;

    end

endmodule