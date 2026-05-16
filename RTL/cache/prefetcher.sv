`timescale 1ns/1ps

module prefetcher
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] current_pc,

    output logic [XLEN-1:0] prefetch_addr
);

assign prefetch_addr = current_pc + 64;

endmodule