`timescale 1ns/1ps

module axi_master
#(
    parameter XLEN = 64
)
(
    input  logic                 clk,

    axi_interface axi
);

always_ff @(posedge clk) begin

    axi.awvalid <= 0;
    axi.wvalid  <= 0;
    axi.arvalid <= 0;

end

endmodule