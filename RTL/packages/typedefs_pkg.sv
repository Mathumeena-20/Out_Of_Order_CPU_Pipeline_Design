// ============================================================
// File: RTL/packages/typedefs_pkg.sv
// ============================================================

package typedefs_pkg;

    // -------------------------------------------------
    // Basic Types
    // -------------------------------------------------

    typedef logic [31:0] instr_t;

    typedef logic [63:0] data_t;

    typedef logic [4:0]  arch_reg_t;

    typedef logic [5:0]  phys_reg_t;

    typedef logic [31:0] addr_t;

    // -------------------------------------------------
    // ROB Entry
    // -------------------------------------------------

    typedef struct packed {

        logic             valid;

        phys_reg_t        dest_tag;

        data_t            value;

        logic             ready;

    } rob_entry_t;

    // -------------------------------------------------
    // Reservation Station Entry
    // -------------------------------------------------

    typedef struct packed {

        logic             valid;

        phys_reg_t        src1_tag;
        phys_reg_t        src2_tag;
        phys_reg_t        dest_tag;

        logic             src1_ready;
        logic             src2_ready;

        instr_t           instruction;

    } rs_entry_t;

endpackage