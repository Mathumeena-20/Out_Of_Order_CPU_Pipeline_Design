`timescale 1ns/1ps

module reset_controller
(
    input  logic ext_reset,

    output logic core_reset
);

assign core_reset = ext_reset;

endmodule