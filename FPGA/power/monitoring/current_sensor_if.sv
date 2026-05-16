`timescale 1ns/1ps

module current_sensor_if
(
    input  logic clk,
    input  logic rst,

    input  logic [11:0] adc_current,

    output logic [11:0] current_value
);

    always_ff @(posedge clk) begin

        if (rst)

            current_value <= 0;

        else

            current_value <= adc_current;

    end

endmodule