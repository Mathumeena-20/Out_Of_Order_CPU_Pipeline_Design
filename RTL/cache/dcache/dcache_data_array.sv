`timescale 1ns/1ps

module dcache_data_array
#(
    parameter XLEN  = 64,
    parameter LINES = 64
)
(
    input  logic                         clk,

    input  logic                         write_en,
    input  logic [$clog2(LINES)-1:0]     index,

    input  logic [XLEN-1:0]              write_data,

    output logic [XLEN-1:0]              read_data
);

logic [XLEN-1:0] data_mem [LINES-1:0];

always_ff @(posedge clk) begin

    if (write_en)

        data_mem[index] <= write_data;

end

assign read_data = data_mem[index];

endmodule