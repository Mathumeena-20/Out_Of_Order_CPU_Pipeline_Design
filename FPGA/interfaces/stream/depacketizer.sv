`timescale 1ns/1ps

module depacketizer
(
    input  logic clk,
    input  logic rst,

    input  logic [39:0] packet,

    output logic [31:0] payload
);

    always_ff @(posedge clk) begin

        if (rst)

            payload <= 0;

        else

            payload <= packet[31:0];

    end

endmodule