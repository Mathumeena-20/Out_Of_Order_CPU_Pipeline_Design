`timescale 1ns/1ps

module parser
(
    input  logic clk,
    input  logic rst,

    input  logic valid,

    input  logic [63:0] packet,

    output logic [15:0] header,

    output logic [31:0] payload
);

    always_ff @(posedge clk) begin

        if (rst) begin

            header  <= 0;

            payload <= 0;

        end

        else if (valid) begin

            header  <= packet[63:48];

            payload <= packet[31:0];

        end

    end

endmodule