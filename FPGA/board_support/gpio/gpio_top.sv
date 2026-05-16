`timescale 1ns/1ps

module gpio_top
(
    input  logic clk,
    input  logic rst,

    input  logic [7:0] gpio_in,

    output logic [7:0] gpio_out
);

    gpio_interface gpio_if
    (
        .gpio_in(gpio_in),
        .gpio_out(gpio_out)
    );

endmodule