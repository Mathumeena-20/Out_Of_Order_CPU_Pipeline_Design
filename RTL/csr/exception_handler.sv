`timescale 1ns/1ps

module exception_handler
(
    input  logic exception_valid,

    output logic trap_taken
);

assign trap_taken = exception_valid;

endmodule