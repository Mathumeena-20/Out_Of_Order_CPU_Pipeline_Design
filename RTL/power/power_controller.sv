`timescale 1ns/1ps

module power_controller
(
    input logic idle,

    output logic low_power_mode
);

assign low_power_mode = idle;

endmodule