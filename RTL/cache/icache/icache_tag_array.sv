`timescale 1ns/1ps

module icache_tag_array
#(
    parameter TAG_WIDTH = 20,
    parameter LINES     = 64
)
(
    input  logic                             clk,

    input  logic                             write_en,
    input  logic [$clog2(LINES)-1:0]         index,

    input  logic [TAG_WIDTH-1:0]             write_tag,
    input  logic                             write_valid,

    output logic [TAG_WIDTH-1:0]             read_tag,
    output logic                             read_valid
);

logic [TAG_WIDTH-1:0] tag_mem [LINES-1:0];
logic                  valid_mem [LINES-1:0];

always_ff @(posedge clk) begin

    if (write_en) begin

        tag_mem[index]   <= write_tag;
        valid_mem[index] <= write_valid;

    end
end

assign read_tag   = tag_mem[index];
assign read_valid = valid_mem[index];

endmodule