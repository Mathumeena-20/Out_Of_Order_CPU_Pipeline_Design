`timescale 1ns/1ps

module rob
#(
    parameter ROB_ENTRIES = 32
)
(
    input  logic                     clk,
    input  logic                     rst,

    // --------------------------------------------------
    // Dispatch Allocate
    // --------------------------------------------------

    input  logic                     allocate,
    input  logic [5:0]               dest_phys_reg,
    input  logic [63:0]              alloc_pc,

    // --------------------------------------------------
    // Writeback
    // --------------------------------------------------

    input  logic                     wb_valid,
    input  logic [5:0]               wb_rob_index,
    input  logic [63:0]              wb_data,

    // --------------------------------------------------
    // Commit Outputs
    // --------------------------------------------------

    output logic                     commit_en,
    output logic [5:0]               commit_dest_reg,
    output logic [63:0]              commit_result,

    // --------------------------------------------------
    // Status
    // --------------------------------------------------

    output logic                     rob_full,
    output logic                     rob_empty
);

    // ==================================================
    // ROB ENTRY TYPE
    // ==================================================

    typedef struct packed {

        logic               valid;
        logic               completed;

        logic [5:0]         dest_reg;

        logic [63:0]        pc;
        logic [63:0]        result;

    } rob_entry_t;

    // ==================================================
    // ROB MEMORY
    // ==================================================

    rob_entry_t rob_mem [0:ROB_ENTRIES-1];

    // ==================================================
    // POINTERS
    // ==================================================

    logic [5:0] head_ptr;
    logic [5:0] tail_ptr;

    logic [5:0] count;

    integer i;

    // ==================================================
    // STATUS FLAGS
    // ==================================================

    assign rob_full  = (count == ROB_ENTRIES);

    assign rob_empty = (count == 0);

    // ==================================================
    // MAIN ROB LOGIC
    // ==================================================

    always_ff @(posedge clk) begin

        if (rst) begin

            head_ptr <= 0;
            tail_ptr <= 0;

            count    <= 0;

            for(i = 0; i < ROB_ENTRIES; i = i + 1) begin

                rob_mem[i].valid     <= 1'b0;

                rob_mem[i].completed <= 1'b0;

                rob_mem[i].dest_reg  <= 6'd0;

                rob_mem[i].pc        <= 64'd0;

                rob_mem[i].result    <= 64'd0;

            end

        end

        else begin

            // ==========================================
            // ALLOCATE NEW ROB ENTRY
            // ==========================================

            if (allocate && !rob_full) begin

                rob_mem[tail_ptr].valid <= 1'b1;

                rob_mem[tail_ptr].completed <= 1'b0;

                rob_mem[tail_ptr].dest_reg <= dest_phys_reg;

                rob_mem[tail_ptr].pc <= alloc_pc;

                rob_mem[tail_ptr].result <= 64'd0;

                $display("--------------------------------");

                $display("ROB ALLOCATE");

                $display("TIME      = %0t", $time);

                $display("ENTRY     = %0d", tail_ptr);

                $display("DEST REG  = %0d", dest_phys_reg);

                $display("PC        = %h", alloc_pc);

                $display("--------------------------------");

                tail_ptr <= tail_ptr + 1;

                count <= count + 1;

            end

            // ==========================================
            // WRITEBACK
            // ==========================================

            if (wb_valid) begin

                rob_mem[wb_rob_index].completed <= 1'b1;

                rob_mem[wb_rob_index].result <= wb_data;

                $display("--------------------------------");

                $display("ROB WRITEBACK");

                $display("TIME      = %0t", $time);

                $display("ENTRY     = %0d", wb_rob_index);

                $display("RESULT    = %h", wb_data);

                $display("--------------------------------");

            end

            // ==========================================
            // COMMIT
            // ==========================================

            if (rob_mem[head_ptr].valid &&
                rob_mem[head_ptr].completed) begin

                rob_mem[head_ptr].valid <= 1'b0;

                $display("--------------------------------");

                $display("ROB COMMIT");

                $display("TIME      = %0t", $time);

                $display("ENTRY     = %0d", head_ptr);

                $display("DEST REG  = %0d",
                          rob_mem[head_ptr].dest_reg);

                $display("RESULT    = %h",
                          rob_mem[head_ptr].result);

                $display("--------------------------------");

                head_ptr <= head_ptr + 1;

                count <= count - 1;

            end

        end

    end

    // ==================================================
    // COMMIT OUTPUT LOGIC
    // ==================================================

    rob_commit_logic commit_logic (

        .clk(clk),
        .rst(rst),

        .head_valid(
            rob_mem[head_ptr].valid
        ),

        .head_completed(
            rob_mem[head_ptr].completed
        ),

        .head_dest_reg(
            rob_mem[head_ptr].dest_reg
        ),

        .head_result(
            rob_mem[head_ptr].result
        ),

        .commit_en(
            commit_en
        ),

        .commit_dest_reg(
            commit_dest_reg
        ),

        .commit_result(
            commit_result
        )

    );

endmodule