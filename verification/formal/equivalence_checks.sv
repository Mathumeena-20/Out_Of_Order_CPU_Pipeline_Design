`timescale 1ns/1ps

module equivalence_checks
#(
    parameter XLEN = 64
)
(
    input logic [XLEN-1:0] rtl_result,
    input logic [XLEN-1:0] golden_result
);

always_comb begin

    assert(rtl_result == golden_result);

end

endmodule