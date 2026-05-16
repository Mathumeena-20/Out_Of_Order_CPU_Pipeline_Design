`timescale 1ns/1ps

module interrupt_controller
(
    input  logic timer_interrupt,
    input  logic external_interrupt,

    output logic interrupt_taken
);

assign interrupt_taken =
       timer_interrupt ||
       external_interrupt;

endmodule