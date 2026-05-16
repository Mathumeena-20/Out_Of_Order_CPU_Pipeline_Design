`timescale 1ns/1ps

module self_test
(
    input  logic clk,
    input  logic rst,

    input  logic start_test,

    output logic test_pass,
    output logic test_done
);

    logic [7:0] test_counter;

    always_ff @(posedge clk) begin

        if (rst) begin

            test_counter <= 0;

            test_pass <= 0;
            test_done <= 0;

        end

        else if (start_test) begin

            test_counter <=
            test_counter + 1;

            if (test_counter == 8'd100) begin

                test_pass <= 1;

                test_done <= 1;

            end

        end

    end

endmodule