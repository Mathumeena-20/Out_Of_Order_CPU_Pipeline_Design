`timescale 1ns/1ps

module gpio_interface
#(
    parameter WIDTH = 8
)
(
    input  logic [WIDTH-1:0] gpio_in,
    output logic [WIDTH-1:0] gpio_out
);

    assign gpio_out = gpio_in;

endmodule