`timescale 1ns/1ps

module icache_controller
#(
    parameter XLEN = 64
)
(
    input  logic                     hit,

    input  logic [31:0]              cache_data,
    input  logic [31:0]              memory_data,

    output logic [31:0]              instruction,
    output logic                     stall
);

always_comb begin

    if (hit) begin

        instruction = cache_data;
        stall       = 0;

    end

    else begin

        instruction = memory_data;
        stall       = 1;

    end
end

endmodule