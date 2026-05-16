`timescale 1ns/1ps

module axi_crossbar
(
    input  logic clk,
    input  logic rst,

    axi_interface master_if,
    axi_interface slave_if
);

    always_comb begin

        slave_if.awaddr  =
        master_if.awaddr;

        slave_if.awvalid =
        master_if.awvalid;

        slave_if.wdata   =
        master_if.wdata;

        slave_if.wvalid  =
        master_if.wvalid;

        slave_if.araddr  =
        master_if.araddr;

        slave_if.arvalid =
        master_if.arvalid;

        master_if.awready =
        slave_if.awready;

        master_if.wready =
        slave_if.wready;

        master_if.rdata =
        slave_if.rdata;

        master_if.rvalid =
        slave_if.rvalid;

    end

endmodule