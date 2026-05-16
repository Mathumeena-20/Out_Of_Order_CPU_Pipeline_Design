`timescale 1ns/1ps

module branch_history_table
#(
    parameter HISTORY_BITS = 8
)
(
    input  logic                     clk,
    input  logic                     rst,

    input  logic                     update_en,
    input  logic                     branch_taken,

    output logic [HISTORY_BITS-1:0]  global_history
);

always_ff @(posedge clk) begin

    if (rst)

        global_history <= 0;

    else if (update_en)

        global_history <=
        {global_history[HISTORY_BITS-2:0],
         branch_taken};

end

endmodule