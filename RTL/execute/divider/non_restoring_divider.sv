module non_restoring_divider
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] dividend,
    input  logic [XLEN-1:0] divisor,

    output logic [XLEN-1:0] quotient
);

assign quotient = dividend / divisor;

endmodule