`timescale 1ns/1ps

module cycle_counter
(
    input  logic clk,
    input  logic rst,

    output logic [63:0] cycle_count
);

    always_ff @(posedge clk) begin

        if (rst)

            cycle_count <= 0;

        else

            cycle_count <=
            cycle_count + 1;

    end

endmodule