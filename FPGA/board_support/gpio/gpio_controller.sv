`timescale 1ns/1ps

module gpio_controller
#(
    parameter WIDTH = 8
)
(
    input  logic clk,
    input  logic rst,

    input  logic [WIDTH-1:0] write_data,
    input  logic             write_en,

    output logic [WIDTH-1:0] gpio_out
);

    always_ff @(posedge clk) begin

        if (rst)

            gpio_out <= 0;

        else if (write_en)

            gpio_out <= write_data;

    end

endmodule