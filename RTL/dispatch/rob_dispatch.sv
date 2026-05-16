module rob_dispatch
#(
    parameter ROB_ENTRIES = 32
)
(
    input  logic             clk,
    input  logic             rst,

    input  logic             dispatch_en,

    input  logic [5:0]       dest_phys_reg,
    input  logic [63:0]      pc,

    output logic [5:0]       rob_index,
    output logic             rob_full
);

logic [5:0] tail_ptr;
logic [5:0] rob_count;

assign rob_full = (rob_count == ROB_ENTRIES);

always_ff @(posedge clk) begin

    if (rst) begin

        tail_ptr  <= 0;
        rob_count <= 0;

    end

    else if (dispatch_en && !rob_full) begin

        rob_index <= tail_ptr;

        tail_ptr  <= tail_ptr + 1;
        rob_count <= rob_count + 1;

        $display("ROB Allocate Entry=%0d", tail_ptr);

    end
end

endmodule