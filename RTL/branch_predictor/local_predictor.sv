`timescale 1ns/1ps

module local_predictor
#(
    parameter ENTRIES = 256
)
(
    input  logic                     clk,
    input  logic                     rst,

    input  logic [63:0]              pc,

    output logic                     prediction,

    input  logic                     update_en,
    input  logic                     actual_taken
);

logic [1:0] local_table [ENTRIES-1:0];

logic [7:0] index;

integer i;

assign index = pc[9:2];

assign prediction = local_table[index][1];

always_ff @(posedge clk) begin

    if (rst) begin

        for (i = 0; i < ENTRIES; i = i + 1)
            local_table[i] <= 2'b01;

    end

    else if (update_en) begin

        if (actual_taken &&
            local_table[index] != 2'b11)

            local_table[index] <=
            local_table[index] + 1;

        else if (!actual_taken &&
                 local_table[index] != 2'b00)

            local_table[index] <=
            local_table[index] - 1;

    end
end

endmodule