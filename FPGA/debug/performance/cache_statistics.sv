`timescale 1ns/1ps

module cache_statistics
(
    input  logic clk,
    input  logic rst,

    input  logic cache_hit,
    input  logic cache_miss,

    output logic [31:0] hit_count,
    output logic [31:0] miss_count
);

    always_ff @(posedge clk) begin

        if (rst) begin

            hit_count  <= 0;
            miss_count <= 0;

        end

        else begin

            if (cache_hit)

                hit_count <=
                hit_count + 1;

            if (cache_miss)

                miss_count <=
                miss_count + 1;

        end

    end

endmodule