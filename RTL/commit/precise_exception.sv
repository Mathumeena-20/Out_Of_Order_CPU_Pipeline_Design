`timescale 1ns/1ps

module precise_exception
#(
    parameter XLEN = 64
)
(
    input  logic                 exception_valid,
    input  logic [XLEN-1:0]      exception_pc,

    output logic                 flush_pipeline,
    output logic [XLEN-1:0]      trap_pc
);

assign flush_pipeline = exception_valid;
assign trap_pc        = exception_pc;

endmodule