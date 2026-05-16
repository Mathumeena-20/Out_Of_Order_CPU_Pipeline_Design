`timescale 1ns/1ps

module pcie_interrupt
(
    input  logic clk,
    input  logic rst,

    input  logic irq_request,

    output logic msi_interrupt
);

    always_ff @(posedge clk) begin

        if (rst)

            msi_interrupt <= 0;

        else

            msi_interrupt <=
            irq_request;

    end

endmodule