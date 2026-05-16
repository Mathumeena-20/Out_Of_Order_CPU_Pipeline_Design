module rs_top
#(
    parameter RS_ENTRIES = 16
)
(
    input  logic                     clk,
    input  logic                     rst,

    // Dispatch
    input  logic                     dispatch_en,

    input  logic [5:0]               src1_tag,
    input  logic [5:0]               src2_tag,
    input  logic [5:0]               dest_tag,

    input  logic                     src1_ready,
    input  logic                     src2_ready,

    input  logic [31:0]              instruction,

    // Common Data Bus
    input  logic                     cdb_valid,
    input  logic [5:0]               cdb_tag,

    // Outputs
    output logic                     issue_valid,
    output logic [4:0]               issue_index,

    output logic                     rs_full
);

logic [RS_ENTRIES-1:0] valid_vec;
logic [RS_ENTRIES-1:0] ready_vec;

// --------------------------------------------------
// Reservation Station
// --------------------------------------------------

reservation_station rs (

    .clk(clk),
    .rst(rst),

    .dispatch_en(dispatch_en),

    .src1_tag(src1_tag),
    .src2_tag(src2_tag),
    .dest_tag(dest_tag),

    .src1_ready(src1_ready),
    .src2_ready(src2_ready),

    .instruction(instruction),

    .issue_grant(issue_valid),
    .issue_index(issue_index),

    .rs_full(rs_full)
);

// --------------------------------------------------
// Simple Issue Queue Logic
// --------------------------------------------------

issue_queue iq (

    .valid_vec(valid_vec),
    .ready_vec(ready_vec),

    .issue_valid(issue_valid),
    .issue_index(issue_index)
);

// Placeholder Assignment
assign valid_vec = '0;
assign ready_vec = '0;

endmodule