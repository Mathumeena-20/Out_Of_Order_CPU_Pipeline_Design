`timescale 1ns/1ps

`include "../common/defines.svh"
`include "../common/macros.svh"

import parameters_pkg::*;
import typedefs_pkg::*;
import enums_pkg::*;

module cpu_top
(
    input logic clk,
    input logic rst,

    output logic [63:0] debug_pc,
    output logic [63:0] debug_alu
);

    // =====================================================
    // FETCH UNIT SIGNALS
    // =====================================================

    logic [63:0] pc;

    logic [31:0] instruction;

    // =====================================================
    // PIPELINE VALID SIGNALS
    // =====================================================

    logic fetch_valid;
    logic decode_valid;
    logic execute_valid;
    logic commit_valid;

    // =====================================================
    // PIPELINE REGISTERS
    // =====================================================

    logic [31:0] if_id_instr;
    logic [31:0] id_ex_instr;
    logic [31:0] ex_mem_instr;
    logic [31:0] mem_wb_instr;

    // =====================================================
    // DECODE OUTPUTS
    // =====================================================

    logic [6:0] opcode;

    logic [4:0] rd;
    logic [2:0] funct3;

    logic [4:0] rs1;
    logic [4:0] rs2;

    logic [6:0] funct7;

    // =====================================================
    // ALU RESULT
    // =====================================================

    logic [63:0] alu_result;

    // =====================================================
    // REGISTER FILE
    // =====================================================

    logic [63:0] regfile [0:31];

    integer i;

    // =====================================================
    // FETCH UNIT
    // =====================================================

    fetch_unit u_fetch (

        .clk(clk),
        .rst(rst),

        .stall(1'b0),
        .flush(1'b0),

        .branch_taken(1'b0),

        .branch_target(64'd0),

        .fetch_pc(pc),

        .instruction(instruction)

    );

    // =====================================================
    // DECODER
    // =====================================================

    decoder u_decode (

        .instruction(if_id_instr),

        .opcode(opcode),

        .rd(rd),

        .funct3(funct3),

        .rs1(rs1),

        .rs2(rs2),

        .funct7(funct7)

    );

    // =====================================================
    // RESERVATION STATION
    // =====================================================

    reservation_station u_rs (

        .clk(clk),
        .rst(rst),

        .dispatch_en(decode_valid),

        .src1_tag(6'd1),
        .src2_tag(6'd2),
        .dest_tag(6'd3),

        .src1_ready(1'b1),
        .src2_ready(1'b1),

        .instruction(id_ex_instr),

        .issue_grant(1'b0),

        .issue_index(5'd0),

        .rs_full()

    );

    // =====================================================
    // PIPELINE REGISTERS
    // =====================================================

    always_ff @(posedge clk or posedge rst) begin

        if (rst) begin

            if_id_instr  <= 32'h00000013;
            id_ex_instr  <= 32'h00000013;
            ex_mem_instr <= 32'h00000013;
            mem_wb_instr <= 32'h00000013;

        end

        else begin

            if_id_instr  <= instruction;

            id_ex_instr  <= if_id_instr;

            ex_mem_instr <= id_ex_instr;

            mem_wb_instr <= ex_mem_instr;

        end

    end

    // =====================================================
    // VALID PROPAGATION
    // =====================================================

    always_ff @(posedge clk or posedge rst) begin

        if (rst) begin

            fetch_valid   <= 1'b0;
            decode_valid  <= 1'b0;
            execute_valid <= 1'b0;
            commit_valid  <= 1'b0;

        end

        else begin

            fetch_valid   <= 1'b1;

            decode_valid  <= fetch_valid;

            execute_valid <= decode_valid;

            commit_valid  <= execute_valid;

        end

    end

    // =====================================================
    // SIMPLE ALU
    // =====================================================

    always_comb begin

        alu_result = 64'd0;

        if (execute_valid)

            alu_result =
            {32'd0, ex_mem_instr} + 64'd16;

    end

    // =====================================================
    // SIMPLE REGISTER WRITEBACK
    // =====================================================

    always_ff @(posedge clk or posedge rst) begin

        if (rst) begin

            for(i = 0; i < 32; i = i + 1)

                regfile[i] <= 64'd0;

        end

        else begin

            if(commit_valid)

                regfile[rd] <= alu_result;

        end

    end

 // =====================================================
    // DEBUG OUTPUTS
    // =====================================================

    assign debug_pc  = pc;

    assign debug_alu = alu_result;

endmodule