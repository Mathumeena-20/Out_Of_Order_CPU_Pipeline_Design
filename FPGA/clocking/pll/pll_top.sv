`timescale 1ns/1ps

module pll_top
#(
    parameter DIVIDE = 2
)
(
    input  logic clk_in,
    input  logic rst,

    output logic clk_out
);

    logic [$clog2(DIVIDE)-1:0] counter;

    always_ff @(posedge clk_in) begin

        if (rst) begin

            counter <= 0;
            clk_out <= 0;

        end

        else begin

            counter <= counter + 1;

            if (counter == DIVIDE-1) begin

                clk_out <= ~clk_out;
                counter <= 0;

            end

        end

    end

endmodule