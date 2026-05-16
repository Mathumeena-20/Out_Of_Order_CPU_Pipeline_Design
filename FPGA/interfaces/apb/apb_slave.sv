`timescale 1ns/1ps

module apb_slave
(
    input logic clk,
    input logic rst,

    apb_interface apb_if
);

    logic [31:0] regfile [0:15];

    always_ff @(posedge clk) begin

        if (apb_if.PSEL &&
            apb_if.PENABLE) begin

            if (apb_if.PWRITE)

                regfile[apb_if.PADDR]
                <= apb_if.PWDATA;

            else

                apb_if.PRDATA
                <= regfile[apb_if.PADDR];

        end

    end

    assign apb_if.PREADY = 1;

endmodule