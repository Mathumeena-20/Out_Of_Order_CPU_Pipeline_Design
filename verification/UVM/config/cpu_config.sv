`timescale 1ns/1ps

class cpu_config extends uvm_object;

    `uvm_object_utils(cpu_config)

    // -------------------------------------------------
    // CPU Configuration Parameters
    // -------------------------------------------------

    int unsigned XLEN;

    int unsigned FETCH_WIDTH;

    int unsigned DECODE_WIDTH;

    int unsigned ISSUE_WIDTH;

    int unsigned COMMIT_WIDTH;

    int unsigned ROB_DEPTH;

    int unsigned RS_DEPTH;

    int unsigned LSQ_DEPTH;

    int unsigned NUM_PHYS_REGS;

    // -------------------------------------------------
    // Feature Enables
    // -------------------------------------------------

    bit enable_branch_predictor;

    bit enable_icache;

    bit enable_dcache;

    bit enable_debug;

    bit enable_performance_counters;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "cpu_config"
    );

        super.new(name);

        XLEN                    = 64;

        FETCH_WIDTH             = 4;

        DECODE_WIDTH            = 4;

        ISSUE_WIDTH             = 4;

        COMMIT_WIDTH            = 4;

        ROB_DEPTH               = 64;

        RS_DEPTH                = 32;

        LSQ_DEPTH               = 32;

        NUM_PHYS_REGS           = 128;

        enable_branch_predictor = 1;

        enable_icache           = 1;

        enable_dcache           = 1;

        enable_debug            = 1;

        enable_performance_counters = 1;

    endfunction

    // -------------------------------------------------
    // Print Function
    // -------------------------------------------------

    function void display();

        `uvm_info("CPU_CONFIG",
                  $sformatf
                  (
                    "XLEN=%0d ROB=%0d RS=%0d",
                    XLEN,
                    ROB_DEPTH,
                    RS_DEPTH
                  ),
                  UVM_LOW)

    endfunction

endclass