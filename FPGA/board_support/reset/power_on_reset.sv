`timescale 1ns/1ps

module power_on_reset
(
    input  logic clk,

    output logic rst
);

    logic [15:0] counter;

    always_ff @(posedge clk) begin

        if (counter < 16'hFFFF) begin

            counter <= counter + 1;
            rst <= 1;

        end

        else

            rst <= 0;

    end

endmodule