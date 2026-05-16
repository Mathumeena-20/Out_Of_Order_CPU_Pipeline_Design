`timescale 1ns/1ps

module ddr_refresh
#(
    parameter REFRESH_INTERVAL = 1000
)
(
    input  logic clk,
    input  logic rst,

    output logic refresh_req
);

    logic [31:0] counter;

    always_ff @(posedge clk) begin

        if (rst) begin

            counter <= 0;

            refresh_req <= 0;

        end

        else begin

            if (counter ==
                REFRESH_INTERVAL) begin

                refresh_req <= 1;

                counter <= 0;

            end

            else begin

                refresh_req <= 0;

                counter <= counter + 1;

            end

        end

    end

endmodule