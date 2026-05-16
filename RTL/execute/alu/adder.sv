`timescale 1ns/1ps

module adder
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] a,
    input  logic [XLEN-1:0] b,

    // Control
    input  logic            cin,
    input  logic            sub,

    // Outputs
    output logic [XLEN-1:0] sum,
    output logic            cout,
    output logic            overflow,
    output logic            zero,
    output logic            negative
);

    // -------------------------------------------------
    // Internal Signals
    // -------------------------------------------------

    logic [XLEN-1:0] b_internal;
    logic [XLEN:0]   result_ext;

    // -------------------------------------------------
    // Two's Complement Subtraction
    // -------------------------------------------------
    // sub = 0 --> Addition
    // sub = 1 --> Subtraction
    //
    // a - b = a + (~b + 1)
    // -------------------------------------------------

    assign b_internal = (sub) ? ~b : b;

    // -------------------------------------------------
    // Extended Addition
    // -------------------------------------------------

    assign result_ext = {1'b0, a} +
                        {1'b0, b_internal} +
                        cin + sub;

    // -------------------------------------------------
    // Main Outputs
    // -------------------------------------------------

    assign sum  = result_ext[XLEN-1:0];
    assign cout = result_ext[XLEN];

    // -------------------------------------------------
    // Overflow Detection
    // -------------------------------------------------
    // Signed overflow:
    //
    // + + -> -
    // - - -> +
    // -------------------------------------------------

    assign overflow =
           ( a[XLEN-1] &  b_internal[XLEN-1] &
            ~sum[XLEN-1]) |

           (~a[XLEN-1] & ~b_internal[XLEN-1] &
             sum[XLEN-1]);

    // -------------------------------------------------
    // Status Flags
    // -------------------------------------------------

    assign zero     = (sum == 0);
    assign negative = sum[XLEN-1];

endmodule