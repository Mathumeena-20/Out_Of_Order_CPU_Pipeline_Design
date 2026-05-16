`timescale 1ns/1ps

class agent_config extends uvm_object;

    `uvm_object_utils(agent_config)

    // -------------------------------------------------
    // Agent Configuration
    // -------------------------------------------------

    uvm_active_passive_enum is_active;

    bit coverage_enable;

    bit checks_enable;

    int unsigned timeout_cycles;

    // -------------------------------------------------
    // Driver Timing Controls
    // -------------------------------------------------

    int unsigned min_delay;

    int unsigned max_delay;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "agent_config"
    );

        super.new(name);

        is_active      = UVM_ACTIVE;

        coverage_enable = 1;

        checks_enable   = 1;

        timeout_cycles  = 1000;

        min_delay       = 1;

        max_delay       = 10;

    endfunction

    // -------------------------------------------------
    // Display
    // -------------------------------------------------

    function void display();

        `uvm_info("AGENT_CONFIG",
                  $sformatf
                  (
                    "ACTIVE=%0d COVERAGE=%0d",
                    is_active,
                    coverage_enable
                  ),
                  UVM_LOW)

    endfunction

endclass