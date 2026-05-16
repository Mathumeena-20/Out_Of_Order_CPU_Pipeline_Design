`timescale 1ns/1ps

module memory_controller
#(
    parameter XLEN = 64
)
(
    input  logic                 read_en,
    input  logic                 write_en,

    output logic                 mem_ready
);

assign mem_ready = read_en || write_en;

endmodule