`timescale 1ns/1ps

module replacement_policy
#(
    parameter WAYS = 4
)
(
    input  logic                     clk,
    input  logic                     rst,

    output logic [$clog2(WAYS)-1:0]  replace_way
);

always_ff @(posedge clk) begin

    if (rst)

        replace_way <= 0;

    else

        replace_way <= replace_way + 1;

end

endmodule