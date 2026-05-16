`timescale 1ns/1ps

module performance_counters
(
    input logic clk,
    input logic rst,

    input logic instruction_commit,

    output logic [63:0] cycle_count,
    output logic [63:0] instret_count
);

always_ff @(posedge clk) begin

    if (rst) begin

        cycle_count   <= 0;
        instret_count <= 0;

    end

    else begin

        cycle_count <= cycle_count + 1;

        if (instruction_commit)
            instret_count <= instret_count + 1;

    end
end

endmodule