`timescale 1ns/1ps

module fpga_bringup
(
    input  logic clk,
    input  logic rst,

    output logic heartbeat_led
);

    logic [31:0] counter;

    always_ff @(posedge clk) begin

        if (rst) begin

            counter <= 0;
            heartbeat_led <= 0;

        end

        else begin

            counter <= counter + 1;

            if (counter == 32'd50000000) begin

                heartbeat_led <=
                ~heartbeat_led;

                counter <= 0;

            end

        end

    end

endmodule