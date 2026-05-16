module physical_register_file
#(
    parameter PHYS_REGS = 64,
    parameter XLEN      = 64
)
(
    input  logic                     clk,

    input  logic                     write_en,
    input  logic [5:0]               write_addr,
    input  logic [XLEN-1:0]          write_data,

    input  logic [5:0]               read_addr1,
    input  logic [5:0]               read_addr2,

    output logic [XLEN-1:0]          read_data1,
    output logic [XLEN-1:0]          read_data2
);

logic [XLEN-1:0] preg [PHYS_REGS-1:0];

// Write Port
always_ff @(posedge clk) begin

    if (write_en && (write_addr != 0))
        preg[write_addr] <= write_data;

end

// Read Ports
assign read_data1 = preg[read_addr1];
assign read_data2 = preg[read_addr2];

endmodule