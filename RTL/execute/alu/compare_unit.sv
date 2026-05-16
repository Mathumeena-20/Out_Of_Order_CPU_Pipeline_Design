module compare_unit
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] a,
    input  logic [XLEN-1:0] b,

    output logic            eq,
    output logic            lt,
    output logic            ltu
);

assign eq  = (a == b);
assign lt  = ($signed(a) < $signed(b));
assign ltu = (a < b);

endmodule