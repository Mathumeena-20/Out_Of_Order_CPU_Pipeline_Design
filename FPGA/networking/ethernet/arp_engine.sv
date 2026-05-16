`timescale 1ns/1ps

module arp_engine
(
    input  logic clk,
    input  logic rst,

    input  logic arp_req,

    input  logic [31:0] ip_addr,

    output logic arp_valid,

    output logic [47:0] mac_addr
);

    always_ff @(posedge clk) begin

        if (rst) begin

            arp_valid <= 0;

            mac_addr <= 0;

        end

        else if (arp_req) begin

            arp_valid <= 1;

            // Example MAC Mapping

            mac_addr <=
            48'h001122334455;

        end

        else

            arp_valid <= 0;

    end

endmodule