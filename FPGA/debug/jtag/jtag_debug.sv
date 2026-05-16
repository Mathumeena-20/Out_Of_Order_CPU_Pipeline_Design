`timescale 1ns/1ps

module jtag_debug
(
    input  logic tck,
    input  logic tms,
    input  logic tdi,

    output logic tdo
);

    logic [7:0] shift_reg;

    always_ff @(posedge tck) begin

        shift_reg <=
        {shift_reg[6:0], tdi};

    end

    assign tdo = shift_reg[7];

endmodule