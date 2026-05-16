`timescale 1ns/1ps

module frequency_controller
(
    input  logic clk,
    input  logic rst,

    input  logic [1:0] freq_select,

    output logic scaled_clk
);

    logic [3:0] counter;
    logic [3:0] divide_ratio;

    always_comb begin

        case(freq_select)

            2'b00:
                divide_ratio = 1;

            2'b01:
                divide_ratio = 2;

            2'b10:
                divide_ratio = 4;

            2'b11:
                divide_ratio = 8;

            default:
                divide_ratio = 1;

        endcase

    end

    always_ff @(posedge clk) begin

        if (rst) begin

            counter <= 0;
            scaled_clk <= 0;

        end

        else begin

            if (counter == divide_ratio-1) begin

                scaled_clk <= ~scaled_clk;

                counter <= 0;

            end

            else

                counter <= counter + 1;

        end

    end

endmodule