`timescale 1ns/1ps

module dma_engine
(
    input  logic clk,
    input  logic rst,

    input  logic dma_req,

    input  logic [63:0] src_data,

    output logic [63:0] dst_data,

    output logic dma_done
);

    always_ff @(posedge clk) begin

        if (rst) begin

            dst_data <= 0;

            dma_done <= 0;

        end

        else if (dma_req) begin

            dst_data <= src_data;

            dma_done <= 1;

        end

        else

            dma_done <= 0;

    end

endmodule