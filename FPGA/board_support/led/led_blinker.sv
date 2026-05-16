`timescale 1ns/1ps

module led_blinker
(
    input  logic clk,
    input  logic rst,

    output logic led
);

    logic [31:0] counter;

    always_ff @(posedge clk) begin

        if (rst) begin

            counter <= 0;
            led <= 0;

        end

        else begin

            counter <= counter + 1;

            if (counter == 32'd50000000) begin

                led <= ~led;
                counter <= 0;

            end

        end

    end

endmodule