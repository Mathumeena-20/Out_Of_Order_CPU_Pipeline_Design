`timescale 1ns/1ps

module dcache
#(
    parameter XLEN = 64,
    parameter LINES = 64,
    parameter TAG_WIDTH = 20
)
(
    input  logic                     clk,
    input  logic                     rst,

    input  logic [XLEN-1:0]          addr,

    input  logic                     read_en,
    input  logic                     write_en,

    input  logic [XLEN-1:0]          store_data,

    output logic [XLEN-1:0]          load_data,
    output logic                     hit
);

logic [$clog2(LINES)-1:0] index;
logic [TAG_WIDTH-1:0] tag;

logic [TAG_WIDTH-1:0] cache_tag;
logic valid_bit;

logic [XLEN-1:0] cache_data;

assign index = addr[7:2];
assign tag   = addr[31:12];

// --------------------------------------------------
// Tag Array
// --------------------------------------------------

dcache_tag_array tag_array (

    .clk(clk),

    .write_en(write_en),
    .index(index),

    .write_tag(tag),
    .write_valid(1'b1),

    .read_tag(cache_tag),
    .read_valid(valid_bit)
);

// --------------------------------------------------
// Data Array
// --------------------------------------------------

dcache_data_array data_array (

    .clk(clk),

    .write_en(write_en),
    .index(index),

    .write_data(store_data),

    .read_data(cache_data)
);

// --------------------------------------------------
// Hit Logic
// --------------------------------------------------

assign hit = valid_bit &&
             (cache_tag == tag);

assign load_data = cache_data;

endmodule