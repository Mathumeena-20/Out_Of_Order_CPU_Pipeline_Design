`timescale 1ns/1ps

module microcode_rom
#(
    parameter ADDR_WIDTH = 8
)
(
    input  logic [ADDR_WIDTH-1:0] addr,

    output logic [63:0] micro_instr
);

    always_comb begin

        case(addr)

            8'h00:
                micro_instr = 64'hDEADBEEF00000001;

            8'h01:
                micro_instr = 64'hCAFEBABE00000002;

            default:
                micro_instr = 64'h0;

        endcase

    end

endmodule