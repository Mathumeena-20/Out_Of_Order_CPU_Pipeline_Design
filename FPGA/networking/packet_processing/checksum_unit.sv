`timescale 1ns/1ps

module checksum_unit
(
    input  logic clk,
    input  logic rst,

    input  logic valid,

    input  logic [31:0] data_in,

    output logic [15:0] checksum
);

    logic [31:0] sum;

    always_ff @(posedge clk) begin

        if (rst) begin

            sum <= 0;

            checksum <= 0;

        end

        else if (valid) begin

            sum <=
            data_in[31:16] +
            data_in[15:0];

            checksum <= ~sum[15:0];

        end

    end

endmodule