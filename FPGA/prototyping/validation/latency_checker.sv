`timescale 1ns/1ps

module latency_checker
(
    input  logic clk,
    input  logic rst,

    input  logic start_event,
    input  logic end_event,

    output logic [31:0] latency
);

    logic counting;

    always_ff @(posedge clk) begin

        if (rst) begin

            latency <= 0;

            counting <= 0;

        end

        else begin

            if (start_event) begin

                counting <= 1;

                latency <= 0;

            end

            else if (counting)

                latency <= latency + 1;

            if (end_event)

                counting <= 0;

        end

    end

endmodule