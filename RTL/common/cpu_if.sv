// ============================================================
// File: RTL/common/cpu_if.sv
// ============================================================

interface cpu_if #(parameter XLEN = 64);

    // =====================================================
    // Common Interface Signals
    // =====================================================

    logic                   clk;
    logic                   rst;

    logic                   valid;
    logic                   ready;

    logic [XLEN-1:0]        addr;
    logic [XLEN-1:0]        wdata;
    logic [XLEN-1:0]        rdata;

    logic [3:0]             opcode;

    logic                   write_en;
    logic                   read_en;

    logic                   response;

    // =====================================================
    // Master Modport
    // =====================================================

    modport master (

        input  clk,
        input  rst,

        output valid,
        input  ready,

        output addr,

        output wdata,
        input  rdata,

        output opcode,

        output write_en,
        output read_en,

        input  response

    );

    // =====================================================
    // Slave Modport
    // =====================================================

    modport slave (

        input  clk,
        input  rst,

        input  valid,
        output ready,

        input  addr,

        input  wdata,
        output rdata,

        input  opcode,

        input  write_en,
        input  read_en,

        output response

    );

    // =====================================================
    // Monitor Modport
    // =====================================================

    modport monitor (

        input clk,
        input rst,

        input valid,
        input ready,

        input addr,

        input wdata,
        input rdata,

        input opcode,

        input write_en,
        input read_en,

        input response

    );

endinterface