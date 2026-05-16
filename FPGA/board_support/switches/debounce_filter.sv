`timescale 1ns/1ps

module debounce_filter
(
    input  logic clk,
    input  logic rst,

    input  logic noisy_in,

    output logic clean_out
);

    logic [15:0] counter;

    always_ff @(posedge clk) begin

        if (rst) begin

            counter <= 0;
            clean_out <= 0;

        end

        else begin

            if (noisy_in != clean_out) begin

                counter <= counter + 1;

                if (counter == 16'hFFFF)

                    clean_out <= noisy_in;

            end

            else

                counter <= 0;

        end

    end

endmodule