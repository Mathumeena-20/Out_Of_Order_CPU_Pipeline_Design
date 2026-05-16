module lsq_dispatch
#(
    parameter LSQ_ENTRIES = 16
)
(
    input  logic             clk,
    input  logic             rst,

    input  logic             dispatch_en,

    input  logic             is_load,
    input  logic             is_store,

    output logic [4:0]       lsq_index,
    output logic             lsq_full
);

logic [4:0] tail_ptr;
logic [4:0] lsq_count;

assign lsq_full = (lsq_count == LSQ_ENTRIES);

always_ff @(posedge clk) begin

    if (rst) begin

        tail_ptr  <= 0;
        lsq_count <= 0;

    end

    else if (dispatch_en &&
            (is_load || is_store) &&
            !lsq_full) begin

        lsq_index <= tail_ptr;

        tail_ptr  <= tail_ptr + 1;
        lsq_count <= lsq_count + 1;

        $display("LSQ Allocate Entry=%0d", tail_ptr);

    end
end

endmodule