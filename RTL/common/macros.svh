`ifndef MACROS_SVH
`define MACROS_SVH

`define NOP 32'h00000013

// ----------------------------------------------------
// Flip-Flop Macro
// ----------------------------------------------------

`define DFF(q, d, clk, rst)         \
always_ff @(posedge clk) begin      \
    if (rst)                        \
        q <= '0;                    \
    else                            \
        q <= d;                     \
end

// ----------------------------------------------------
// DFF with Enable
// ----------------------------------------------------

`define DFF_EN(q, d, en, clk, rst)  \
always_ff @(posedge clk) begin      \
    if (rst)                        \
        q <= '0;                    \
    else if (en)                    \
        q <= d;                     \
end

// ----------------------------------------------------
// Assertion Macro
// ----------------------------------------------------

`define ASSERT(name, prop)          \
assert property(prop)               \
else begin                          \
    $error("ASSERTION FAILED: %s", name); \
end

// ----------------------------------------------------
// Display Macro
// ----------------------------------------------------

`define LOG(msg)                    \
$display("[%0t] %s", $time, msg)

// ----------------------------------------------------
// Fatal Error
// ----------------------------------------------------

`define FATAL(msg)                  \
begin                               \
    $display("FATAL: %s", msg);     \
    $finish;                        \
end

`endif