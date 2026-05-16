`timescale 1ns/1ps

module top_wrapper
(
    input logic clk,
    input logic rst
);

soc_top soc (

    .clk(clk),
    .rst(rst)
);

endmodule