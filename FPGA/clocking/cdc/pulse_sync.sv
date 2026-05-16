`timescale 1ns/1ps

module pulse_sync
(
    input  logic src_clk,
    input  logic dst_clk,
    input  logic rst,

    input  logic pulse_in,

    output logic pulse_out
);

    logic toggle_src;
    logic sync_ff1;
    logic sync_ff2;

    // -----------------------------------------
    // Source Domain
    // -----------------------------------------

    always_ff @(posedge src_clk) begin

        if (rst)

            toggle_src <= 0;

        else if (pulse_in)

            toggle_src <= ~toggle_src;

    end

    // -----------------------------------------
    // Destination Domain
    // -----------------------------------------

    always_ff @(posedge dst_clk) begin

        if (rst) begin

            sync_ff1 <= 0;
            sync_ff2 <= 0;

        end

        else begin

            sync_ff1 <= toggle_src;
            sync_ff2 <= sync_ff1;

        end

    end

    assign pulse_out =
           sync_ff1 ^ sync_ff2;

endmodule