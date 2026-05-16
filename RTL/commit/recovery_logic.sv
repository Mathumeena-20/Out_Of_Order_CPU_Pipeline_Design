`timescale 1ns/1ps

module recovery_logic
#(
    parameter XLEN = 64
)
(
    input  logic                 flush,

    input  logic [XLEN-1:0]      recovery_pc,

    output logic                 recovery_valid,
    output logic [XLEN-1:0]      restart_pc
);

assign recovery_valid = flush;
assign restart_pc     = recovery_pc;

endmodule