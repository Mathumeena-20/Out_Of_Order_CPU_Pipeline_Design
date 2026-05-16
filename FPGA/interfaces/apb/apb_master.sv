`timescale 1ns/1ps

module apb_master
(
    input logic clk,
    input logic rst,

    apb_interface apb_if
);

    always_ff @(posedge clk) begin

        if (rst) begin

            apb_if.PSEL <= 0;

        end

        else begin

            apb_if.PADDR   <= 16'h10;

            apb_if.PWDATA  <= 32'h1234;

            apb_if.PWRITE  <= 1;

            apb_if.PSEL    <= 1;

            apb_if.PENABLE <= 1;

        end

    end

endmodule