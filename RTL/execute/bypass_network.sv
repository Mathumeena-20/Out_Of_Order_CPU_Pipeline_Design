module bypass_network
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] ex_result,
    input  logic [XLEN-1:0] mem_result,

    input  logic            ex_valid,
    input  logic            mem_valid,

    output logic [XLEN-1:0] bypass_data
);

always_comb begin

    if (ex_valid)
        bypass_data = ex_result;

    else if (mem_valid)
        bypass_data = mem_result;

    else
        bypass_data = 0;

end

endmodule