`timescale 1ns/1ps

class branch_stress_sequence extends
      cpu_virtual_sequence;

    `uvm_object_utils
    (branch_stress_sequence)

    // -------------------------------------------------
    // Branch Transaction
    // -------------------------------------------------

    branch_transaction tr;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "branch_stress_sequence"
    );

        super.new(name);

    endfunction

    // -------------------------------------------------
    // Body Task
    // -------------------------------------------------

    task body();

        `uvm_info("BRANCH_STRESS",
                  "Starting Branch Stress Test",
                  UVM_LOW)

        repeat(500) begin

            tr =
            branch_transaction::
            type_id::
            create("tr");

            assert(tr.randomize());

            `uvm_info("BRANCH_STRESS",
                      $sformatf
                      (
                        "PC=%h PRED=%b ACT=%b",
                        tr.pc,
                        tr.prediction,
                        tr.actual_taken
                      ),
                      UVM_HIGH)

            #5;

        end

        `uvm_info("BRANCH_STRESS",
                  "Branch Stress Completed",
                  UVM_LOW)

    endtask

endclass