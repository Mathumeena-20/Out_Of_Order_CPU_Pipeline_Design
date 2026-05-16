`timescale 1ns/1ps

`include "../common/defines.svh"
`include "../common/macros.svh"

import parameters_pkg::*;
import typedefs_pkg::*;
import enums_pkg::*;

module fetch_unit
#(
    parameter XLEN = 64
)
(
    input  logic                 clk,
    input  logic                 rst,

    input  logic                 stall,
    input  logic                 flush,

    input  logic                 branch_taken,
    input  logic [XLEN-1:0]      branch_target,

    output logic [XLEN-1:0]      fetch_pc,
    output logic [31:0]          instruction
);

    // =====================================================
    // INTERNAL SIGNALS
    // =====================================================

    logic [XLEN-1:0] current_pc;

    logic [XLEN-1:0] next_pc;

    // =====================================================
    // INSTRUCTION MEMORY
    // =====================================================

    logic [31:0] imem [0:255];

    integer i;

    // =====================================================
    // INITIALIZE MEMORY
    // =====================================================

    initial begin

        // ---------------------------------------------
        // Initialize all memory with RISC-V NOP
        // ---------------------------------------------

        for(i = 0; i < 256; i = i + 1)

            imem[i] = 32'h00000013;

        // ---------------------------------------------
        // Load external program
        // ---------------------------------------------

        $display("--------------------------------");

        $display("Loading program.hex");

        $display("--------------------------------");

        $readmemh("program.hex", imem);

    end

    // =====================================================
    // PROGRAM COUNTER LOGIC
    // =====================================================

    pc_logic pc_inst (

        .clk(clk),
        .rst(rst),

        .stall(stall),
        .flush(flush),

        .next_pc(next_pc),

        .pc(current_pc)

    );

    // =====================================================
    // NEXT PC LOGIC
    // =====================================================

    next_pc_logic npc_inst (

        .current_pc(current_pc),

        .branch_taken(branch_taken),

        .branch_target(branch_target),

        .next_pc(next_pc)

    );

    // =====================================================
    // SAFE INSTRUCTION FETCH
    // =====================================================

    always_comb begin

        // ---------------------------------------------
        // Prevent out-of-range memory access
        // ---------------------------------------------

        if(current_pc[9:2] <= 8'd255)

            instruction = imem[current_pc[9:2]];

        else

            instruction = 32'h00000013;

    end

    // =====================================================
    // FETCH PC OUTPUT
    // =====================================================

    assign fetch_pc = current_pc;

endmodule