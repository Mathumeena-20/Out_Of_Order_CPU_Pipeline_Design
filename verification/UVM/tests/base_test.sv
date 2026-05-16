`timescale 1ns/1ps

class base_test extends uvm_test;

    `uvm_component_utils(base_test)

    // -------------------------------------------------
    // Environment
    // -------------------------------------------------

    cpu_env env;

    // -------------------------------------------------
    // Configuration
    // -------------------------------------------------

    env_config cfg;

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
        // Create Environment Config
        // ---------------------------------------------

        cfg =
        env_config::type_id::
        create("cfg");

        // ---------------------------------------------
        // Configure CPU
        // ---------------------------------------------

        cfg.cpu_cfg.XLEN = 64;

        cfg.cpu_cfg.ROB_DEPTH = 64;

        cfg.cpu_cfg.RS_DEPTH  = 32;

        // ---------------------------------------------
        // Set Configuration
        // ---------------------------------------------

        uvm_config_db #(env_config)::
        set(this,
            "*",
            "env_config",
            cfg);

        // ---------------------------------------------
        // Create Environment
        // ---------------------------------------------

        env =
        cpu_env::type_id::
        create("env", this);

        `uvm_info("BASE_TEST",
                  "Environment Created",
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

        `uvm_info("BASE_TEST",
                  "Starting Base Test",
                  UVM_LOW)

        #1000;

        `uvm_info("BASE_TEST",
                  "Ending Base Test",
                  UVM_LOW)

        phase.drop_objection(this);

    endtask

endclass