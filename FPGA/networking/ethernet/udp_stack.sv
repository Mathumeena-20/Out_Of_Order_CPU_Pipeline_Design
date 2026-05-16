`timescale 1ns/1ps

module udp_stack
(
    input  logic clk,
    input  logic rst,

    input  logic udp_valid,

    input  logic [15:0] src_port,
    input  logic [15:0] dst_port,

    input  logic [31:0] payload,

    output logic tx_valid,

    output logic [63:0] udp_packet
);

    always_ff @(posedge clk) begin

        if (rst) begin

            tx_valid   <= 0;

            udp_packet <= 0;

        end

        else if (udp_valid) begin

            udp_packet <=
            {
                src_port,
                dst_port,
                payload
            };

            tx_valid <= 1;

        end

        else

            tx_valid <= 0;

    end

endmodule