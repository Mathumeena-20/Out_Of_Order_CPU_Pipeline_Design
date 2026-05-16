module logic_unit
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] a,
    input  logic [XLEN-1:0] b,

    input  logic [1:0]      logic_op,

    output logic [XLEN-1:0] result
);

always_comb begin

    case(logic_op)

        2'b00: result = a & b;
        2'b01: result = a | b;
        2'b10: result = a ^ b;

        default: result = 0;

    endcase
end

endmodule