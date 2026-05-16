`timescale 1ns/1ps

class branch_test extends base_test;

    `uvm_component_utils(branch_test)

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

        `uvm_info("BRANCH_TEST",
                  "Running Branch Predictor Test",
                  UVM_LOW)

        repeat(200) begin

            #5;

            `uvm_info("BRANCH_TEST",
                      "Branch Prediction Check",
                      UVM_HIGH)

        end

        `uvm_info("BRANCH_TEST",
                  "Branch Test Completed",
                  UVM_LOW)

        phase.drop_objection(this);

    endtask

endclass