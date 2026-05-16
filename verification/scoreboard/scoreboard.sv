`timescale 1ns/1ps

module scoreboard
#(
    parameter XLEN = 64
)
(
    input logic [XLEN-1:0] dut_result,
    input logic [XLEN-1:0] ref_result
);

always_comb begin

    if (dut_result == ref_result)

        $display("PASS");

    else

        $display("FAIL");

end

endmodule