module alu
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] a,
    input  logic [XLEN-1:0] b,

    input  logic [3:0]      alu_op,

    output logic [XLEN-1:0] result
);

logic [XLEN-1:0] add_result;
logic [XLEN-1:0] logic_result;
logic [XLEN-1:0] shift_result;

logic eq, lt, ltu;

// --------------------------------------------------
// Submodules
// --------------------------------------------------

adder add_u (

    .a(a),
    .b(b),

    .sum(add_result)
);

logic_unit logic_u (

    .a(a),
    .b(b),

    .logic_op(alu_op[1:0]),

    .result(logic_result)
);

barrel_shifter shift_u (

    .data_in(a),
    .shift_amt(b[5:0]),

    .shift_left(alu_op == 4'd5),
    .arithmetic(alu_op == 4'd7),

    .data_out(shift_result)
);

compare_unit cmp_u (

    .a(a),
    .b(b),

    .eq(eq),
    .lt(lt),
    .ltu(ltu)
);

// --------------------------------------------------
// ALU Result Select
// --------------------------------------------------

always_comb begin

    case(alu_op)

        4'd0: result = add_result;
        4'd1: result = a - b;

        4'd2,
        4'd3,
        4'd4: result = logic_result;

        4'd5,
        4'd6,
        4'd7: result = shift_result;

        4'd8: result = lt;
        4'd9: result = ltu;

        default: result = 0;

    endcase
end

endmodule