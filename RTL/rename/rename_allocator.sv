module rename_allocator
(
    input  logic             clk,
    input  logic             rst,

    input  logic             rename_valid,

    input  logic [4:0]       src1_arch,
    input  logic [4:0]       src2_arch,
    input  logic [4:0]       dest_arch,

    output logic [5:0]       src1_phys,
    output logic [5:0]       src2_phys,
    output logic [5:0]       dest_phys,

    output logic             allocation_success
);

logic [5:0] new_phys_reg;
logic free_available;

// --------------------------------------------------
// Free List
// --------------------------------------------------

freelist fl (

    .clk(clk),
    .rst(rst),

    .allocate(rename_valid),
    .free_en(1'b0),

    .free_reg(6'd0),

    .allocated_reg(new_phys_reg),
    .free_available(free_available)
);

// --------------------------------------------------
// Rename Table
// --------------------------------------------------

rename_table rt (

    .clk(clk),
    .rst(rst),

    .rename_en(rename_valid && free_available),

    .src1_arch(src1_arch),
    .src2_arch(src2_arch),
    .dest_arch(dest_arch),

    .new_phys_reg(new_phys_reg),

    .src1_phys(src1_phys),
    .src2_phys(src2_phys),
    .dest_phys(dest_phys)
);

assign allocation_success = free_available;

endmodule