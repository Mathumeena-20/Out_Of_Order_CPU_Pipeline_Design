module architectural_map_table
#(
    parameter ARCH_REGS = 32,
    parameter PHYS_REGS = 64
)
(
    input  logic                     clk,
    input  logic                     rst,

    input  logic                     write_en,

    input  logic [4:0]               arch_reg,
    input  logic [5:0]               phys_reg,

    output logic [5:0]               map_table [ARCH_REGS-1:0]
);

integer i;

always_ff @(posedge clk) begin

    if (rst) begin

        for (i = 0; i < ARCH_REGS; i = i + 1)
            map_table[i] <= i;

    end

    else if (write_en) begin

        map_table[arch_reg] <= phys_reg;

    end
end

endmodule