`timescale 1ns/1ps

class smoke_test extends base_test;

    `uvm_component_utils(smoke_test)

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
    // Run Phase
    // -------------------------------------------------

    task run_phase
    (
        uvm_phase phase
    );

        phase.raise_objection(this);

        `uvm_info("SMOKE_TEST",
                  "Running Smoke Test",
                  UVM_LOW)

        // ---------------------------------------------
        // Basic CPU Bringup
        // ---------------------------------------------

        #500;

        `uvm_info("SMOKE_TEST",
                  "Smoke Test Completed",
                  UVM_LOW)

        phase.drop_objection(this);

    endtask

endclass