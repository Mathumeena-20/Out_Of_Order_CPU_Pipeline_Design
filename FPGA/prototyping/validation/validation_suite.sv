`timescale 1ns/1ps

module validation_suite
(
    input  logic clk,
    input  logic rst,

    input  logic validation_start,

    output logic validation_done
);

    logic [15:0] counter;

    always_ff @(posedge clk) begin

        if (rst) begin

            counter <= 0;

            validation_done <= 0;

        end

        else if (validation_start) begin

            counter <= counter + 1;

            if (counter == 16'd1000)

                validation_done <= 1;

        end

    end

endmodule