`timescale 1ns/1ps

module pipeline_flush
(
    input  logic exception_flush,
    input  logic branch_mispredict,

    output logic flush
);

assign flush =
       exception_flush ||
       branch_mispredict;

endmodule