`timescale 1ns/1ps

module board_model
(
    input  logic clk,
    input  logic rst,

    output logic power_good
);

    always_ff @(posedge clk) begin

        if (rst)

            power_good <= 0;

        else

            power_good <= 1;

    end

endmodule