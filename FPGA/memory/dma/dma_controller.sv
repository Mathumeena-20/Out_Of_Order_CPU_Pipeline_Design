`timescale 1ns/1ps

module dma_controller
(
    input  logic clk,
    input  logic rst,

    input  logic start,

    input  logic [31:0] src_addr,
    input  logic [31:0] dst_addr,

    input  logic [15:0] length,

    output logic done
);

    logic [15:0] counter;

    always_ff @(posedge clk) begin

        if (rst) begin

            counter <= 0;

            done <= 0;

        end

        else if (start) begin

            counter <= counter + 1;

            if (counter == length)

                done <= 1;

        end

    end

endmodule