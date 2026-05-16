`timescale 1ns/1ps

module sleep_controller
(
    input  logic clk,
    input  logic rst,

    input  logic sleep_req,

    output logic sleep_mode
);

    always_ff @(posedge clk) begin

        if (rst)

            sleep_mode <= 0;

        else

            sleep_mode <= sleep_req;

    end

endmodule