`ifndef DEFINES_SVH
`define DEFINES_SVH

`define XLEN 64
`define ROB_ENTRIES 32
`define RS_ENTRIES 16

// ---------------------------------------------------------
// Global CPU Definitions
// ---------------------------------------------------------

`define XLEN                64
`define ILEN                32
`define PLEN                56

`define ARCH_REGS           32
`define PHYS_REGS           64

`define ROB_ENTRIES         32
`define RS_ENTRIES          16
`define LSQ_ENTRIES         16

`define FETCH_WIDTH         2
`define ISSUE_WIDTH         2
`define COMMIT_WIDTH        2

`define ICACHE_SIZE         4096
`define DCACHE_SIZE         4096

`define RESET_PC            64'h0000_0000_8000_0000

// ---------------------------------------------------------
// Boolean Macros
// ---------------------------------------------------------

`define TRUE                1'b1
`define FALSE               1'b0

// ---------------------------------------------------------
// Enable/Disable
// ---------------------------------------------------------

`define ENABLE              1'b1
`define DISABLE             1'b0

// ---------------------------------------------------------
// Valid/Invalid
// ---------------------------------------------------------

`define VALID               1'b1
`define INVALID             1'b0

// ---------------------------------------------------------
// Branch Prediction
// ---------------------------------------------------------

`define BP_HISTORY_BITS     8
`define BTB_ENTRIES         32

// ---------------------------------------------------------
// Cache Parameters
// ---------------------------------------------------------

`define CACHE_LINE_BYTES    64
`define CACHE_WAYS          4

`endif