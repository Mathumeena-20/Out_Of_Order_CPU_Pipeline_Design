module issue_queue
#(
    parameter RS_ENTRIES = 16
)
(
    input  logic [RS_ENTRIES-1:0] valid_vec,
    input  logic [RS_ENTRIES-1:0] ready_vec,

    output logic                  issue_valid,
    output logic [4:0]            issue_index
);

integer i;

always_comb begin

    issue_valid = 0;
    issue_index = 0;

    for (i = 0; i < RS_ENTRIES; i = i + 1) begin

        if (valid_vec[i] &&
            ready_vec[i] &&
            !issue_valid) begin

            issue_valid = 1;
            issue_index = i;

        end
    end
end

endmodule