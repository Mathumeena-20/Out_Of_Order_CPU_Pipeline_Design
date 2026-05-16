`timescale 1ns/1ps

module uart_rx
(
    input  logic clk,
    input  logic rst,

    input  logic baud_tick,
    input  logic uart_rx,

    output logic [7:0] rx_data,
    output logic       rx_valid
);

    logic [7:0] shift_reg;
    logic [3:0] bit_count;

    logic receiving;

    always_ff @(posedge clk) begin

        if (rst) begin

            receiving <= 0;
            rx_valid  <= 0;
            bit_count <= 0;

        end

        else begin

            rx_valid <= 0;

            if (!receiving && !uart_rx) begin

                receiving <= 1;
                bit_count <= 0;

            end

            else if (baud_tick &&
                     receiving) begin

                shift_reg[bit_count]
                <= uart_rx;

                bit_count <=
                bit_count + 1;

                if (bit_count == 7) begin

                    rx_data  <= shift_reg;
                    rx_valid <= 1;
                    receiving <= 0;

                end

            end

        end

    end

endmodule