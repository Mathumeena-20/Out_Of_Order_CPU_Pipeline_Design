`timescale 1ns/1ps

module csr_top
#(
    parameter XLEN = 64
)
(
    input  logic                 clk,

    input  logic                 exception_valid,
    input  logic                 timer_interrupt,
    input  logic                 external_interrupt,

    output logic                 trap_taken
);

logic interrupt_taken;

exception_handler eh (

    .exception_valid(exception_valid),

    .trap_taken(trap_taken)
);

interrupt_controller ic (

    .timer_interrupt(timer_interrupt),
    .external_interrupt(external_interrupt),

    .interrupt_taken(interrupt_taken)
);

endmodule