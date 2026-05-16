`timescale 1ns/1ps

module performance_counters
(
    input  logic clk,
    input  logic rst,

    input  logic instr_retired,
    input  logic cache_miss,
    input  logic branch_miss,

    output logic [63:0] instr_count,
    output logic [63:0] cache_miss_count,
    output logic [63:0] branch_miss_count
);

    always_ff @(posedge clk) begin

        if (rst) begin

            instr_count <= 0;

            cache_miss_count <= 0;

            branch_miss_count <= 0;

        end

        else begin

            if (instr_retired)

                instr_count <=
                instr_count + 1;

            if (cache_miss)

                cache_miss_count <=
                cache_miss_count + 1;

            if (branch_miss)

                branch_miss_count <=
                branch_miss_count + 1;

        end

    end

endmodule