`timescale 1ns/1ps

class cpu_env extends uvm_env;

    `uvm_component_utils(cpu_env)

    // -------------------------------------------------
    // Agents
    // -------------------------------------------------

    cpu_agent      cpu_ag;

    fetch_agent    fetch_ag;

    decode_agent   decode_ag;

    execute_agent  execute_ag;

    memory_agent   memory_ag;

    branch_agent   branch_ag;

    // -------------------------------------------------
    // Environment Components
    // -------------------------------------------------

    cpu_scoreboard       sb;

    coverage_collector   cov;

    cpu_virtual_sequencer vseqr;

    env_config cfg;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new(string name,
                 uvm_component parent);

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
        // Configuration
        // ---------------------------------------------

        if (!uvm_config_db #(env_config)::
             get(this,
                 "",
                 "env_config",
                 cfg))

        begin

            cfg = env_config::
                  type_id::
                  create("cfg");

        end

        // ---------------------------------------------
        // Agents
        // ---------------------------------------------

        cpu_ag =
        cpu_agent::type_id::
        create("cpu_ag", this);

        if (cfg.enable_fetch_agent)

            fetch_ag =
            fetch_agent::type_id::
            create("fetch_ag", this);

        if (cfg.enable_decode_agent)

            decode_ag =
            decode_agent::type_id::
            create("decode_ag", this);

        if (cfg.enable_execute_agent)

            execute_ag =
            execute_agent::type_id::
            create("execute_ag", this);

        if (cfg.enable_memory_agent)

            memory_ag =
            memory_agent::type_id::
            create("memory_ag", this);

        if (cfg.enable_branch_agent)

            branch_ag =
            branch_agent::type_id::
            create("branch_ag", this);

        // ---------------------------------------------
        // Scoreboard
        // ---------------------------------------------

        if (cfg.enable_scoreboard)

            sb =
            cpu_scoreboard::type_id::
            create("sb", this);

        // ---------------------------------------------
        // Coverage
        // ---------------------------------------------

        if (cfg.enable_coverage)

            cov =
            coverage_collector::type_id::
            create("cov", this);

        // ---------------------------------------------
        // Virtual Sequencer
        // ---------------------------------------------

        vseqr =
        cpu_virtual_sequencer::
        type_id::
        create("vseqr", this);

    endfunction

    // -------------------------------------------------
    // Connect Phase
    // -------------------------------------------------

    function void connect_phase
    (
        uvm_phase phase
    );

        super.connect_phase(phase);

        // ---------------------------------------------
        // Connect Analysis Ports
        // ---------------------------------------------

        if (cfg.enable_scoreboard)

            cpu_ag.mon.mon_ap.connect
            (sb.cpu_port);

        // ---------------------------------------------
        // Virtual Sequencer Connections
        // ---------------------------------------------

        vseqr.cpu_seqr =
        cpu_ag.seqr;

        if (cfg.enable_fetch_agent)

            vseqr.fetch_seqr =
            fetch_ag.seqr;

        if (cfg.enable_decode_agent)

            vseqr.decode_seqr =
            decode_ag.seqr;

        if (cfg.enable_execute_agent)

            vseqr.execute_seqr =
            execute_ag.seqr;

        if (cfg.enable_memory_agent)

            vseqr.memory_seqr =
            memory_ag.seqr;

        if (cfg.enable_branch_agent)

            vseqr.branch_seqr =
            branch_ag.seqr;

    endfunction

    // -------------------------------------------------
    // Run Phase
    // -------------------------------------------------

    task run_phase
    (
        uvm_phase phase
    );

        phase.raise_objection(this);

        `uvm_info("CPU_ENV",
                  "Starting CPU Environment",
                  UVM_LOW)

        #(cfg.timeout_cycles);

        `uvm_info("CPU_ENV",
                  "Ending CPU Environment",
                  UVM_LOW)

        phase.drop_objection(this);

    endtask

endclass