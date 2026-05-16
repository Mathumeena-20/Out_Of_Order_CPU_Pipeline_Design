`timescale 1ns/1ps

module csr_file
#(
    parameter XLEN = 64
)
(
    input  logic                 clk,

    input  logic                 write_en,
    input  logic [11:0]          csr_addr,

    input  logic [XLEN-1:0]      write_data,

    output logic [XLEN-1:0]      read_data
);

logic [XLEN-1:0] csr_mem [0:4095];

always_ff @(posedge clk) begin

    if (write_en)

        csr_mem[csr_addr] <= write_data;

end

assign read_data = csr_mem[csr_addr];

endmodule