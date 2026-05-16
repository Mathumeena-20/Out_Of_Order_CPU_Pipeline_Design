module checkpoint_logic
#(
    parameter ARCH_REGS = 32
)
(
    input  logic                     clk,
    input  logic                     rst,

    input  logic                     checkpoint_en,
    input  logic                     restore_en,

    input  logic [5:0]               current_map [ARCH_REGS-1:0],

    output logic [5:0]               restored_map [ARCH_REGS-1:0]
);

logic [5:0] checkpoint_table [ARCH_REGS-1:0];

integer i;

always_ff @(posedge clk) begin

    if (rst) begin

        for (i = 0; i < ARCH_REGS; i = i + 1)
            checkpoint_table[i] <= i;

    end

    else begin

        // Save checkpoint
        if (checkpoint_en) begin

            for (i = 0; i < ARCH_REGS; i = i + 1)
                checkpoint_table[i] <= current_map[i];

        end

        // Restore checkpoint
        if (restore_en) begin

            for (i = 0; i < ARCH_REGS; i = i + 1)
                restored_map[i] <= checkpoint_table[i];

        end
    end
end

endmodule