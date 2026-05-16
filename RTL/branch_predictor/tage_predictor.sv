`timescale 1ns/1ps

module tage_predictor
#(
    parameter XLEN = 64
)
(
    input  logic                 clk,
    input  logic                 rst,

    input  logic [XLEN-1:0]      pc,

    output logic                 prediction
);

//
// Simplified TAGE Predictor
//

logic [1:0] tage_table [255:0];

logic [7:0] index;

integer i;

assign index = pc[9:2];

assign prediction = tage_table[index][1];

always_ff @(posedge clk) begin

    if (rst) begin

        for (i = 0; i < 256; i = i + 1)
            tage_table[i] <= 2'b01;

    end
end

endmodule