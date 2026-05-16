`timescale 1ns/1ps

module reservation_station
#(
    parameter RS_ENTRIES = 16
)
(
    input  logic                     clk,
    input  logic                     rst,

    // ---------------------------------------------
    // Dispatch Inputs
    // ---------------------------------------------

    input  logic                     dispatch_en,

    input  logic [5:0]               src1_tag,
    input  logic [5:0]               src2_tag,
    input  logic [5:0]               dest_tag,

    input  logic                     src1_ready,
    input  logic                     src2_ready,

    input  logic [31:0]              instruction,

    // ---------------------------------------------
    // Issue Control
    // ---------------------------------------------

    input  logic                     issue_grant,
    input  logic [4:0]               issue_index,

    // ---------------------------------------------
    // Status
    // ---------------------------------------------

    output logic                     rs_full
);

    // =============================================
    // RS Entry Structure
    // =============================================

    typedef struct packed
    {
        logic               valid;

        logic [5:0]         src1_tag;
        logic [5:0]         src2_tag;
        logic [5:0]         dest_tag;

        logic               src1_ready;
        logic               src2_ready;

        logic [31:0]        instruction;

    } rs_entry_t;

    // =============================================
    // Reservation Station Memory
    // =============================================

    rs_entry_t rs_mem [RS_ENTRIES-1:0];

    // =============================================
    // Free Entry Logic
    // =============================================

    logic [4:0] free_index;

    logic       found_free;

    // =============================================
    // Free Entry Search
    // =============================================

    always_comb begin

        integer i;

        found_free = 0;

        free_index = 0;

        for (i = 0;
             i < RS_ENTRIES;
             i = i + 1) begin

            if (!rs_mem[i].valid &&
                !found_free) begin

                found_free = 1;

                free_index = i;

            end

        end

    end

    // =============================================
    // RS Full Flag
    // =============================================

    assign rs_full = !found_free;

    // =============================================
    // Main Reservation Station Logic
    // =============================================

    always_ff @(posedge clk) begin

        integer i;

        if (rst) begin

            for (i = 0;
                 i < RS_ENTRIES;
                 i = i + 1) begin

                rs_mem[i].valid <= 0;

                rs_mem[i].src1_tag <= 0;
                rs_mem[i].src2_tag <= 0;
                rs_mem[i].dest_tag <= 0;

                rs_mem[i].src1_ready <= 0;
                rs_mem[i].src2_ready <= 0;

                rs_mem[i].instruction <= 0;

            end

        end

        else begin

            // -------------------------------------
            // Dispatch New Instruction
            // -------------------------------------

            if (dispatch_en &&
                found_free) begin

                rs_mem[free_index].valid
                <= 1;

                rs_mem[free_index].src1_tag
                <= src1_tag;

                rs_mem[free_index].src2_tag
                <= src2_tag;

                rs_mem[free_index].dest_tag
                <= dest_tag;

                rs_mem[free_index].src1_ready
                <= src1_ready;

                rs_mem[free_index].src2_ready
                <= src2_ready;

                rs_mem[free_index].instruction
                <= instruction;

                $display(
                    "[RS] Dispatch Entry=%0d Time=%0t",
                    free_index,
                    $time
                );

            end

            // -------------------------------------
            // Remove Issued Instruction
            // -------------------------------------

            if (issue_grant) begin

                rs_mem[issue_index].valid
                <= 0;

                $display(
                    "[RS] Issue Entry=%0d Time=%0t",
                    issue_index,
                    $time
                );

            end

        end

    end

endmodule