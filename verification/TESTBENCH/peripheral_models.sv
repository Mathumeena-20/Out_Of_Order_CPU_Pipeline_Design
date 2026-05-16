`timescale 1ns/1ps

module peripheral_models
(
    input  logic clk,
    input  logic rst,

    input  logic uart_tx,

    output logic uart_rx
);

    // Simple loopback model

    always_ff @(posedge clk) begin

        if (rst)

            uart_rx <= 1'b1;

        else

            uart_rx <= uart_tx;

    end

endmodule