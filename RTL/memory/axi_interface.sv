`timescale 1ns/1ps

interface axi_interface
#(
    parameter XLEN = 64
);

logic [XLEN-1:0] awaddr;
logic awvalid;
logic awready;

logic [XLEN-1:0] wdata;
logic wvalid;
logic wready;

logic [XLEN-1:0] araddr;
logic arvalid;
logic arready;

logic [XLEN-1:0] rdata;
logic rvalid;
logic rready;

endinterface