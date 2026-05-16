`timescale 1ns/1ps

class branch_sequencer extends
      uvm_sequencer #(branch_transaction);

    `uvm_component_utils(branch_sequencer)

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
    // Build Phase
    // -------------------------------------------------

    function void build_phase
    (
        uvm_phase phase
    );

        super.build_phase(phase);

        `uvm_info("BRANCH_SEQUENCER",
                  "Branch Sequencer Build",
                  UVM_LOW)

    endfunction

endclass