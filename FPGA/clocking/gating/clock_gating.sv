`timescale 1ns/1ps

module clock_gating
(
    input  logic clk,
    input  logic enable,

    output logic gated_clk
);

    assign gated_clk =
           clk & enable;

endmodule