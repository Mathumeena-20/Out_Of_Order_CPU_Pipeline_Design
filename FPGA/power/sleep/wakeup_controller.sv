`timescale 1ns/1ps

module wakeup_controller
(
    input  logic clk,
    input  logic rst,

    input  logic wake_event,

    output logic wakeup_signal
);

    always_ff @(posedge clk) begin

        if (rst)

            wakeup_signal <= 0;

        else

            wakeup_signal <= wake_event;

    end

endmodule