`timescale 1ns/1ps

module soc_top
(
    input logic clk,
    input logic rst
);

cpu_top cpu (

    .clk(clk),
    .rst(rst)
);

endmodule