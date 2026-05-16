`timescale 1ns/1ps

module pcie_dma
(
    input  logic clk,
    input  logic rst,

    input  logic dma_start,

    input  logic [31:0] src_addr,
    input  logic [31:0] dst_addr,

    input  logic [15:0] transfer_size,

    output logic dma_done
);

    logic [15:0] counter;

    always_ff @(posedge clk) begin

        if (rst) begin

            counter <= 0;

            dma_done <= 0;

        end

        else if (dma_start) begin

            counter <= counter + 1;

            if (counter == transfer_size) begin

                dma_done <= 1;

            end

        end

        else begin

            dma_done <= 0;

        end

    end

endmodule