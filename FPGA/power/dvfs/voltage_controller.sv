`timescale 1ns/1ps

module voltage_controller
#(
    parameter VOLTAGE_LEVELS = 4
)
(
    input  logic clk,
    input  logic rst,

    input  logic [1:0] voltage_select,

    output logic [7:0] voltage_level
);

    always_ff @(posedge clk) begin

        if (rst)

            voltage_level <= 8'd100;

        else begin

            case(voltage_select)

                2'b00:
                    voltage_level <= 8'd80;

                2'b01:
                    voltage_level <= 8'd100;

                2'b10:
                    voltage_level <= 8'd120;

                2'b11:
                    voltage_level <= 8'd140;

                default:
                    voltage_level <= 8'd100;

            endcase

        end

    end

endmodule