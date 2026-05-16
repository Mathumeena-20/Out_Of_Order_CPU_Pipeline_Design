module booth_multiplier
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] a,
    input  logic [XLEN-1:0] b,

    output logic [(2*XLEN)-1:0] product
);

assign product = $signed(a) * $signed(b);

endmodule