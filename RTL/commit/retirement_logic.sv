`timescale 1ns/1ps

module retirement_logic
(
    input  logic commit_en,

    output logic retire_valid
);

assign retire_valid = commit_en;

endmodule