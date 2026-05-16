`timescale 1ns/1ps

module dual_port_ram
#(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 32
)
(
    input  logic clk,

    // Port A
    input  logic we_a,
    input  logic [ADDR_WIDTH-1:0] addr_a,
    input  logic [DATA_WIDTH-1:0] wdata_a,
    output logic [DATA_WIDTH-1:0] rdata_a,

    // Port B
    input  logic we_b,
    input  logic [ADDR_WIDTH-1:0] addr_b,
    input  logic [DATA_WIDTH-1:0] wdata_b,
    output logic [DATA_WIDTH-1:0] rdata_b
);

    logic [DATA_WIDTH-1:0]
          mem [0:(1<<ADDR_WIDTH)-1];

    always_ff @(posedge clk) begin

        if (we_a)

            mem[addr_a] <= wdata_a;

        rdata_a <= mem[addr_a];

        if (we_b)

            mem[addr_b] <= wdata_b;

        rdata_b <= mem[addr_b];

    end

endmodule