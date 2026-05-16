`timescale 1ns/1ps

module memory_top
#(
    parameter XLEN = 64
)
(
    input logic clk
);

axi_interface axi();

axi_master am (

    .clk(clk),
    .axi(axi)
);

endmodule