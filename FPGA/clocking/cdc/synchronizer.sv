`timescale 1ns/1ps

module synchronizer
(
    input  logic clk,
    input  logic rst,

    input  logic async_signal,

    output logic sync_signal
);

    logic ff1, ff2;

    always_ff @(posedge clk) begin

        if (rst) begin

            ff1 <= 0;
            ff2 <= 0;

        end

        else begin

            ff1 <= async_signal;

            ff2 <= ff1;

        end

    end

    assign sync_signal = ff2;

endmodule