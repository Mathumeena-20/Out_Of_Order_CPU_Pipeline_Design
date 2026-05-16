`timescale 1ns/1ps

module power_monitor
(
    input  logic clk,
    input  logic rst,

    input  logic activity,

    output logic [31:0] power_count
);

    always_ff @(posedge clk) begin

        if (rst)

            power_count <= 0;

        else if (activity)

            power_count <=
            power_count + 1;

    end

endmodule