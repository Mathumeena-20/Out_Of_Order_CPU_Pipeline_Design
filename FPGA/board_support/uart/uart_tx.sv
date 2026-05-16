`timescale 1ns/1ps

module uart_baud_gen
#(
    parameter CLK_FREQ = 50000000,
    parameter BAUDRATE = 115200
)
(
    input  logic clk,
    input  logic rst,

    output logic baud_tick
);

    localparam DIVISOR =
               CLK_FREQ / BAUDRATE;

    logic [31:0] counter;

    always_ff @(posedge clk) begin

        if (rst) begin

            counter   <= 0;
            baud_tick <= 0;

        end

        else begin

            if (counter == DIVISOR-1) begin

                counter   <= 0;
                baud_tick <= 1;

            end

            else begin

                counter   <= counter + 1;
                baud_tick <= 0;

            end

        end

    end

endmodule