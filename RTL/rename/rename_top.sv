module rename_top
(
    input  logic             clk,
    input  logic             rst,

    input  logic             rename_valid,

    input  logic [4:0]       src1_arch,
    input  logic [4:0]       src2_arch,
    input  logic [4:0]       dest_arch,

    input  logic             writeback_en,
    input  logic [5:0]       wb_phys_reg,
    input  logic [63:0]      wb_data,

    output logic [5:0]       src1_phys,
    output logic [5:0]       src2_phys,
    output logic [5:0]       dest_phys,

    output logic [63:0]      src1_data,
    output logic [63:0]      src2_data,

    output logic             allocation_success
);

physical_register_file prf (

    .clk(clk),

    .write_en(writeback_en),
    .write_addr(wb_phys_reg),
    .write_data(wb_data),

    .read_addr1(src1_phys),
    .read_addr2(src2_phys),

    .read_data1(src1_data),
    .read_data2(src2_data)
);

rename_allocator ra (

    .clk(clk),
    .rst(rst),

    .rename_valid(rename_valid),

    .src1_arch(src1_arch),
    .src2_arch(src2_arch),
    .dest_arch(dest_arch),

    .src1_phys(src1_phys),
    .src2_phys(src2_phys),
    .dest_phys(dest_phys),

    .allocation_success(allocation_success)
);

endmodule