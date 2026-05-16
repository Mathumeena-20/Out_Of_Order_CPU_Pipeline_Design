`timescale 1ns/1ps

module throughput_monitor
(
    input  logic clk,
    input  logic rst,

    input  logic transaction_valid,

    output logic [31:0] throughput_count
);

    always_ff @(posedge clk) begin

        if (rst)

            throughput_count <= 0;

        else if (transaction_valid)

            throughput_count <=
            throughput_count + 1;

    end

endmodule