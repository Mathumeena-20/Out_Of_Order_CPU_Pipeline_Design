`timescale 1ns/1ps

module cache_top
#(
    parameter XLEN = 64
)
(
    input  logic                     clk,
    input  logic                     rst,

    // Instruction Fetch
    input  logic [XLEN-1:0]          fetch_pc,

    output logic [31:0]              instruction,

    // Data Access
    input  logic [XLEN-1:0]          data_addr,

    input  logic                     load_en,
    input  logic                     store_en,

    input  logic [XLEN-1:0]          store_data,

    output logic [XLEN-1:0]          load_data
);

logic icache_hit;
logic dcache_hit;

// --------------------------------------------------
// Instruction Cache
// --------------------------------------------------

icache icache_u (

    .clk(clk),
    .rst(rst),

    .pc(fetch_pc),

    .instruction(instruction),
    .hit(icache_hit)
);

// --------------------------------------------------
// Data Cache
// --------------------------------------------------

dcache dcache_u (

    .clk(clk),
    .rst(rst),

    .addr(data_addr),

    .read_en(load_en),
    .write_en(store_en),

    .store_data(store_data),

    .load_data(load_data),
    .hit(dcache_hit)
);

endmodule