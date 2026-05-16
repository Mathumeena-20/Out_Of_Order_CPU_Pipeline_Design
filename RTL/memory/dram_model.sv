`timescale 1ns/1ps

module dram_model
#(
    parameter XLEN = 64,
    parameter DEPTH = 1024
)
(
    input  logic                 clk,

    input  logic                 read_en,
    input  logic                 write_en,

    input  logic [XLEN-1:0]      addr,
    input  logic [XLEN-1:0]      write_data,

    output logic [XLEN-1:0]      read_data
);

logic [XLEN-1:0] mem [DEPTH-1:0];

always_ff @(posedge clk) begin

    if (write_en)

        mem[addr] <= write_data;

end

assign read_data = mem[addr];

endmodule