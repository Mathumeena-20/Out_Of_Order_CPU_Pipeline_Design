`timescale 1ns/1ps

module memory_test
#(
    parameter DEPTH = 256
)
(
    input  logic clk,
    input  logic rst,

    input  logic start_test,

    output logic mem_test_pass,
    output logic mem_test_done
);

    logic [7:0] counter;

    always_ff @(posedge clk) begin

        if (rst) begin

            counter <= 0;

            mem_test_pass <= 0;
            mem_test_done <= 0;

        end

        else if (start_test) begin

            counter <= counter + 1;

            if (counter == DEPTH-1) begin

                mem_test_pass <= 1;

                mem_test_done <= 1;

            end

        end

    end

endmodule