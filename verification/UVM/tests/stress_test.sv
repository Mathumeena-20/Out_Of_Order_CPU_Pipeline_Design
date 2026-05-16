`timescale 1ns/1ps

class stress_test extends base_test;

    `uvm_component_utils(stress_test)

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

        `uvm_info("STRESS_TEST",
                  "Running Stress Test",
                  UVM_LOW)

        repeat(10000) begin

            #1;

        end

        `uvm_info("STRESS_TEST",
                  "Stress Test Completed",
                  UVM_LOW)

        phase.drop_objection(this);

    endtask

endclass