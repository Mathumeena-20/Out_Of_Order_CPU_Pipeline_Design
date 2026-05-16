`timescale 1ns/1ps

module icache
#(
    parameter XLEN = 64,
    parameter LINES = 64,
    parameter TAG_WIDTH = 20
)
(
    input  logic                     clk,
    input  logic                     rst,

    input  logic [XLEN-1:0]          pc,

    output logic [31:0]              instruction,
    output logic                     hit
);

logic [$clog2(LINES)-1:0] index;
logic [TAG_WIDTH-1:0]     tag;

logic [TAG_WIDTH-1:0] cache_tag;
logic                  valid_bit;

logic [31:0] cache_data;

assign index = pc[7:2];
assign tag   = pc[31:12];

// --------------------------------------------------
// Tag Array
// --------------------------------------------------

icache_tag_array tag_array (

    .clk(clk),

    .write_en(1'b0),
    .index(index),

    .write_tag(0),
    .write_valid(0),

    .read_tag(cache_tag),
    .read_valid(valid_bit)
);

// --------------------------------------------------
// Data Array
// --------------------------------------------------

icache_data_array data_array (

    .clk(clk),

    .write_en(1'b0),
    .index(index),

    .write_data(0),

    .read_data(cache_data)
);

// --------------------------------------------------
// Hit Logic
// --------------------------------------------------

assign hit = valid_bit &&
             (cache_tag == tag);

assign instruction = cache_data;

endmodule