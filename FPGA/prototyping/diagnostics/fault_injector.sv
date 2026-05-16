`timescale 1ns/1ps

module fault_injector
(
    input  logic clk,
    input  logic rst,

    input  logic inject_fault,

    output logic fault_signal
);

    always_ff @(posedge clk) begin

        if (rst)

            fault_signal <= 0;

        else

            fault_signal <= inject_fault;

    end

endmodule