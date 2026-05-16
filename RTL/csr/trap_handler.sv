`timescale 1ns/1ps

module trap_handler
#(
    parameter XLEN = 64
)
(
    input  logic                 trap_taken,

    input  logic [XLEN-1:0]      trap_vector,

    output logic [XLEN-1:0]      trap_pc
);

assign trap_pc =
       (trap_taken) ? trap_vector : 0;

endmodule