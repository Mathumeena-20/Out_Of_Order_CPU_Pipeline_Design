module execute_top
#(
    parameter XLEN = 64
)
(
    input  logic                 clk,
    input  logic                 rst,

    input  logic [XLEN-1:0]      a,
    input  logic [XLEN-1:0]      b,

    input  logic [3:0]           alu_op,

    input  logic                 ex_valid,
    input  logic [5:0]           dest_tag,

    output logic [XLEN-1:0]      alu_result,

    output logic                 cdb_valid,
    output logic [5:0]           cdb_tag,
    output logic [XLEN-1:0]      cdb_data
);

alu alu_u (

    .a(a),
    .b(b),

    .alu_op(alu_op),

    .result(alu_result)
);

cdb_controller cdb (

    .ex_valid(ex_valid),
    .ex_dest(dest_tag),
    .ex_result(alu_result),

    .cdb_valid(cdb_valid),
    .cdb_tag(cdb_tag),
    .cdb_data(cdb_data)
);

endmodule