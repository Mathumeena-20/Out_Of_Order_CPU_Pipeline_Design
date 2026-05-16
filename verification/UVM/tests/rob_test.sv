`timescale 1ns/1ps

class rob_test extends base_test;

    `uvm_component_utils(rob_test)

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

        `uvm_info("ROB_TEST",
                  "Running ROB Verification",
                  UVM_LOW)

        repeat(300) begin

            #3;

            `uvm_info("ROB_TEST",
                      "ROB Allocate/Commit",
                      UVM_HIGH)

        end

        `uvm_info("ROB_TEST",
                  "ROB Test Completed",
                  UVM_LOW)

        phase.drop_objection(this);

    endtask

endclass