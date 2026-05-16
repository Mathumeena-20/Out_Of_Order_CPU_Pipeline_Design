`timescale 1ns/1ps

module recovery_controller
(
    input  logic clk,
    input  logic rst,

    input  logic fault_detected,

    output logic recovery_start
);

    always_ff @(posedge clk) begin

        if (rst)

            recovery_start <= 0;

        else

            recovery_start <=
            fault_detected;

    end

endmodule