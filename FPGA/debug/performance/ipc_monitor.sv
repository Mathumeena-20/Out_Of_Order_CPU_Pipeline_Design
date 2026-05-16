`timescale 1ns/1ps

module ipc_monitor
(
    input  logic clk,
    input  logic rst,

    input  logic [31:0] instructions,
    input  logic [31:0] cycles,

    output logic [31:0] ipc
);

    always_ff @(posedge clk) begin

        if (rst)

            ipc <= 0;

        else if (cycles != 0)

            ipc <= instructions / cycles;

    end

endmodule