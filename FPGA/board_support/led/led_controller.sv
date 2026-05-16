`timescale 1ns/1ps

module led_controller
(
    input  logic [7:0] led_data,
    output logic [7:0] leds
);

    assign leds = led_data;

endmodule