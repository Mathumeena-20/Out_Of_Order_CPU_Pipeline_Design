module cdb_controller
#(
    parameter XLEN = 64
)
(
    input  logic                 ex_valid,
    input  logic [5:0]           ex_dest,
    input  logic [XLEN-1:0]      ex_result,

    output logic                 cdb_valid,
    output logic [5:0]           cdb_tag,
    output logic [XLEN-1:0]      cdb_data
);

always_comb begin

    cdb_valid = ex_valid;
    cdb_tag   = ex_dest;
    cdb_data  = ex_result;

end

endmodule