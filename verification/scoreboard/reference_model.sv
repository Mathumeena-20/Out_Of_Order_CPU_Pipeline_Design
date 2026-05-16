`timescale 1ns/1ps

module reference_model
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] a,
    input  logic [XLEN-1:0] b,

    output logic [XLEN-1:0] expected_result
);

assign expected_result = a + b;

endmodule
