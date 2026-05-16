`timescale 1ns/1ps

module axi_arbiter
(
    input  logic clk,
    input  logic rst,

    input  logic req0,
    input  logic req1,

    output logic grant0,
    output logic grant1
);

    always_ff @(posedge clk) begin

        if (rst) begin

            grant0 <= 0;
            grant1 <= 0;

        end

        else begin

            if (req0) begin

                grant0 <= 1;
                grant1 <= 0;

            end

            else if (req1) begin

                grant0 <= 0;
                grant1 <= 1;

            end

        end

    end

endmodule