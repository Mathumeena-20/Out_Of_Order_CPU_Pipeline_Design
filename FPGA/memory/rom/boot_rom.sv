`timescale 1ns/1ps

module boot_rom
#(
    parameter ADDR_WIDTH = 8
)
(
    input  logic [ADDR_WIDTH-1:0] addr,

    output logic [31:0] data
);

    always_comb begin

        case(addr)

            8'h00:
                data = 32'h00000013;

            8'h01:
                data = 32'h00100093;

            8'h02:
                data = 32'h00200113;

            default:
                data = 32'h00000013;

        endcase

    end

endmodule