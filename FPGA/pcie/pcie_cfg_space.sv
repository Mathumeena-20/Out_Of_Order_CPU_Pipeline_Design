`timescale 1ns/1ps

module pcie_cfg_space
(
    input  logic clk,
    input  logic rst,

    input  logic cfg_read,
    input  logic cfg_write,

    input  logic [7:0] cfg_addr,
    input  logic [31:0] cfg_wdata,

    output logic [31:0] cfg_rdata
);

    logic [31:0] cfg_regs [0:255];

    always_ff @(posedge clk) begin

        if (rst) begin

            cfg_rdata <= 0;

        end

        else begin

            if (cfg_write)

                cfg_regs[cfg_addr]
                <= cfg_wdata;

            if (cfg_read)

                cfg_rdata
                <= cfg_regs[cfg_addr];

        end

    end

endmodule