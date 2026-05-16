`timescale 1ns/1ps

module scan_chain
#(
    parameter WIDTH = 32
)
(
    input  logic scan_clk,
    input  logic scan_in,

    output logic scan_out
);

    logic [WIDTH-1:0] scan_reg;

    always_ff @(posedge scan_clk) begin

        scan_reg <=
        {scan_reg[WIDTH-2:0], scan_in};

    end

    assign scan_out =
           scan_reg[WIDTH-1];

endmodule