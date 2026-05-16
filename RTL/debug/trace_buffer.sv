`timescale 1ns/1ps

module trace_buffer
#(
    parameter XLEN = 64
)
(
    input logic clk,

    input logic [XLEN-1:0] trace_data
);

always_ff @(posedge clk)

    $display("TRACE: %h", trace_data);

endmodule