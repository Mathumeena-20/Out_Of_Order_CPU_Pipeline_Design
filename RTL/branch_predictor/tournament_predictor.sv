`timescale 1ns/1ps

module tournament_predictor
(
    input  logic         local_pred,
    input  logic         gshare_pred,

    input  logic [1:0]   chooser,

    output logic         final_prediction
);

always_comb begin

    if (chooser[1])
        final_prediction = gshare_pred;

    else
        final_prediction = local_pred;

end

endmodule