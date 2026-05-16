`timescale 1ns/1ps

module dcache_controller
#(
    parameter XLEN = 64
)
(
    input  logic                     hit,

    input  logic [XLEN-1:0]          cache_data,
    input  logic [XLEN-1:0]          memory_data,

    output logic [XLEN-1:0]          load_data,
    output logic                     stall
);

always_comb begin

    if (hit) begin

        load_data = cache_data;
        stall     = 0;

    end

    else begin

        load_data = memory_data;
        stall     = 1;

    end
end

endmodule