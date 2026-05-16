`timescale 1ns/1ps

module packetizer
(
    input  logic clk,
    input  logic rst,

    input  logic [31:0] payload,

    output logic [39:0] packet
);

    always_ff @(posedge clk) begin

        if (rst)

            packet <= 0;

        else

            packet <=
            {8'hAA, payload};

    end

endmodule