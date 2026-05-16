`timescale 1ns/1ps

module reset_sync
(
    input  logic clk,
    input  logic async_rst,

    output logic sync_rst
);

    logic ff1, ff2;

    always_ff @(posedge clk or posedge async_rst) begin

        if (async_rst) begin

            ff1 <= 1;
            ff2 <= 1;

        end

        else begin

            ff1 <= 0;
            ff2 <= ff1;

        end

    end

    assign sync_rst = ff2;

endmodule