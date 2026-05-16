`timescale 1ns/1ps

module ddr_phy
(
    input  logic clk,
    input  logic rst,

    input  logic [63:0] tx_data,

    output logic [63:0] rx_data
);

    always_ff @(posedge clk) begin

        if (rst)

            rx_data <= 0;

        else

            rx_data <= tx_data;

    end

endmodule