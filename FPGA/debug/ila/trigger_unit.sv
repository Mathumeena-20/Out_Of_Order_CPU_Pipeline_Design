`timescale 1ns/1ps

module trigger_unit
#(
    parameter WIDTH = 64
)
(
    input  logic [WIDTH-1:0] probe_data,

    input  logic [WIDTH-1:0] trigger_value,

    output logic trigger
);

    always_comb begin

        if (probe_data == trigger_value)

            trigger = 1;

        else

            trigger = 0;

    end

endmodule