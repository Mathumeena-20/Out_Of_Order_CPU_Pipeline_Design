`timescale 1ns/1ps

module dynamic_frequency_scaling
(
    input  logic clk,
    input  logic rst,

    input  logic [1:0] freq_select,

    output logic scaled_clk
);

    logic [3:0] counter;
    logic [3:0] divide_value;

    always_comb begin

        case(freq_select)

            2'b00:
                divide_value = 1;

            2'b01:
                divide_value = 2;

            2'b10:
                divide_value = 4;

            2'b11:
                divide_value = 8;

            default:
                divide_value = 1;

        endcase

    end

    always_ff @(posedge clk) begin

        if (rst) begin

            counter <= 0;

            scaled_clk <= 0;

        end

        else begin

            if (counter == divide_value-1) begin

                scaled_clk <= ~scaled_clk;

                counter <= 0;

            end

            else

                counter <= counter + 1;

        end

    end

endmodule