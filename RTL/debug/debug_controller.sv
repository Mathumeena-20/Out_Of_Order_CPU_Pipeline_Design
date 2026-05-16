`timescale 1ns/1ps

module debug_controller
(
    input logic halt_req,

    output logic core_halt
);

assign core_halt = halt_req;

endmodule