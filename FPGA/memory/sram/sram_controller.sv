`timescale 1ns/1ps

module sram_controller
#(
    parameter ADDR_WIDTH = 10,
    parameter DATA_WIDTH = 32
)
(
    input  logic clk,

    input  logic write_en,

    input  logic [ADDR_WIDTH-1:0] addr,

    input  logic [DATA_WIDTH-1:0] wdata,

    output logic [DATA_WIDTH-1:0] rdata
);

    logic [DATA_WIDTH-1:0]
          mem [0:(1<<ADDR_WIDTH)-1];

    always_ff @(posedge clk) begin

        if (write_en)

            mem[addr] <= wdata;

        rdata <= mem[addr];

    end

endmodule