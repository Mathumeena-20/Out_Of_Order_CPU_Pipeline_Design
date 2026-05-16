`timescale 1ns/1ps

class env_config extends uvm_object;

    `uvm_object_utils(env_config)

    // -------------------------------------------------
    // Environment Enables
    // -------------------------------------------------

    bit enable_scoreboard;

    bit enable_coverage;

    bit enable_virtual_sequencer;

    // -------------------------------------------------
    // Agent Enables
    // -------------------------------------------------

    bit enable_cpu_agent;

    bit enable_fetch_agent;

    bit enable_decode_agent;

    bit enable_execute_agent;

    bit enable_memory_agent;

    bit enable_branch_agent;

    // -------------------------------------------------
    // Timeout
    // -------------------------------------------------

    int unsigned global_timeout;

    // -------------------------------------------------
    // Configuration Handles
    // -------------------------------------------------

    cpu_config cpu_cfg;

    agent_config cpu_agent_cfg;

    agent_config fetch_agent_cfg;

    agent_config decode_agent_cfg;

    agent_config execute_agent_cfg;

    agent_config memory_agent_cfg;

    agent_config branch_agent_cfg;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "env_config"
    );

        super.new(name);

        enable_scoreboard        = 1;

        enable_coverage          = 1;

        enable_virtual_sequencer = 1;

        enable_cpu_agent         = 1;

        enable_fetch_agent       = 1;

        enable_decode_agent      = 1;

        enable_execute_agent     = 1;

        enable_memory_agent      = 1;

        enable_branch_agent      = 1;

        global_timeout           = 100000;

        // ---------------------------------------------
        // Create Sub Configurations
        // ---------------------------------------------

        cpu_cfg =
        cpu_config::type_id::
        create("cpu_cfg");

        cpu_agent_cfg =
        agent_config::type_id::
        create("cpu_agent_cfg");

        fetch_agent_cfg =
        agent_config::type_id::
        create("fetch_agent_cfg");

        decode_agent_cfg =
        agent_config::type_id::
        create("decode_agent_cfg");

        execute_agent_cfg =
        agent_config::type_id::
        create("execute_agent_cfg");

        memory_agent_cfg =
        agent_config::type_id::
        create("memory_agent_cfg");

        branch_agent_cfg =
        agent_config::type_id::
        create("branch_agent_cfg");

    endfunction

endclass