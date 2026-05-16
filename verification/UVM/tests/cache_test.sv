`timescale 1ns/1ps

class cache_test extends base_test;

    `uvm_component_utils(cache_test)

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

        `uvm_info("CACHE_TEST",
                  "Running Cache Test",
                  UVM_LOW)

        repeat(500) begin

            #2;

            `uvm_info("CACHE_TEST",
                      "Cache Access",
                      UVM_HIGH)

        end

        `uvm_info("CACHE_TEST",
                  "Cache Test Completed",
                  UVM_LOW)

        phase.drop_objection(this);

    endtask

endclass