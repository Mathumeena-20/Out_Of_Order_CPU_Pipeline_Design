module wakeup_logic
#(
    parameter RS_ENTRIES = 16
)
(
    input  logic [5:0]               cdb_tag,
    input  logic                     cdb_valid,

    input  logic [5:0]               src1_tags [RS_ENTRIES-1:0],
    input  logic [5:0]               src2_tags [RS_ENTRIES-1:0],

    input  logic                     src1_ready_in [RS_ENTRIES-1:0],
    input  logic                     src2_ready_in [RS_ENTRIES-1:0],

    output logic                     src1_ready_out [RS_ENTRIES-1:0],
    output logic                     src2_ready_out [RS_ENTRIES-1:0]
);

integer i;

always_comb begin

    for (i = 0; i < RS_ENTRIES; i = i + 1) begin

        src1_ready_out[i] = src1_ready_in[i];
        src2_ready_out[i] = src2_ready_in[i];

        if (cdb_valid) begin

            if (src1_tags[i] == cdb_tag)
                src1_ready_out[i] = 1;

            if (src2_tags[i] == cdb_tag)
                src2_ready_out[i] = 1;

        end
    end
end

endmodule