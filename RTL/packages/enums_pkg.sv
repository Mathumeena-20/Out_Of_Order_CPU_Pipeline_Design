// ============================================================
// File: RTL/packages/enums_pkg.sv
// ============================================================

package enums_pkg;

    // -------------------------------------------------
    // ALU Operations
    // -------------------------------------------------

    typedef enum logic [3:0] {

        ALU_ADD    = 4'd0,
        ALU_SUB    = 4'd1,
        ALU_AND    = 4'd2,
        ALU_OR     = 4'd3,
        ALU_XOR    = 4'd4,
        ALU_SLL    = 4'd5,
        ALU_SRL    = 4'd6,
        ALU_SRA    = 4'd7,
        ALU_SLT    = 4'd8,
        ALU_SLTU   = 4'd9

    } alu_op_t;

    // -------------------------------------------------
    // Branch Types
    // -------------------------------------------------

    typedef enum logic [2:0] {

        BR_NONE    = 3'd0,
        BR_EQ      = 3'd1,
        BR_NE      = 3'd2,
        BR_LT      = 3'd3,
        BR_GE      = 3'd4,
        BR_JAL     = 3'd5,
        BR_JALR    = 3'd6

    } branch_t;

    // -------------------------------------------------
    // Pipeline Control State
    // -------------------------------------------------

    typedef enum logic [1:0] {

        PIPE_IDLE      = 2'd0,
        PIPE_RUNNING   = 2'd1,
        PIPE_FLUSH     = 2'd2,
        PIPE_STALL     = 2'd3

    } pipe_state_t;

    // -------------------------------------------------
    // Pipeline Stages
    // -------------------------------------------------

    typedef enum logic [1:0] {

        FETCH    = 2'd0,
        DECODE   = 2'd1,
        EXECUTE  = 2'd2,
        COMMIT   = 2'd3

    } pipeline_stage_t;

endpackage