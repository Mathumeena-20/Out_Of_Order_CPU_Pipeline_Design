`timescale 1ns/1ps

module debug_transport
(
    input  logic clk,
    input  logic rst,

    input  logic [31:0] dbg_cmd,

    output logic [31:0] dbg_resp
);

    always_ff @(posedge clk) begin

        if (rst)

            dbg_resp <= 0;

        else

            dbg_resp <= dbg_cmd;

    end

endmodule