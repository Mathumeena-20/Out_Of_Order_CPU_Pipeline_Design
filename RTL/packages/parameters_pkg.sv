// ============================================================
// File: RTL/packages/parameters_pkg.sv
// ============================================================

package parameters_pkg;

    // -------------------------------------------------
    // Global CPU Parameters
    // -------------------------------------------------

    parameter int XLEN         = 64;
    parameter int ILEN         = 32;

    parameter int ARCH_REGS    = 32;
    parameter int PHYS_REGS    = 64;

    parameter int ROB_ENTRIES  = 32;
    parameter int RS_ENTRIES   = 16;
    parameter int LSQ_ENTRIES  = 16;

    parameter int FETCH_WIDTH  = 2;
    parameter int ISSUE_WIDTH  = 2;
    parameter int COMMIT_WIDTH = 2;

    parameter int ICACHE_SIZE  = 4096;
    parameter int DCACHE_SIZE  = 4096;

    parameter logic [63:0] RESET_PC =
        64'h0000_0000_8000_0000;

endpackage