`timescale 1ns/1ps

module thermal_monitor
(
    input  logic clk,
    input  logic rst,

    input  logic [7:0] temperature,

    output logic thermal_warning,
    output logic thermal_shutdown
);

    always_ff @(posedge clk) begin

        if (rst) begin

            thermal_warning  <= 0;
            thermal_shutdown <= 0;

        end

        else begin

            if (temperature > 8'd80)

                thermal_warning <= 1;

            else

                thermal_warning <= 0;

            if (temperature > 8'd100)

                thermal_shutdown <= 1;

            else

                thermal_shutdown <= 0;

        end

    end

endmodule