`timescale 1ns/1ps

module ethernet_phy_if
(
    input  logic clk,
    input  logic rst,

    input  logic phy_tx_en,
    input  logic [7:0] phy_txd,

    output logic phy_ready
);

    always_ff @(posedge clk) begin

        if (rst)

            phy_ready <= 0;

        else

            phy_ready <= phy_tx_en;

    end

endmodule