`timescale 1ns/1ps

module pcie_bar_controller
#(
    parameter BAR_SIZE = 1024
)
(
    input  logic clk,
    input  logic rst,

    input  logic bar_read,
    input  logic bar_write,

    input  logic [31:0] bar_addr,

    input  logic [31:0] bar_wdata,

    output logic [31:0] bar_rdata
);

    logic [31:0]
          bar_mem [0:BAR_SIZE-1];

    always_ff @(posedge clk) begin

        if (rst)

            bar_rdata <= 0;

        else begin

            if (bar_write)

                bar_mem[bar_addr]
                <= bar_wdata;

            if (bar_read)

                bar_rdata
                <= bar_mem[bar_addr];

        end

    end

endmodule