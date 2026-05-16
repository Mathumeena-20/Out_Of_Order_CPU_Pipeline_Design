`timescale 1ns/1ps

module wishbone_master
(
    input  logic clk,
    input  logic rst,

    output logic cyc,
    output logic stb,
    output logic we,

    output logic [31:0] addr,
    output logic [31:0] wdata,

    input  logic [31:0] rdata,
    input  logic ack
);

    always_ff @(posedge clk) begin

        if (rst) begin

            cyc <= 0;
            stb <= 0;

        end

        else begin

            cyc   <= 1;
            stb   <= 1;
            we    <= 1;

            addr  <= 32'h1000;

            wdata <= 32'h55AA;

        end

    end

endmodule