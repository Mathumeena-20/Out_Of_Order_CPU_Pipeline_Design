`timescale 1ns/1ps

module switch_interface
(
    input  logic switch_in,
    output logic switch_out
);

    assign switch_out = switch_in;

endmodule