`timescale 1ns/1ps

module branch_assertions
(
    input logic clk,
    input logic rst,

    input logic branch_taken,
    input logic prediction
);

    // -------------------------------------------------
    // Prediction Check
    // -------------------------------------------------

    property branch_prediction_check;

        @(posedge clk)
        disable iff (rst)

        prediction == branch_taken;

    endproperty

    assert property(branch_prediction_check)
    else
        $warning("Branch Misprediction");

endmodule