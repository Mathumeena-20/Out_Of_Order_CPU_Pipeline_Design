`timescale 1ns/1ps

module pll_reconfig
(
    input  logic clk,
    input  logic rst,

    input  logic reconfig_req,

    input  logic [7:0] divide_value,

    output logic reconfig_done
);

    logic [7:0] current_divide;

    always_ff @(posedge clk) begin

        if (rst) begin

            current_divide <= 2;

            reconfig_done <= 0;

        end

        else begin

            if (reconfig_req) begin

                current_divide <= divide_value;

                reconfig_done <= 1;

            end

            else

                reconfig_done <= 0;

        end

    end

endmodule