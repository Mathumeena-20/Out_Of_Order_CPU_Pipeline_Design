`timescale 1ns/1ps

module bp_top
#(
    parameter XLEN = 64
)
(
    input  logic                     clk,
    input  logic                     rst,

    input  logic [XLEN-1:0]          pc,

    // Branch Resolution
    input  logic                     update_en,
    input  logic [XLEN-1:0]          update_pc,
    input  logic                     actual_taken,
    input  logic [XLEN-1:0]          actual_target,

    // Outputs
    output logic                     prediction,
    output logic [XLEN-1:0]          predicted_target,
    output logic                     btb_hit
);

logic gshare_pred;
logic local_pred;
logic tage_pred;

logic final_prediction;

// --------------------------------------------------
// BTB
// --------------------------------------------------

btb btb_u (

    .clk(clk),
    .rst(rst),

    .pc(pc),

    .hit(btb_hit),
    .target_pc(predicted_target),

    .update_en(update_en),
    .update_pc(update_pc),
    .update_target(actual_target)
);

// --------------------------------------------------
// GShare Predictor
// --------------------------------------------------

gshare_predictor gshare_u (

    .clk(clk),
    .rst(rst),

    .pc(pc),

    .prediction(gshare_pred),

    .update_en(update_en),
    .update_pc(update_pc),
    .actual_taken(actual_taken)
);

// --------------------------------------------------
// Local Predictor
// --------------------------------------------------

local_predictor local_u (

    .clk(clk),
    .rst(rst),

    .pc(pc),

    .prediction(local_pred),

    .update_en(update_en),
    .actual_taken(actual_taken)
);

// --------------------------------------------------
// TAGE Predictor
// --------------------------------------------------

tage_predictor tage_u (

    .clk(clk),
    .rst(rst),

    .pc(pc),

    .prediction(tage_pred)
);

// --------------------------------------------------
// Tournament Selection
// --------------------------------------------------

tournament_predictor tp (

    .local_pred(local_pred),
    .gshare_pred(gshare_pred),

    .chooser(2'b10),

    .final_prediction(final_prediction)
);

assign prediction = final_prediction;

endmodule