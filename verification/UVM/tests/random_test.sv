`timescale 1ns/1ps

class random_test extends base_test;

    `uvm_component_utils(random_test)

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

        `uvm_info("RANDOM_TEST",
                  "Running Randomized Test",
                  UVM_LOW)

        repeat(100) begin

            #10;

            `uvm_info("RANDOM_TEST",
                      "Random Instruction Generated",
                      UVM_HIGH)

        end

        phase.drop_objection(this);

    endtask

endclass