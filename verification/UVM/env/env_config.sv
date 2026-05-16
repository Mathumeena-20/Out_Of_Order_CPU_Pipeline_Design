`timescale 1ns/1ps

class env_config extends uvm_object;

    `uvm_object_utils(env_config)

    // -------------------------------------------------
    // Configuration Fields
    // -------------------------------------------------

    bit enable_scoreboard;
    bit enable_coverage;

    bit enable_fetch_agent;
    bit enable_decode_agent;
    bit enable_execute_agent;
    bit enable_memory_agent;
    bit enable_branch_agent;

    int unsigned timeout_cycles;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new(string name =
                 "env_config");

        super.new(name);

        enable_scoreboard   = 1;
        enable_coverage     = 1;

        enable_fetch_agent  = 1;
        enable_decode_agent = 1;
        enable_execute_agent= 1;
        enable_memory_agent = 1;
        enable_branch_agent = 1;

        timeout_cycles      = 10000;

    endfunction

endclass