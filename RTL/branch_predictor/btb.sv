`timescale 1ns/1ps

module btb
#(
    parameter XLEN       = 64,
    parameter BTB_ENTRIES = 32
)
(
    input  logic                     clk,
    input  logic                     rst,

    // Lookup
    input  logic [XLEN-1:0]          pc,

    output logic                     hit,
    output logic [XLEN-1:0]          target_pc,

    // Update
    input  logic                     update_en,
    input  logic [XLEN-1:0]          update_pc,
    input  logic [XLEN-1:0]          update_target
);

typedef struct packed {

    logic                 valid;
    logic [XLEN-1:0]      tag;
    logic [XLEN-1:0]      target;

} btb_entry_t;

btb_entry_t btb_mem [BTB_ENTRIES-1:0];

logic [$clog2(BTB_ENTRIES)-1:0] index;

integer i;

assign index = pc[$clog2(BTB_ENTRIES)+1:2];

always_comb begin

    if (btb_mem[index].valid &&
        btb_mem[index].tag == pc) begin

        hit       = 1;
        target_pc = btb_mem[index].target;

    end

    else begin

        hit       = 0;
        target_pc = pc + 4;

    end
end

always_ff @(posedge clk) begin

    if (rst) begin

        for (i = 0; i < BTB_ENTRIES; i = i + 1)
            btb_mem[i].valid <= 0;

    end

    else if (update_en) begin

        btb_mem[update_pc[$clog2(BTB_ENTRIES)+1:2]].valid  <= 1;

        btb_mem[update_pc[$clog2(BTB_ENTRIES)+1:2]].tag    <= update_pc;

        btb_mem[update_pc[$clog2(BTB_ENTRIES)+1:2]].target <= update_target;

    end
end

endmodule