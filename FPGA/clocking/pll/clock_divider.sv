`timescale 1ns/1ps

module clock_divider
#(
    parameter DIVISOR = 4
)
(
    input  logic clk_in,
    input  logic rst,

    output logic clk_out
);

    logic [$clog2(DIVISOR)-1:0] counter;

    always_ff @(posedge clk_in) begin

        if (rst) begin

            counter <= 0;

            clk_out <= 0;

        end

        else begin

            if (counter == DIVISOR-1) begin

                clk_out <= ~clk_out;

                counter <= 0;

            end

            else

                counter <= counter + 1;

        end

    end

endmodule