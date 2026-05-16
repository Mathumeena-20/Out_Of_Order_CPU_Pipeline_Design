`timescale 1ns/1ps

module gshare_predictor
#(
    parameter XLEN = 64,
    parameter HISTORY_BITS = 8
)
(
    input  logic                     clk,
    input  logic                     rst,

    input  logic [XLEN-1:0]          pc,

    output logic                     prediction,

    // Update
    input  logic                     update_en,
    input  logic [XLEN-1:0]          update_pc,
    input  logic                     actual_taken
);

logic [HISTORY_BITS-1:0] global_history;

logic [1:0] pht [2**HISTORY_BITS-1:0];

logic [HISTORY_BITS-1:0] index;

integer i;

// --------------------------------------------------
// Branch History
// --------------------------------------------------

branch_history_table bht (

    .clk(clk),
    .rst(rst),

    .update_en(update_en),
    .branch_taken(actual_taken),

    .global_history(global_history)
);

assign index =
       pc[HISTORY_BITS+1:2] ^
       global_history;

// --------------------------------------------------
// Prediction
// --------------------------------------------------

assign prediction = pht[index][1];

// --------------------------------------------------
// Update PHT
// --------------------------------------------------

always_ff @(posedge clk) begin

    if (rst) begin

        for (i = 0; i < 2**HISTORY_BITS; i = i + 1)
            pht[i] <= 2'b01;

    end

    else if (update_en) begin

        if (actual_taken &&
            pht[index] != 2'b11)

            pht[index] <= pht[index] + 1;

        else if (!actual_taken &&
                 pht[index] != 2'b00)

            pht[index] <= pht[index] - 1;

    end
end

endmodule