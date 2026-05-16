module select_logic
#(
    parameter RS_ENTRIES = 16
)
(
    input  logic [RS_ENTRIES-1:0] valid_vec,
    input  logic [RS_ENTRIES-1:0] ready_vec,

    output logic                  select_valid,
    output logic [4:0]            select_index
);

integer i;

always_comb begin

    select_valid = 0;
    select_index = 0;

    for (i = 0; i < RS_ENTRIES; i = i + 1) begin

        if (valid_vec[i] &&
            ready_vec[i] &&
            !select_valid) begin

            select_valid = 1;
            select_index = i;

        end
    end
end

endmodule