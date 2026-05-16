`timescale 1ns/1ps

class full_system_test extends
      base_test;

    `uvm_component_utils
    (full_system_test)

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name,
        uvm_component parent
    );

        super.new(name, parent);

    endfunction

    // -------------------------------------------------
    // Build Phase
    // -------------------------------------------------

    function void build_phase
    (
        uvm_phase phase
    );

        super.build_phase(phase);

        // ---------------------------------------------
        // Full System Enable
        // ---------------------------------------------

        cfg.enable_cpu_agent     = 1;

        cfg.enable_fetch_agent   = 1;

        cfg.enable_decode_agent  = 1;

        cfg.enable_execute_agent = 1;

        cfg.enable_memory_agent  = 1;

        cfg.enable_branch_agent  = 1;

        cfg.enable_scoreboard    = 1;

        cfg.enable_coverage      = 1;

        `uvm_info("FULL_SYSTEM_TEST",
                  "Full System Configuration Enabled",
                  UVM_LOW)

    endfunction

    // -------------------------------------------------
    // Run Phase
    // -------------------------------------------------

    task run_phase
    (
        uvm_phase phase
    );

        phase.raise_objection(this);

        `uvm_info("FULL_SYSTEM_TEST",
                  "Running Full CPU System Test",
                  UVM_LOW)

        // ---------------------------------------------
        // Simulate Long CPU Run
        // ---------------------------------------------

        repeat(10000) begin

            #1;

        end

        `uvm_info("FULL_SYSTEM_TEST",
                  "Full System Test Completed",
                  UVM_LOW)

        phase.drop_objection(this);

    endtask

endclass