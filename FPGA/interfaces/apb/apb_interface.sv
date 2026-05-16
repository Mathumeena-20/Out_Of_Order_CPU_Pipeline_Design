interface apb_interface
#(
    parameter ADDR_WIDTH = 16,
    parameter DATA_WIDTH = 32
)
(
    input logic PCLK,
    input logic PRESETn
);

    logic [ADDR_WIDTH-1:0] PADDR;
    logic                  PSEL;
    logic                  PENABLE;
    logic                  PWRITE;

    logic [DATA_WIDTH-1:0] PWDATA;
    logic [DATA_WIDTH-1:0] PRDATA;

    logic                  PREADY;

endinterface