module rename_table
(
    input  logic             clk,
    input  logic             rst,

    input  logic             rename_en,

    input  logic [4:0]       src1_arch,
    input  logic [4:0]       src2_arch,
    input  logic [4:0]       dest_arch,

    input  logic [5:0]       new_phys_reg,

    output logic [5:0]       src1_phys,
    output logic [5:0]       src2_phys,
    output logic [5:0]       dest_phys
);

logic [5:0] map_table [31:0];

integer i;

always_ff @(posedge clk) begin

    if (rst) begin

        for (i = 0; i < 32; i = i + 1)
            map_table[i] <= i;
    end

    else if (rename_en) begin

        map_table[dest_arch] <= new_phys_reg;

    end
end

always_comb begin

    src1_phys = map_table[src1_arch];
    src2_phys = map_table[src2_arch];
    dest_phys = new_phys_reg;

end

endmodule