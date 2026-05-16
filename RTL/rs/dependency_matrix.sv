module dependency_matrix
#(
    parameter RS_ENTRIES = 16
)
(
    input  logic [5:0]       src1_tags [RS_ENTRIES-1:0],
    input  logic [5:0]       src2_tags [RS_ENTRIES-1:0],

    input  logic [5:0]       dest_tags [RS_ENTRIES-1:0],

    output logic             dependency_matrix
                           [RS_ENTRIES-1:0]
                           [RS_ENTRIES-1:0]
);

integer i, j;

always_comb begin

    for (i = 0; i < RS_ENTRIES; i = i + 1) begin

        for (j = 0; j < RS_ENTRIES; j = j + 1) begin

            dependency_matrix[i][j] = 0;

            if ((src1_tags[i] == dest_tags[j]) ||
                (src2_tags[i] == dest_tags[j]))

                dependency_matrix[i][j] = 1;

        end
    end
end

endmodule